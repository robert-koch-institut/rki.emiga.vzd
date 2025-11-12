Profile: EmigaLocation
Parent: Location
Id: EmigaLocation
Title: "EMIGA Bereich / Standort"
Description: "Ein 'physischer' Ort, der besucht werden kann. Einem physischen Ort können grundsätzlich Geo-Koordinaten und zumeist auch eine Straßenadresse zugeordnet werden."
//
* ^version = "1.2.0"
* ^date = "2025-10-27"

* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaTags
* insert ProfileMetaProfileTags

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation|2.0.0-alpha.10"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 0..0

// 'Unique code or number identifying the location to its users' - 0..* - Identifier
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
// Update: Wir öffnen die Identifikation des Standortes, um diesen eindeutiger zuordnen zu können

//* identifier 0..*
//* identifier.system 1..1  MS
//* identifier.value 1..1  MS
* identifier ^short = "Logischer Identifier"
* identifier ^definition = "Logischer Identifier der Organisation"
* identifier 0..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
   emigaOrgvId 0..1 MS and
    emigaOrgvFileNumber 0..1 MS and 
    BSNR 0..1 MS and
    demisParticipantId 0..1 MS and
    telematikID 0..1 MS

* identifier[emigaOrgvId] only IdentifierEmigaOrgvId
* identifier[emigaOrgvId] ^definition = "EMIGA Organizationsverzeichnis ID to be used in Identifiers"
* identifier[emigaOrgvId] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].system 1.. MS
* identifier[emigaOrgvId].value 1.. MS

* identifier[emigaOrgvFileNumber] only IdentifierEmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber] ^definition = "EMIGA Organizationsverzeichnis Aktenzeichen to be used in Identifiers"
* identifier[emigaOrgvFileNumber] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].system 1.. MS
* identifier[emigaOrgvFileNumber].value 1.. MS

* identifier[BSNR] only $identifier-bsnr
* identifier[BSNR] ^definition = "Jede Betriebsstätte und jede Nebenbetriebsstätte nach den Definitionen des Bundesmantelvertrages-Ärzte erhalten jeweils eine Betriebsstättennummer. Die Betriebsstättennummer ist neunstellig. Die ersten beiden Ziffern stellen den KV-Landes- oder Bezirksstellenschlüssel gemäß Anlage 1 (Richtlinie der Kassenärztlichen Bundesvereinigung nach § 75 Absatz 7SGB V zur Vergabe der Arzt-, Betriebsstätten- sowie der Praxisnetznummern) dar (Ziffern 1-2). Die Ziffern drei bis neun werden von der KV vergeben (Ziffern 3-9). Dabei sind die Ziffern drei bis sieben so zu wählen, dass anhand der ersten sieben Stellen die Betriebsstätte eindeutig zu identifizieren ist."
//* identifier[BSNR] ^patternIdentifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[BSNR].system 1..1 MS
* identifier[BSNR].value 1..1 MS
/*
* identifier[organisationseinheitenID] ^comment = "Kommentar von Isik Basis: Motivation: Für IDs, die Krankhausintern spezifischen Organisationseinheiten wie Abteilungen oder Stationen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung. Da auch Stationen im Identifier-System inkludiert werden könnten, sollte hier das Identifier generisch Organisationseinheiten abbilden und nicht Abteilungen allein."
* identifier[organisationseinheitenID] ^patternIdentifier.type = $sct#43741000
* identifier[organisationseinheitenID].system 1.. MS
* identifier[organisationseinheitenID].value 1.. MS
*/
* identifier[demisParticipantId] only Identifier
* identifier[demisParticipantId] ^short = "DEMIS-Teilnehmer-Nummer"
* identifier[demisParticipantId] ^patternIdentifier.system = "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId] ^definition = "DEMIS-Teilnehmernummer, welche durch das RKI an ausgewählte Systemteilnehmer vergeben wird. Der Identifier entstammt folgendem NamingSystem: https://demis.rki.de/fhir/NamingSystem/DemisParticipantId."
* identifier[demisParticipantId].system 1.. MS
* identifier[demisParticipantId].value 1.. MS

* identifier[telematikID] only $identifier-telematik-id
* identifier[telematikID] ^comment = "Anschluß GA in TI s.gematik.de/sektoren/oegd"
* identifier[telematikID] ^patternIdentifier.system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].system 1.. MS
* identifier[telematikID].value 1.. MS
// 'active | suspended | inactive' - 0..1 - code
// Wir wollen des Status zwingend unterscheiden können und verlangen daher dessen Angabe
// Update 27.10.25 Status wird auf "optional" gesetzt, um bestehende Standorte ohne Statusangabe weiterhin nutzen zu können.
* status 0..1 MS
* status ^short = "Status"
* status ^definition = "Aktivitätsstatus des Standortes"
* status ^comment = "Wir wollen des Status zwingend unterscheiden können und verlangen daher dessen Angabe"

// 'The operational status of the location (typically only for a bed/room)' - 0..1 - Coding
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* operationalStatus 0..0

// 'Name of the location as used by humans' - 0..1 - string
// Bezeichnung des Standortes, z.B. 'Niederlassung Berliner Str.'
* name 0..1 MS
* name ^short = "Bezeichnung"
* name ^definition = "Bezeichnung des Standortes , z.B. 'Niederlassung Berliner Str."
* name obeys validString

// 'A list of alternate names that the location is known as or was known as in the past' - 0..* - string
// Begründung: Es kann sinnvoll sein, Standorte unter verschiedenen Namen zu suchen
* alias 0..1 MS
* alias ^short = "Kürzel"
* alias ^definition = "Alternativ oder Kurznamme"
* alias obeys validString
* alias ^comment = "Begründung: Es kann sinnvoll sein, Standorte unter verschiedenen Namen zu suchen"

// 'Additional details about the location that could be displayed as further information to identify the location beyond its name' - 0..1 - string
// Begründung: Es kann sinnvoll sein, Standorte durch zusätzliche Informationen zu identifizieren
* description 0..1 MS
* description ^short = "zusätzliche Informationen"
* description ^definition = "zusätzliche Informationen"
* description ^comment = "Begründung: Es kann sinnvoll sein, Standorte durch zusätzliche Informationen zu identifizieren"

// 'instance | kind' - 0..1 - code
// Wir wollen im Verzeichnis lediglich tatsächliche Standorte verwalten. Typen/Arten von Standorten sind nicht von Interesse.
// Entsprechend wird der Mode auf 'instance' gesetzt.
* mode 1..1 MS
* mode = #instance
* mode ^comment = "Wir wollen im Verzeichnis lediglich tatsächliche Standorte verwalten. Typen/Arten von Standorten sind nicht von Interesse."

// 'Type of function performed' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Die Funktionen sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden.
* type 0..0
* type ^comment = "Begründung: Die Funktionen sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden."

// 'Contact details of the location' - 0..* - ContactPoint
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Die Kontaktdaten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden.
* telecom 0..0
* telecom ^comment = "Begründung: Die Kontaktdaten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden."

// 'Physical location' - 0..1 - Address
// Besuchbare Anschrift des Standortes
* address ^comment = "Besuchbare Anschrift des Standortes"
* address 0..1 MS
* address only $address-de-basis
* address.extension[Stadtteil] ^mustSupport = true
* address.extension[Stadtteil].valueString MS
* address.extension[Stadtteil].valueString obeys validString
* address.line.extension[Strasse] ^mustSupport = true
* address.line.extension[Strasse].valueString MS
* address.line.extension[Strasse].valueString obeys validString
* address.line.extension[Hausnummer] ^mustSupport = true
* address.line.extension[Hausnummer].valueString MS
* address.line.extension[Hausnummer].valueString obeys validHouseNumber
* address.line.extension[Adresszusatz] ^mustSupport = true
* address.line.extension[Adresszusatz].valueString MS
* address.line.extension[Adresszusatz].valueString obeys validString
* address.line.extension[Postfach] ^mustSupport = true
* address.line.extension[Postfach].valueString MS
* address.line.extension[Postfach].valueString obeys validString
* address.city MS
* address.city obeys validString
* address.state MS
* address.postalCode MS 
* address.postalCode obeys validPLZ


// 'Physical form of the location' - 0..1 - code
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* physicalType 0..0
* physicalType ^comment = "Wird für die EMIGA generische Bereiche / Standorte derzeit nicht benötigt."

// 'The absolute geographic location' - 0..1 - BackboneElement
// Begründung: Perspektivisch hilfreich, wenn Standorte in Karten dargestellt werden sollen und eine Ableitung über die Adresse nicht möglich oder inkorrekt ist
* position 0..1 MS
* position ^short = "Geographische Koordinaten"
* position ^definition = "Geographische Koordinaten"
  * longitude MS
  * latitude MS
  * altitude

// 'Organization responsible for provisioning and upkeep' - 0..1 - Reference(Organization)
// Über dieses Element kann der Standort einer Organisation zugeordnet werden
// Begründung: Ein Standort gehört zwar üblicherweise zu einer Organisation. Perspektivisch kann sich der Anwendungsfall jedoch ändern, sodass ein Standort nicht direkt einer Organisation zugeordnet werden kann.
* managingOrganization 0..1 MS
* managingOrganization only Reference(Organization)
* managingOrganization ^comment = "Über dieses Element kann der Standort einer Organisation zugeordnet werden"

// 'Another location this one is physically a partof' - 0..1 - Reference(Location)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Wir haben erstmal nicht den Bedarf Hierarchien von Standorten abzubilden. Dies kann sich ggf. zukünftig ändern.
//Update(20.10.2025) Wir öffnen das Element, um ggf. Standort-Hierarchien abbilden zu können.
* partOf MS
* partOf ^short = "Übergeordneter Standort/Bereich"
* partOf ^definition = "Referenz auf übergeordneten Standort/Bereich"
* partOf ^comment = "Dieses Element kann genutzt werden, um Standort/Bereich-Hierarchien abzubilden. Wenn es belegt ist, verweist es auf den übergeordneten Standort/Bereich und die Instanz bildet ein Subbereich ab."

// 'What days/times during a week is this location usually open' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Die Öffnungszeiten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden.
* hoursOfOperation 0..0
* hoursOfOperation ^comment = "Begründung: Die Öffnungszeiten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden."

// 'Description of availability exceptions' - 0..1 - string
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Die Öffnungszeiten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden.
* availabilityExceptions 0..0
* availabilityExceptions ^comment = "Begründung: Die Öffnungszeiten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden."

// 'Technical endpoints providing access to services operated for the location' - 0..* - Reference(Endpoint)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* endpoint 0..0
* endpoint ^comment = "Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt."