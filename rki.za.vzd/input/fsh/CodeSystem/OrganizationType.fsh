CodeSystem: OrganizationType
Id: OrganizationType
Title: "Organization Type in RKI Directory (Code System)"
Description: "Organization Type in RKI Directory"
* ^date = "2024-03-19"
* ^version = "1.0.0"
* ^caseSensitive = true
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/OrganizationType"
* insert Meta
* #ga "Gesundheitsamt"

ValueSet: OrganizationType
Id: OrganizationType
Title: "Organization Type in RKI Directory (Value Set)"
Description: "Organization Type in RKI Directory"
* insert Meta
* ^date = "2024-03-19"
* ^version = "1.0.0"
* include codes from system OrganizationType