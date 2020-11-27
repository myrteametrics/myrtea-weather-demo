package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"time"

	"github.com/robfig/cron/v3"
)

var client http.Client

func main() {

	client = http.Client{
		Timeout: time.Second * 120,
	}
	c := cron.New()
	c.AddJob(" */1 * * * *", customJob{})

	c.Start()
	for {
	}

}

type BulkIngestRequest struct {
	UUID         string     `json:"uuid"`
	DocumentType string     `json:"documentType"`
	MergeConfig  []Config   `json:"merge"`
	Docs         []Document `json:"docs"`
}

type Document struct {
	ID     string      `json:"id"`
	Source interface{} `json:"source"`
}

type Config struct {
	Mode             string  `json:"mode"`
	ExistingAsMaster bool    `json:"existingAsMaster"`
	Type             string  `json:"type,omitempty"`
	LinkKey          string  `json:"linkKey,omitempty"`
	Groups           []Group `json:"groups,omitempty"`
}

type Group struct {
	Condition             string      `json:"condition,omitempty"`
	FieldReplace          []string    `json:"fieldReplace,omitempty"`
	FieldReplaceIfMissing []string    `json:"fieldReplaceIfMissing,omitempty"`
	FieldMerge            []string    `json:"fieldMerge,omitempty"`
	FieldMath             []FieldMath `json:"fieldMath,omitempty"`
	FieldKeepLatest       []string    `json:"fieldKeepLatest,omitempty"`
	FieldKeepEarliest     []string    `json:"fieldKeepEarliest,omitempty"`
}

// FieldMath specify a merge rule using a math expression
type FieldMath struct {
	Expression  string `json:"expression"`
	OutputField string `json:"outputField"`
}

var stationIDs = map[string]string{"perpignan": "817", "narbonne": "1135", "montpellier": "1176"}
var url = "https://holfuy.com/puget/mjso.php?k="
var ingesterUrl = "http://localhost:9001/api/v1/ingester/data"
var pushObjectsUrl = "http://localhost:9000/api/v4/service/objects?fact="

type customJob struct{}

func (j customJob) Run() {

	t := time.Now().Truncate(1 * time.Minute).UTC()
	var docs []Document
	for station, id := range stationIDs {
		response, _ := http.Get(url + id)
		responseData, _ := ioutil.ReadAll(response.Body)

		var data map[string]interface{}
		json.Unmarshal(responseData, &data)

		delete(data, "valid")
		delete(data, "updated")
		data["datetime"] = t.Format("2006-01-02T15:04:05.000")

		doc := Document{
			ID:     fmt.Sprintf("%s-%s", id, t.Format("2006-01-02")),
			Source: data,
		}
		b, _ := json.Marshal([]Document{doc})

		factName := "current_" + station
		client.Post(pushObjectsUrl+factName, "application/json", bytes.NewBuffer(b))

		docs = append(docs, doc)
	}

	bir := BulkIngestRequest{
		UUID:         "",
		DocumentType: "measure",
		MergeConfig: []Config{
			{
				Type:             "measure",
				Mode:             "self",
				ExistingAsMaster: true,
				Groups: []Group{
					{
						Condition: "datemillis(New.datetime) > datemillis(Existing.datetime)",
						FieldReplace: []string{
							"speed",
							"dir",
							"dir_str",
							"gust",
							"temperature",
							"wind_chill",
							"avg_speed",
							"max_gust",
							"avg_dir",
							"avg_dir_str",
							"dir_rate",
							"dir_tendency",
							"speed_rate",
							"speed_tendency",
							"daily_avg_speed",
							"daily_max_wind",
							"daily_max_temp",
							"daily_min_temp",
							"datetime",
						},
					},
					{
						FieldReplaceIfMissing: []string{
							"speed",
							"dir",
							"dir_str",
							"gust",
							"temperature",
							"wind_chill",
							"avg_speed",
							"max_gust",
							"avg_dir",
							"avg_dir_str",
							"dir_rate",
							"dir_tendency",
							"speed_rate",
							"speed_tendency",
							"daily_avg_speed",
							"daily_max_wind",
							"daily_max_temp",
							"daily_min_temp",
							"datetime",
						},
					},
				},
			},
		},
		Docs: docs,
	}

	b, _ := json.Marshal(bir)
	client.Post(ingesterUrl, "application/json", bytes.NewBuffer(b))
}
