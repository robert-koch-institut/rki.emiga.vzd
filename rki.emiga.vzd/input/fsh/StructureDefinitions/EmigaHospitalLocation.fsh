Profile: EmigaHospitalLocation
Parent: Location
Id: EmigaHospitalLocation
Title: "Krankenhaus-Standort"
Description: "TO DO"
//
* ^version = "0.1.0"
* ^date = "2025-05-26"

* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaTags
* insert ProfileMetaProfileTags

* meta.security contains readOnly 0..1 MS
* meta.security[readOnly].system 1.. MS
* meta.security[readOnly].system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* meta.security[readOnly].code 1.. MS
* meta.security[readOnly].code = #INFOREADONLY
* meta.security[readOnly].display MS
* meta.security[readOnly].display = "read only information"

* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* extension 

// 'Unique code or number identifying the location to its users' - 0..* - Identifier
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
// Update: Wir öffnen die Identifikation des Standortes, um diesen eindeutiger zuordnen zu können

* identifier ^short = "Logischer Identifier"
* identifier ^definition = "Logischer Identifier der Standort"
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
   emigaOrgvId 0..1 MS and standortId 0..1 MS and standortnummer-dkg 0..1 MS
    

* identifier[emigaOrgvId] only IdentifierEmigaOrgvId
* identifier[emigaOrgvId] ^definition = "Emiga Organizationsverzeichnis ID to be used in Identifiers"
* identifier[emigaOrgvId] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].system 1.. MS
* identifier[emigaOrgvId].value 1.. MS

* identifier[standortId] only Identifier
* identifier[standortId] ^short = "Standort-Id"
* identifier[standortId] ^patternIdentifier.system = "https://demis.rki.de/fhir/NamingSystem/InekStandortId"
* identifier[standortId] ^definition = "Die InEK Standort-Id dient der eindeutigen Identifizierung von Krankenhausstandorten. Die entsprechenden Krankenhausstandorte werden im InEK Standortverzeichnis verwaltet. Die Vergabe der eindeutigen 6-stelligen Standort-Id erfolgt durch das Institut für das Entgeltsystem im Krankenhaus GmbH (InEK)."
* identifier[standortId].system 1.. MS
* identifier[standortId].value 1.. MS

* identifier[standortnummer-dkg] only $identifier-standortnummer
* identifier[standortnummer-dkg] ^comment = "Motivation : Entsprechend der Festlegung der DKG laut Basisprofile-DE 1.5.0 (https://simplifier.net/packages/de.basisprofil.r4/) "
* identifier[standortnummer-dkg] ^patternIdentifier.system = "http://fhir.de/sid/dkgev/standortnummer"
* identifier[standortnummer-dkg].system 1.. MS
* identifier[standortnummer-dkg].value 1.. MS

/*
* identifier[telematikID] only $identifier-telematik-id
* identifier[telematikID] ^comment = "Anschluß GA in TI s.gematik.de/sektoren/oegd"
* identifier[telematikID] ^patternIdentifier.system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[telematikID].system 1.. MS
* identifier[telematikID].value 1.. MS
// 'active | suspended | inactive' - 0..1 - code
// Wir wollen des Status zwingend unterscheiden können und verlangen daher dessen Angabe
*/
* status 1..1 MS
* status ^short = "Status"
* status ^definition = "Aktivitätsstatus des Standortes"
* status ^comment = "Wir wollen des Status zwingend unterscheiden können und verlangen daher dessen Angabe. Wird für InEK Szenario von Standort.GültigVon-GültigBis abgeleitet."

// 'The operational status of the location (typically only for a bed/room)' - 0..1 - Coding
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
* operationalStatus 0..0

// 'Name of the location as used by humans' - 0..1 - string
// Bezeichnung des Standortes, z.B. 'Niederlassung Berliner Str.'
* name 1..1 MS
* name ^short = "Bezeichnung"
* name ^definition = "Bezeichnung des Standortes , z.B. 'Niederlassung Berliner Str."
* name obeys validString

// 'A list of alternate names that the location is known as or was known as in the past' - 0..* - string
// Begründung: Es kann sinnvoll sein, Standorte unter verschiedenen Namen zu suchen
* alias 0..* MS
* alias ^short = "Kürzel / Referenz - Haupt-IK"
* alias ^definition = "Alternativ oder Kurznamme, in InEK Szenarios wird der Haupt-IK des Refererenz-Krankenhauses verwendet."
* alias obeys validString
* alias ^comment = "Aus dem Feld Standort::Referenzkrankenhaus wird das Element „HauptIK“ gelesen. Daraufhin wird in der Krankenhaus-Map nach der IK gesucht und der Wert (= Bezeichnung) als alias gespeichert. Da manche Standorte nur „Hauptstandort“ heißen, ist das zum Teil nötig"

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
//* address.type MS
//* address.type ^comment = "Es wird benötigt um den physische Addressen-Typ zu kennzeichnen, z.B. ob es sich um eine Postanschrift oder eine Besuchsadresse handelt."
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
* physicalType MS
* physicalType.coding.system 1..1 MS
* physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* physicalType.coding.version MS
* physicalType.coding.code 1..1 MS
* physicalType.coding.code = #si
* physicalType.coding.display MS
* physicalType.coding.display = "Site"

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
* managingOrganization only Reference(EmigaOrganization)
* managingOrganization.identifier 0..1 MS
* managingOrganization.identifier ^short = "Haupt-IK"
* managingOrganization.identifier ^definition = "Haupt-IK des Referenz-Krankenhauses, das den Standort verwaltet."
//* managingOrganization.identifier.extension
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