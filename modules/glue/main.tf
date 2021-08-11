resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name = var.glue_table
  database_name = var.database_name
  table_type = "EXTERNAL_TABLE"
  parameters = {
    EXTERNAL = "TRUE",
    "classification" = "csv",
    "has_encrypted_data"  = "true"
  }

  storage_descriptor {
    location = "s3://${var.bucket_name}/"
    input_format = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"

      parameters = {
        "separatorChar" = ",",
        "skip.header.line.count"="3"
      }
    }

    columns {
      name = "id"
      type = "int"
      comment = ""
    }

    columns {
      name = "sepallengthcm"
      type = "float"
      comment = ""
    }

    columns {
      name = "sepalwidthcm"
      type = "float"
      comment = ""
    }
    columns {
      name = "petallengthcm"
      type = "float"
      comment = ""
    }

    columns {
      name = "petalwidthcm"
      type = "float"
      comment = ""
    }

    columns {
      name = "species"
      type = "string"
      comment = ""
    }
  }

}
