# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Krankenhäusern und krankenhausbezogenen Einrichtungen bzw. Standorten im Einrichtungs Verzeichnis (EINRV).

## Überblick

Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im EINRV mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` für das Krankenhaus,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder für Stationen,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOverview.svg}}

Die Profile unterscheiden zwischen organisatorischen Einheiten und physischen Orten. Eine Klinik oder Fachabteilung ist beispielsweise eine organisatorische Einheit, während ein Krankenhausstandort, eine Station oder ein Raum einen physischen Ort beschreibt.

## Fachlicher Ablauf

Eine Krankenhausorganisation wird im EINRV angelegt oder aus einer führenden Quelle übernommen. Anschließend werden die Einrichtungsdaten fachlich ergänzt und präzisiert. Dazu gehören insbesondere Name, Identifikatoren, Einrichtungsart, Zuständigkeiten und hierarchische Beziehungen.

Im nächsten Schritt können die zugehörigen Standorte und räumlichen Einheiten ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet. Die Krankenhausorganisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

### InEK Krankenhausverzeichnis


INEK Daten beziehen sich auf die Datenerhebung und -übermittlung an das Institut für das Entgeltsystem im Krankenhaus (InEK). Diese Daten werden hauptsächlich für die Weiterentwicklung des Diagnosis- Related Groups G-DRG-Systems und des PEPP-Systems benötigt. Das InEK dient als zentrale Datenannahmestelle und nutzt diese Informationen zur Berechnung von Relativgewichten und zur Ermittlung des DRG-Erlös. 

Unter krankenhausstandorte.de lässt sich nach Anmeldung ein vollständiges Verzeichnis der zugelassenen Krankenhäuser in Deutschland und deren Ambulanzen als XML-Datei herunterladen. Außerdem ist die Struktur des Verzeichnisses in einer XSD-Datei definiert. Diese daten werden in Einrichtungsverzeichnis importiert. Die InEK-Krankenhausorganizationen werden mit den Tag 'meta.tag:relevance' und dem Kode 'InEK' und Dispaly 'Aus Krankenhausverzeichnis' gekenzeichnet.

### InEK-Import
Der **InEK Importer** ist eine eigenständige Komponente des Einrichtungsverzeichnisses und stellt eine **lesende Schnittstelle zum InEK** bereit. Über diese Schnittstelle lädt der InEK Importer regelmäßig eine Datei mit den vom InEK verwalteten Einrichtungsdaten herunter.

Die heruntergeladenen Daten werden mit dem bereits im **EMIGA FHIRStore Server** vorhandenen Datenbestand abgeglichen. Dabei werden Änderungen, beispielsweise neu hinzugekommene oder nicht mehr im InEK-Verzeichnis enthaltene Krankenhäuser, erkannt. Die erkannten Änderungen werden anschließend an den EMIGA FHIRStore Server übergeben und dort in den Datenbestand übernommen.

Im Produktionsbetrieb wird der InEK-Datenbestand **monatlich** aktualisiert. Vor dem Produktivbetrieb ist ein **quartalsweiser Import** ausreichend.

Bei jedem erfolgreichen Import wird eine neue Version der Krankenhaus-Stammdaten erstellt und in der Versionshistorie dokumentiert.

Die aus dem InEK-Verzeichnis importierten Daten sind als **Krankenhaus-Stammdaten** zu verstehen. Sie dürfen von Nutzenden weder bearbeitet noch gelöscht werden. Dadurch wird verhindert, dass manuelle Änderungen bei einer späteren Aktualisierung des InEK-Datenbestands zu Inkonsistenzen führen.

Wird ein Krankenhaus bei einem späteren Import nicht mehr im InEK-Verzeichnis gefunden, wird der entsprechende Datensatz in EMIGA **als inaktiv bzw. „nicht mehr im InEK enthalten“** gekennzeichnet. Der Datensatz wird nicht gelöscht.

Die Krankenhaus-Stammdaten sind für alle EMIGA-Nutzenden einsehbar. Der Zugriff auf diese Daten erfolgt lesend.

### Manuelle Anlage
Da das InEK-Verzeichnis nicht alle in Deutschland ansässigen Krankenhäuser umfasst, muss zusätzlich die **manuelle Anlage von Krankenhäusern** möglich sein. Dies betrifft beispielsweise Privatkliniken. Darüber hinaus müssen auch **ausländische Krankenhäuser** angelegt werden können. Bei der Erfassung ausländischer Krankenhäuser ist der unterschiedliche Aufbau von Adressdaten zu berücksichtigen.

Krankenhäuser, die nicht im InEK-Verzeichnis enthalten sind, werden entsprechend gekennzeichnet.

Die manuelle Anlage eines Krankenhauses ist ausschließlich Nutzenden mit entsprechenden Bearbeitungsrechten erlaubt. Hierzu zählen insbesondere das RKI, Landesbehörden sowie weitere Nutzende mit den erforderlichen Bearbeitungsrechten.

Die Berechtigungen müssen dabei unabhängig von der örtlichen Zuständigkeit gelten. So muss beispielsweise auch ein Gesundheitsamt die Möglichkeit haben, ein Krankenhaus für einen Landkreis anzulegen, für den es nicht zuständig ist.

Aufgrund dieser übergreifenden Anlageberechtigung ist eine zuverlässige **Doublettenprüfung** erforderlich.

### Doublettenprüfung
Vor der Anlage eines neuen Krankenhauses muss geprüft werden, ob dieses bereits in EMIGA vorhanden ist.

Als eindeutiges Identifikationsmerkmal für die Doublettenprüfung dient die **Institutionskennzeichen-Nummer (IK-Nummer) der Einrichtung**. Die IK-Nummer ist daher bei der manuellen Anlage eines Krankenhauses ein **Pflichtfeld**.

Bei der Eingabe der IK-Nummer sollte den Nutzenden ein Hinweis auf eine geeignete Suchmöglichkeit zur Ermittlung der IK-Nummer bereitgestellt werden.


## Beschreibung der Profile
### Krankenhausorganisation

Das Profil `EmigaHospitalOrganization` bildet ein Krankenhaus im Kontext von EMIGA ab. Es dient der strukturierten Erfassung von Stammdaten des Krankenhauses (z. B. Name, Kennziffern, Kontakt- und Adressdaten) für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. `EmigaHospitalOrganization` ist eine Spezialisierung der FHIR-Ressource `Organization`.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOrganization.svg}}

### Krankenhausstandort

Das Profil `EmigaHospitalLocation` bildet einen Standort eines Krankenhauses ab. Dazu gehören beispielsweise ein Hauptstandort, ein Klinikgebäude oder ein weiterer Krankenhausstandort. Es dient der strukturierten Erfassung von besuchbaren Krankenhaus-Standorten (z. B. Hauptstandort, Klinikgebäude, Stationen) einschließlich Adress- und ggf. Geokoordinaten für die Nutzung in Melde-, Dokumentations- und Kommunikationsprozessen. 

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalLocation.svg}}

### Krankenhauseinrichtungsstandort

Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungen nach dem InEK Standortverzeichnis oder Stationen eines Krankenhauses ab. Das Profil `EmigaHospitalFacilityLocation` bildet Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder Stationen eines Krankenhauses ab.

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

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Einrichtung werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den EINRV übermittelt. Bei einer Änderung werden insbesondere Identifier, Einrichtungstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Einrichtungsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Einrichtungen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- Einrichtungen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaLocation` oder ein spezialisiertes Standortprofil abgebildet.
- Die verwaltende Einrichtung eines Standorts wird über `managingOrganization` referenziert.
- Die Rolle einer Einrichtung muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Einrichtung ist nicht automatisch die zuständige Einrichtung.
- Nur aktive und aktuell gültige Einrichtungen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Einrichtung verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.