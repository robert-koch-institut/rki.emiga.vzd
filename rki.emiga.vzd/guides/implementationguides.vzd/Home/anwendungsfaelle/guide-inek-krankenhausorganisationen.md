# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Krankenhäusern und krankenhausbezogenen Organisationen bzw. Standorten im Verzeichnisdienst (VZD).

## Überblick

Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im VZD mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` für das Krankenhaus,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder für Stationen,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalOverview.png}}

Die Profile unterscheiden zwischen organisatorischen Einheiten und physischen Orten. Eine Klinik oder Fachabteilung ist beispielsweise eine organisatorische Einheit, während ein Krankenhausstandort, eine Station oder ein Raum einen physischen Ort beschreibt.

## Fachlicher Ablauf

Eine Krankenhausorganisation wird im VZD angelegt oder aus einer führenden Quelle übernommen. Anschließend werden die Organisationsdaten fachlich ergänzt und präzisiert. Dazu gehören insbesondere Name, Identifikatoren, Organisationsart, Zuständigkeiten und hierarchische Beziehungen.

Im nächsten Schritt können die zugehörigen Standorte und räumlichen Einheiten ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet. Die Krankenhausorganisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Beschreibung der Profile
### Krankenhausorganisation

Das Profil `EmigaHospitalOrganization` bildet ein Krankenhaus im Kontext von EMIGA ab. Es dient der strukturierten Erfassung von Stammdaten des Krankenhauses (z. B. Name, Kennziffern, Kontakt- und Adressdaten) für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. `EmigaHospitalOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalOrganization.png}}

### Krankenhausstandort

Das Profil `EmigaHospitalLocation` bildet einen Standort eines Krankenhauses ab. Dazu gehören beispielsweise ein Hauptstandort, ein Klinikgebäude oder ein weiterer Krankenhausstandort. Es dient der strukturierten Erfassung von besuchbaren Krankenhaus-Standorten (z. B. Hauptstandort, Klinikgebäude, Stationen) einschließlich Adress- und ggf. Geokoordinaten für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. 

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalLocation.png}}

### Krankenhauseinrichtungsstandort

Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungen nach dem InEK Standortverzeichnis oder Stationen eines Krankenhauses ab. Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder Stationen eines Krankenhauses ab.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalFacilityLocation.png}}

### Krankenhausraum

Das Profil `EmigaHospitalRoomLocation` bildet einen Raum in einem Krankenhaus ab. Es dient der strukturierten Erfassung von räumlichen Einheiten innerhalb eines Krankenhausstandorts (z. B. Zimmer, Behandlungsräume, Isolationsbereiche) einschließlich ihrer Identifikation und Zuordnung zu übergeordneten Organisationseinheiten.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalRoomLocation.png}}

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von Krankenhaus-Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach Krankenhaus-Organisationen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Krankenhaus-Organisationsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Krankenhaus-Standorten. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer Krankenhaus-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Krankenhaus-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Krankenhaus-Organisation. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt. Bei einer Änderung werden insbesondere Identifier, Organisationstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- Organisationen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaLocation` oder ein spezialisiertes Standortprofil abgebildet.
- Die verwaltende Organisation eines Standorts wird über `managingOrganization` referenziert.
- Die Rolle einer Organisation muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Organisation ist nicht automatisch die zuständige Organisation.
- Nur aktive und aktuell gültige Organisationen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.