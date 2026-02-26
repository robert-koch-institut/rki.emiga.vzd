Instance: PractitionerRole44588971
InstanceOf: EmigaPractitionerRole
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole|2.0.0-alpha.19"
* active = true
* practitioner = Reference(Practitioner44588970)
* organization = Reference(Organization44588981)
* code[emigaPractitionerRole] = $PractitionerRole#publicMedicalOfficer