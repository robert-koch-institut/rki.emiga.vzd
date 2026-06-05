Instance: HealthcareService44588973
InstanceOf: EmigaHealthcareServiceR6
Usage: #example
Description: "Ein Beispiel für einen telefonischen Beratungsdienst, der während der Dienstzeit verfügbar ist" 
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareServiceR6"
* active = true
* providedBy = Reference(EpiWarnOrganization)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#consultation
//* location = Reference(44588965)
//* type[0].coding = $serviceType#538 "Telephone Counselling"
* name = "test_dienst"
* comment = "diverse Angebote, Präventionsberatung"
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value = "Ruf@MS.NI.de"
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value = "54548797989"
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[0] = #mon
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #tue
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #wed
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #thu
// AUTO-DISABLED (SUSHI R6): * availableTime.daysOfWeek[+] = #fri
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.code = #duringServiceHours
// AUTO-DISABLED (SUSHI R6): * availableTime.extension[dutyHoursAvailability].valueCoding.display = "Während der Dienstzeit"

//* availableTime.daysOfWeek[+] = #sat
//* availableTime.daysOfWeek[+] = #sun
// AUTO-DISABLED (SUSHI R6): * availableTime.allDay = false
