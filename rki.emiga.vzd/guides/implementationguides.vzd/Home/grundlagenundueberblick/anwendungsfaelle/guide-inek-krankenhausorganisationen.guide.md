# {{page-title}}

Dieser Anwendungsfall beschreibt die Abbildung von Krankenhäusern und krankenhausbezogenen Einrichtungen bzw. Standorten im Einrichtungs Verzeichnis (EINRV).

## Überblick

Krankenhäuser sind medizinische Einrichtungen, in denen Patientinnen und Patienten stationär und/oder ambulant behandelt werden. Sie spielen insbesondere im Melde- und Kommunikationsprozess mit den Gesundheitsämtern eine wichtige Rolle.
Im Kontext von EMIGA werden Krankenhäuser als eigenständige Einrichtungen mit eindeutigen Kennungen geführt.
Die im Einrichtungsverzeichnis bereitgestellten Informationen zu Krankenhäusern orientieren sich unter anderem an den vom Institut für das Entgeltsystem im Krankenhaus (InEK) bereitgestellten Krankenhausdaten.

Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im EINRV mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` für das Krankenhaus,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder für Stationen,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOverview.svg}}

Eine Klinik oder Fachabteilung ist beispielsweise eine organisatorische Einheit, während ein Krankenhausstandort, eine Station oder ein Raum einen physischen Ort beschreibt.

## Fachlicher Ablauf

Eine Krankenhauseinrichtung wird im EINRV angelegt, aus einer führenden Quelle übernommen oder mit dieser synchronisiert. Anschließend können die Einrichtungsdaten fachlich ergänzt und präzisiert werden. Dazu gehören insbesondere Name, Identifikatoren, Einrichtungsart, Zuständigkeiten und hierarchische Beziehungen.

Die zugehörigen Standorte und räumlichen Einheiten können ebenfalls ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet.

### InEK Krankenhausverzeichnis

INEK Daten beziehen sich auf die Datenerhebung und -übermittlung an das Institut für das Entgeltsystem im Krankenhaus (InEK). Diese Daten werden hauptsächlich für die Weiterentwicklung des Diagnosis- Related Groups G-DRG-Systems und des PEPP-Systems benötigt. Das InEK dient als zentrale Datenannahmestelle und nutzt diese Informationen zur Berechnung von Relativgewichten und zur Ermittlung des DRG-Erlös. 

Unter krankenhausstandorte.de lässt sich nach Anmeldung ein vollständiges Verzeichnis der zugelassenen Krankenhäuser in Deutschland und deren Ambulanzen als XML-Datei herunterladen. Außerdem ist die Struktur des Verzeichnisses in einer XSD-Datei definiert. Diese daten werden in Einrichtungsverzeichnis importiert. Die InEK-Krankenhausorganizationen werden mit den Tag 'meta.tag:relevance' und dem Kode 'InEK' und Dispaly 'Aus Krankenhausverzeichnis' gekenzeichnet.

### InEK-Import
Der **InEK Importer** ist eine eigenständige Komponente des Einrichtungsverzeichnisses und stellt eine **lesende Schnittstelle zum InEK** bereit. Über diese Schnittstelle lädt der InEK Importer regelmäßig eine Datei mit den vom InEK verwalteten Einrichtungsdaten herunter.

Die heruntergeladenen Daten werden mit dem bereits im **EMIGA FHIRStore Server** vorhandenen Datenbestand abgeglichen. Dabei werden Änderungen, beispielsweise neu hinzugekommene oder nicht mehr im InEK-Verzeichnis enthaltene Krankenhäuser, erfasst. Die erkannten Änderungen werden anschließend an den EMIGA FHIRStore Server übergeben und dort in den Datenbestand übernommen.

Bei jedem erfolgreichen Import wird eine neue Version der Krankenhaus-Stammdaten erstellt und in der Versionshistorie dokumentiert.

Im Produktionsbetrieb wird der InEK-Datenbestand **monatlich** aktualisiert. Vor dem Produktivbetrieb ist ein **quartalsweiser Import** vorgesehen.

Die aus dem InEK-Verzeichnis importierten Daten sind als **Krankenhaus-Stammdaten** zu verstehen. Sie dürfen von Nutzenden weder bearbeitet noch gelöscht werden. Dadurch wird verhindert, dass manuelle Änderungen bei einer späteren Aktualisierung des InEK-Datenbestands zu Inkonsistenzen führen.

Wird ein Krankenhaus bei einem späteren Import nicht mehr im InEK-Verzeichnis gefunden, wird der entsprechende Datensatz in EMIGA **als inaktiv bzw. „nicht mehr im InEK enthalten“** gekennzeichnet.

Alle EMIGA-Nutzenden haben lesenden Zugriff auf die Krankenhaus-Stammdaten.

### Manuelle Anlage

Da das InEK-Verzeichnis nicht alle in Deutschland ansässigen Krankenhäuser umfasst, ist zusätzlich die manuelle Anlage von Krankenhäusern möglich. Krankenhäuser, die nicht im InEK-Verzeichnis enthalten sind, werden entsprechend gekennzeichnet. Dies betrifft beispielsweise Privatkliniken.
Darüber hinaus können relevante Krankenhäuser mit Standort außerhalb Deutschlands angelegt werden. Bei deren Erfassung sind insbesondere die länderspezifischen Unterschiede bei der Abbildung von Adressdaten zu berücksichtigen.

Die manuelle Anlage eines Krankenhauses ist ausschließlich Nutzenden mit entsprechenden Bearbeitungsrechten gestattet. Hierzu zählen insbesondere das RKI, Landesbehörden sowie weitere entsprechend berechtigte Nutzende.
Die Berechtigung zur Anlage ist unabhängig von der örtlichen Zuständigkeit. So kann beispielsweise auch ein Gesundheitsamt ein Krankenhaus in einem Landkreis anlegen, für den es selbst nicht zuständig ist.

### Doublettenprüfung

Vor der Anlage eines neuen Krankenhauses wird geprüft, ob dieses bereits in EMIGA vorhanden ist. Bei Krankenhäusern aus dem InEK-Verzeichnis wird für die Dublettenprüfung die Institutionskennzeichen-Nummer (IK-Nummer) als eindeutiges Identifikationsmerkmal verwendet. Bei Krankenhäusern ohne IK-Nummer erfolgt die Dublettenprüfung anhand weiterer vorhandener Einrichtungsdaten.

## Beschreibung der Profile

### Krankenhausorganisation
Das Profil `EmigaHospitalOrganization` bildet ein Krankenhaus im EMIGA-Kontext ab. Es dient der strukturierten Erfassung von Stammdaten des Krankenhauses (z. B. Name, Kennziffern, Kontakt- und Adressdaten) für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. `EmigaHospitalOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOrganization.svg}}

### Krankenhausstandort

Das Profil `EmigaHospitalLocation` bildet einen Standort eines Krankenhauses ab. Dazu gehören beispielsweise ein Hauptstandort, ein Klinikgebäude oder ein weiterer Krankenhausstandort. Es dient der strukturierten Erfassung von besuchbaren Krankenhaus-Standorten (z. B. Hauptstandort, Klinikgebäude, Stationen) einschließlich Adress- und ggf. Geokoordinaten für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalLocation.svg}}

### Krankenhauseinrichtungsstandort

Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungen nach dem InEK Standortverzeichnis oder Stationen eines Krankenhauses ab. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalFacilityLocation.svg}}

### Krankenhausraum

Das Profil `EmigaHospitalRoomLocation` bildet einen Raum in einem Krankenhaus ab. Es dient der strukturierten Erfassung von räumlichen Einheiten innerhalb eines Krankenhausstandorts (z. B. Zimmer, Behandlungsräume, Isolationsbereiche) einschließlich ihrer Identifikation und Zuordnung zu übergeordneten Einrichtungseinheiten.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalRoomLocation.svg}}

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
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation'
    or
    supportedProfile =
        'https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation'
   

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

Der EINRV stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von Krankenhaus-Einrichtungen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach Krankenhaus-Einrichtungen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Krankenhaus-Einrichtungsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Krankenhaus-Standorten. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer Krankenhaus-Einrichtung. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Krankenhaus-Einrichtung. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Krankenhaus-Einrichtung. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |
