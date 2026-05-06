Instance: PractitionerRole-minimal
InstanceOf: EmigaPractitionerRole
Usage: #example

// ---------------------------
// Required metadata
// ---------------------------
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole"
// ---------------------------
// 1..1 MS elements
// ---------------------------
* active = true
* practitioner = Reference(Practitioner/Practitioner-minimal)
* organization = Reference(Organization/Organization-minimal)

// ---------------------------
// MustSupport sliced element: code
// ---------------------------
* code[emigaPractitionerRole] = $PractitionerRole#publicMedicalOfficer
* code[emigaPractitionerRole].coding.display = "Amtsärztlicher Dienst"

// ---------------------------
// 0..1 MS element
// ---------------------------
* location = Reference(Location/Location-minimal)

// ---------------------------
// 0..* MS element (include once)
// ---------------------------
* healthcareService[0] = Reference(HealthcareService/HealthcareService-minimal)
