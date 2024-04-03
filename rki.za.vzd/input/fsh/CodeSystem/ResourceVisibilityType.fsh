CodeSystem: ResourceVisibilityType
Id: ResourceVisibilityType
Title: "ResourceVisibility Type Code System"
Description: "Defines visibility of resources in VZD"
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/ResourceVisibilityType"
* #public "Public"
* #internal "Internal"
* #private "Private"

ValueSet: ResourceVisibilityType
Title: "ResourceVisibilityType Type Value Set"
Description: "Defines visibility of resources in VZD"
Id: ResourceVisibilityType
* insert MetaTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system ResourceVisibilityType
