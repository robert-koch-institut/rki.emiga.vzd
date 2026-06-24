Instance: PractitionerRole-maximal
InstanceOf: EmigaPractitionerRole
Usage: #example

// ----------------------------------------------------
// Resource-level elements (ProfileResourceCommon)
// ----------------------------------------------------
* id = "PractitionerRole-maximal"
* language = #de-DE

// ----------------------------------------------------
// Meta: profile, security, tags (ProfileSecurityTags, ProfileMetaProfileTags, ProfileMetaTags)
// ----------------------------------------------------
* meta.versionId = "1"
* meta.lastUpdated = "2024-10-15T08:30:00+01:00"
* meta.source = "https://emiga.rki.de/fhir/vzd"

// Profile slice
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole"

// Security slices (all MS + fully populated)
* meta.security[visibility] = $ResourceVisibilityType#inPublicHealthService
* meta.security[responsibility] = $ResourceResponsibility#1.

// Meta tag slices (all defined slices populated)  
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
// Core 1..1 MS elements
// ----------------------------------------------------
* active = true

* practitioner = Reference(Practitioner/Practitioner-maximal)
* practitioner.display = "Dr. med. Anna Müller"

* organization = Reference(Organization/EmigaPublicHealthOrganizationMaximal)
* organization.display = "Gesundheitsamt Berlin-Mitte"

// ----------------------------------------------------
// Role code (sliced, StrictCodableConcept, all MS sub-elements)
// ----------------------------------------------------
* code[emigaPractitionerRole] = $PractitionerRole#publicMedicalOfficer
* code[emigaPractitionerRole].coding.display = "Amtsärztlicher Dienst"
* code[emigaPractitionerRole].coding.version = "2024"
// text is 0..0 via StrictCodableConcept → not present

// ----------------------------------------------------
// Location (0..1 MS)
// ----------------------------------------------------
* location = Reference(Location/Location-maximal)
* location.display = "Dienstsitz Berlin-Mitte"

// ----------------------------------------------------
// HealthcareService (0..* MS) – showing multiple entries in maximal as example, but typically only one entry would be included. 
// ----------------------------------------------------
* healthcareService[0] = Reference(HealthcareService/EmigaHealthcareServiceTypical)
* healthcareService[0].display = "Telefonische Beratung Infektionsschutz"
* healthcareService[1] = Reference(HealthcareService/EmigaHealthcareServiceMaximal)
* healthcareService[1].display = "Telefonische Beratung Infektionsschutz"
