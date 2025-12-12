Instance: PractitionerRole-typical
InstanceOf: EmigaPractitionerRole
Usage: #example

// -------------------------------------------------------------------
// Meta: profile & security tags (typical for EMIGA resources)
// -------------------------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole|2.0.0-alpha.16"
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.

// -------------------------------------------------------------------
// Core required & MustSupport elements
// -------------------------------------------------------------------
* active = true

* practitioner = Reference(EmigaPractitioner/Practitioner-12345)
* organization = Reference(EmigaOrganization/Organization-RKI)

// -------------------------------------------------------------------
// Role code (sliced, MS, bound to PractitionerRole)
// -------------------------------------------------------------------
* code[emigaPractitionerRole] = $PractitionerRole#publicMedicalOfficer
* code[emigaPractitionerRole].coding.display = "Public Medical Officer"

// ---------------------------
// 0..1 MS element
// ---------------------------
* location = Reference(Location/Location-typical)

// ---------------------------
// 0..* MS element (include once)
// ---------------------------
* healthcareService[0] = Reference(HealthcareService/HealthcareService-typical)
