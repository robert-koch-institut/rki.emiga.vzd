Instance: Practitioner-minimal
InstanceOf: EmigaPractitioner
Usage: #example

// ----------------------------------------------------
// Required metadata (ProfileMetaProfileTags)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner"

// ----------------------------------------------------
// MustSupport security tags (ProfileSecurityTags)
// ----------------------------------------------------
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.

// ----------------------------------------------------
// Required + MustSupport elements
// ----------------------------------------------------
* active = true

// ----------------------------------------------------
// Required name elements (HumanName-de-basis)
// ----------------------------------------------------
* name.family = "Hahn"
* name.given = "Wilhelm"
* name.prefix = "Dr."

// ----------------------------------------------------
// MustSupport telecom slices (all three required)
// ----------------------------------------------------
* telecom[Email].system = #email
* telecom[Email].value = "wilhelm.hahn@example.org"

* telecom[Phone].system = #phone
* telecom[Phone].value = "0123 456789"

* telecom[Fax].system = #fax
* telecom[Fax].value = "0123 456789-99"
