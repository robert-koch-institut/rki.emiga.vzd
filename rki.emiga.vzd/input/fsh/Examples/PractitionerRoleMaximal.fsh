Instance: PractitionerRoleMaximal
InstanceOf: EmigaPractitionerRole
Usage: #example


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


// ----------------------------------------------------
// Core 1..1 MS elements
// ----------------------------------------------------
* active = true

* practitioner = Reference(Practitioner/PractitionerMaximal)
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
* location = Reference(Location/LocationMaximal)
* location.display = "Dienstsitz Berlin-Mitte"

// ----------------------------------------------------
// HealthcareService (0..* MS) – showing multiple entries in maximal as example, but typically only one entry would be included. 
// ----------------------------------------------------
* healthcareService[0] = Reference(HealthcareService/EmigaHealthcareServiceTypical)
* healthcareService[0].display = "Telefonische Beratung Infektionsschutz"
* healthcareService[1] = Reference(HealthcareService/EmigaHealthcareServiceMaximal)
* healthcareService[1].display = "Telefonische Beratung Infektionsschutz"
