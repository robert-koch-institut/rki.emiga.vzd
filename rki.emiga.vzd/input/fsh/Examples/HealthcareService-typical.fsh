Instance: EmigaHealthcareServiceTypical
InstanceOf: EmigaHealthcareService
Usage: #example
Description: "Typische Instanz einer EMIGA-Dienstleistung"

* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService|2.0.0-alpha.16"

* active = true

* providedBy = Reference(EpiWarnOrganization)

* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#consultation

* type[emigaHealthcareServiceType].coding.system = $ServiceTypeCS
* type[emigaHealthcareServiceType].coding.code = #538
* type[emigaHealthcareServiceType].coding.display = "Telephone counselling"

* specialty[emigaHealthcareServiceSpecialty].coding.system = $HealthcareServiceSpecialtyCS
* specialty[emigaHealthcareServiceSpecialty].coding.code = #infectionProtectionAndEpi
* specialty[emigaHealthcareServiceSpecialty].coding.display = "Infektionsschutz und Infektionsepidemiologie"

* location = Reference(EmigaLocation/Location-typical)

* name = "test_dienst"

* comment = "diverse Angebote, Präventionsberatung"

* extraDetails = "Weitere Informationen zur Durchführung der Dienstleistung."

/* -------- telecom -------- */
* telecom[Email].system = #email
* telecom[Email].value = "infektionsschutz@gesundheitsamt.de"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49-511-9876543"

* telecom[Url].system = #url
* telecom[Url].value = "https://www.gesundheitsamt.de/infektionsschutz"

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49-511-9876544"

/* -------- availability -------- */
* availableTime.daysOfWeek[0] = #mon
* availableTime.daysOfWeek[+] = #tue
* availableTime.daysOfWeek[+] = #wed
* availableTime.daysOfWeek[+] = #thu
* availableTime.daysOfWeek[+] = #fri

* availableTime.extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* availableTime.extension[dutyHoursAvailability].valueCoding.code = #duringServiceHours
* availableTime.extension[dutyHoursAvailability].valueCoding.display = "Während der Dienstzeit"

* availableTime.allDay = false
* availableTime.availableStartTime = 08:00:00
* availableTime.availableEndTime = 16:00:00

/* -------- not available -------- */
* notAvailable.description = "Gesetzliche Feiertage"
* notAvailable.during.start = "2025-01-01"
* notAvailable.during.end = "2025-01-01"

/* -------- free text exceptions -------- */
* availabilityExceptions = "An Wochenenden und gesetzlichen Feiertagen ist keine telefonische Beratung möglich."
