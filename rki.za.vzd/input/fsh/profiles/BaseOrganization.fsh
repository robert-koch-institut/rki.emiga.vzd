Profile: BaseOrganization
Parent: Organization
Id: BaseOrganization
Title: "Organization - Basis-Ressource des EMIGA-Verzeichnisdienstes"
Description: "Organization - Basis-Ressource des EMIGA-Verzeichnisdienstes"
* insert Meta
* insert Security
* insert ResourceCommon
* ^version = "1.0.0"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* insert DomainResourceCommon

// Diskussion: Wir starten erstmal ohne extensions und nehmen das Feld erst dann dazu, wenn wir es benötigen
* extension 0..0

// Logischer Identifier der Organisation
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization identifier by system"
  * ^slicing.ordered = false
* identifier contains codeSiteId 0..1 MS
* identifier[codeSiteId] only IdentifierCodeSiteId

// Diskussion: Wollen wir active zum Pflichtfeld machen
* active MS

// Art/Typ der Organisation
// Diskussion: Mit welchem ValueSet wollen wir hier starten. Eigentlich benötigen wir hier schon die Union aus EMIGA, DEMIS und perspektivisch gematik. D.h. wir sollten ein Platzhalter VS binden oder slicen und darüber dann mehrere bindings dazunehmen
* type 1.. MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #closed
  * ^slicing.description = "slicing organization type by system"
  * ^slicing.ordered = false
* type contains emigaOrganizationType 0..1 MS
* type[emigaOrganizationType] from OrganizationType
  * coding.system = $OrganizationType

// Bezeichnung der Organisation
* name 1.. MS

// Diskussion: Wollen wir die Kardinalität begrenzen oder beliebig viele Aliase zulassen
* alias MS

// Diskussion: Wollen wir verschiedene Telekommunikationswege über Slicing abbilden?
* telecom MS

// Diskussion: Wie viele Adressen benötigen wir, wenn wir hier eh nur die Postadresse festlegen. Wir starten strikt mit genau einer Adresse
* address 0..1 MS

// Diskussion: Wir verbieten 'contact' erstmal, bis wir es für bestimmte Organisationstypen benötigen
* contact 0..0

// Diskussion: Sobald wir technische Endpoints abbilden müssen wir hier bestimmt eine weitere Profilierung vornehmen
* endpoint 0..0

