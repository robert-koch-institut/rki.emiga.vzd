Profile: BaseHealthcareService
Parent: HealthcareService
Id: BaseHealthcareService
Title: "HealthcareService - Basis-Ressource des EMIGA-Verzeichnisdienstes"
Description: "HealthcareService - Basis-Ressource des EMIGA-Verzeichnisdienstes"
* insert Meta
* insert Security
* ^version = "1.0.0"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* insert DomainResourceCommon

// 'Additional content defined by implementations'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 0..0

// 'External identifiers for this item'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* identifier 0..0

// 'Whether this HealthcareService record is in active use'
// Wir wollen den Status von angebotenen Dienstleistungen klar unterscheiden können. Entsprechend machen wir das Element verpflichtend.
* active 1..1 MS

// 'Organization that provides this service'
// Dienstleistungen müssen immer auf eine anbietende Organisation zurückzuführen sein. Entsprechend machen wir das Element verpflichtend.
* providedBy 1..1 MS
* providedBy only Reference(BaseOrganization)

// 'Broad category of service being performed or delivered'
// Sollten wir für eine bessere Kategorisierung der Dienstleistungen nutzen. Entsprechend machen wir das Element verpflichtend und binden es an eine Werteliste.
* category 1.. MS 
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #closed
  * ^slicing.description = "slicing healthcare service category by system"
  * ^slicing.ordered = false
* category contains emigaHealthcareServiceCategory 0..1 MS
* category[emigaHealthcareServiceCategory] from HealthcareServiceCategory
  * coding.system = $HealthcareServiceCategory

// 'Type of service that may be delivered or performed'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// !!! Perspektivisch wäre das sicherlich sinnvoll, um die Dienstleistungen besser zu kategorisieren. !!!
// !!! Dann benötigen wir aber auch eine entsprechende Werteliste. !!!
* type 0..0 

// 'Specialties handled by the HealthcareService'
// Würde einer Fachrichtung (z.B. 'Kardiologie') entsprechen.
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* specialty 0..0

// 'Location(s) where service may be provided'
// Referenzierung der Standorte, an denen die Dienstleistung angeboten wird.
* location 0..* MS
* location only Reference(BaseLocation)

// 'Description of service as presented to a consumer while searching'
* name 0..1 MS

// 'Additional description and/or any specific issues not covered elsewhere'
* comment 0..1 MS

// 'Extra details about the service that can't be placed in the other fields'
* extraDetails 0..1 MS 

// 'Facilitates quick identification of the service'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* photo 0..0

// 'Contacts related to the healthcare service'
* telecom 0.. 

// 'Location(s) service is intended for/available to'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* coverageArea 0..0

// Conditions under which service is available/offered'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* serviceProvisionCode 0..0

// 'Specific eligibility requirements required to use the service'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* eligibility 0..0

// 'Programs that this service is applicable to'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* program 0..0

// 'Collection of characteristics (attributes)'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* characteristic 0..0

// 'The language that this service is offered in'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* communication 0..0

// 'Ways that the service accepts referrals'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* referralMethod 0..0

// 'If an appointment is required for access to this service'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* appointmentRequired 0..0

// 'Times the Service Site is available'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* availableTime 0..0

// 'Not available during this time due to provided reason'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* notAvailable 0..0

// 'Description of availability exceptions'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* availabilityExceptions 0..0

// 'Technical endpoints providing access to services operated for the healthcare service'
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* endpoint 0..0