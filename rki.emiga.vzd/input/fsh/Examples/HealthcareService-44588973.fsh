Instance: 44588973
InstanceOf: EmigaHealthcareService
Usage: #example
Description: "Ein Beispiel für einen telefonischen Beratungsdienst, der während der Dienstzeit verfügbar ist" 
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* active = true
* providedBy = Reference(EpiWarnOrganization)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#consultation
//* location = Reference(44588965)
//* type[0].coding = $serviceType#538 "Telephone Counselling"
* name = "test_dienst"
* comment = "diverse Angebote, Präventionsberatung"
* telecom[0].system = #email
* telecom[=].value = "Ruf@MS.NI.de"
* telecom[+].system = #phone
* telecom[=].value = "54548797989"

* availableTime.daysOfWeek[0] = #mon
* availableTime.daysOfWeek[+] = #tue
* availableTime.daysOfWeek[+] = #wed
* availableTime.daysOfWeek[+] = #thu
* availableTime.daysOfWeek[+] = #fri
* availableTime.extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* availableTime.extension[dutyHoursAvailability].valueCoding.code = #duringService
* availableTime.extension[dutyHoursAvailability].valueCoding.display = "Während der Dienstzeit"

//* availableTime.daysOfWeek[+] = #sat
//* availableTime.daysOfWeek[+] = #sun
* availableTime.allDay = false
