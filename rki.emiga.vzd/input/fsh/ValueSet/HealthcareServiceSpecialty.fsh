ValueSet: HealthcareServiceSpecialty
Id: HealthcareServiceSpecialty
Title: "Fachspezialisierung"
Description: "'HealthcareServiceSpecialty' ist eine Werteliste mit Konzepten, die die Fachspezialisierung einer Dienstleistung beschreiben."
* ^version = "1.0.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

* include codes from system HealthcareServiceSpecialty

* $nullflavorCS#OTH "other"
* $nullflavorCS#OTH ^designation[0].use = $HL7DesignationUse#display
* $nullflavorCS#OTH ^designation[0].use.system = "http://terminology.hl7.org/CodeSystem/designation-usage"
* $nullflavorCS#OTH ^designation[0].value = "Sonstige"
* $nullflavorCS#OTH ^designation[0].language = #de-DE