Profile: BasePractitioner
Parent: Practitioner
Id: BasePractitioner
Title: "BasePractitioner (Basis-Ressource des EMIGA-Verzeichnisdienstes)"
Description: "Personen, die im weiteren Sinne einen Bezug zur Erbringung von Leistungen/Erfüllung von Aufgaben innerhalb der Gesundheitsversorgung (hier: ÖGD) haben. Dies sind somit explizit nicht nur Ärztinnen und Ärzte sondern auch andere Personengruppen, wie z.B. MitarbeiterInnen im Gesundheitsamt, LeiterInnen/AnsprechpartnerInnen von Gemeinschaftseinrichtungen. Patienten, Kontaktpersonen etc. fallen jedoch explizit NICHT unter diese Kategorie."
* insert MetadataProfile
* ^version = "1.0.0"
* ^date = "2024-03-18"

* insert ProfileResourceCommon
* insert ProfileDomainResourceCommon
* insert ProfileSecurityTags

// 'Additional content defined by implementations' - 0..* - Extension
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* extension 0..0

// 'An identifier for the person as this agent' - 0..* - Identifier
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Zukünftig sicherlich spannend, wenn weitere Personentypen mit eigenen Identifiern verwealtet werden müssen.
* identifier 0..0

// 'Whether this practitioner's record is in active use' - 0..1 - boolean
// Der entsprechende Eintrag muss gepflegt werden, um eindeutig feststellen zu können, ob ein Eintrag noch aktiv ist.
* active 1..1 MS

// 'The name(s) associated with the practitioner' - 0..* - HumanName
* name 1..1 MS
* name only $humanname-de-basis
* name.family 1.. MS  
* name.family obeys validString
* name.given 1.. MS  
* name.given obeys validString


// 'A contact detail for the practitioner (that apply to all roles)' - 0..* - ContactPoint
// We slice the telecom element to apply the regex rules

* telecom 0.. MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #closed
* telecom ^definition = "Kontaktangaben der Organisation. Telefonnummern, E-Mailadressen, Urls und Faxnummern können angegeben werden."
* telecom contains
    Email 0..* and
    Phone 0..* and
    Fax 0..*
* telecom[Email].system 1.. MS
* telecom[Email].system = #email (exactly)
* telecom[Email].value 1.. MS
* telecom[Email].value obeys validEmailAddress
* telecom[Phone].system 1.. MS
* telecom[Phone].system = #phone (exactly)
* telecom[Phone].value 1.. MS
* telecom[Phone].value obeys validPhoneNumber
* telecom[Fax].system 1.. MS
* telecom[Fax].system = #fax (exactly)
* telecom[Fax].value 1.. MS
* telecom[Fax].value obeys validFaxNumber

// 'Address(es) of the practitioner that are not role specific (typically home address)' - 0..* - Address
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* address 0..0

// 'male | female | other | unknown' - 0..1 - code
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* gender 0..0

// 'The date on which the practitioner was born' - 0..1 - date
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* birthDate 0..0

// 'Image of the person' - 0..* - Attachment
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
// Kann aber sicherlich interssant sein, um eine personalisierung von Kontaktdaten auf freiwilliger Basis zu ermöglichen
* photo 0..0

// 'Certification, licenses, or training pertaining to the provision of care' - 0..* - BackboneElement
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* qualification 0..0

// 'A language the practitioner is able to use in patient communication' - 0..* - CodeableConcept
// Wird für die EMIGA Anwendungsfälle derzeit nicht benötigt.
* communication 0..0
/*
// Invariants to validate the address and telecom values

//    Max. Zeichenlänge = 255 / Alle Zeichen erlaubt / Formatvalidierung E-Mail 
Invariant: validEmailAddress
Description: "Die E-Mail-Adresse muss valide sein."
* severity = #warning
* expression = "$this.matches('^(?=.{1,255}$)[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+[.])+[a-zA-Z0-9]{2,63}$')"

//    Max. Zeichenlänge = 50 / Nur Zahlen erlaubt / Länderpräfix mit Deutschland als Default 
Invariant: validPhoneNumber
Description: "Die Telefonnummer muss valide sein."
* severity = #warning
* expression = "$this.matches('^(49|0049|0)?\d{1,50}$')"

// TODO: Verify need of regex
Invariant: validFaxNumber
Description: "Die Faxnummer muss valide sein."
* severity = #warning
* expression = "$this.matches('^[0+][0-9 \\\\-\\\\(\\\\)]{6,50}$')"

// valid String

Invariant: validString
Description: "Zeichenlänge maximal 255 Zeichen"
* severity = #warning
* expression = "$this.matches('^.{1,255}$')"

// valid Hausnummer

Invariant: validHouseNumber
Description: "Die Hausnummer muss valide sein. Zeichenlänge maximal 50 Zeichen"
* severity = #warning
* expression = "$this.matches('^.{1,50}$')"
*/



