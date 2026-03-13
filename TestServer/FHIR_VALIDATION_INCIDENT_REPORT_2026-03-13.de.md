# FHIR-Validierungs-Incident-Report

## Titel
Validierungsfehler der EmigaHospitalOrganization-Payload in der Entwicklungsumgebung trotz erfolgreicher Validierung in lokaler und Test-Umgebung.

## Datum
2026-03-13

## Geltungsbereich
- Projekt: rki.emiga.vzd
- Betroffene Ressource/Profil: EmigaHospitalOrganization
- Betroffene Umgebung: Development
- Nicht betroffene Umgebungen: Lokaler Backend-Server (HAPI FHIR 8.4.0), Test-Server (HAPI FHIR 8.6.0)

## Management-Zusammenfassung
Ein Transaction-Bundle mit einer als EmigaHospitalOrganization profilierten Organization-Instanz schlug nur in der Entwicklungsumgebung bei der Validierung fehl. Dieselbe korrigierte Payload wurde in lokaler und Test-Umgebung erfolgreich validiert. Erste Fehlerbilder deuteten auf Slice-Mismatches in Organization.type sowie auf einen fehlenden Pflicht-Slice hin. Die Untersuchung bestaetigte, dass Payload und Profil inhaltlich korrekt ausgerichtet waren. Die eigentliche Ursache war eine Inkonsistenz des Umgebungszustands (Runtime/Index/Datenbank) auf dem Entwicklungsserver, nicht ein Defekt in Profil oder Payload. Das Problem wurde geloest, indem die Anwendung gestoppt, die Datenbank per CLI neu angelegt, Installationen unterdrueckt und ein Dry-Run ausgefuehrt wurde; anschliessend wurden die Installationen erneut angestossen.

## Auswirkungen
- Validierung und Integrationstests fuer Krankenhaus-Organization-Payloads in Development waren blockiert.
- Es entstanden False-Negative-Validierungsergebnisse und Unsicherheit bzgl. Profilkorrektheit.
- Erhoehter Debugging-Aufwand ueber mehrere Teams hinweg (Profilierung, Backend, Test).

## Beobachtete Symptome
1. OperationOutcome in Development meldete:
   - Slice-Mismatch fuer Organization.type gegen geforderte Profil-Slices.
   - Pflicht-Slice fuer Organization.type:emigaOrganizationType nicht gefunden.
   - Best-Practice-Warnung fuer dom-6 Narrative (nicht blockierend).
2. Korrigierte Payload war erfolgreich in:
   - Test-Umgebung
   - Lokaler Backend-Umgebung
3. Zusaetzliches Runtime-Signal waehrend der Untersuchung in Development:
   - HAPI-0389 / Hibernate-Search-Initialisierungsfehler im ValueSet-Expansion-Pfad.

## Wichtiger technischer Kontext
Das EmigaHospitalOrganization-Profil erfordert Type-Slicing und spezifische Coding-Constraints fuer den verpflichtenden emigaOrganizationType-Slice.

Erwartete Constraints:
- coding.system: https://demis.rki.de/fhir/CodeSystem/organizationType
- coding.code: hospital

Relevante Projektartefakte:
- [rki.emiga.vzd/input/fsh/StructureDefinitions/EmigaHospitalOrganization.fsh](rki.emiga.vzd/input/fsh/StructureDefinitions/EmigaHospitalOrganization.fsh)
- [rki.emiga.vzd/fsh-generated/resources/StructureDefinition-EmigaHospitalOrganization.json](rki.emiga.vzd/fsh-generated/resources/StructureDefinition-EmigaHospitalOrganization.json)
- [rki.emiga.vzd/input/fsh/Examples/InekKrankenhaus.fsh](rki.emiga.vzd/input/fsh/Examples/InekKrankenhaus.fsh)

## Untersuchungs-Timeline (Kurzfassung)
1. Payload und OperationOutcome wurden analysiert.
2. Profildifferential und FSH-Quelle wurden geprueft; Mismatch im uebergebenen Codesystem wurde identifiziert und korrigiert.
3. Korrigiertes Bundle wurde als gueltig auf Test- und lokalem Backend-Server verifiziert.
4. Development zeigte weiterhin Fehler, was auf ein umgebungsspezifisches Problem hinwies.
5. Eine Conformance-Probe-Collection und ein Environment wurden erstellt und fuer Cross-Environment-Checks genutzt:
   - [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
   - [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
6. Die Entwicklungsumgebung wurde vom Backend-Entwickler neu aufgebaut und reinitialisiert.
7. Nach der Wiederherstellung war die Validierung fuer hospital-Code/-Pfad erfolgreich.

## Root Cause
Inkonsistenter Umgebungszustand in der Development-Deployment-Instanz (Runtime-/Index-/Datenbank-Initialisierung), wodurch das Validierungsverhalten trotz identischem Profil-/Payload-Inhalt von lokal/test abwich.

Wahrscheinliche Mitfaktoren:
- Inkonsistente Initialisierungsreihenfolge von Runtime-Subsystemen.
- Veralteter oder ungueltiger Index-/Cache-Zustand im Validierungspfad.
- Unvollstaendiger oder inkonsistenter Installationszustand in der Development-Datenbank.

## Umgesetzte Loesung
Der Backend-Entwickler hat:
1. Die Anwendung gestoppt.
2. Die Datenbank per CLI neu erstellt.
3. Installationen unterdrueckt und Dry-Run ausgefuehrt.
4. Danach die Installationen erneut angestossen.
5. Validierung erneut geprueft; hospital-Code/-Pfad war erfolgreich.

## Verifikation der Loesung
Die Loesung wurde durch erfolgreiches Validierungsverhalten nach Rebuild und kontrollierter Installationssequenz bestaetigt.

Erwartete Post-Fix-Checks:
1. ValueSet-Expansion erfolgreich.
2. Profilabruf per Canonical/Version liefert erwartete Constraints.
3. Known-good Organization-Transaction validiert ohne blockierende OperationOutcome-Issues.

## Praeventive Massnahmen
1. Verbindliches Post-Deploy-Health-Gate fuer jede Umgebungsbereitstellung.
   - In Testleitfaden umgesetzt:
   - [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
2. Standardisierung des Rebuild-/Install-Verfahrens in Ops-Runbooks.
3. Sicherstellen, dass alle Nodes/Pods nach Profil-/Terminologie-Updates neu gestartet und ausgerichtet sind.
4. Conformance-Probe als Release-Gate vor Integrationstests verwenden.

## Erzeugte Artefakte waehrend des Incidents
- Conformance-Probe-Collection:
  - [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
- Conformance-Probe-Environment:
  - [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
- Aktualisierter Server-Testleitfaden mit Health-Gate:
  - [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)

## Lessons Learned
1. Identisches Payload-/Profilverhalten kann zwischen Umgebungen aufgrund des Runtime-Zustands divergieren.
2. Inhaltaehnliche Validierungsfehler koennen Sekundaereffekte von Initialisierungsproblemen der Umgebung sein.
3. Schnelle, reproduzierbare Conformance-Probes reduzieren die Zeit bis zur Root-Cause deutlich.

## Aktueller Status
Abgeschlossen. Root Cause wurde durch Rebuild der Entwicklungsumgebung und kontrollierte Neuinstallation behoben. Health-Gate wurde zur Reduktion des Wiederholungsrisikos ergaenzt.
