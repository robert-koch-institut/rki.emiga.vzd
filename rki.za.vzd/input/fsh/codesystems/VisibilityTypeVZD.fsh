CodeSystem: VisibilityType
Id: visibilityType
Title: "Visibility Type Code System"
Description: "Defines visibility of resources in VZD"
* ^valueSet = "https://emiga.rki.de/fhir/ValueSet/visibilityType"
* ^content = #complete
* ^caseSensitive = true
* ^date = "2024-03-19"
* ^version = "0.1.0-alpha.1"
* insert Meta
* #public "Public"
* #internal "Internal"


ValueSet: VisibilityType
Title: "VisibilityType Type Value Set"
Description: "Defines visibility of resources in VZD"
Id: visibilityType
* insert Meta
* ^date = "2024-03-19"
* ^version = "0.1.0-alpha.1"
* include codes from system VisibilityType
