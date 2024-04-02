CodeSystem: ResourceVisibilityType
Id: ResourceVisibilityType
Title: "ResourceVisibility Type Code System"
Description: "Defines visibility of resources in VZD"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/ResourceVisibilityType"
* ^content = #complete
* ^caseSensitive = true
* ^date = "2024-03-19"
* ^version = "1.0.0"
* insert Meta
* #public "Public"
* #internal "Internal"


ValueSet: ResourceVisibilityType
Title: "ResourceVisibilityType Type Value Set"
Description: "Defines visibility of resources in VZD"
Id: ResourceVisibilityType
* insert Meta
* ^date = "2024-03-19"
* ^version = "1.0.0"
* include codes from system ResourceVisibilityType
