CodeSystem: OrganizationType
Id: OrganizationType
Title: "Organization Type in RKI Directory (Code System)"
Description: "Organization Type in RKI Directory"
* insert Meta
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/OrganizationType"
* #ga "Gesundheitsamt"

ValueSet: OrganizationType
Id: OrganizationType
Title: "Organization Type in RKI Directory (Value Set)"
Description: "Organization Type in RKI Directory"
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system OrganizationType