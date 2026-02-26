ValueSet: HealthcareServiceSpecialtyVS
Title: "Fachspezialisierung (Werteliste)"
Description: "Werteliste mit Konzepten, die die Fachspezialisierung einer Dienstleistung näher beschreiben."
Id: HealthcareServiceSpecialtyVS
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-27"
* include codes from system HealthcareServiceSpecialtyVS

* $nullflavorCS#OTH "other"
* $nullflavorCS#OTH ^designation[0].use = $HL7DesignationUse#display
* $nullflavorCS#OTH ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorCS#OTH ^designation[0].value = "Sonstige"
* $nullflavorCS#OTH ^designation[0].language = #de-DE


/*
* $IHEFachrichtungen#GESU "Öffentliches Gesundheitswesen"
* $IHEFachrichtungen#LABO "Laboratoriumsmedizin"
* $IHEFachrichtungen#MZKH "Zahnmedizin"

* $IHEnichtAerztlicheFachrichtungen#KIN "Kinderpflege"
* $IHEnichtAerztlicheFachrichtungen#SOZ "Sozialwesen"
* $IHEnichtAerztlicheFachrichtungen#PRV "Prävention"
* $IHEnichtAerztlicheFachrichtungen#VER "Verwaltung"
*/