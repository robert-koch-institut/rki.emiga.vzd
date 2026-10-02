ValueSet: ResponsibilityType
Id: responsibilityType
Title: "Art der Zuständigkeit OEGD"
Description: "'ResponsibilityType' ist eine Werteliste mit den Arten der Zuständigkeit, die im ÖGD genutzt werden."
* ^version = "1.0.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

* ^expansion.timestamp = "2024-07-23T00:00:00+01:00"
* ^expansion.contains[0].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* ^expansion.contains[=].code = #all
* ^expansion.contains[=].display = "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger"
* ^expansion.contains[+].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* ^expansion.contains[=].code = #TB
* ^expansion.contains[=].display = "zuständig nur für Tuberkulose"
* ^expansion.contains[+].system = "https://emiga.rki.de/fhir/vzd/CodeSystem/responsibilityType"
* ^expansion.contains[=].code = #all-exceptTB
* ^expansion.contains[=].display = "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger außer Tuberkulose"
* include codes from system $Art-der-Zustaendigkeit