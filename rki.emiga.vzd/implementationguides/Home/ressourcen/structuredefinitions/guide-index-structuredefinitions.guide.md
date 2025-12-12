# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---

## StructureDefinitions Überblick

Dieser Abschnitt bietet eine Übersicht über die in diesem Implementierungsleitfaden definierten **FHIR-Profile und -Ressourcen**. Die Profile sind speziell für den Öffentlichen Gesundheitsdienst (**ÖGD**) in Deutschland angepasst und erweitern Standard-FHIR-Ressourcen, um spezifische Anforderungen abzubilden. Diese Ressourcen sind zentral für die Abbildung von Organisationen, Personen und Dienstleistungen im Kontext des Infektionsschutzes und der Zusammenarbeit im Öffentlichen Gesundheitsdienst.
<br>&nbsp;<br>

| **Profil**                                      | **Beschreibung**                                                                                         |
|-------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Bereich / Standort (EmigaLocation)                        | Ein 'physischer' Ort, der besucht werden kann. Einem physischen Ort können grundsätzlich Geo-Koordinaten und zumeist auch eine Straßenadresse zugeordnet werden.  |
| Dienstleistung (EmigaHealthcareService)         | Beschreibung einer Dienstleistung, die im weitesten Sinne mit dem Gesundheitswesen assoziiert ist, z.B. Tuberkulosestelle, Lebensmittelpersonal-Beratungsstelle, AIDS-Beratungsstelle. |
| Fachabteilung (EmigaDepartmentOrganization)    | Unter einer Fachabteilung versteht man einen organisatorischen Teil einer Abteilung (nicht der physischen Ort).   |
| RKI Kennung (IdentifierCodeSiteId)              | Identifier-Profil für die vom RKI vergebene Kennung des Organisationen des ÖGDs (Gesundheitsamts, Landesstelle, usw.). |
| Organisationsverzeichnis Id (IdentifierEmigaOrgVId) | Identifier Profil für EmigaOrgvId.  |
|Organisationsverzeichnis Aktenzeichen (IdentifierEmigaOrgvFileNumber) | Identifier Profil für EMIGA Organizationsverzeichnis Aktenzeichen. |
| Krankenhaus (EmigaHospitalOrganization) | TODO |
| Krankenhaus - Einrichtungsstandort (EmigaHospitalFacilityLocation) | Krankenhaus - Einrichtungsstandort bildet Einrichtungen nach InEK Standortverzeichnis oder Stationen eines Krankenhauses ab. |
| Krankenhaus - Raum (EmigaHospitalRoomLocation) | TODO |
| Krankenhaus - Standort (EmigaHospitalLocation) | TODO |
| ÖGD Organisation (EmigaPublicHealthOrganization) | Unter der ÖGD Organisation werden alle Organisationen zusammengefasst, die EMIGA direkt nutzende ÖDG-Organisationen sind, die eine Code-Side-ID besitzen.     |
| Organisation (EmigaOrganization)               | Unter der EMIGA Organization werden alle Organisationen zusammengefasst, die NICHT EMIGA direkt nutzende ÖDG-Organisationen sind, die eine Code-Side-ID besitzen. Damit werden unter EMIGA Organisationen sowohl Behörden, Transport-Unternehmen, wie Krankenhäuser, Labore oder Arztpraxen aber auch jede andere Organisation subsummiert. Die jeweiligen Organisation werden durch ihren Typen und/oder ihren Identifier eindeutig charakterisiert. EmigaOrganisationen müssen nicht zwingend eine Straßenanschrift haben, verfügen häufig jedoch zumindest über eine Postanschrift. |
| Organisationsverzeichnis Bundle (OrgVBundle) | TODO  |
| Practitioner (EmigaPractitioner)                | Personen, die im weiteren Sinne einen Bezug zur Erbringung von Leistungen/Erfüllung von Aufgaben innerhalb der Gesundheitsversorgung (hier: ÖGD) haben. Dies sind somit explizit nicht nur Ärztinnen und Ärzte sondern auch andere Personengruppen, wie z.B. MitarbeiterInnen im Gesundheitsamt, LeiterInnen/AnsprechpartnerInnen von Gemeinschaftseinrichtungen. Patienten, Kontaktpersonen etc. fallen jedoch explizit NICHT unter diese Kategorie.  |
| Practitioner Role (EmigaPractitionerRole)       | Definiert einen bestimmten Satz von Attributen, die einem Practitioner zugeordnet werden. Dazu gehören beispielsweise die Zuordnung zu einer bestimmten Organisation aber auch die Rolle die wahrgenommen wird. |