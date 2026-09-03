# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung generischer Einrichtungen und Organisationen im VZD.

Die allgemeinen fachlichen Regeln zur Entität `Einrichtung`, zum Lebenszyklus, zur Zuständigkeit, zur Sichtbarkeit und zur Verknüpfung mit weiteren EMIGA-Entitäten sind in den Grundlagen des VZD beschrieben.

<!-- TODO: Verweis auf die gemeinsame VZD-Grundlagenseite ergänzen. -->
<!-- TODO: Die noch offenen Extensions der verwendeten Profile ergänzen. -->

## Überblick

{{render:guides/implementationguides.common/PlantUML/PNGs/GenericOrganizationOverview.png}}

Generische Organisationen werden über das Profil `EmigaOrganization` abgebildet. Das Profil umfasst Organisationen, die keine direkt nutzende ÖGD-Organisation mit Code-Side-ID sind.

Dazu gehören beispielsweise:

- Behörden,
- Transport-Unternehmen,
- Krankenhäuser,
- Labore,
- Arztpraxen,
- Pflegeeinrichtungen,
- Schulen,
- Kindergärten,
- Gemeinschaftseinrichtungen,
- Unterkünfte,
- Lebensmittelbetriebe,
- Unternehmen,
- Forschungseinrichtungen,
- sonstige Institutionen.

Eine generische Organisation muss nicht zwingend über eine Straßenanschrift verfügen. Häufig besitzt sie jedoch zumindest eine Postanschrift oder elektronische Kontaktdaten.

Zusätzlich können physische Orte, Gesundheitsleistungen und fachlich zugeordnete Personen verwaltet werden.

## Fachlicher Ablauf

Eine generische Organisation wird manuell angelegt, aus einem zentralen Verzeichnis übernommen, im Rahmen einer DEMIS-Meldung erzeugt oder über einen Excel-Import eingelesen.

Nach der Anlage werden Stammdaten, Organisationstyp, Identifier, Kontaktdaten und gegebenenfalls Standorte ergänzt.

{{render:guides/implementationguides.common/PlantUML/PNGs/OrganizationOrg.png}}

Physische Orte werden über `EmigaLocation` abgebildet. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben. Personen und deren Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` mit der Organisation verknüpft.

Die Organisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Generische Organisation

{{render:guides/implementationguides.common/PlantUML/PNGs/Organization.png}}

Das Profil `EmigaOrganization` bildet eine generische Organisation im Kontext von EMIGA ab.

| Element | Bedeutung |
| --- | --- |
| `identifier` | Eindeutige fachliche oder technische Identifikatoren. |
| `active` | Gibt an, ob die Organisation aktuell verwendet werden kann. |
| `type` | Fachliche Kategorie der Organisation. |
| `name` | Offizielle Bezeichnung der Organisation. |
| `alias` | Kurz- oder Alternativbezeichnungen. |
| `address` | Postanschrift oder gegebenenfalls Straßenanschrift. |
| `telecom` | Telefon, E-Mail, Webadresse und weitere Kommunikationswege. |
| `managingOrganization` | Referenz auf die verwaltende Organisation, sofern vorhanden. |
| `location` | Referenzen auf zugehörige physische Orte. |
| `contact` | Verknüpfte Ansprechpersonen oder Funktionsrollen. |

`EmigaOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

Eine generische Organisation ist von einer `EmigaPublicHealthOrganization` zu unterscheiden. `EmigaPublicHealthOrganization` beschreibt direkt nutzende ÖGD-Organisationen mit einer Code-Side-ID.

## Einrichtungstypen

| Einrichtungstyp | Beispiele |
| --- | --- |
| Gesundheitsamt oder Behörde | Kommunales Gesundheitsamt, Landesbehörde oder sonstige öffentliche Stelle. |
| Krankenhaus | Krankenhaus oder medizinische Einrichtung außerhalb der spezialisierten Krankenhausabbildung. |
| Labor | Medizinisches Labor oder Untersuchungslabor. |
| Arztpraxis | Hausarztpraxis, Facharztpraxis oder Gemeinschaftspraxis. |
| Pflegeeinrichtung | Pflegeheim, Seniorenheim oder ambulante Pflegeeinrichtung. |
| Gemeinschaftseinrichtung | Schule, Kindertagesstätte oder Jugendhilfeeinrichtung. |
| Unterkunft | Gemeinschaftsunterkunft, Flüchtlingsunterkunft oder Hotel. |
| Lebensmittelbetrieb | Gastronomiebetrieb, Produktionsbetrieb oder Großküche. |
| Unternehmen | Betrieb, Arbeitgeber oder sonstige Firma. |
| Forschungseinrichtung | Universität oder Forschungsinstitut. |
| Transport-Unternehmen | Unternehmen, das Transport- oder Beförderungsleistungen anbietet. |
| Sonstige Organisation | Organisation ohne spezifische fachliche Kategorie. |

<!-- TODO: Die verbindlichen Einrichtungstypen und deren Codierung ergänzen. -->
<!-- TODO: Festlegen, ob mehrere Organisationstypen gleichzeitig angegeben werden können. -->
<!-- TODO: Die Abgrenzung zwischen `EmigaOrganization` und spezialisierten Organisationsprofilen ergänzen. -->

## Physische Orte

Das Profil `EmigaLocation` beschreibt einen physischen Ort, der besucht werden kann.

{{render:guides/implementationguides.common/PlantUML/PNGs/Location.png}}

Ein physischer Ort kann grundsätzlich über Geokoordinaten und in der Regel über eine Straßenadresse beschrieben werden.

| Element | Bedeutung |
| --- | --- |
| `identifier` | Eindeutige Kennung des physischen Orts. |
| `status` | Status des Orts. |
| `name` | Bezeichnung des Orts. |
| `address` | Straßen- oder Standortadresse. |
| `position` | Optionale Geokoordinaten. |
| `managingOrganization` | Referenz auf die verwaltende Organisation. |
| `partOf` | Referenz auf einen übergeordneten physischen Ort. |

Ein `EmigaLocation` kann über `managingOrganization` einer `EmigaOrganization` zugeordnet werden.

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von generischen Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

<!-- TODO: Die verbindlichen Endpunkte und Operationsnamen anhand der VZD- und generische Organisation-Spezifikation prüfen. -->

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach generischen Organisationen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Organisationsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Standorten. | `Bundle` vom Typ `searchset` |
| `/HealthcareService/$search-healthcare-service` | `GET`, `POST` | Suche nach Gesundheitsleistungen. | `Bundle` vom Typ `searchset` |
| `/PractitionerRole/$search-practitioner-role` | `GET`, `POST` | Suche nach Personen und Rollen. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer generischen Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Organisation. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer generischen Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt.

Physische Standorte, Gesundheitsleistungen, Personen und Rollen werden als eigene Ressourcen angelegt und mit der Organisation verknüpft.

Bei einer Änderung werden insbesondere Identifier, Organisationstyp, fachliche Rolle, Zuständigkeit, Kommunikationsadresse, Gültigkeitszeitraum und Ansprechpersonen geprüft.

Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

<!-- TODO: Festlegen, ob Änderungen versioniert werden und ob eine Historienoperation angeboten wird. -->

## Suche und Anzeige

Typische Suchkriterien sind:

- Organisations-Identifier,
- Code-Side-ID,
- Name oder Namensbestandteil,
- Organisationstyp,
- Organisations-Rolle,
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