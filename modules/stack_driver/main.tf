resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = <<EOF
{
  "displayName": "Dashboard",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Cloud Function - Execution Time",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [{
            "minAlignmentPeriod": "60s",
            "targetAxis": "Y1",
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"cloudfunctions.googleapis.com/function/execution_times\"",
                "aggregation": {
                  "alignmentPeriod": "60s",
                  "perSeriesAligner": "ALIGN_PERCENTILE_50"
                }
              }
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Big Query - Log entries",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "STACKED_AREA",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "60s",
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"logging.googleapis.com/log_entry_count\" resource.type=\"bigquery_dataset\"",
                  "secondaryAggregation": {
                    "alignmentPeriod": "60s",
                    "perSeriesAligner": "ALIGN_MEAN"
                  }
                }
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}

EOF
}