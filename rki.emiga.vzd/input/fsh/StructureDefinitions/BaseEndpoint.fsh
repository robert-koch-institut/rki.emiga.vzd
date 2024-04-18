Profile: BaseEndpoint
Parent: Endpoint
Id: BaseEndpoint
Title: "BaseEndpoint (Basis-Ressource des EMIGA-Verzeichnisdienstes)"
Description: "Hilfskonstrukt, welches es erlaubt, technische Angaben zu einem Dienst-Endpunkt zu machen. Dies beinhaltet sowohl Adressierungsinformationen als auch Informationen zum Sicherheitskontext, z.B. Zertifikate"
* insert MetadataProfile
* ^version = "1.0.0"
* ^date = "2024-03-18"

* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* extension 0..0

// 'Identifies this endpoint across multiple systems' - 0..* - Identifier
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #closed
  * ^slicing.description = "slicing endpoint identifier by system"
  * ^slicing.ordered = false
* identifier contains codeSiteId 0..1 MS
* identifier[codeSiteId] only IdentifierCodeSiteId

// 'active | suspended | error | off | entered-in-error | test' - 1..1 - code
* status 1..1 MS

// 'Protocol/Profile/Standard to be followed by this endpoint connection' - 1..1 - Coding
* connectionType 1..1 MS
* connectionType from EndpointConnectionType

// 'A name that this endpoint can be identified by' - 0..1 - string
* name 1..1 MS

// 'Organization that manages this endpoint (may not be the organization that exposes the endpoint)' - 0..1 - Reference(Organization)
* managingOrganization 1..1 MS
* managingOrganization only Reference(BaseOrganization) 

// 'Contact details for source (e.g. troubleshooting)' - 0..* - ContactPoint
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* contact 0..0

// 'Interval the endpoint is expected to be operational' - 0..1 - Period
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* period 0..0

// 'The type of content that may be used at this endpoint (e.g. XDS Discharge summaries)' - 1..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* payloadType 1..* MS

// 'Mimetype to send. If not specified, the content could be anything (including no payload, if the connectionType defined this)' - 0..* - code
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* payloadMimeType 0..0

// 'The technical base address for connecting to this endpoint' - 1..1 - url
* address 1..1 MS

// 'Usage depends on the channel type' - 0..* - string
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* header 0..0

