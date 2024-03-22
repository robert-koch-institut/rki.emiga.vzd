CodeSystem: OrganizationType
Id: organizationType
Title: "Organization Type in RKI Directory (Code System)"
Description: "Organization Type in RKI Directory"
* ^date = "2024-03-19"
* ^version = "0.1.0-alpha.1"
* ^caseSensitive = true
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/organizationType"
* insert Meta
* #ga "Gesundheitsamt"

ValueSet: OrganizationType
Id: organizationType
Title: "Organization Type in RKI Directory (Value Set)"
Description: "Organization Type in RKI Directory"
* insert Meta
* ^date = "2024-03-19"
* ^version = "0.1.0-alpha.1"
* include codes from system OrganizationType