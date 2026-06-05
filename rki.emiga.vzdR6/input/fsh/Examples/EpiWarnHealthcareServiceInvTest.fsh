Instance: EpiWarnHealthcareServiceInvTest
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

* name = "Test_Invariant"
* comment = "diverse Angebote, Präventionsberatung"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "testinvMS@NI.de"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "54548797999"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[0] = #mon
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #tue
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #wed
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #thu
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #fri
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #sat
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #sun
//* availableTime.allDay = true
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.code = #24/7 
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.display = "24/7"