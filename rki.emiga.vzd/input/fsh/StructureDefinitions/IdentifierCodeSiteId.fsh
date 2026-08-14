Profile: IdentifierCodeSiteId
Parent: Identifier
Id: IdentifierCodeSiteId
Title: "Identifier-Profil CodeSiteId"
Description: "'IdentifierCodeSiteId' ist ein Identifier-Profil für die vom RKI vergebene Kennung der Organisationen des ÖGDs (Gesundheitsamts, Landesstelle, usw.)."

* ^version = "1.0.0"
* ^date = "2023-11-30"

* insert MetadataProfile
* type = $v2-0203#PRN
* system 1.. MS
* system = $CodeSiteId
* value 1.. MS