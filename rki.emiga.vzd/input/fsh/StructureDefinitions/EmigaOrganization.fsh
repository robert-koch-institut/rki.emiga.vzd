Profile: EmigaOrganization
Parent: Organization
Id: EmigaOrganization
Title: "Organization"
Description: "TODO"
//* insert MetadataProfile
* ^version = "1.0.0"
* ^date = "2024-12-12"

* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags
* insert ProfileMetaTags
//* insert ProfileMetaProfileTags

* insert ProfileMetaProfileTags
* meta.profile[emigaprofile] = "https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization"

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt
// Update: extension benuzt um die Art derZuständigkeit abzubilden
//* extension 1.. MS
//* extension contains $ResponsibilityHealthdepartments named responsibilityHealthdepartments 0..*
//* extension[responsibilityHealthdepartments] ^isModifier = false
//* modifierExtension ..0
// 'Identifies this organization across multiple systems' - 0..* - Identifier
// Logischer Identifier der Organisation
// Wir gestalten das Slicing bewusst offen, um später weitere Identifier-Typen abbilden zu können (z.B. DEMIS-ID, gematik-ID, usw.)


//Identifiers harmonisiert mit IsiK und MII. Die Demis und telematikID Werden diskutiert
* identifier ^short = "Logischer Identifier"
* identifier ^definition = "Logischer Identifier der Organisation"
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
    IKNR 0..1 MS and
    BSNR 0..1 MS and
    organisationseinheitenID 0..1 MS and 
    demisParticipantId 0..1 MS
* identifier[IKNR] only $identifier-iknr
* identifier[IKNR] ^definition = "Die ARGE·IK vergibt und pflegt so genannte Institutionskennzeichen (IK). Das sind neunstellige Ziffernfolgen"
* identifier[IKNR] ^patternIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[BSNR] only $identifier-bsnr
* identifier[BSNR] ^definition = "Jede Betriebsstätte und jede Nebenbetriebsstätte nach den Definitionen des Bundesmantelvertrages-Ärzte erhalten jeweils eine Betriebsstättennummer. Die Betriebsstättennummer ist neunstellig. Die ersten beiden Ziffern stellen den KV-Landes- oder Bezirksstellenschlüssel gemäß Anlage 1 (Richtlinie der Kassenärztlichen Bundesvereinigung nach § 75 Absatz 7SGB V zur Vergabe der Arzt-, Betriebsstätten- sowie der Praxisnetznummern) dar (Ziffern 1-2). Die Ziffern drei bis neun werden von der KV vergeben (Ziffern 3-9). Dabei sind die Ziffern drei bis sieben so zu wählen, dass anhand der ersten sieben Stellen die Betriebsstätte eindeutig zu identifizieren ist."
* identifier[BSNR] ^patternIdentifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[organisationseinheitenID] ^comment = "Motivation: Für IDs, die Krankhausintern spezifischen Organisationseinheiten wie Abteilungen oder Stationen vergeben werden, ist diese Identifier zu nutzen - analog zu Slice Abteilungsidentifikator in https://simplifier.net/medizininformatikinitiative-modulstrukturdaten/mii_pr_struktur_abteilung. Da auch Stationen im Identifier-System inkludiert werden könnten, sollte hier das Identifier generisch Organisationseinheiten abbilden und nicht Abteilungen allein."
* identifier[organisationseinheitenID] ^patternIdentifier.type = $sct#43741000
* identifier[organisationseinheitenID].system 1.. MS
* identifier[organisationseinheitenID].value 1.. MS

* identifier[demisParticipantId] only Identifier
* identifier[demisParticipantId] ^short = "DEMIS-Teilnehmer-Nummer"
* identifier[demisParticipantId] ^patternIdentifier.system = "https://demis.rki.de/fhir/NamingSystem/DemisParticipantId"
* identifier[demisParticipantId] ^definition = "DEMIS-Teilnehmernummer, welche durch das RKI an ausgewählte Systemteilnehmer vergeben wird. Der Identifier entstammt folgendem NamingSystem: https://demis.rki.de/fhir/NamingSystem/DemisParticipantId."
* identifier[demisParticipantId].system 1.. MS
* identifier[demisParticipantId].value 1.. MS
/*
* identifier[telematikID] only $identifier-telematik-id
* identifier[telematikID] ^comment = "TODO Rephrase the comment -> Motivation: Entsprechend der Profil-Festlegung der KBV Organisation 1.5.0. (https://fhir.kbv.de/StructureDefinition/KBV_PR_Base_Organization) und der VZD-FHIR-Directory Organisation-Ressource in der Version 0.10.2 (https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory), muss ein System ein Telematik-ID verarbeiten können, sofern diese Information verfügbar ist."
* identifier[telematikID] ^patternIdentifier.system = "https://gematik.de/fhir/sid/telematik-id"
*/
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
    einrichtungsArt 0..1 MS and
    erweiterterFachabteilungsschluessel 0..1 MS
* type[emigaOrganizationType] from OrganizationType (required)
  * ^patternCodeableConcept.coding.system = $OrganizationType
  * insert StrictCodableConcept
* type[einrichtungsArt] from $IHEXDShealthcareFacilityTypeCode (required)
  * insert StrictCodableConcept
* type[erweiterterFachabteilungsschluessel] from $Fachabteilungsschluessel-erweitert (required)
  * insert StrictCodableConcept
 

// 'Name used for the organization' - 0..1 - string
// Der Name der Organisation ist für uns ein Pflichtfeld
* name 1..1 MS
* name ^short = "Name"
* name ^definition = "Name der Organization"

* name obeys validString

// 'A list of alternate names that the organization is known as, or was known as in the past' - 0..* - string
// Wir lassen bewusst eine beliebige Anzahl von Alias-Namen zu. Sollte hier aus fachlichen Gründen eine Beschränkung notwendig sein, können wir das später nachziehen.
* alias MS
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
