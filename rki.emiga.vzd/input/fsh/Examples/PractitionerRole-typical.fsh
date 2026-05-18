Instance: PractitionerRole-typical
InstanceOf: EmigaPractitionerRole
Usage: #example

// -------------------------------------------------------------------
// Meta: profile & security tags (typical for EMIGA resources)
// -------------------------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole"
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.

// -------------------------------------------------------------------
// Core required & MustSupport elements
// -------------------------------------------------------------------
* active = true

* practitioner = Reference(Practitioner/Practitioner-typical)
* organization = Reference(Organization/EmigaPublicHealthOrganizationTypical)

// -------------------------------------------------------------------
// Role code (sliced, MS, bound to PractitionerRole)
// -------------------------------------------------------------------
* code[emigaPractitionerRole] = $PractitionerRole#publicMedicalOfficer
* code[emigaPractitionerRole].coding.display = "Amtsärztlicher Dienst"

// ---------------------------
// 0..1 MS element
// ---------------------------
* location = Reference(Location/Location-typical)

// ---------------------------------
// 0..* MS element (include once)
// ---------------------------------
* healthcareService[0] = Reference(HealthcareService/EmigaHealthcareServiceTypical)
