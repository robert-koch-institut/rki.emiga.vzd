Instance: EpiWarnPractitionerRole
InstanceOf: EmigaPractitionerRole
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* active = true
* practitioner = Reference(EpiWarnPractitioner)
* organization = Reference(EpiWarnOrganization)
* location = Reference(EpiWarnLocation)
* healthcareService = Reference(EpiWarnHealthcareServiceHealthcareService)
* code[emigaPractitionerRole] = $PractitionerRole#personOfContact "Ansprechperson"