CodeSystem: ResponsibilityType
Id: responsibilityType
Title: "Art der Zustaendigkeit OEGD"
Description: "Das CodeSystem 'ResponsibilityType' definiert die Arten der Zuständigkeit, die im ÖGD genutzt werden."
* ^version = "1.0.1"
* ^caseSensitive = true
* ^content = #complete
* ^count = 3
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/responsibilityType"

* insert MetadataTerminology

* #all "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger"
* #TB "zuständig nur für Tuberkulose"
* #all-exceptTB "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger außer Tuberkulose"