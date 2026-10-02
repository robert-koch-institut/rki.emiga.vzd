# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von ÖGD-Stellen sowie weiteren EMIGA-nutzenden Einrichtungen im Einrichtungsverzeichnis (EINRV), die im Rahmen des Öffentlichen Gesundheitsdienstes fachlich relevant sind.

## Überblick

Unter ÖGD-Einrichtungen werden alle Einrichtungen des Öffentlichen Gesundheitsdienstes zusammengefasst, die EMIGA direkt nutzen. Diese Einrichtungen verfügen jeweils über eine CodeSite-ID, über die sie innerhalb von EMIGA eindeutig identifiziert werden können.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/OEGDOverview.svg}}

## Fachlicher Ablauf

Eine ÖGD-Einrichtung wird aus einem bestehenden zentralen ÖGD-Verzeichnis übernommen, durch einen berechtigten Nutzenden manuell angelegt oder aus einer führenden Datenquelle synchronisiert.

### Erstellung und Versionierung

Beim Erstellen einer ÖGD-Einrichtung werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt. Bei einer Änderung werden insbesondere Identifier, Einrichtungstyp und Kommunikationsadresse geprüft. Historische Vorgänge bleiben weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Einrichtungsstand nachvollziehbar.
### Suche und Anzeige

ÖGD-Einrichtungen können anhand verschiedener Suchkriterien wie Identifier, CodeSite-ID, Name, Ort, Postleitzahl oder Kommunikationsadresse gesucht werden. Dabei werden nur Einrichtungen berücksichtigt, die für den jeweiligen Prozess aktiv und sichtbar sind.
Für eine gefundene Einrichtung können die aktuellen Stammdaten, fachlichen Rollen, Zuständigkeiten und Kommunikationsdaten abgerufen werden.
Verfügt eine ÖGD-Einrichtung über physische Standorte, werden diese über `EmigaPublicHealthLocation` abgebildet und der jeweiligen Einrichtung zugeordnet.

## Beschreibung der Profile

### ÖGD-Einrichtung

Das Profil `EmigaPublicHealthOrganization` bildet ÖGD-Einrichtungen ab, die EMIGA direkt nutzen und über eine CodeSite-ID verfügen.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/PublicHealthOrganization.svg}}

Die CodeSite-ID wird über das Profil `IdentifierCodeSiteId` abgebildet. 

### ÖGD-Standort

Das Profil `EmigaPublicHealthLocation` bildet physische Standorte eines ÖGD-Fachbereichs, an dem Leistungen erbracht werden, ab. Der Standort ist in der Regel über eine Adresse und optional über Geo-Koordinaten eindeutig räumlich verortet.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/PublicHealthLocation.svg}}

Eine `EmigaPublicHealthLocation` kann über `managingOrganization` einer `EmigaPublicHealthOrganization` zugeordnet werden.

## Schnittstellenoperationen

Der EINRV stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von ÖGD-Einrichtungen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

<fql>
using scope

from CapabilityStatement

where
    url = 'https://emiga.rki.de/fhir/vzd/CapabilityStatement/EmigaEINRVCapabilityStatementRequirements'

for rest.resource

where
    type = 'Organization'
    or
    type = 'Location'
	or 
	type = 'Practitioner'
	or 
	type = 'PractitionerRole'
	or
	type = 'HealthcareService'

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


## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- `EmigaPublicHealthOrganization` ist von `EmigaOrganization` zu unterscheiden. `EmigaOrganization` umfasst Einrichtungen, die nicht direkt nutzende ÖGD-Einrichtungen mit CodeSite-ID sind.
- `EmigaPublicHealthOrganization` ist für direkt nutzende ÖGD-Einrichtungen mit CodeSite-ID vorgesehen.
- Die CodeSite-ID wird über `IdentifierCodeSiteId` abgebildet.
- Einrichtungen und physische Standorte sind technisch getrennte Ressourcen.
    - Physische Standorte werden über `EmigaPublicHealthLocation` abgebildet.
    - Die verwaltende Standort einer Einrichtung wird über `managingOrganization` referenziert.
- Die Rolle einer Einrichtung muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Für die fachlichen Prozesse in EMIGA werden ausschließlich aktive und zum jeweiligen Zeitpunkt gültige Einrichtungen berücksichtigt.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Einrichtung verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.