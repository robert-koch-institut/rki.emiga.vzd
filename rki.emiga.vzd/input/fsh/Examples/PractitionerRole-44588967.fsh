Instance: 44588967
InstanceOf: EmigaPractitionerRole
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole|2.0.0-alpha.18"
* active = true
* practitioner = Reference(44588966)
* organization = Reference(44588964)
* code[emigaPractitionerRole] = $PractitionerRole#personOfContact