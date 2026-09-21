# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung generischer Einrichtungen und Einrichtungen im Verzeichnisdienst (EINRV).

## Überblick

Generische Einrichtungen werden über das Profil `EmigaOrganization` abgebildet. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/GenericOrganizationOverview.svg}}

Das Profil umfasst Einrichtungen, die keine direkt nutzende ÖGD-Einrichtung und kein Krankenhaus sind und keine CodeSite-ID besitzen.

Dazu gehören beispielsweise:

- Behörden,
- Transport-Unternehmen,
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

Eine generische Einrichtung muss nicht zwingend über eine Straßenanschrift verfügen. Häufig besitzt sie jedoch zumindest eine Postanschrift oder elektronische Kontaktdaten. Zusätzlich können physische Orte, Gesundheitsleistungen und fachlich zugeordnete Personen verwaltet werden.

## Fachlicher Ablauf

Eine generische Einrichtung wird manuell angelegt, aus einem zentralen Verzeichnis übernommen, im Rahmen einer DEMIS-Meldung erzeugt oder eingelesen. Nach der Anlage werden Stammdaten, Einrichtungstyp, Identifier, Kontaktdaten und gegebenenfalls Standorte ergänzt.

Physische Orte werden über `EmigaLocation` abgebildet. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben und können den Einrichtungen sowie den Standorten zugeordnet werden.. Personen und deren Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` mit der Einrichtung verknüpft. Die Einrichtung kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Beschreibung der Profile
### Generische Einrichtung

Das Profil `EmigaOrganization` bildet eine generische Einrichtung im Kontext von EMIGA ab.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/Organization.svg}}

`EmigaOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`. Eine generische Einrichtung ist von einer `EmigaPublicHealthOrganization` zu unterscheiden. `EmigaPublicHealthOrganization` beschreibt direkt nutzende ÖGD-Einrichtungen mit einer CodeSite-ID.

### Physische Orte

Das Profil `EmigaLocation` beschreibt einen physischen Ort, der besucht werden kann.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/Location.svg}}

Ein physischer Ort kann grundsätzlich über Geokoordinaten und in der Regel über eine Straßenadresse beschrieben werden. Eine `EmigaLocation` kann über `managingOrganization` einer Einrichtung zugeordnet werden.

### Fachabteilung

Das Profil `EmigaDepartmentOrganization` beschreibt einen organisatorischen Teil einer Abteilung, nicht den physischen Ort.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/DepartmentOrganization.svg}}

Eine `EmigaDepartmentOrganization` kann über `managingOrganization` einer Einrichtung zugeordnet werden.


### Dienstleistungen im EINRV

Falls eine Einrichtung eine Dienstleistung anbietet, kann diese über `EmigaHealthcareService` abgebildet werden. Beispiel einer Dienstleistung ist Ein Hotline einer Einrichtung oder ein/-e Ansprechpartner_in.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HealthCareService.svg}}

Die Dienstleistung wird über `providedBy` der anbietenden Einrichtung zugeordnet. Die Standorte, an denen sie angeboten wird, werden über `EmigaLocation` referenziert.

### Ansprechpersonen und Rollen

Einrichtungen können mit `EmigaPractitioner` und `EmigaPractitionerRole` verknüpft werden.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/Practitioner.svg}}
{{render:guides/implementationguides.vzd/PlantUML/SVGs/PractitionerRole.svg}}

Die Sichtbarkeit der Ansprechpersonen wird getrennt von der Sichtbarkeit der Einrichtung gesteuert.

## Schnittstellenoperationen

<!--> NOTIZ: Dynamische mittels fql Represantation der Tabelle unten, wenn ok ich werde die Tabelle entfernen <-->
<fql>
using scope

from CapabilityStatement

where
    url = 'https://emiga.rki.de/fhir/vzd/CapabilityStatement/EmigaEINRVCapabilityStatementRequirements'

for rest.resource

where
    supportedProfile
        .where(
            $this = %canonical
        )
        .exists()

for interaction

select
    'Operation': code,
    'Zweck': documentation,
    'Verbindlichkeit':
        extension
            .where(
                url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation'
            )
            .value

with header
</fql>

Der EINRV stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von generischen Einrichtungen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach generischen Einrichtungen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Einrichtungsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Standorten. | `Bundle` vom Typ `searchset` |
| `/HealthcareService/$search-healthcare-service` | `GET`, `POST` | Suche nach Gesundheitsleistungen. | `Bundle` vom Typ `searchset` |
| `/PractitionerRole/$search-practitioner-role` | `GET`, `POST` | Suche nach Personen und Rollen. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer generischen Einrichtung. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Einrichtung. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Einrichtung. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Einrichtung werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den EINRV übermittelt. Bei einer Änderung werden insbesondere Identifier, Einrichtungstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Einrichtungsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Einrichtungen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

## EpiWarn Organizationen

EpiWarn-Einrichtungen dienen der eindeutigen Identifikation und Verwaltung von Einrichtungen und Stellen, die unter Paragraf 2 IfSG-Koordinierungs-VwV an EpiWarn-Prozessen beteiligt sind. EpiWarn-Einrichtungen werden grundsätzlich über die für generische Einrichtungen vorgesehenen EMIGA-Profile abgebildet mit befüllung der 'meta.tag:relevance' Elementes mit der Wert 'IfsgKoordVwV'. Je nach fachlichem Bedarf kann insbesondere EmigaOrganization verwendet werden. Handelt es sich bei einer EpiWarn-Einrichtung um eine direkt nutzende ÖGD-Einrichtung mit CodeSite-ID, wird EmigaPublicHealthOrganization verwendet.

Eine EpiWarn-Einrichtung kann beispielsweise folgende Funktionen haben:

- zuständige Einrichtung,
- weiterleitende Einrichtung,
- fachlich beteiligte Einrichtung,
- koordinierende Stelle,
- Kontaktstelle für Rückfragen.

Im Folgenden wird ein Beispiel für einen EpiWarn Organization dargestellt.

<tabs>
    <tab title="Übersicht">      
        {{render:Organization-EpiWarnOrganization.json}}
    </tab>
    <tab title="XML">      
        {{xml:Organization-EpiWarnOrganization.json}}
    </tab>
    <tab title="JSON">
        {{json:Organization-EpiWarnOrganization.json}}
    </tab>
    <tab title="Link">
        {{link:Organization-EpiWarnOrganization.json}}
    </tab>
</tabs>


## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- `EmigaOrganization` ist für nicht direkt nutzende ÖGD-Einrichtungen vorgesehen.
- Einrichtungen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaLocation` oder ein spezialisiertes Standortprofil abgebildet.
- Die verwaltende Einrichtung eines Standorts wird über `managingOrganization` referenziert.
- Gesundheitsleistungen werden über `EmigaHealthcareService` abgebildet.
- Die anbietende Einrichtung wird über `providedBy` referenziert.
- Standorte einer Gesundheitsleistung werden über `location` referenziert.
- Personen und Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` abgebildet.
- Die Rolle einer Einrichtung muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Einrichtung ist nicht automatisch die zuständige Einrichtung.
- Nur aktive und aktuell gültige Einrichtungen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Einrichtung verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.