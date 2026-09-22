# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von ÖGD Einrichtungen und Einrichtungen, die im Rahmen von ÖGD fachlich relevant sind, im Einrichtungs Verzeichnis (EINRV).

## Überblick

Unter der ÖGD Einrichtung werden alle Einrichtungen zusammengefasst, die EMIGA direkt nutzende ÖDG-Einrichtungen sind, die eine Code-Side-ID besitzen.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/OEGDOverview.svg}}

## Fachlicher Ablauf

Eine ÖGD-Einrichtung wird aus einem zentralen ÖGD-Verzeichnis übernommen, manuell durch einen berechtigten Nutzer angelegt oder aus einer führenden Quelle synchronisiert. Der Client sucht eine Einrichtung anhand ihres Identifiers oder anhand fachlicher Suchparameter. Anschließend werden der aktuelle Detailstand, die fachliche Rolle, die Zuständigkeit und die erreichbaren Kommunikationsadressen abgerufen. Falls die Einrichtung über physische Standorte verfügt, werden diese über `EmigaPublicHealthLocation` referenziert. 

## Beschreibung der Profile

### ÖGD-Einrichtung

Das Profil `EmigaPublicHealthOrganization` bildet eine ÖGD Einrichtung ab, die alle Einrichtungen zusammenfasst, die EMIGA direkt nutzende ÖDG-Einrichtungen sind und eine CodeSite ID besitzen.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/PublicHealthOrganization.svg}}

Die CodeSite-ID wird über das Profil `IdentifierCodeSiteId` abgebildet. `EmigaPublicHealthOrganization` ist von `EmigaOrganization` zu unterscheiden. `EmigaOrganization` umfasst Einrichtungen, die nicht direkt nutzende ÖGD-Einrichtungen mit CodeSite-ID sind.

### ÖGD-Standort

Das Profil `EmigaPublicHealthLocation` bildet physische Standorte eines ÖGD-Fachbereichs, an dem Leistungen erbracht werden, ab. Der Standort ist in der Regel über eine Adresse und optional über Geo-Koordinaten eindeutig räumlich verortet.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/PublicHealthLocation.svg}}

Eine `EmigaPublicHealthLocation` kann über `managingOrganization` einer `EmigaPublicHealthOrganization` zugeordnet werden.

## Schnittstellenoperationen

Der EINRV stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von ÖGD-Einrichtungen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

<!--> NOTIZ: Dynamische mittels fql Represantation der Tabelle unten, wenn ok ich werde die Tabelle entfernen <-->
<fql>
using scope

from CapabilityStatement

where
    url = 'https://emiga.rki.de/fhir/vzd/CapabilityStatement/EmigaEINRVCapabilityStatementRequirements'

for rest.resource

where
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicLocation'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService'

for interaction

select
    'Operation': code,
    'Zweck'[markdown]: documentation,
    'Verbindlichkeit':
        extension
            .where(
                url = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation'
            )
            .value

with header
</fql>

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach EpiWarn-Einrichtungen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Einrichtungsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Standorten. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer EpiWarn-Einrichtung. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Einrichtung. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Einrichtung. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Einrichtung werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt. Bei einer Änderung werden insbesondere Identifier, Einrichtungstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Einrichtungsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, CodeSite-ID, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Einrichtungen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

Die Suche soll nur Einrichtungen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind.

Bei der Anzeige muss zwischen Einrichtung, physischem Standort, Gesundheitsleistung und Ansprechperson unterschieden werden.


## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- `EmigaPublicHealthOrganization` ist für direkt nutzende ÖGD-Einrichtungen mit CodeSite-ID vorgesehen.
- Die CodeSite-ID wird über `IdentifierCodeSiteId` abgebildet.
- Einrichtungen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaPublicHealthLocation` abgebildet.
- Die verwaltende Einrichtung eines Standorts wird über `managingOrganization` referenziert.
- Die Rolle einer Einrichtung muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Einrichtung ist nicht automatisch die zuständige Einrichtung.
- Nur aktive und aktuell gültige Einrichtungen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Einrichtung verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.