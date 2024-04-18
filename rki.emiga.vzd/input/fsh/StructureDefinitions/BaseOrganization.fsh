Profile: BaseOrganization
Parent: Organization
Id: BaseOrganization
Title: "BaseOrganization (Basis-Ressource des EMIGA-Verzeichnisdienstes)"
Description: "Ein formaler Zusammenschluss von Personen, Institutionen etc., um einen gemeinsamen Zweck zu erreichen. Dies können zum Beispiel Arztpraxen, Gesundheitsämter, Schulen aber auch eine einzelne Abteilung eines Gesundheitsamtes sein. Organisationen müssen nicht zwingend eine Straßenanschrift haben, verfügen häufig jedoch zumindest über eine Postanschrift."
* insert Meta
* insert Security
* insert ResourceCommon
* ^version = "1.0.0"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* insert DomainResourceCommon

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 0..0

// 'Identifies this organization across multiple systems' - 0..* - Identifier
// Logischer Identifier der Organisation
// Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization identifier by system"
  * ^slicing.ordered = false
* identifier contains codeSiteId 0..1 MS
* identifier[codeSiteId] only IdentifierCodeSiteId

// 'Whether the organization's record is still in active use' - 0..1 - boolean
// Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist.
* active 1..1 MS

// 'Kind of organization' - 0..* - CodeableConcept
// In einer ersten Version beschränken wir uns auf die Organisationstypen, die für die EMIGA Anwendungsfälle benötigt werden. Später können wir hier über Slicing weitere Organisationstypen (DEMIS, gematik, usw.) abbilden.
* type 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #closed
  * ^slicing.description = "slicing organization type by system"
  * ^slicing.ordered = false
* type contains emigaOrganizationType 0..1 MS
* type[emigaOrganizationType] from OrganizationType (required)
  * ^patternCodeableConcept.coding.system = $OrganizationType

// 'Name used for the organization' - 0..1 - string
// Der Name der Organisation ist für uns ein Pflichtfeld
* name 1..1 MS

// 'A list of alternate names that the organization is known as, or was known as in the past' - 0..* - string
// Wir lassen bewusst eine beliebige Anzahl von Alias-Namen zu. Sollte hier aus fachlichen Gründen eine Beschränkung notwendig sein, können wir das später nachziehen.
* alias 0.. MS

// 'A contact detail for the organization' - 0..* - ContactPoint
// Diskussion: Wollen wir verschiedene Telekommunikationswege über Slicing abbilden?
* telecom 0.. MS

// 'An address for the organization' - 0..* - Address
// Diskussion: Wie viele Adressen benötigen wir, wenn wir hier eh nur die Postadresse festlegen? 
// Wir starten strikt mit maximal einer Adresse. Später können wir hier auch über Slicing mehrere Adressen abbilden, falls erforderlich
* address 0..1 MS
* address only $address-de-basis

// 'The organization of which this organization forms a part' - 0..1 - Reference(Organization)
// Über dieses Element ist eine Hierarchiebildung möglich.
* partOf 0..1 MS
* partOf only Reference(BaseOrganization) 

// 'Contact for the organization for a certain purpose' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Wir verbieten 'contact' erstmal, bis wir es später für weitere Organisationstypen und eine weiterführende Kompatibilität ggf. benötigen
* contact 0..0

// 'Technical endpoints providing access to services operated for the organization' - 0..* - Reference(Endpoint)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Sobald wir technische Endpoints abbilden, müssen wir hier bestimmt eine weitere Profilierung vornehmen
* endpoint 0..0

