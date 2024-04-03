Profile: BasePractitioner
Parent: Practitioner
Id: BasePractitioner
Title: "Practitioner - Basis-Ressource des EMIGA-Verzeichnisdienstes"
Description: "Practitioner - Basis-Ressource des EMIGA-Verzeichnisdienstes"
* insert Meta
* insert Security
* ^version = "1.0.0"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* insert DomainResourceCommon

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

// 'A contact detail for the practitioner (that apply to all roles)' - 0..* - ContactPoint
* telecom 0.. MS

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