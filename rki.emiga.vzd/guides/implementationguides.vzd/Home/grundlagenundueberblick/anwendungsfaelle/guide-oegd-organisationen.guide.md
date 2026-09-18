# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von ÖGD Organisationen und Einrichtungen, die im Rahmen von ÖGD fachlich relevant sind, im Einrichtungs Verzeichnis (EINRV).

## Überblick

Unter der ÖGD Organisation werden alle Organisationen zusammengefasst, die EMIGA direkt nutzende ÖDG-Organisationen sind, die eine Code-Side-ID besitzen.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/OEGDOverview.svg}}

## Fachlicher Ablauf

Eine ÖGD-Organisation wird aus einem zentralen ÖGD-Verzeichnis übernommen, manuell durch einen berechtigten Nutzer angelegt oder aus einer führenden Quelle synchronisiert. Der Client sucht eine Organisation anhand ihres Identifiers oder anhand fachlicher Suchparameter. Anschließend werden der aktuelle Detailstand, die fachliche Rolle, die Zuständigkeit und die erreichbaren Kommunikationsadressen abgerufen. Falls die Organisation über physische Standorte verfügt, werden diese über `EmigaPublicHealthLocation` referenziert. 

## Beschreibung der Profile

### ÖGD-Organisation

Das Profil `EmigaPublicHealthOrganization` bildet eine ÖGD Organisation ab, die alle Organisationen zusammenfasst, die EMIGA direkt nutzende ÖDG-Organisationen sind und eine CodeSite ID besitzen.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/PublicHealthOrganization.svg}}

Die CodeSite-ID wird über das Profil `IdentifierCodeSiteId` abgebildet. `EmigaPublicHealthOrganization` ist von `EmigaOrganization` zu unterscheiden. `EmigaOrganization` umfasst Organisationen, die nicht direkt nutzende ÖGD-Organisationen mit CodeSite-ID sind.

### ÖGD-Standort

Das Profil `EmigaPublicHealthLocation` bildet physische Standorte eines ÖGD-Fachbereichs, an dem Leistungen erbracht werden, ab. Der Standort ist in der Regel über eine Adresse und optional über Geo-Koordinaten eindeutig räumlich verortet.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/PublicHealthLocation.svg}}

Eine `EmigaPublicHealthLocation` kann über `managingOrganization` einer `EmigaPublicHealthOrganization` zugeordnet werden.

## Schnittstellenoperationen

Der EINRV stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von EpiWarn-Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.
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

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach EpiWarn-Organisationen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Organisationsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Standorten. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer EpiWarn-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Organisation. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt. Bei einer Änderung werden insbesondere Identifier, Organisationstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, CodeSite-ID, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind.

Bei der Anzeige muss zwischen Organisation, physischem Standort, Gesundheitsleistung und Ansprechperson unterschieden werden.


## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- `EmigaPublicHealthOrganization` ist für direkt nutzende ÖGD-Organisationen mit CodeSite-ID vorgesehen.
- Die CodeSite-ID wird über `IdentifierCodeSiteId` abgebildet.
- Organisationen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaPublicHealthLocation` abgebildet.
- Die verwaltende Organisation eines Standorts wird über `managingOrganization` referenziert.
- Die Rolle einer Organisation muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Organisation ist nicht automatisch die zuständige Organisation.
- Nur aktive und aktuell gültige Organisationen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.