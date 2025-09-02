Instance: EpiWarnPractitionerRole
InstanceOf: BasePractitionerRole
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.12.99.99.
* active = true
* practitioner = Reference(EpiWarnPractitioner)
* organization = Reference(EpiWarnOrganization)
* location = Reference(EpiWarnLocation)
* healthcareService = Reference(EpiWarnHealthcareServiceHealthcareService)
* code[emigaPractitionerRole] = $PractitionerRole#personOfContact