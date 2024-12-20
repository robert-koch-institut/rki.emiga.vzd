Profile: EmigaLocation
Parent: Location
Id: EmigaLocation
Title: "EmigaLocation"
Description: "Ein 'physischer' Ort, der besucht werden kann, z.B. die Hauptstelle oder Zweigstelle eines Gesundheitsamtes. Einem physischen Ort können grundsätzlich Geo-Koordinaten und zumeist auch eine Straßenadresse zugeordnet werden."
//* insert MetadataProfile
* ^version = "1.0.0"
* ^date = "2024-12-20"

* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaTags
* insert ProfileMetaProfileTags

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 0..0

// 'Unique code or number identifying the location to its users' - 0..* - Identifier
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* identifier 0..0

// 'active | suspended | inactive' - 0..1 - code
// Wir wollen des Status zwingend unterscheiden können und verlangen daher dessen Angabe
* status 1..1 MS

// 'The operational status of the location (typically only for a bed/room)' - 0..1 - Coding
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* operationalStatus 0..0

// 'Name of the location as used by humans' - 0..1 - string
// Bezeichnung des Standortes, z.B. 'Niederlassung Berliner Str.'
* name 0..1 MS
* name ^short = "Bezeichnung"
* name ^definition = "Bezeichnung des Standortes"
* name obeys validString

// 'A list of alternate names that the location is known as or was known as in the past' - 0..* - string
// Begründung: Es kann sinnvoll sein, Standorte unter verschiedenen Namen zu suchen
* alias 0..* MS
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
* address.postalCode MS 
* address.postalCode obeys validPLZ


// 'Physical form of the location' - 0..1 - code
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* physicalType 0..0

// 'The absolute geographic location' - 0..1 - BackboneElement
// Begründung: Perspektivisch hilfreich, wenn Standorte in Karten dargestellt werden sollen und eine Ableitung über die Adresse nicht möglich oder inkorrekt ist
* position 0..1 MS
  * longitude MS
  * latitude MS
  * altitude

// 'Organization responsible for provisioning and upkeep' - 0..1 - Reference(Organization)
// Über dieses Element kann der Standort einer Organisation zugeordnet werden
// Begründung: Ein Standort gehört zwar üblicherweise zu einer Organisation. Perspektivisch kann sich der Anwendungsfall jedoch ändern, sodass ein Standort nicht direkt einer Organisation zugeordnet werden kann.
* managingOrganization 0..1 MS
* managingOrganization only Reference(Organization)

// 'Another location this one is physically a partof' - 0..1 - Reference(Location)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Wir haben erstmal nicht den Bedarf Hierarchien von Standorten abzubilden. Dies kann sich ggf. zukünftig ändern.
* partOf 0..0

// 'What days/times during a week is this location usually open' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Die Öffnungszeiten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden.
* hoursOfOperation 0..0

// 'Description of availability exceptions' - 0..1 - string
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Begründung: Die Öffnungszeiten sind in der Regel nicht für die Standorte relevant, sondern für die Dienstleistungen, die an den Standorten erbracht werden.
* availabilityExceptions 0..0

// 'Technical endpoints providing access to services operated for the location' - 0..* - Reference(Endpoint)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* endpoint 0..0