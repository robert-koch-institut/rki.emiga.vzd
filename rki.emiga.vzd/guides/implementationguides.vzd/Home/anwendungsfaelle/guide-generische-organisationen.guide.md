# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung generischer Einrichtungen und Organisationen im Verzeichnisdienst (VZD).

## Überblick

Generische Organisationen werden über das Profil `EmigaOrganization` abgebildet. 

{{render:guides/implementationguides.vzd/PlantUML/PNGs/GenericOrganizationOverview.png}}

Das Profil umfasst Organisationen, die keine direkt nutzende ÖGD-Organisation mit Code-Side-ID sind.

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

Eine generische Organisation muss nicht zwingend über eine Straßenanschrift verfügen. Häufig besitzt sie jedoch zumindest eine Postanschrift oder elektronische Kontaktdaten. Zusätzlich können physische Orte, Gesundheitsleistungen und fachlich zugeordnete Personen verwaltet werden.

## Fachlicher Ablauf

Eine generische Organisation wird manuell angelegt, aus einem zentralen Verzeichnis übernommen, im Rahmen einer DEMIS-Meldung erzeugt oder eingelesen. Nach der Anlage werden Stammdaten, Organisationstyp, Identifier, Kontaktdaten und gegebenenfalls Standorte ergänzt.

Physische Orte werden über `EmigaLocation` abgebildet. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben und können den Organisationen sowie den Standorten zugeordnet werden.. Personen und deren Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` mit der Organisation verknüpft. Die Organisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Beschreibung der Profile
### Generische Organisation

Das Profil `EmigaOrganization` bildet eine generische Organisation im Kontext von EMIGA ab.

{{render:guides/implementationguides.vzd/PlantUML/PNGs/Organization.png}}

`EmigaOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`. Eine generische Organisation ist von einer `EmigaPublicHealthOrganization` zu unterscheiden. `EmigaPublicHealthOrganization` beschreibt direkt nutzende ÖGD-Organisationen mit einer Code-Side-ID.

### Physische Orte

Das Profil `EmigaLocation` beschreibt einen physischen Ort, der besucht werden kann.

{{render:guides/implementationguides.vzd/PlantUML/PNGs/Location.png}}

Ein physischer Ort kann grundsätzlich über Geokoordinaten und in der Regel über eine Straßenadresse beschrieben werden. Eine `EmigaLocation` kann über `managingOrganization` einer Organisation zugeordnet werden.

### Fachabteilung

Das Profil `EmigaDepartmentOrganization` beschreibt einen organisatorischen Teil einer Abteilung, nicht den physischen Ort.

{{render:guides/implementationguides.vzd/PlantUML/PNGs/DepartmentOrganization.png}}

Eine `EmigaDepartmentOrganization` kann über `managingOrganization` einer Organisation zugeordnet werden.


### Gesundheitsleistungen

Falls eine Organisation eine gesundheitsbezogene Dienstleistung anbietet, kann diese über `EmigaHealthcareService` abgebildet werden.

{{render:guides/implementationguides.vzd/PlantUML/PNGs/HealthCareService.png}}

Die Gesundheitsleistung wird über `providedBy` der anbietenden Organisation zugeordnet. Die Standorte, an denen sie angeboten wird, werden über `EmigaLocation` referenziert.

### Ansprechpersonen und Rollen

Organisationen können mit `EmigaPractitioner` und `EmigaPractitionerRole` verknüpft werden.

{{render:guides/implementationguides.vzd/PlantUML/PNGs/Practitioner.png}}
{{render:guides/implementationguides.vzd/PlantUML/PNGs/PractitionerRole.png}}

Die Sichtbarkeit der Ansprechpersonen wird getrennt von der Sichtbarkeit der Organisation gesteuert.

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von generischen Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

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

Beim Erstellen einer Krankenhaus-Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt. Bei einer Änderung werden insbesondere Identifier, Organisationstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- `EmigaOrganization` ist für nicht direkt nutzende ÖGD-Organisationen vorgesehen.
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