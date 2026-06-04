Instance: PractitionerRole44588971
InstanceOf: EmigaPractitionerRoleR6
Usage: #example
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService	"ÖGD-weit"
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRoleR6"
* active = true
* practitioner = Reference(Practitioner44588970)
* organization = Reference(Organization44588981)
* code[emigaPractitionerRole] = $PractitionerRole#publicMedicalOfficer