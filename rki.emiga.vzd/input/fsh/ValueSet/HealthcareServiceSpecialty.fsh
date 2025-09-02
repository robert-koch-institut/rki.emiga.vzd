ValueSet: HealthcareServiceSpecialty
Title: "Fachspezialisierung (Werteliste)"
Description: "Werteliste mit Konzepten, die die Fachspezialisierung einer Dienstleistung näher beschreiben."
Id: HealthcareServiceSpecialty
* insert MetadataTerminology
* ^version = "1.0.0"
* ^date = "2024-12-27"
* include codes from system HealthcareServiceSpecialty

* $nullflavour#OTH "other"
* $nullflavour#OTH ^designation[0].use = $HL7DesignationUse#display
* $nullflavour#OTH ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavour#OTH ^designation[0].value = "Sonstige"
* $nullflavour#OTH ^designation[0].language = #de-DE


/*
* $IHEFachrichtungen#GESU "Öffentliches Gesundheitswesen"
* $IHEFachrichtungen#LABO "Laboratoriumsmedizin"
* $IHEFachrichtungen#MZKH "Zahnmedizin"

* $IHEnichtAerztlicheFachrichtungen#KIN "Kinderpflege"
* $IHEnichtAerztlicheFachrichtungen#SOZ "Sozialwesen"
* $IHEnichtAerztlicheFachrichtungen#PRV "Prävention"
* $IHEnichtAerztlicheFachrichtungen#VER "Verwaltung"
*/