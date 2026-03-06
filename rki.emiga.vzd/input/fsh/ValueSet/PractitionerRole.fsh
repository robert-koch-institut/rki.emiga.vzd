ValueSet: PractitionerRole
Title: "Personenrolle"
Description: "Werteliste mit Konzepten für Rollen, die eine Person innerhalb einer Organisation einnehmen/wahrnehmen kann."
Id: PractitionerRole
* insert MetadataTerminology
* ^version = "1.1.0"
* ^date = "2024-03-19"

* include codes from system PractitionerRole

* $nullflavorCS#OTH "other"
* $nullflavorCS#OTH ^designation[0].use = $HL7DesignationUse#display
* $nullflavorCS#OTH ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorCS#OTH ^designation[0].value = "Sonstige"
* $nullflavorCS#OTH ^designation[0].language = #de-DE