CodeSystem: PractitionerRole
Id: PractitionerRole
Title: "Personenrolle"
Description: "Die Kodiersystematik 'PractitionerRole' definiert Konzepte, die die Rolle, die eine Person (Practitioner) innerhalb einer Organisation einnehmen/wahrnehmen kann."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-28"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/PractitionerRole"
* #director "Leiter/-in"
* #director ^designation[0].language = #de-DE
* #director ^designation[=].use = $ConceptDesignationUse#abbreviation
* #director ^designation[=].value = "L"
* #director ^designation[+].language = #de-DE
* #director ^designation[=].use = $ConceptDesignationUse#long
* #director ^designation[=].value = "Leiter/Leiterin"
* #publicMedicalOfficer "Amtsarzt/-ärztin"
* #publicMedicalOfficer ^designation[0].language = #de-DE
* #publicMedicalOfficer ^designation[=].use = $ConceptDesignationUse#abbreviation
* #publicMedicalOfficer ^designation[=].value = "AA"
* #publicMedicalOfficer ^designation[+].language = #de-DE
* #publicMedicalOfficer ^designation[=].use = $ConceptDesignationUse#long
* #publicMedicalOfficer ^designation[=].value = "Amtsarzt/Amtsärztin"
* #caseOfficer "Sachbearbeiter/in"
* #caseOfficer ^designation[0].language = #de-DE
* #caseOfficer ^designation[=].use = $ConceptDesignationUse#abbreviation
* #caseOfficer ^designation[=].value = "SB"
* #caseOfficer ^designation[+].language = #de-DE
* #caseOfficer ^designation[=].use = $ConceptDesignationUse#long
* #caseOfficer ^designation[=].value = "Sachbearbeiter/Sachbearbeiterin"
* #personOfContact "Ansprechpartner/-in"
* #personOfContact ^designation[0].language = #de-DE
* #personOfContact ^designation[=].use = $ConceptDesignationUse#abbreviation
* #personOfContact ^designation[=].value = "AP"
* #personOfContact ^designation[+].language = #de-DE
* #personOfContact ^designation[=].use = $ConceptDesignationUse#long
* #personOfContact ^designation[=].value = "Ansprechpartner/Ansprechpartnerin"

ValueSet: PractitionerRole
Title: "Personenrolle (Werteliste)"
Description: "Werteliste mit Konzepten für Rollen, die eine Person innerhalb einer Organisation einnehmen/wahrnehmen kann."
Id: PractitionerRole
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system PractitionerRole