CodeSystem: LocationType
Id: LocationType
Title: "Location Type in RKI Directory (Code System)"
Description: "Location Type in RKI Directory"
* ^version = "0.1.0-alpha.1"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/LocationType"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^version = "1.0.0"
* insert Meta
* #office "Office"


ValueSet: LocationType
Title: "Location Type in RKI Directory (Value Set)"
Description: "Location Type in RKI Directory"
Id: LocationType
* insert Meta
* ^date = "2024-03-19"
* ^version = "1.0.0"
* include codes from system LocationType