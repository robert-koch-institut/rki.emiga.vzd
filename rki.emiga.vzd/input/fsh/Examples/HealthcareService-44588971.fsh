Instance: 44588972
InstanceOf: BaseHealthcareService
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#public
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* active = true
* providedBy = Reference(44588964)
* category[emigaHealthcareServiceCategory] = $HealthcareServiceCategory#preventiveExamination
* location = Reference(44588965)
* name = "Kinder- und Jugendgesundheitsdienst"
* comment = "diverse Angebote, u.a. auch Impfungen, zahnärztliche Untersuchung ..."
* telecom[0].system = #email
* telecom[=].value = "kinder_und_jugend@example.org"
* telecom[+].system = #phone
* telecom[=].value = "0123 456789-123"
