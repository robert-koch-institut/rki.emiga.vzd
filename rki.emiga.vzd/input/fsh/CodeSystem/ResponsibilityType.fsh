CodeSystem: ResponsibilityType
Id: ResponsibilityType
Title: "Art der Zustaendigkeit OEGD"
Description: "Die Kodiersystematik 'Art der Zustaendigkeit' definiert die Arten der Zuständigkeit, die im ÖGD genutzt werden"
* insert MetadataTerminology
* ^version = "1.0.0"
* ^caseSensitive = true
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/ResponsibilityTypeVS"
* ^content = #complete
* ^count = 3
* #all "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger"
* #TB "zuständig nur für Tuberkulose"
* #all-exceptTB "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger außer Tuberkulose"