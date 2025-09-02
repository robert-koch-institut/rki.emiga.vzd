Extension: UTMCoordinates
Id: UTMCoordinates
Title: "UTM Coordinates (ETRS89)"
Description: "Representiert die UTM-Koordinaten (ETRS89) einer Einrichtung."
* ^url = "https://emiga.rki.de/fhir/vzd/Extension/UTMCoordinates"
* ^version = "0.1.0"
* ^date = "2025-06-17"

* ^context.type = #element
* ^context.expression = "Location.position"

* insert MetadataProfile

* extension contains
    UTM_Easting_X 1..1 MS and
    UTM_Northing_Y 1..1 MS and
    UTM_Zone 1..1 MS

* extension[UTM_Easting_X].valueDecimal 1..1
* extension[UTM_Easting_X] ^short = "GeoreferenzZone X-Wert der UTM Koordinate (ETRS89) der Einrichtung"

* extension[UTM_Northing_Y].valueDecimal 1..1
* extension[UTM_Northing_Y] ^short = "GeoreferenzZone Y-Wert der UTM Koordinate (ETRS89) der Einrichtung"

* extension[UTM_Zone].valueString 1..1
* extension[UTM_Zone] ^short = "GeoreferenzZone Zone"