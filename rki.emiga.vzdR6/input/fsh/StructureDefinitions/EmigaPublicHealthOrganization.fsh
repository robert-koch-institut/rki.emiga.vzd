Profile: EmigaPublicHealthOrganizationR6
Parent: Organization
Id: EmigaPublicHealthOrganizationR6
Title: "ÖGD Organisation"
Description: "Unter der ÖGD Organisation werden alle Organisationen zusammengefasst, die EMIGA direkt nutzende ÖDG-Organisationen sind, die eine Code-Side-ID besitzen."

* ^version = "1.2.0"
* ^date = "2026-03-09"
* insert MetadataProfile
* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ORGVProfileSecurityTags

* insert ProfileMetaProfileTags
* insert MetaTagOrgVBundle
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganizationR6"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
// Update: extension benuzt um die Art derZuständigkeit und den Zeitraum der Gültigkeit abzubilden
* extension 1.. MS
//* extension ^definition = "Art der Zuständigkeit"
// AUTO-DISABLED (SUSHI R6): * extension contains $ResponsibilityHealthdepartments named responsibilityHealthdepartments 0..* and $OrganizationPeriod named organizationPeriod 0..*
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod] ^isModifier = false
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod] ^mustSupport = true
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod] ^short = "Zeitraum der Gültigkeit"
// AUTO-DISABLED (SUSHI R6): * extension[organizationPeriod] ^definition = "Zeitraum der Gültigkeit der Organisation"
// AUTO-DISABLED (SUSHI R6): * extension[responsibilityHealthdepartments] ^isModifier = false
// AUTO-DISABLED (SUSHI R6): * extension[responsibilityHealthdepartments] ^mustSupport = true
* modifierExtension ..0

// 'Identifies this organization across multiple systems' - 0..* - Identifier
// Logischer Identifier der Organisation
// Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)

* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization identifier by pattern"
  * ^slicing.ordered = false
* identifier contains 
    codeSiteId 1..1 MS and
    telematikID 0..1 MS and
    emigaOrgvId 0..1 MS and
    emigaOrgvFileNumber 0..1 MS
* identifier[codeSiteId] only IdentifierCodeSiteIdR6
* identifier ^short = "Logischer Identifier"
* identifier ^definition = "Logischer Identifier der Organisation"
* identifier[codeSiteId] ^patternIdentifier.system = $CodeSiteId
//* identifier ^comment = "Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)"
//Update: identifier telematikID hinzugefügt weil Anschluß GA in TI s.gematik.de/sektoren/oegd
* identifier[telematikID] only $identifier-telematik-id
* identifier[telematikID] ^comment = "Anschluß GA in TI s.gematik.de/sektoren/oegd"
* identifier[telematikID] ^patternIdentifier.system = "https://gematik.de/fhir/sid/telematik-id"
//* identifier[telematikID] ^patternIdentifier.value = "^[1-9][0-9]{0,10}$"
* identifier[emigaOrgvId] only IdentifierEmigaOrgvIdR6
* identifier[emigaOrgvId] ^definition = "Identifier für EmigaOrgvId"
* identifier[emigaOrgvId] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvId"
* identifier[emigaOrgvId].system 1.. MS
* identifier[emigaOrgvId].value 1.. MS
* identifier[emigaOrgvFileNumber] only IdentifierEmigaOrgvFileNumberR6
* identifier[emigaOrgvFileNumber] ^definition = "Identifier für EMIGA Organizationsverzeichnis Aktenzeichen"
* identifier[emigaOrgvFileNumber] ^patternIdentifier.system = "https://emiga.rki.de/fhir/vzd/sid/EmigaOrgvFileNumber"
* identifier[emigaOrgvFileNumber].system 1.. MS
* identifier[emigaOrgvFileNumber].value 1.. MS

// 'Whether the organization's record is still in active use' - 0..1 - boolean
// Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist.

* active 1..1 MS
* active ^comment = "Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist."

// 'Kind of organization' - 0..* - CodeableConcept
// In einer ersten Version beschränken wir uns auf die Organisationstypen, die für die EMIGA Anwendungsfälle benötigt werden. Später können wir hier über Slicing weitere Organisationstypen (DEMIS, gematik, usw.) abbilden.

* type 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^slicing.description = "slicing organization type by pattern"
  * ^slicing.ordered = false
* type contains emigaOrganizationType 0..1 MS
* type[emigaOrganizationType] from PublicHealthOrganizationType (required)
  * ^patternCodeableConcept.coding.system = $OrganizationType
  * insert StrictCodableConcept
 

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
// AUTO-DISABLED (SUSHI R6): 
// AUTO-DISABLED (SUSHI R6): * telecom 0.. MS
// AUTO-DISABLED (SUSHI R6): * telecom ^slicing.discriminator.type = #value
// AUTO-DISABLED (SUSHI R6): * telecom ^slicing.discriminator.path = "system"
// AUTO-DISABLED (SUSHI R6): * telecom ^slicing.rules = #closed
// AUTO-DISABLED (SUSHI R6): * telecom ^definition = "Kontaktangaben der Organisation. Telefonnummern, E-Mailadressen, Urls und Faxnummern können angegeben werden."
// AUTO-DISABLED (SUSHI R6): * telecom contains
    // AUTO-DISABLED (SUSHI R6): Email 0..* and
    // AUTO-DISABLED (SUSHI R6): Phone 0..* and
    // AUTO-DISABLED (SUSHI R6): Url 0..* and
    // AUTO-DISABLED (SUSHI R6): Fax 0..*
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Email].system = #email (exactly)
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Email].value obeys validEmailAddress
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].system = #phone (exactly)
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Phone].value obeys validPhoneNumber
// AUTO-DISABLED (SUSHI R6): * telecom[Url].system 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Url].system = #url (exactly)
// AUTO-DISABLED (SUSHI R6): * telecom[Url].value 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Url].value obeys validUrl
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].system 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].system = #fax (exactly)
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].value 1.. MS
// AUTO-DISABLED (SUSHI R6): * telecom[Fax].value obeys validFaxNumber

// 'An address for the organization' - 0..* - Address
// Diskussion: Wie viele Adressen benötigen wir, wenn wir hier eh nur die Postadresse festlegen? 
// Wir starten strikt mit maximal einer Adresse. Später können wir hier auch über Slicing mehrere Adressen abbilden, falls erforderlich
// Update: In V 1.1.0 erlauben wir mehree Addressen um "HauptAdresse etc. abzubilden"
// AUTO-DISABLED (SUSHI R6): * address 0..* MS
// AUTO-DISABLED (SUSHI R6): * address only $address-de-basis
// AUTO-DISABLED (SUSHI R6): * address.extension[Stadtteil] ^mustSupport = true
// AUTO-DISABLED (SUSHI R6): * address.extension[Stadtteil].valueString MS
// AUTO-DISABLED (SUSHI R6): * address.extension[Stadtteil].valueString obeys validString
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Strasse] ^mustSupport = true
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Strasse].valueString MS
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Strasse].valueString obeys validString
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Hausnummer] ^mustSupport = true
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Hausnummer].valueString MS
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Hausnummer].valueString obeys validHouseNumber
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Adresszusatz] ^mustSupport = true
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Adresszusatz].valueString MS
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Adresszusatz].valueString obeys validString
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Postfach] ^mustSupport = true
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Postfach].valueString MS
// AUTO-DISABLED (SUSHI R6): * address.line.extension[Postfach].valueString obeys validString
// AUTO-DISABLED (SUSHI R6): * address.city MS
// AUTO-DISABLED (SUSHI R6): * address.city obeys validString
// AUTO-DISABLED (SUSHI R6): * address.state MS
// AUTO-DISABLED (SUSHI R6): * address.postalCode MS 
// AUTO-DISABLED (SUSHI R6): * address.postalCode obeys validPLZ

// 'The organization of which this organization forms a part' - 0..1 - Reference(Organization)
// Über dieses Element ist eine Hierarchiebildung möglich.
* partOf 0..1 MS
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