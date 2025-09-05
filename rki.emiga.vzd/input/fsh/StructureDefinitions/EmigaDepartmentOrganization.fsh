Profile: EmigaDepartmentOrganization
Parent: Organization
Id: EmigaDepartmentOrganization
Title: "Fachabteilung"
Description: "Unter einer Fachabteilung versteht man einen organisatorischen Teil einer Abteilung (nicht der physischen Ort)."

* ^version = "1.0.0"
* ^date = "2024-03-12"

* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaProfileTags
* insert ProfileMetaTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganization|2.0.0-alpha.10"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
// Update: extension benuzt um den Zeitraum der Gültigkeit der Organisation abzubilden
* extension MS
* extension contains $OrganizationPeriod named organizationPeriod 0..*
* extension[organizationPeriod] ^isModifier = false
* extension[organizationPeriod] ^mustSupport = true
* extension[organizationPeriod] ^short = "Zeitraum der Gültigkeit"
* extension[organizationPeriod] ^definition = "Zeitraum der Gültigkeit der Organisation"
* modifierExtension ..0
//* modifierExtension ..0
// 'Identifies this organization across multiple systems' - 0..* - Identifier
// Logischer Identifier der Organisation
// Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)
// Update zu v2: Wir  nutzen Slicing um die verschiedenen Identifier-Typen zu unterscheiden. Addiert gematik-ID und emigaOrgvId
// Discussion: Soll identifier pflicht sein 1..1?
* identifier 1..* MS
* identifier ^short = "Logischer Identifier"
* identifier ^definition = "Logischer Identifier der Organisation"
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
    emigaOrgvId 0..1 MS and
    emigaOrgvFileNumber 0..1 MS and
    IKNR 0..1 MS and
    BSNR 0..1 MS and
    Abteilungsidentifikator 0..1 MS and
    demisParticipantId 0..1 MS and
    telematikID 0..1 MS 

* identifier[emigaOrgvId] only IdentifierEmigaOrgvId
* identifier[emigaOrgvId] ^definition = "Emiga Organizationsverzeichnis ID to be used in Identifiers"
* identifier[emigaOrgvId] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].system 1.. MS
* identifier[emigaOrgvId].value 1.. MS
* identifier[emigaOrgvFileNumber] only IdentifierEmigaOrgvFileNumber
* identifier[emigaOrgvFileNumber] ^definition = "Emiga Organizationsverzeichnis Aktenzeichen to be used in Identifiers"
* identifier[emigaOrgvFileNumber] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].system 1.. MS
* identifier[emigaOrgvFileNumber].value 1.. MS
* identifier[IKNR] only $identifier-iknr
* identifier[IKNR] ^definition = "Die ARGE·IK vergibt und pflegt so genannte Institutionskennzeichen (IK). Das sind neunstellige Ziffernfolgen"
* identifier[IKNR] ^patternIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[BSNR] only $identifier-bsnr
* identifier[BSNR] ^definition = "Jede Betriebsstätte und jede Nebenbetriebsstätte nach den Definitionen des Bundesmantelvertrages-Ärzte erhalten jeweils eine Betriebsstättennummer. Die Betriebsstättennummer ist neunstellig. Die ersten beiden Ziffern stellen den KV-Landes- oder Bezirksstellenschlüssel gemäß Anlage 1 (Richtlinie der Kassenärztlichen Bundesvereinigung nach § 75 Absatz 7SGB V zur Vergabe der Arzt-, Betriebsstätten- sowie der Praxisnetznummern) dar (Ziffern 1-2). Die Ziffern drei bis neun werden von der KV vergeben (Ziffern 3-9). Dabei sind die Ziffern drei bis sieben so zu wählen, dass anhand der ersten sieben Stellen die Betriebsstätte eindeutig zu identifizieren ist."
* identifier[BSNR] ^patternIdentifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Abteilungsidentifikator] ^comment = "Motivation: Für IDs, die Krankhausintern spezifischen Fachabteilungen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung."
* identifier[Abteilungsidentifikator] ^patternIdentifier.type = $sct#225746001
* identifier[Abteilungsidentifikator].system 1.. MS
* identifier[Abteilungsidentifikator].value 1.. MS

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

// 'Whether the organization's record is still in active use' - 0..1 - boolean
// Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist.
* active 1..1 MS
* active ^comment = "Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist."


// 'Kind of organization' - 0..* - CodeableConcept
// In einer ersten Version beschränken wir uns auf die Organisationstypen, die für die EMIGA Anwendungsfälle benötigt werden. Später können wir hier über Slicing weitere Organisationstypen (DEMIS, gematik, usw.) abbilden.
* type ^short = "Organizationsart"
* type ^definition = "Art der Organization"
* type 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization type by system"
  * ^slicing.ordered = false
* type contains emigaOrganizationType 0..1 MS and 
  organizationType 1..1 MS and
  //ErweiterterFachabteilungsschluessel 0..1 MS and
  fachbereich 0..1 MS
/** type[emigaOrganizationType] from OrganizationType (required)
  * ^patternCodeableConcept.coding.system = $OrganizationType
  * insert StrictCodableConcept
  */
* type[emigaOrganizationType] from OrganizationType (required)
//  * ^patternCodeableConcept.coding.system = $OrganizationType
  * insert StrictCodableConcept
* type[organizationType] = $hl7-organization-type#dept
//* type[organizationType] ^definition = "TODO: Ein beschreibung über den feste Kode dept schreiben"
  //* ^patternCodeableConcept.coding.system = $OrganizationType
  * insert StrictCodableConcept
//* type[ErweiterterFachabteilungsschluessel] from $Fachabteilungsschluessel-erweitert (required)
//  * insert StrictCodableConcept
//* type[ErweiterterFachabteilungsschluessel] ^comment = "Motivation: Das ValueSet muss bindend sein, damit Systemübergreifend der Fachabteilungstyp einheitlich kodiert werden kann. \n  \n  Dieses ValueSet KANN über ein Mapping (siehe Abschnitt https://wiki.hl7.de/index.php?title=IG:Value_Sets_f%C3%BCr_XDS#DocumentEntry.practiceSettingCode) mit dem ValueSet der Fachrichtung verknüpft werden und darüber ggf. die Integration von Systemen erleichtern."
* type[fachbereich] from $Fachbereich (required)
* type[fachbereich].coding.code 1..1 MS
* type[fachbereich].coding.system 1..1 MS
* type[fachbereich].coding.display MS




// 'Name used for the organization' - 0..1 - string
// Der Name der Organisation ist für uns ein Pflichtfeld
* name 1..1 MS
* name obeys validString
* name ^short = "Name"
* name ^definition = "Name der Organization"


// 'A list of alternate names that the organization is known as, or was known as in the past' - 0..* - string
// Wir lassen bewusst eine beliebige Anzahl von Alias-Namen zu. Sollte hier aus fachlichen Gründen eine Beschränkung notwendig sein, können wir das später nachziehen.
* alias 0.. MS
* alias ^comment = "Hinweis: Hier können Kürzel genutzt werden. Ein System muss den Alias einer Organisation zum Abruf bereitstellen, sofern diese Information verfügbar ist."
* alias obeys validString

// 'A contact detail for the organization' - 0..* - ContactPoint
// Diskussion: Wollen wir verschiedene Telekommunikationswege über Slicing abbilden?
// Entscheidung: Wir bilden die verschiedene Telekommunikationswege über Slicing ab, um den regex regeln zu implementieren

* telecom 0.. MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom ^definition = "Kontaktangaben der Organisation. Telefonnummern, E-Mailadressen, Urls und Faxnummern können angegeben werden."
* telecom contains
    Email 0..* and
    Phone 0..* and
    Url 0..* and
    Fax 0..*
* telecom[Email].system 1.. MS
* telecom[Email].system = #email (exactly)
* telecom[Email].value 1.. MS
* telecom[Email].value obeys validEmailAddress
* telecom[Phone].system 1.. MS
* telecom[Phone].system = #phone (exactly)
* telecom[Phone].value 1.. MS
* telecom[Phone].value obeys validPhoneNumber
* telecom[Url].system 1.. MS
* telecom[Url].system = #url (exactly)
* telecom[Url].value 1.. MS
* telecom[Url].value obeys validUrl
* telecom[Fax].system 1.. MS
* telecom[Fax].system = #fax (exactly)
* telecom[Fax].value 1.. MS
* telecom[Fax].value obeys validFaxNumber

// 'An address for the organization' - 0..* - Address
// Diskussion: Wie viele Adressen benötigen wir, wenn wir hier eh nur die Postadresse festlegen? 
// Wir starten strikt mit maximal einer Adresse. Später können wir hier auch über Slicing mehrere Adressen abbilden, falls erforderlich
// Für V 1.1.0 erlauben wir mehrere Addressen um Hauptaddresse etc. abzubilden
* address 0..* MS
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

// 'The organization of which this organization forms a part' - 0..1 - Reference(Organization)
// Über dieses Element ist eine Hierarchiebildung möglich.
* partOf 1..1 MS
* partOf only Reference(Organization) 
* partOf ^comment = "Über dieses Element ist eine Hierarchiebildung möglich."


// 'Contact for the organization for a certain purpose' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Wir verbieten 'contact' erstmal, bis wir es später für weitere Organisationstypen und eine weiterführende Kompatibilität ggf. benötigen
* contact 0..0
* contact ^comment = "Wir verbieten 'contact' erstmal, bis wir es später für weitere Organisationstypen und eine weiterführende Kompatibilität ggf. benötigen"

// 'Technical endpoints providing access to services operated for the organization' - 0..* - Reference(Endpoint)
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Sobald wir technische Endpoints abbilden, müssen wir hier bestimmt eine weitere Profilierung vornehmen
* endpoint 0..0
* endpoint ^comment = "Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt. Sobald wir technische Endpoints abbilden, müssen wir hier bestimmt eine weitere Profilierung vornehmen"

// Invariants to validate the address and telecom values

//    Max. Zeichenlänge = 255 / Alle Zeichen erlaubt / Formatvalidierung E-Mail 
/*
Invariant: validEmailAddress
Description: "Die E-Mail-Adresse muss valide sein."
* severity = #error
* expression = "$this.matches('^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+[.])+[a-zA-Z0-9]{2,63}$')"

//    Max. Zeichenlänge = 50 / Nur Zahlen erlaubt / Länderpräfix mit Deutschland als Default 
Invariant: validPhoneNumber
Description: "Die Telefonnummer muss valide sein."
* severity = #error
* expression = "$this.matches('^(( ?\\\\+[0-9]{2,4}( ?[0-9]+? ?| ? \\\\([0-9]+?\\\\) ?))|(\\\\(0[0-9 ]+?\\\\) ?)|( 0[0-9]+? ?( |-|\\/) ?))? ?[0-9]+?[0-9 \\/-]*[0-9]$')"

//     Max. Zeichenlänge = 1000 / Alle Zeichen erlaubt / Formatvalidierung Website

Invariant: validUrl
Description: "Die Url muss valide sein."
* severity = #error
* expression = "$this.matches('^(https?:\\/\\/)?([\\da-z.-]{1,1000})\\.([a-z.]{2,6})([/\\w.-]{0,999})\\/?$')"

// TODO: Verify need of regex
Invariant: validFaxNumber
Description: "Die Faxnummer muss valide sein."
* severity = #error
* expression = "$this.matches('^(( ?\\\\+[0-9]{2,4}( ?[0-9]+? ?| ? \\\\([0-9]+?\\\\) ?))|(\\\\(0[0-9 ]+?\\\\) ?)|( 0[0-9]+? ?( |-|\\/) ?))? ?[0-9]+?[0-9 \\/-]*[0-9]$')"

// valid String

Invariant: validString
Description: "Zeichenlänge maximal 255 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,255}$')"

// valid Hausnummer

Invariant: validHouseNumber
Description: "Die Hausnummer muss valide sein. Zeichenlänge maximal 50 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,50}$')"


//valid PLZ

Invariant: validPLZ
Description: "Die PLZ muss valide sein. Zeichenlänge maximal 10 Zeichen"
* severity = #error
* expression = "$this.matches('^.{1,10}$')"
*/