Instance: Practitioner-typical
InstanceOf: EmigaPractitioner
Usage: #example

// ----------------------------------------------------
// META
// ----------------------------------------------------
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner|2.0.0-alpha.16"

* meta.security[visibility] = $ResourceVisibilityType#internal
* meta.security[responsibility] = $ResourceResponsibility#1.

* meta.tag[relevance].system = $RelevanceCS
* meta.tag[relevance].code = #primary
* meta.tag[relevance].display = "Primärer Datensatz"

* meta.tag[orgvBundleId].system = $BundleIdCS
* meta.tag[orgvBundleId].code = #orgv-bundle-001
* meta.tag[orgvBundleId].display = "OrgV Bundle 001"

* meta.tag[orgvBundleVersion].system = $BundleVersionCS
* meta.tag[orgvBundleVersion].code = #1.0.0
* meta.tag[orgvBundleVersion].display = "Bundle Version 1.0.0"

// ----------------------------------------------------
// CORE ELEMENTS
// ----------------------------------------------------
* active = true

// ----------------------------------------------------
// NAME (typical)
// ----------------------------------------------------
* name[0].text = "Dr. Anna Müller"
* name[0].family = "Müller"
* name[0].given[0] = "Anna"
* name[0].prefix[0] = "Dr."

// three German extensions on family name (commonly used in DE profiles)
// German HumanName.family extensions 
* name[0].family.extension[namenszusatz].url = "http://fhir.de/StructureDefinition/humanname-namenszusatz"
* name[0].family.extension[namenszusatz].valueString = "von"

* name[0].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[0].family.extension[nachname].valueString = "Müller"

* name[0].family.extension[vorsatzwort].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
* name[0].family.extension[vorsatzwort].valueString = "zu"

// ----------------------------------------------------
// TELECOM (one entry per slice, typical)
// ----------------------------------------------------
* telecom[Email].system = #email
* telecom[Email].value = "anna.mueller@example.org"
* telecom[Email].use = #work

* telecom[Phone].system = #phone
* telecom[Phone].value = "+49-30-1234567"
* telecom[Phone].use = #work

* telecom[Fax].system = #fax
* telecom[Fax].value = "+49-30-7654321"
