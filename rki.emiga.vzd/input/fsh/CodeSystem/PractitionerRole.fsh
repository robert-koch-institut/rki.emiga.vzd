CodeSystem: PractitionerRole
Id: PractitionerRole
Title: "Personenrolle"
Description: "Die Kodiersystematik 'PractitionerRole' definiert Konzepte, die die Rolle, die eine Person (Practitioner) innerhalb einer Organisation einnehmen/wahrnehmen kann."
* insert MetadataTerminology
* ^version = "2.0.0"
* ^date = "2024-12-18"
* ^caseSensitive = true
* ^content = #complete
* ^valueSet = "https://emiga.rki.de/fhir/vzd/ValueSet/PractitionerRole"
* #director "Amtsleiter/Amtsleiterin"
* #director ^designation[0].language = #de-DE
* #director ^designation[=].use = $ConceptDesignationUse#abbreviation
* #director ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #director ^designation[=].value = "AL"
//* #director ^designation[+].language = #de-DE
//* #director ^designation[=].use = $ConceptDesignationUse#long
//* #director ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #director ^designation[=].value = "Amtsleiter/Amtsleiterin"
* #publicMedicalOfficer "Amtsarzt/Amtsärztin"
* #publicMedicalOfficer ^designation[0].language = #de-DE
* #publicMedicalOfficer ^designation[=].use = $ConceptDesignationUse#abbreviation
* #publicMedicalOfficer ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #publicMedicalOfficer ^designation[=].value = "AA"
//* #publicMedicalOfficer ^designation[+].language = #de-DE
//* #publicMedicalOfficer ^designation[=].use = $ConceptDesignationUse#long
//* #publicMedicalOfficer ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #publicMedicalOfficer ^designation[=].value = "Amtsarzt/Amtsärztin"
* #caseOfficer "Sachbearbeiter/Sachbearbeiterin"
* #caseOfficer ^designation[0].language = #de-DE
* #caseOfficer ^designation[=].use = $ConceptDesignationUse#abbreviation
* #caseOfficer ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #caseOfficer ^designation[=].value = "SB"
//* #caseOfficer ^designation[+].language = #de-DE
//* #caseOfficer ^designation[=].use = $ConceptDesignationUse#long
//* #caseOfficer ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #caseOfficer ^designation[=].value = "Sachbearbeiter/Sachbearbeiterin"
* #personOfContact "Ansprechperson"
* #personOfContact ^designation[0].language = #de-DE
* #personOfContact ^designation[=].use = $ConceptDesignationUse#abbreviation
* #personOfContact ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #personOfContact ^designation[=].value = "AP"
//* #personOfContact ^designation[+].language = #de-DE
//* #personOfContact ^designation[=].use = $ConceptDesignationUse#long
//* #personOfContact ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #personOfContact ^designation[=].value = "Ansprechperson"
* #headOfUnit "Referatsleiter/Referatsleiterin"
* #headOfUnit ^designation[0].language = #de-DE 
* #headOfUnit ^designation[=].use = $ConceptDesignationUse#abbreviation
* #headOfUnit ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #headOfUnit ^designation[=].value = "RL"
//* #headOfUnit ^designation[+].language = #de-DE
//* #headOfUnit ^designation[=].use = $ConceptDesignationUse#long
//* #headOfUnit ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #headOfUnit ^designation[=].value = "Referatsleiter/Referatsleiterin"
* #airPortMedServ "Hafen- und/oder Flughafen-ärztlicher Dienst"
* #airPortMedServ ^designation[0].language = #de-DE  
* #airPortMedServ ^designation[=].use = $ConceptDesignationUse#abbreviation
* #airPortMedServ ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #airPortMedServ ^designation[=].value = "HFAED"
//* #airPortMedServ ^designation[+].language = #de-DE
//* #airPortMedServ ^designation[=].use = $ConceptDesignationUse#long
//* #airPortMedServ ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #airPortMedServ ^designation[=].value = "Hafen- und/oder Flughafen-ärztlicher Dienst"
* #expertWitness "Sachverständiger/Sachverständige"
* #expertWitness ^designation[0].language = #de-DE  
* #expertWitness ^designation[=].use = $ConceptDesignationUse#abbreviation
* #expertWitness ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #expertWitness ^designation[=].value = "SV"
//* #expertWitness ^designation[+].language = #de-DE
//* #expertWitness ^designation[=].use = $ConceptDesignationUse#long
//* #expertWitness ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #expertWitness ^designation[=].value = "Sachverständiger/Sachverständige"
* #infectionProtectionOfficer "Infektionsschutzreferent/Infektionsschutzreferentin"
* #infectionProtectionOfficer ^designation[0].language = #de-DE   
* #infectionProtectionOfficer ^designation[=].use = $ConceptDesignationUse#abbreviation
* #infectionProtectionOfficer ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #infectionProtectionOfficer ^designation[=].value = "ISR"
//* #infectionProtectionOfficer ^designation[+].language = #de-DE
//* #infectionProtectionOfficer ^designation[=].use = $ConceptDesignationUse#long
//* #infectionProtectionOfficer ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #infectionProtectionOfficer ^designation[=].value = "Infektionsschutzreferent/Infektionsschutzreferentin"
* #hygieneInspector "Hygienekontrolleur/Hygienekontrolleurin"
* #hygieneInspector ^designation[0].language = #de-DE   
* #hygieneInspector ^designation[=].use = $ConceptDesignationUse#abbreviation
* #hygieneInspector ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
* #hygieneInspector ^designation[=].value = "HK"
//* #hygieneInspector ^designation[+].language = #de-DE
//* #hygieneInspector ^designation[=].use = $ConceptDesignationUse#long
//* #hygieneInspector ^designation[=].use.system = "https://emiga.rki.de/fhir/common/CodeSystem/ConceptDesignationUse"
//* #hygieneInspector ^designation[=].value = "Hygienekontrolleur/Hygienekontrolleurin"


ValueSet: PractitionerRole
Title: "Personenrolle (Werteliste)"
Description: "Werteliste mit Konzepten für Rollen, die eine Person innerhalb einer Organisation einnehmen/wahrnehmen kann."
Id: PractitionerRole
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-03-19"
* include codes from system PractitionerRole