Instance: 4458897
InstanceOf: EmigaHealthcareService
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* active = true
* providedBy = Reference(44588981)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#consultation
//* location = Reference(44588965)
* name = "test_dienst"
* comment = "diverse Angebote, Präventionsberatung"
* telecom[0].system = #email
* telecom[=].value = "test_dienst@example.org"
* telecom[+].system = #phone
* telecom[=].value = "0123 456789-123"

* availableTime.daysOfWeek[0] = #mon
* availableTime.daysOfWeek[+] = #tue
* availableTime.daysOfWeek[+] = #wed
* availableTime.daysOfWeek[+] = #thu
* availableTime.daysOfWeek[+] = #fri
* availableTime.daysOfWeek[+] = #sat
* availableTime.daysOfWeek[+] = #sun
* availableTime.allDay = true
