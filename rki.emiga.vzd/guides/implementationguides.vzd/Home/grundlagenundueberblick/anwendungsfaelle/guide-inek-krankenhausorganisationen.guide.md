# {{page-title}}

Dieser Anwendungsfall beschreibt die Abbildung von Krankenhäusern und krankenhausbezogenen Einrichtungen bzw. Standorten im Einrichtungs Verzeichnis (EINRV).

## Überblick

Informationen zu Krankenhäusern spielen insbesondere bei Melde- und Kommunikationsprozessen mit den Gesundheitsämtern eine wichtige Rolle.
Im Kontext von EMIGA werden Krankenhäuser als eigenständige Ressourcen mit eindeutigen Kennungen geführt.

Die im Einrichtungsverzeichnis bereitgestellten Informationen zu Krankenhäusern orientieren sich unter anderem an den vom Institut für das Entgeltsystem im Krankenhaus (InEK) bereitgestellten Krankenhausdaten.
Die InEK-Krankenhausorganizationen werden mit den Tag 'meta.tag:relevance' und dem Kode 'InEK' und Dispaly 'Aus Krankenhausverzeichnis' gekenzeichnet.
Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im EINRV mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` bildet das Krankenhaus a ,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte oder für Stationen nach dem InEK-Standortverzeichnis,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOverview.svg}}

## Fachlicher Ablauf

Eine Krankenhauseinrichtung wird im EINRV angelegt, aus einer führenden Quelle übernommen oder mit dieser synchronisiert. Die Einrichtungsdaten können fachlich ergänzt und präzisiert werden. Dazu gehören insbesondere Name, Identifikatoren, Einrichtungsart, Zuständigkeiten und hierarchische Beziehungen.
Die zugehörigen Standorte und räumlichen Einheiten können ebenfalls ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet.

### InEK-Import
Der **InEK Importer** ist eine eigenständige Komponente des Einrichtungsverzeichnisses und stellt eine lesende Schnittstelle zum InEK bereit. Über diese Schnittstelle lädt der InEK Importer regelmäßig die Datei mit den vom InEK verwalteten Krankenhauseinrichtungsdaten herunter.

Die heruntergeladenen Daten werden mit dem bereits im EMIGA FHIRStore Server vorhandenen Datenbestand abgeglichen. Dabei werden Änderungen, beispielsweise neu hinzugekommene oder nicht mehr im InEK-Verzeichnis enthaltene Krankenhäuser, erfasst. 
Die erkannten Änderungen werden anschließend an den EMIGA FHIRStore Server übergeben und dort in den Datenbestand übernommen.
Bei jedem erfolgreichen Import wird eine neue Version der Krankenhaus-Stammdaten erstellt und in der Versionshistorie dokumentiert.
Wird ein Krankenhaus bei einem späteren Import nicht mehr im InEK-Verzeichnis gefunden, wird der entsprechende Datensatz in EMIGA **als inaktiv bzw. „nicht mehr im InEK enthalten“** gekennzeichnet.

Im Produktionsbetrieb ist eine monatliche Aktualisierung des InEK-Datenbestands vorgesehen. Bis zum Produktivbetrieb erfolgt der Import quartalsweise.

### Manuelle Anlage weiterer Krankenhäuser

Da das InEK-Verzeichnis nicht alle in Deutschland ansässigen Krankenhäuser umfasst, können weitere Krankenhäuser manuell angelegt werden. 
Dies betrifft beispielsweise Privatkliniken sowie weitere Krankenhäuser, die nicht im InEK-Verzeichnis enthalten sind. Diese werden entsprechend gekennzeichnet.
Darüber hinaus können für EMIGA relevante Krankenhäuser mit Standort außerhalb Deutschlands manuell angelegt werden. Bei der Erfassung sind insbesondere länderspezifische Unterschiede bei den Adressdaten zu berücksichtigen.

Die manuelle Anlage eines Krankenhauses ist ausschließlich Nutzenden mit entsprechenden Bearbeitungsrechten gestattet.
Die Berechtigung zur Anlage ist unabhängig von der örtlichen Zuständigkeit. So kann beispielsweise auch ein Gesundheitsamt ein Krankenhaus in einem Landkreis anlegen, für den es selbst nicht zuständig ist.

### Doublettenprüfung

Vor der Anlage eines neuen Krankenhauses wird geprüft, ob dieses bereits in EMIGA-Einrichtungsverzeichnis vorhanden ist. Bei Krankenhäusern aus dem InEK-Verzeichnis wird für die Dublettenprüfung die Institutionskennzeichen-Nummer (IK-Nummer) als eindeutiges Identifikationsmerkmal verwendet. Bei Krankenhäusern ohne IK-Nummer erfolgt die Dublettenprüfung anhand weiterer vorhandener Einrichtungsdaten.

## Beschreibung der Profile

### Krankenhausorganisation
Das Profil `EmigaHospitalOrganization` bildet ein Krankenhaus im EMIGA-Kontext ab. Es dient der strukturierten Erfassung von Stammdaten des Krankenhauses (z. B. Name, Kennziffern, Kontakt- und Adressdaten) für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. `EmigaHospitalOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOrganization.svg}}

### Krankenhausstandort

Das Profil `EmigaHospitalLocation` bildet einen Standort eines Krankenhauses ab. Dazu gehören beispielsweise ein Hauptstandort, ein Klinikgebäude oder weitere Krankenhausstandorte. Es dient der strukturierten Erfassung von besuchbaren Krankenhaus-Standorten (z. B. Hauptstandort, Klinikgebäude, Stationen) einschließlich Adress- und ggf. Geokoordinaten für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalLocation.svg}}

### Krankenhauseinrichtungsstandort

Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungen nach dem InEK Standortverzeichnis oder Stationen eines Krankenhauses ab. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalFacilityLocation.svg}}

### Krankenhausraum

Das Profil `EmigaHospitalRoomLocation` bildet einen Raum in einem Krankenhaus ab. Es dient der strukturierten Erfassung von räumlichen Einheiten innerhalb eines Krankenhausstandorts (z. B. Zimmer, Behandlungsräume, Isolationsbereiche) einschließlich ihrer Identifikation und Zuordnung zu übergeordneten Einrichtungseinheiten.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalRoomLocation.svg}}

## Schnittstellenoperationen

Der EINRV stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von Krankenhaus-Einrichtungen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

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


