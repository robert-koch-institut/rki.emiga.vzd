Instance: Practitioner44588967
InstanceOf: EmigaPractitionerRole
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole"
* active = true
* practitioner = Reference(Practitioner44588966)
* organization = Reference(Organization44588981)
* code[emigaPractitionerRole] = $PractitionerRole#personOfContact