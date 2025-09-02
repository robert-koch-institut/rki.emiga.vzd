Instance: EpiWarnHealthcareService
InstanceOf: EmigaHealthcareService
Usage: #example
Description: "Ein Beispiel für einen telefonischen Beratungsdienst, der rund um die Uhr verfügbar ist" 
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* active = true
* providedBy = Reference(EpiWarnOrganization)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#consultation "Beratungsangebot"
* specialty = $HealthcareServiceSpecialtyCS#infectionProtectionAndEpi "Infektionsschutz und Infektionsepidemiologie"
* type[0].coding = $serviceType#538 "Telephone Counselling"
* location = Reference(EpiWarnLocation)

* name = "Rufbereitschaft"
* comment = "diverse Angebote, Präventionsberatung"
* telecom[0].system = #email
* telecom[=].value = "Ruf@MS.NI.de"
* telecom[+].system = #phone
* telecom[=].value = "54548797989"
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
* availableTime.extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* availableTime.extension[dutyHoursAvailability].valueCoding.code = #24/7 
* availableTime.extension[dutyHoursAvailability].valueCoding.display = "24/7"