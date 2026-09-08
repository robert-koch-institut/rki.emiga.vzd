# {{page-title}}

Dieser Anwendungsfall beschreibt die Verwaltung von Krankenhäusern und krankenhausbezogenen Organisationen bzw. Standorten im Verzeichnisdienst (VZD).

## Überblick

Für die Abbildung von Krankenhäusern und deren räumlichen und organisatorischen Einheiten werden im VZD mehrere spezialisierte Profile verwendet:

- `EmigaHospitalOrganization` für das Krankenhaus,
- `EmigaHospitalLocation` für besuchbare Krankenhausstandorte,
- `EmigaHospitalFacilityLocation` für Einrichtungsstandorte nach dem InEK-Standortverzeichnis oder für Stationen,
- `EmigaHospitalRoomLocation` für Räume innerhalb eines Krankenhausstandorts.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalOverview.svg}}

Die Profile unterscheiden zwischen organisatorischen Einheiten und physischen Orten. Eine Klinik oder Fachabteilung ist beispielsweise eine organisatorische Einheit, während ein Krankenhausstandort, eine Station oder ein Raum einen physischen Ort beschreibt.

## Fachlicher Ablauf

Eine Krankenhausorganisation wird im VZD angelegt oder aus einer führenden Quelle übernommen. Anschließend werden die Organisationsdaten fachlich ergänzt und präzisiert. Dazu gehören insbesondere Name, Identifikatoren, Organisationsart, Zuständigkeiten und hierarchische Beziehungen.

Im nächsten Schritt können die zugehörigen Standorte und räumlichen Einheiten ergänzt werden. Je nach fachlichem Bedarf werden dabei Krankenhausstandorte, Einrichtungsstandorte, Stationen und Räume abgebildet. Die Krankenhausorganisation kann mit Meldungen, Fällen, Kontakten, Kontaktevents, Ausbrüchen und Infektionsereignissen verknüpft werden.

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

Als eindeutiges Identifikationsmerkmal für die Doublettenprüfung dient die **Institutionskennzeichen-Nummer (IK-Nummer) der Organisation**. Die IK-Nummer ist daher bei der manuellen Anlage eines Krankenhauses ein **Pflichtfeld**.

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

Das Profil `EmigaHospitalRoomLocation` bildet einen Raum in einem Krankenhaus ab. Es dient der strukturierten Erfassung von räumlichen Einheiten innerhalb eines Krankenhausstandorts (z. B. Zimmer, Behandlungsräume, Isolationsbereiche) einschließlich ihrer Identifikation und Zuordnung zu übergeordneten Organisationseinheiten.

{{render:guides/implementationguides.vzd/PlantUML/SVGs/HospitalRoomLocation.svg}}

## Schnittstellenoperationen

Der VZD stellt FHIR-Schnittstellen für die Suche, den Detailabruf und gegebenenfalls die Pflege von Krankenhaus-Organisationen, Standorten und Rollen bereit. Die Operationen verarbeiten FHIR-Ressourcen in den Formaten `application/fhir+json` oder `application/fhir+xml` und sind über Bearer Token abgesichert.

| Operation | Methode | Zweck | Ergebnis |
| --- | --- | --- | --- |
| `/metadata` | `GET` | Abruf des FHIR-`CapabilityStatement`. | `CapabilityStatement` |
| `/Organization/$search-organization` | `GET`, `POST` | Suche nach Krankenhaus-Organisationen. | `Bundle` vom Typ `searchset` |
| `/Organization/{id}/$organization-details` | `GET`, `POST` | Abruf des aktuellen Krankenhaus-Organisationsstands. | FHIR-`Organization` oder FHIR-`Bundle` |
| `/Location/$search-location` | `GET`, `POST` | Suche nach Krankenhaus-Standorten. | `Bundle` vom Typ `searchset` |
| `/Organization/$create-organization` | `POST` | Anlage einer Krankenhaus-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/$update-organization` | `POST` | Änderung einer bestehenden Krankenhaus-Organisation. | Gespeicherte FHIR-Ressource oder FHIR-`Bundle` |
| `/Organization/{id}/$deactivate-organization` | `POST` | Deaktivierung einer Krankenhaus-Organisation. | `OperationOutcome` |
| `/OperationDefinition/{id}` | `GET` | Abruf der technischen Beschreibung einer Operation. | `OperationDefinition` |

## Erstellung und Versionierung

Beim Erstellen einer Krankenhaus-Organisation werden die erforderlichen Stammdaten, Identifier, Rollen und Kommunikationsadressen an den VZD übermittelt. Bei einer Änderung werden insbesondere Identifier, Organisationstyp und Kommunikationsadresse geprüft. Historische Vorgänge müssen weiterhin mit dem zum jeweiligen Zeitpunkt gültigen Organisationsstand nachvollziehbar bleiben.

## Suche und Anzeige

Typische Suchkriterien sind Identifier, Name, Ort oder Postleitzahl oder Kommunikationsadresse. Die Suche soll nur Organisationen berücksichtigen, die für den jeweiligen Prozess aktiv und zugelassen sind. Bei der Anzeige muss zwischen Krankenhausorganisation, Krankenhausstandort, Krankenhauseinrichtungsstandort und Krankenhausraum unterschieden werden.

## Interoperabilitätshinweise

Clients sollten folgende Regeln berücksichtigen:

- Organisationen und physische Standorte sind getrennte Ressourcen.
- Physische Standorte werden über `EmigaLocation` oder ein spezialisiertes Standortprofil abgebildet.
- Die verwaltende Organisation eines Standorts wird über `managingOrganization` referenziert.
- Die Rolle einer Organisation muss im jeweiligen Prozess eindeutig ausgewertet werden.
- Eine empfangende Organisation ist nicht automatisch die zuständige Organisation.
- Nur aktive und aktuell gültige Organisationen sollen für neue Prozesse ausgewählt werden.
- Kommunikationsadressen müssen auf ihre Gültigkeit und Verwendbarkeit geprüft werden.
- Historische Vorgänge müssen auch nach einer Deaktivierung auf die ursprüngliche Organisation verweisen können.
- Personenbezogene Kontaktdaten müssen entsprechend den Datenschutz- und Berechtigungsvorgaben behandelt werden.