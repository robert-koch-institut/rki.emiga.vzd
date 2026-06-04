Instance: HealthcareService44588971
InstanceOf: EmigaHealthcareServiceR6
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareServiceR6"
* active = true
* providedBy = Reference(Organization44588981)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#preventiveExamination
* location = Reference(Location44588965)
* name = "Kinder- und Jugendgesundheitsdienst"
* comment = "diverse Angebote, u.a. auch Impfungen, zahnärztliche Untersuchung ..."
* telecom[Email].system = #email
* telecom[Email].value = "kinder_und_jugend@example.org"
* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 456789-123"
