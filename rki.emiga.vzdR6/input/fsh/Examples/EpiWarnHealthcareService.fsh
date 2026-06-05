Instance: EpiWarnHealthcareService
InstanceOf: EmigaHealthcareServiceR6
Usage: #example
Description: "Ein Beispiel für einen telefonischen Beratungsdienst, der rund um die Uhr verfügbar ist" 
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareServiceR6"
* active = true
* providedBy = Reference(EpiWarnOrganization)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#consultation "Beratungsangebot"
* specialty = $HealthcareServiceSpecialtyCS#infectionProtectionAndEpi "Infektionsschutz und Infektionsepidemiologie"
* type[0].coding = $serviceType#538 "Telephone Counselling"
* location = Reference(EpiWarnLocation)

* name = "Rufbereitschaft"
* comment = "diverse Angebote, Präventionsberatung"
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "Ruf@MS.NI.de"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "54548797989"
/*
* availableTime.daysOfWeek[0] = #mon
* availableTime.daysOfWeek[+] = #tue
* availableTime.daysOfWeek[+] = #wed
* availableTime.daysOfWeek[+] = #thu
* availableTime.daysOfWeek[+] = #fri
* availableTime.daysOfWeek[+] = #sat
* availableTime.daysOfWeek[+] = #sun
* availableTime.allDay = true
*/
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.code = #24/7 
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.display = "24/7"