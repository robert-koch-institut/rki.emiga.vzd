# {{page-title}}

Dieser Anwendungsfall beschreibt die Abbildung generischer Einrichtungen im Einrichtungsverzeichnis (EINRV).
Von generischen Einrichtungen abzugrenzen ist das Profil `EmigaPublicHealthOrganization`, das ÖGD-Einrichtungen abbildet, die EMIGA direkt nutzen und über eine CodeSite-ID verfügen.

## Überblick
Unter Generische Einrichtungen werden alle Einrichtungen zusammengefasst, die EMIGA nicht direkt nutzen und daher über keine CodeSite-ID verfügen. Hierzu zählen beispielsweise Behörden, Transportunternehmen, Labore und Arztpraxen sowie weitere Arten von Einrichtungen.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/GenericOrganizationOverview.svg}}

Generische Einrichtungen werden über das Profil `EmigaOrganization` abgebildet.
Für eine generische Einrichtung ist die Angabe einer Straßenanschrift optional. In der Regel verfügt sie jedoch mindestens über eine Postanschrift oder elektronische Kontaktdaten. Darüber hinaus können der Einrichtung physische Standorte, Gesundheitsleistungen sowie fachlich zugeordnete Personen zugeordnet werden.


## Fachlicher Ablauf

Eine generische Einrichtung kann manuell angelegt, aus einem zentralen Verzeichnis übernommen oder im Rahmen einer DEMIS-Meldung erzeugt beziehungsweise eingelesen werden. Nach der Anlage werden die relevanten Informationen zu Stammdaten, Einrichtungstyp, Identifikatoren und Kontaktdaten sowie gegebenenfalls zu den zugehörigen Standorten ergänzt.

Physische Standorte einer generischen Einrichtung können über das Profil `EmigaLocation` abgebildet werden. Gesundheitsleistungen werden über `EmigaHealthcareService` beschrieben und können einer Einrichtung oder einem ihrer Standorte zugeordnet werden. Personen und deren Rollen werden über `EmigaPractitioner` und `EmigaPractitionerRole` mit der jeweiligen Einrichtung verknüpft.
Im Rahmen der EMIGA-Fachprozesse können generische Einrichtungen mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

## Beschreibung der Profile

`EmigaOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/Organization.svg}}

### Physische Orte

Das Profil `EmigaLocation` beschreibt einen physischen Ort, der besucht werden kann.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/Location.svg}}

Ein physischer Ort kann grundsätzlich über Geokoordinaten und in der Regel über eine Straßenadresse beschrieben werden. Eine `EmigaLocation` kann über `managingOrganization` einer Einrichtung zugeordnet werden.

### Fachabteilung

Das Profil `EmigaDepartmentOrganization` beschreibt einen organisatorischen Teil einer Abteilung, nicht den physischen Ort.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/DepartmentOrganization.svg}}

Eine `EmigaDepartmentOrganization` kann über `managingOrganization` einer Einrichtung zugeordnet werden.


### Dienstleistungen im EINRV

Bietet eine Einrichtung eine Dienstleistung an, kann diese über `EmigaHealthcareService` abgebildet werden. Beispiele hierfür sind ein Hotline-Service oder das Angebot einer Ansprechperson für einen bestimmten fachlichen Bereich.

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
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation'
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

Beim Anlegen eines Krankenhauses in EMIGA werden die erforderlichen Stammdaten, Identifikatoren, Rollen und Kommunikationsadressen an den EINRV übermittelt. 
Bei Änderungen werden insbesondere Identifikatoren, Einrichtungstyp und Kommunikationsadressen geprüft und aktualisiert. Durch die Versionierung der Einträge bleiben historische Vorgänge mit dem jeweils zu diesem Zeitpunkt gültigen Stand der Einrichtung nachvollziehbar.

## Suche und Anzeige

Es kann differenziert nach Krankenhaus, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum gesucht werden. Die Suchergebnisse werden entsprechend differenziert dargestellt. Die Suche berücksichtigt nur Einrichtungen, die für den jeweiligen EMIGA-Fachprozess sichtbar sind. Typische Suchkriterien sind Identifier, Name, Ort, Postleitzahl oder Kommunikationsadresse.

## EpiWarn Organizationen

Als **EpiWarn-Einrichtungen** werden in EMIGA Einrichtungen und Organistaionen bezeichnet, die im Rahmen der in §2 IfSG-Koordinierungs-VwV beschriebenen Koordinierungs- und Erreichbarkeitsprozesse relevant sind. Hierzu gehören insbesondere die dort genannten Behörden, Einrichtungen und zuständigen Stellen, deren Kontakt- und Erreichbarkeitsdaten für diese Prozesse vorgehalten werden.

EpiWarn-Einrichtungen werden grundsätzlich über die für generische Einrichtungen vorgesehenen EMIGA-Profile abgebildet und durch die Belegung von `meta.tag:relevance` mit dem Wert `IfsgKoordVwV` entsprechend gekennzeichnet. 
Handelt es sich um eine direkt EMIGA nutzende ÖGD-Stelle, wird stattdessen `EmigaPublicHealthOrganization` verwendet.

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
