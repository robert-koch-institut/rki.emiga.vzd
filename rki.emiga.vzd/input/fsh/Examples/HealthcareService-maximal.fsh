Instance: EmigaHealthcareServiceMaximal
InstanceOf: EmigaHealthcareService
Usage: #example
Description: "Maximale Instanz einer EMIGA-Dienstleistung (alle im Profil erlaubten Elemente befüllt)"

/* -------------------- Resource / Meta -------------------- */
* id = "healthcareservice-maximal-01"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.

/* -------------------- Required / MustSupport elements -------------------- */
* active = true
* providedBy = Reference(EpiWarnOrganization)

/* -------------------- category (sliced, open) -------------------- */
* category[emigaHealthcareServiceCategory].coding.system = $HealthcareServiceCategory
* category[emigaHealthcareServiceCategory].coding.code = #consultation
* category[emigaHealthcareServiceCategory].coding.display = "Consultation"

* category[+].coding.system = "http://snomed.info/sct"
* category[=].coding.code = #409063005
* category[=].coding.display = "Beratung"

/* -------------------- type (sliced, open) -------------------- */
* type[emigaHealthcareServiceType].coding.system = $ServiceTypeCS
* type[emigaHealthcareServiceType].coding.code = #538
* type[emigaHealthcareServiceType].coding.display = "Telephone counselling"

* type[+].coding.system = "http://snomed.info/sct"
* type[=].coding.code = #185317003
* type[=].coding.display = "Telefonischer Kontakt"

/* -------------------- specialty (sliced, open) -------------------- */
* specialty[emigaHealthcareServiceSpecialty].coding.system = $HealthcareServiceSpecialtyCS
* specialty[emigaHealthcareServiceSpecialty].coding.code = #infectionProtectionAndEpi
* specialty[emigaHealthcareServiceSpecialty].coding.display = "Infektionsschutz und Infektionsepidemiologie"

* specialty[+].coding.system = "http://snomed.info/sct"
* specialty[=].coding.code = #394807007
* specialty[=].coding.display = "Infectious disease specialty (qualifier value)"

/* -------------------- location (0..* MS) -------------------- */
* location[0] = Reference(EmigaLocation/Location-maximal)

/* -------------------- name/comment/extraDetails (MS) -------------------- */
* name = "Telefonische Beratung Infektionsschutz"
* comment = "Beratung zu meldepflichtigen Infektionskrankheiten, Hygiene und Präventionsmaßnahmen."
* extraDetails = "Für medizinisches Fachpersonal und Bürgerinnen/Bürger. Bei akuten Notfällen wählen Sie bitte 112."

/* -------------------- telecom (sliced, closed) -------------------- */
* telecom[Email].system = #email
* telecom[Email].value = "infektionsschutz@gesundheitsamt.de"
* telecom[Email].use = #work
* telecom[Email].rank = 1
* telecom[Email].period.start = "2024-01-01"

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49-511-9876543"
* telecom[Phone].use = #work
* telecom[Phone].rank = 1
* telecom[Phone].period.start = "2024-01-01"

* telecom[Url].system = #url
* telecom[Url].value = "https://www.gesundheitsamt.de/infektionsschutz"
* telecom[Url].use = #work
* telecom[Url].rank = 1
* telecom[Url].period.start = "2024-01-01"

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49-511-9876544"
* telecom[Fax].use = #work
* telecom[Fax].rank = 1
* telecom[Fax].period.start = "2024-01-01"

/* -------------------- availableTime (MS + invariant ORGV-Service-Opening-Time) -------------------- */
/* 1) During service hours */
* availableTime[0].extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* availableTime[0].extension[dutyHoursAvailability].valueCoding.code = #duringServiceHours
* availableTime[0].extension[dutyHoursAvailability].valueCoding.display = "Während der Dienstzeit"
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[+] = #tue
* availableTime[0].daysOfWeek[+] = #wed
* availableTime[0].daysOfWeek[+] = #thu
* availableTime[0].daysOfWeek[+] = #fri
* availableTime[0].allDay = false
* availableTime[0].availableStartTime = 08:00:00
* availableTime[0].availableEndTime = 16:00:00

/* 2) Outside service hours (on-call window) */
* availableTime[+].extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* availableTime[=].extension[dutyHoursAvailability].valueCoding.code = #outsideServiceHours
* availableTime[=].extension[dutyHoursAvailability].valueCoding.display = "Ausserhalb der Dienstzeit"
* availableTime[=].daysOfWeek[0] = #sat
* availableTime[=].daysOfWeek[+] = #sun
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = 10:00:00
* availableTime[=].availableEndTime = 12:00:00

/* 3) 24/7 (per invariant: daysOfWeek/start/end must be absent) */
* availableTime[+].extension[dutyHoursAvailability].valueCoding.system = "https://emiga.rki.de/fhir/vzd/CodeSystem/HealthcareServiceDutyHours"
* availableTime[=].extension[dutyHoursAvailability].valueCoding.code = #24/7
* availableTime[=].extension[dutyHoursAvailability].valueCoding.display = "24/7"
* availableTime[=].allDay = true

/* -------------------- notAvailable (MS, 0..*) -------------------- */
* notAvailable[0].description = "Gesetzliche Feiertage"
* notAvailable[0].during.start = "2025-01-01"
* notAvailable[0].during.end = "2025-01-01"

* notAvailable[+].description = "Interne Fortbildung"
* notAvailable[=].during.start = "2025-03-14T08:00:00+01:00"
* notAvailable[=].during.end = "2025-03-14T12:00:00+01:00"

/* -------------------- availabilityExceptions (MS) -------------------- */
* availabilityExceptions = "An Wochenenden und gesetzlichen Feiertagen ist die Beratung nur eingeschränkt verfügbar; außerhalb der genannten Zeiten ggf. Rückruf am nächsten Werktag."
