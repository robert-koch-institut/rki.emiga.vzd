Instance: EpiWarnPractitionerRole
InstanceOf: EmigaPractitionerRole
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.tag[relevance] = $RelevanceCS#IfsgKoordVwV "Paragraf 2 IfSG-Koordinierungs-VwV"
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole|2.0.0-alpha.16"
* active = true
* practitioner = Reference(EpiWarnPractitioner)
* organization = Reference(EpiWarnOrganization)
* location = Reference(EpiWarnLocation)
* healthcareService = Reference(EpiWarnHealthcareService)
* code[emigaPractitionerRole] = $PractitionerRole#personOfContact "Ansprechperson"