Instance: Practitioner-minimal
InstanceOf: EmigaPractitioner
Usage: #example

// ----------------------------------------------------
// Required metadata (ProfileMetaProfileTags)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner|2.0.0-alpha.16"

// ----------------------------------------------------
// MustSupport security tags (ProfileSecurityTags)
// ----------------------------------------------------
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.

// ----------------------------------------------------
// MustSupport meta.tag slices (ProfileMetaTags)
// ----------------------------------------------------
// * meta.tag[relevance].system = $RelevanceCS
// * meta.tag[relevance].code = #primary
// * meta.tag[relevance].display = "Primärer Datensatz"

// * meta.tag[orgvBundleId].system = $BundleIdCS
// * meta.tag[orgvBundleId].code = #orgv-bundle-001
// * meta.tag[orgvBundleId].display = "OrgV Bundle 001"

// * meta.tag[orgvBundleVersion].system = $BundleVersionCS
// * meta.tag[orgvBundleVersion].code = #1.0.0
// * meta.tag[orgvBundleVersion].display = "Bundle Version 1.0.0"

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
