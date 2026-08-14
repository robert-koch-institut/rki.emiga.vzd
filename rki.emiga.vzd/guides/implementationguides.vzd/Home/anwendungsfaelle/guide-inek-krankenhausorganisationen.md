# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Krankenhäusern und krankenhausbezogenen Organisationen und Standorten im VZD.

Die allgemeinen fachlichen Regeln zur Entität `Einrichtung`, zum Lebenszyklus, zur Zuständigkeit, zur Sichtbarkeit und zur Verknüpfung mit weiteren EMIGA-Entitäten sind in den Grundlagen des VZD beschrieben.

<!-- TODO: Verweis auf die gemeinsame VZD-Grundlagenseite ergänzen. -->
<!-- TODO: Die noch offenen Extensions der verwendeten Profile ergänzen. -->

## Überblick

Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im VZD mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` für das Krankenhaus,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder für Stationen,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts,
- `EmigaDepartmentOrganization` für organisatorische Teile einer Abteilung,
- `EmigaPractitioner` für fachlich zugeordnete Personen,
- `EmigaPractitionerRole` für die Zuordnung einer Person zu einer Organisation und Rolle,
- `EmigaHealthcareService` für angebotene Gesundheitsleistungen.

{{render:guides/implementationguides.common/PlantUML/PNGs/VzdOverview.png}}

Die Profile unterscheiden zwischen organisatorischen Einheiten und physischen Orten. Eine Klinik oder Fachabteilung ist beispielsweise eine organisatorische Einheit, während ein Krankenhausstandort, eine Station oder ein Raum einen physischen Ort beschreibt.

## Fachlicher Ablauf

Eine Krankenhausorganisation wird im VZD angelegt oder aus einer führenden Quelle übernommen. Anschließend werden die Organisationsdaten fachlich ergänzt und präzisiert. Dazu gehören insbesondere Name, Identifikatoren, Organisationsart, Zuständigkeiten und hierarchische Beziehungen.

Im nächsten Schritt können die zugehörigen Standorte und räumlichen Einheiten ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalOrg.png}}

Ansprechpersonen und weitere fachlich zugeordnete Personen werden über `EmigaPractitioner` und `EmigaPractitionerRole` verknüpft. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben und können den Organisationen sowie den Standorten zugeordnet werden.

Die Krankenhausorganisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Krankenhausorganisation

Das Profil `EmigaHospitalOrganization` bildet ein Krankenhaus im Kontext von EMIGA ab. Es enthält insbesondere Stammdaten, Kennziffern, Kontakt- und Adressdaten.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalOrganization.png}}

| Element | Bedeutung |
| --- | --- |
| `identifier` | Fachliche Identifikatoren des Krankenhauses, beispielsweise Institutionskennzeichen oder weitere Krankenhauskennungen. |
| `active` | Gibt an, ob das Krankenhaus aktuell betrieben und verwendet werden kann. |
| `type` | Fachliche Einordnung des Krankenhauses. |
| `name` | Offizielle Bezeichnung des Krankenhauses. |
| `alias` | Kurz- oder Alternativbezeichnungen. |
| `telecom` | Telefonische und elektronische Kontaktdaten. |
| `address` | Post- oder Hauptanschrift des Krankenhauses. |
| `managingOrganization` | Übergeordnete Organisation, sofern das Krankenhaus einer übergeordneten Organisation zugeordnet ist. |
| `location` | Referenzen auf zugehörige Krankenhausstandorte. |

`EmigaHospitalOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

## Krankenhausstandorte

Das Profil `EmigaHospitalLocation` bildet einen besuchbaren Standort eines Krankenhauses ab. Dazu gehören beispielsweise ein Hauptstandort, ein Klinikgebäude oder ein weiterer Krankenhausstandort.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalLocation.png}}

| Element | Bedeutung |
| --- | --- |
| `identifier` | Kennung des Krankenhausstandorts. |
| `status` | Status des Standorts. |
| `name` | Bezeichnung des Standorts. |
| `address` | Adresse des Standorts. |
| `position` | Optionale Geokoordinaten. |
| `managingOrganization` | Referenz auf das verwaltende `EmigaHospitalOrganization`. |
| `partOf` | Referenz auf einen übergeordneten Standort. |

Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder Stationen eines Krankenhauses ab.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalFacilityLocation.png}}

Das Profil `EmigaHospitalRoomLocation` bildet einen Raum in einem Krankenhaus ab. Es dient der strukturierten Erfassung von räumlichen Einheiten innerhalb eines Krankenhausstandorts (z. B. Zimmer, Behandlungsräume, Isolationsbereiche) einschließlich ihrer Identifikation und Zuordnung zu übergeordneten Organisationseinheiten.

{{render:guides/implementationguides.common/PlantUML/PNGs/HospitalRoomLocation.png}}

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von Krankenhaus-Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

<!-- TODO: Die verbindlichen Endpunkte und Operationsnamen anhand der VZD- und EpiWarn-Spezifikation prüfen. -->

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach Krankenhaus-Organisationen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Organisationsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Standorten. | `Bundle` vom Typ `searchset` |
| `/HealthcareService/$search-healthcare-service` | `GET`, `POST` | Suche nach Gesundheitsleistungen. | `Bundle` vom Typ `searchset` |
| `/PractitionerRole/$search-practitioner-role` | `GET`, `POST` | Suche nach Personen und Rollen. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer Krankenhaus-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Organisation. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt.

Physische Standorte, Gesundheitsleistungen, Personen und Rollen werden als eigene Ressourcen angelegt und mit der Organisation verknüpft.

Bei einer Änderung werden insbesondere Identifier, Organisationstyp, fachliche Rolle, Zuständigkeit, Kommunikationsadresse, Gültigkeitszeitraum und Ansprechpersonen geprüft.

Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

<!-- TODO: Festlegen, ob Änderungen versioniert werden und ob eine Historienoperation angeboten wird. -->

## Suche und Anzeige

Typische Suchkriterien sind:

- Krankenhaus-Identifier,
- Code-Side-ID,
- Name oder Namensbestandteil,
- Organisationstyp,
- Krankenhaus-Rolle,
- meldende Organisation,
- empfangende Organisation,
- zuständige Organisation,
- Ort oder Postleitzahl,
- Status,
- Kommunikationsadresse,
- übergeordnete Organisation,
- Gesundheitsleistung,
- Ansprechperson.

Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind.

Bei der Anzeige muss zwischen Organisation, physischem Standort, Gesundheitsleistung und Ansprechperson unterschieden werden.

<!-- TODO: Die unterstützten Suchparameter sowie `_count`, `_offset` und Sortierparameter ergänzen. -->

## Interoperabilitätshinweise

Clients sollen folgende Regeln berücksichtigen:

- `EmigaOrganization` ist für nicht direkt nutzende ÖGD-Organisationen vorgesehen.
- `EmigaPublicHealthOrganization` ist für direkt nutzende ÖGD-Organisationen mit Code-Side-ID vorgesehen.
- Die Code-Side-ID wird über `IdentifierCodeSiteId` abgebildet.
- Organisationen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaLocation` oder ein spezialisiertes Standortprofil abgebildet.
- Die verwaltende Organisation eines Standorts wird über `managingOrganization` referenziert.
- Gesundheitsleistungen werden über `EmigaHealthcareService` abgebildet.
- Die anbietende Organisation wird über `providedBy` referenziert.
- Standorte einer Gesundheitsleistung werden über `location` referenziert.
- Personen und Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` abgebildet.
- Die Rolle einer Organisation muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Organisation ist nicht automatisch die zuständige Organisation.
- Nur aktive und aktuell gültige Organisationen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.