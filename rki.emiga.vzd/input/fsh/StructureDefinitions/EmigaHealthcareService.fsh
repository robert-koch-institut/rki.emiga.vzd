Profile: EmigaHealthcareService
Parent: HealthcareService
Id: EmigaHealthcareService
Title: "HealthcareService (Ressource des EMIGA-Verzeichnisdienstes)"
Description: "Beschreibung einer Dienstleistung, die im weitesten Sinne mit dem Gesundheitswesen assoziiert ist, z.B. Tuberkulosestelle, Lebensmittelpersonal-Beratungsstelle, AIDS-Beratungsstelle"
//Temporäre outcomment um draft zu kennzeichnen.
//* insert MetadataProfile
* ^version = "1.0.0"
* ^date = "2024-03-18"

* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaProfileTags
* insert ProfileMetaTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 0..0

// 'External identifiers for this item' - 0..* - Identifier
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* identifier 0..0

// 'Whether this HealthcareService record is in active use' - 0..1 - boolean
// Wir wollen den Status von angebotenen Dienstleistungen klar unterscheiden können. Entsprechend machen wir das Element verpflichtend.
* active 1..1 MS
* active ^comment = "Wir wollen den Status von angebotenen Dienstleistungen klar unterscheiden können. Entsprechend machen wir das Element verpflichtend."

// 'Organization that provides this service' - 0..1 - Reference(Organization)
// Dienstleistungen müssen immer auf eine anbietende Organisation zurückzuführen sein. Entsprechend machen wir das Element verpflichtend.
* providedBy 1..1 MS
* providedBy only Reference(Organization)
* providedBy ^comment = "Dienstleistungen müssen immer auf eine anbietende Organisation zurückzuführen sein. Entsprechend machen wir das Element verpflichtend."

// 'Broad category of service being performed or delivered' - 0..* - CodeableConcept
// Sollten wir für eine bessere Kategorisierung der Dienstleistungen nutzen. Entsprechend machen wir das Element verpflichtend und binden es an eine Werteliste.
* category MS 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing healthcare service category by system"
  * ^slicing.ordered = false
* category contains emigaHealthcareServiceCategory 0..1 MS
* category[emigaHealthcareServiceCategory] from HealthcareServiceCategory (required)
  * ^patternCodeableConcept.coding.system = $HealthcareServiceCategory
  * insert StrictCodableConcept

// 'Type of service that may be delivered or performed' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// !!! Perspektivisch wäre das sicherlich sinnvoll, um die Dienstleistungen besser zu kategorisieren. !!!
// !!! Dann benötigen wir aber auch eine entsprechende Werteliste. !!!
// !!! Update: wird ermöglicht um "telephone counseling" etc. abzubilden
* type MS
* type from $serviceType (extensible)

// 'Specialties handled by the HealthcareService' - 0..* - CodeableConcept
// Würde einer Fachrichtung (z.B. 'Kardiologie') entsprechen.
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Update: Wird benuzt um den epiWarn Zuständigkeiten abzubilden.
* specialty MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing healthcare service specialty by system"
  * ^slicing.ordered = false
* specialty contains emigaHealthcareServiceSpecialty 0..1 MS


// 'Location(s) where service may be provided' - 0..* - Reference(Location)
// Referenzierung der Standorte, an denen die Dienstleistung angeboten wird.
* location 0..* MS
* location only Reference(EmigaLocation)
* location ^comment = "Referenzierung der Standorte, an denen die Dienstleistung angeboten wird."

// 'Description of service as presented to a consumer while searching' - 0..1 - string
* name 0..1 MS


// 'Additional description and/or any specific issues not covered elsewhere' - 0..1 - string
* comment 0..1 MS

// 'Extra details about the service that can't be placed in the other fields' - 0..1 - markdown
* extraDetails 0..1 MS 

// 'Facilitates quick identification of the service' - 0..1 - Attachment
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* photo 0..0

// 'Contacts related to the healthcare service' - 0..* - ContactPoint
* telecom 0.. 

// 'Location(s) service is intended for/available to' - 0..* - Reference(Location)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* coverageArea 0..0

// Conditions under which service is available/offered' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* serviceProvisionCode 0..0

// 'Specific eligibility requirements required to use the service' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* eligibility 0..0

// 'Programs that this service is applicable to' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* program 0..0

// 'Collection of characteristics (attributes)' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* characteristic 0..0

// 'The language that this service is offered in' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* communication 0..0

// 'Ways that the service accepts referrals' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* referralMethod 0..0

// 'If an appointment is required for access to this service' - 0..1 - boolean
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* appointmentRequired 0..0

// 'Times the Service Site is available' - 0..* - BackboneElement

// Hier werden entsprehend die Erreichbarkeitsdaten abgebildet
* availableTime MS
* availableTime obeys ORGV-Service-Opening-Time
* availableTime.extension contains $dutyHoursEx named dutyHoursAvailability 0..1 MS

* availableTime.daysOfWeek MS
* availableTime.allDay MS
* availableTime.availableStartTime MS
* availableTime.availableEndTime MS
// 'Not available during this time due to provided reason' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Update: Wird benötigt
* notAvailable MS

// 'Description of availability exceptions' - 0..1 - string
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Update: Wird benötigt
* availabilityExceptions MS

// 'Technical endpoints providing access to services operated for the healthcare service' - 0..* - Reference(Endpoint)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* endpoint 0..0

Invariant: ORGV-Service-Opening-Time
Description: "If DutyHoursAvailability code is '24/7', then daysOfWeek, availableStartTime, and availableEndTime must not be present."
* severity = #error
* expression = "extension('https://emiga.rki.de/fhir/vzd/Extension/DutyHoursAvailability').valueCoding.code = '24/7' implies (daysOfWeek.empty() and availableStartTime.empty() and availableEndTime.empty())"
//* expression = "extension('https://emiga.rki.de/fhir/vzd/Extension/DutyHoursAvailability').exists() xor (daysOfWeek.exists() and availableStartTime.exists() and availableEndTime.exists())"