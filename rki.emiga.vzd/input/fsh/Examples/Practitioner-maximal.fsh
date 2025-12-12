Instance: Practitioner-maximal
InstanceOf: EmigaPractitioner
Usage: #example

// ----------------------------------------------------
// META (EMIGA-defined only)
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner|2.0.0-alpha.16"

// MustSupport meta.security slices
* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.

// MustSupport meta.tag slices
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
// CORE ELEMENTS
// ----------------------------------------------------
* active = true

// ----------------------------------------------------
// NAME — EMIGA-required
// ----------------------------------------------------
* name[0].family = "Müller"

// German HumanName.family extensions 
* name[0].family.extension[namenszusatz].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name[0].family.extension[namenszusatz].valueString = "von"

* name[0].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[0].family.extension[nachname].valueString = "Müller"

* name[0].family.extension[vorsatzwort].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name[0].family.extension[vorsatzwort].valueString = "zu"

// Given names
* name[0].given[0] = "Anna"
* name[0].given[1] = "Maria"

// Prefixes
* name[0].prefix[0] = "Dr."
* name[0].prefix[1] = "med."

// ----------------------------------------------------
// TELECOM — all slices, multiple entries (maximal)
// ----------------------------------------------------
* telecom[Email][0].system = #email
* telecom[Email][0].value = "anna.mueller@example.org"

* telecom[Email][1].system = #email
* telecom[Email][1].value = "a.mueller@gesundheitsamt.de"

* telecom[Phone][0].system = #phone
* telecom[Phone][0].value = "+49-30-1234567"

* telecom[Phone][1].system = #phone
* telecom[Phone][1].value = "+49-30-9876543"

* telecom[Fax][0].system = #fax
* telecom[Fax][0].value = "+49-30-7654321"
