Profile: BasePractitionerRole
Parent: PractitionerRole
Id: BasePractitionerRole
Title: "PractitionerRole - Basis-Ressource des EMIGA-Verzeichnisdienstes"
Description: "PractitionerRole - Basis-Ressource des EMIGA-Verzeichnisdienstes"
* insert Meta
* insert Security
* ^version = "1.0.0"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* insert DomainResourceCommon

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 0..0

// 'Business Identifiers that are specific to a role/location' - 0..* - Identifier
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* identifier 0..0

// 'Whether this practitioner role record is in active use' - 0..1 - boolean
* active 0..1

// 'The period during which the practitioner is authorized to perform in these role(s)' - 0..1 - Period
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* period 0..0

// 'Practitioner that is able to provide the defined services for the organization' - 0..1 - Reference(Practitioner)
// Ein Bezug zu einer konkreten Practitioner-Ressource ist für die EMIGA Anwendungsfälle zwingend erforderlich.
* practitioner 1..1 MS
* practitioner only Reference(BasePractitioner)

// 'Organization where the roles are available' - 0..1 - Reference(Organization)
// Ein Bezug zu einer konkreten Organization-Ressource ist für die EMIGA Anwendungsfälle zwingend erforderlich.
* organization 1..1 MS
* organization only Reference(BaseOrganization)

// 'Roles which this practitioner may perform' - 0..* - CodeableConcept
// Diskussion: Wollen wir das Feld verpflichtend machen?
* code 0.. MS 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #closed
  * ^slicing.description = "slicing practitioner role code by system"
  * ^slicing.ordered = false
* code contains emigaPractitionerRole 0.. MS
* code[emigaPractitionerRole] from PractitionerRole (required)
  * ^patternCodeableConcept.coding.system = $PractitionerRole
//  * ^binding.description = "emigaPractitionerRole"

// 'Specific specialty of the practitioner' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* specialty 0..0

// 'The location(s) at which this practitioner provides care' - 0..* - Reference(Location)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* location 0..0

// 'The list of healthcare services that this worker provides for this role's Organization/Location(s)' - 0..* - Reference(HealthcareService)
* healthcareService 0.. MS
* healthcareService only Reference(BaseHealthcareService)

// 'Contact details that are specific to the role/location/service' - 0..* - ContactPoint
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt. Die Angaben zur Erreichbarkeit werden über die Practitioner-Ressource abgebildet.
* telecom 0..0

// 'Times the Service Site is available' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* availableTime 0..0

// 'Not available during this time due to provided reason' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* notAvailable 0..0

// 'Description of availability exceptions' - 0..1 - string
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* availabilityExceptions 0..0

// 'Technical endpoints providing access to services operated for the practitioner with this role' - 0..* - Reference(Endpoint)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* endpoint 0..0