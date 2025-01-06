ValueSet: HealthcareServiceType
Id: HealthcareServiceType
Title: "Dienstleistungstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer Dienstleistung charakterisieren."
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2025-01-06"

* $serviceType#70 "Crisis Counselling" 
* $serviceType#70 ^designation[0].language = #de-DE
* $serviceType#70 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#70 ^designation[=].value = "Krisenberatung"

* $serviceType#76 "Health Counselling" 
* $serviceType#76 ^designation[0].language = #de-DE
* $serviceType#76 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#76 ^designation[=].value = "Gesundheitsberatung"
 
* $serviceType#117 "Emergeny Medical" 
* $serviceType#117 ^designation[0].language = #de-DE
* $serviceType#117 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#117 ^designation[=].value = "Notfallmedizin"
 
* $serviceType#314 "Dentistry" 
* $serviceType#314 ^designation[0].language = #de-DE
* $serviceType#314 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#314 ^designation[=].value = "Zahnmedizin"
 
* $serviceType#423 "Psychiatric Support" 
* $serviceType#423 ^designation[0].language = #de-DE
* $serviceType#423 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#423 ^designation[=].value = "Psychiatrische Betreuung"
 
* $serviceType#538 "Telephone Counselling" 
* $serviceType#538 ^designation[0].language = #de-DE
* $serviceType#538 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#538 ^designation[=].value = "Telefonberatung"
 
* $serviceType#539 "Telephone Help Line" 
* $serviceType#539 ^designation[0].language = #de-DE
* $serviceType#539 ^designation[=].use = $HL7DesignationUse#display
* $serviceType#539 ^designation[=].value = "Telefon-Hotline"


