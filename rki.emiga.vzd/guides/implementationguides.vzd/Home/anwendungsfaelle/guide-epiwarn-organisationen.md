# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Organisationen und Einrichtungen, die im Rahmen von EpiWarn fachlich relevant sind, im Verzeichnisdienst (VZD).

## Überblick

EpiWarn-Organisationen dienen der eindeutigen Identifikation und Verwaltung von Einrichtungen und Stellen, die an EpiWarn-Prozessen beteiligt sind.

{{render:guides/implementationguides.common/PlantUML/PNGs/OEGDOverview.png}}

EpiWarn-Organisationen werden grundsätzlich über die für Organisationen vorgesehenen EMIGA-Profile abgebildet. Je nach fachlichem Bedarf kann insbesondere `EmigaOrganization` verwendet werden. Handelt es sich bei einer EpiWarn-Organisation um eine direkt nutzende ÖGD-Organisation mit Code-Side-ID, wird `EmigaPublicHealthOrganization` verwendet.

Eine EpiWarn-Organisation kann beispielsweise folgende Funktionen haben:

- meldende Organisation,
- empfangende Organisation,
- zuständige Organisation,
- weiterleitende Organisation,
- fachlich beteiligte Organisation,
- koordinierende Stelle,
- Kontaktstelle für Rückfragen.

## Fachlicher Ablauf

Eine EpiWarn-Organisation wird aus einem zentralen EpiWarn-Verzeichnis übernommen, manuell durch einen berechtigten Nutzer angelegt oder aus einer führenden Quelle synchronisiert. Der Client sucht eine Organisation anhand ihres Identifiers oder anhand fachlicher Suchparameter. Anschließend werden der aktuelle Detailstand, die fachliche Rolle, die Zuständigkeit und die erreichbaren Kommunikationsadressen abgerufen. Falls die Organisation über physische Standorte verfügt, werden diese über `EmigaPublicHealthLocation` referenziert. Die ausgewählte Organisation wird in einem EpiWarn-Prozess als meldende, empfangende, zuständige oder beteiligte Organisation referenziert.

## Beschreibung der Profile
### ÖGD-Organisation

Das Profil `EmigaPublicHealthOrganization` bildet eine ÖGD Organisation ab, die alle Organisationen zusammenfasst, die EMIGA direkt nutzende ÖDG-Organisationen sind und eine CodeSite-ID besitzen.

{{render:guides/implementationguides.common/PlantUML/PNGs/PublicHealthOrganization.png}}

Die Code-Side-ID wird über das Profil `IdentifierCodeSiteId` abgebildet. `EmigaPublicHealthOrganization` ist von `EmigaOrganization` zu unterscheiden. `EmigaOrganization` umfasst Organisationen, die nicht direkt nutzende ÖGD-Organisationen mit Code-Side-ID sind.

### ÖGD-Standort

Das Profil `EmigaPublicHealthLocation` bildet physische Standorte eines ÖGD-Fachbereichs, an dem Leistungen erbracht werden, ab. Der Standort ist in der Regel über eine Adresse und optional über Geo-Koordinaten eindeutig räumlich verortet.

{{render:guides/implementationguides.common/PlantUML/PNGs/PublicHealthLocation.png}}

Eine `EmigaPublicHealthLocation` kann über `managingOrganization` einer `EmigaPublicHealthOrganization` zugeordnet werden.

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von EpiWarn-Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

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

Typische Suchkriterien sind Identifier, Code-Side-ID, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind.

Bei der Anzeige muss zwischen Organisation, physischem Standort, Gesundheitsleistung und Ansprechperson unterschieden werden.

<!-- TODO: Die unterstützten Suchparameter sowie `_count`, `_offset` und Sortierparameter ergänzen. -->

## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- `EmigaPublicHealthOrganization` ist für direkt nutzende ÖGD-Organisationen mit Code-Side-ID vorgesehen.
- Die Code-Side-ID wird über `IdentifierCodeSiteId` abgebildet.
- Organisationen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaPublicHealthLocation` abgebildet.
- Die verwaltende Organisation eines Standorts wird über `managingOrganization` referenziert.
- Die Rolle einer Organisation muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Organisation ist nicht automatisch die zuständige Organisation.
- Nur aktive und aktuell gültige Organisationen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.