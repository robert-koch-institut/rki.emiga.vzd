CodeSystem: PractitionerRole
Id: PractitionerRole
Title: "Rolle einer Person im Kontext einer Organisation"
Description: "Definiert Konzepte, die die Rolle beschreiben, die eine Person innerhalb einer Organisation einnehmen kann."
* ^language = #de-DE
* ^version = "1.0.0"
* ^date = "2024-03-28"
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/PractitionerRole"
* ^content = #complete
* insert Meta
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
Title: "Rolle einer Person im Kontext einer Organisation (ValueSet)"
Description: "Werteliste für Rollen, die eine Person im Kontext einer Organisation im EMIGA-Kontext einnehmen kann."
Id: PractitionerRole
* insert Meta
* ^date = "2024-03-19"
* ^version = "1.0.0"
* include codes from system PractitionerRole