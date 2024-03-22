CodeSystem: LocationType
Id: locationType
Title: "Location Type in RKI Directory (Code System)"
Description: "Location Type in RKI Directory"
* ^version = "0.1.0-alpha.1"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/locationType"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^version = "0.1.0-alpha.1"
* insert Meta
* #office "Office"


ValueSet: LocationType
Title: "Location Type in RKI Directory (Value Set)"
Description: "Location Type in RKI Directory"
Id: locationType
* insert Meta
* ^date = "2024-03-19"
* ^version = "0.1.0-alpha.1"
* include codes from system LocationType