//Alias: $ConceptDesignationUse = https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse

CodeSystem: ResponsibilityType
Id: responsibilityType
Title: "Art der Zustaendigkeit OEGD"
Description: "Die Kodiersystematik 'Art der Zustaendigkeit' definiert die Arten der Zuständigkeit, die im ÖGD genutzt werden"
* ^language = #de-DE
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2024-07-30"
* ^publisher = "Robert Koch-Institut"
* ^contact.name = "Robert Koch-Institut"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://rki.de"
* ^caseSensitive = true
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/responsibilityType"
* ^content = #complete
* ^count = 3
* #all "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger"
* #all ^designation.language = #de-DE
* #all ^designation.use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #all ^designation.use = $ConceptDesignationUse#abbreviation
* #all ^designation.value = "all"
* #TB "zuständig nur für Tuberkulose"
* #TB ^designation.language = #de-DE
* #TB ^designation.use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #TB ^designation.use = $ConceptDesignationUse#abbreviation
* #TB ^designation.value = "TB"
* #all-exceptTB "zuständig für alle meldepflichtigen Infektionskrankheiten und -erreger außer Tuberkulose"
* #all-exceptTB ^designation.language = #de-DE
* #all-exceptTB ^designation.use = $ConceptDesignationUse#abbreviation
* #all-exceptTB ^designation.value = "all-exceptTB"