# FHIR-Terminologiebericht zum Verhalten nach dem Fix

## Titel
Verhalten der Terminologie-Logs nach dem Fix in der Entwicklungsumgebung: Pre-Expansion und NOT_EXPANDED-Warnungen nach Environment-Rebuild.

## Datum
2026-03-13

## Geltungsbereich
- Projekt: rki.emiga.vzd
- Umgebung: Development (Spring Boot + Elasticsearch)
- Bereich: HAPI FHIR Terminologieverarbeitung und Validierungsverhalten

## Management-Zusammenfassung
Nach dem Rebuild der Entwicklungsumgebung und wieder erfolgreich laufender Validierung wurden zwei Terminologie-Logmeldungen beobachtet:
1. Pre-Expansion fuer ein ValueSet mit 0 gespeicherten Konzepten.
2. HospitalOrganizationType war in Terminologie-Tabellen vorhanden, blieb jedoch auf Status NOT_EXPANDED, wodurch bei validate-code ein In-Memory-Fallback verwendet wurde.

Diese Meldungen deuten auf Konvergenz der Terminologie-Subsysteme und asynchrones Processing hin, nicht zwingend auf einen Defekt in Profil oder Payload. In vielen Faellen ist dieser Zustand temporaer. Kritisch wird es erst, wenn die Warnungen dauerhaft bestehen und Validierungsergebnisse instabil bleiben.

## Beobachtete Logmeldungen
### Meldung 1
- Logger: TermReadSvcImpl
- Kernaussage: Pre-Expansion fuer ValueSet organizationType, 0 Konzepte gespeichert.

### Meldung 2
- Logger: TermReadSvcImpl
- Kernaussage: HospitalOrganizationType ist in Terminologie-Tabellen vorhanden, aber NOT_EXPANDED; persistence-backed validate-code noch nicht bereit; Fallback auf In-Memory-Validierung; ValueSet wartet auf geplante Pre-Expansion.

## Technische Interpretation
### 1. Pre-Expansion mit 0 gespeicherten Konzepten
HAPI hat in einem geplanten Terminologie-Job eine persistierte Expansion ausgefuehrt und zu diesem Zeitpunkt ein leeres Expansionsergebnis gespeichert.

Das kann auftreten, wenn:
- Der effektive Inhalt des ValueSets im aktuellen Aufloesungskontext leer ist.
- Abhaengigkeiten beim Lauf dieses Scheduler-Zyklus noch nicht vollstaendig verfuegbar waren.
- Installations-/Index-Timing zu frueher Expansion fuehrte, bevor alle Terminologieartefakte bereit waren.

### 2. NOT_EXPANDED mit In-Memory-Fallback
HAPI hat die ValueSet-Metadaten in Terminologie-Tabellen erkannt, aber die persistenzgestuetzte Expansion war noch nicht abgeschlossen. Fuer validate-code wurde deshalb In-Memory-Validierung als Fallback genutzt.

Das bedeutet:
- Funktionalitaet kann weiterhin gegeben sein.
- Performance und Konsistenz koennen waehrend der Warm-up-Phase schwanken.
- Der Readiness-Zustand ist noch nicht voll konvergiert.

## Warum das nach erfolgreichem Fix auftreten kann
Auch nach erfolgreichem Rebuild/Install koennen temporaere Terminologie-Warnungen auftreten, weil:
1. Terminologieverarbeitung asynchron erfolgt.
2. Scheduler-Jobs zyklisch laufen und abhaengig von Reihenfolge/Dependencies arbeiten.
3. Cluster-/Node-Start, Locks und Timing Expansionen verzoegern oder neu ordnen.
4. Search/Index und Terminologiepersistenz mit unterschiedlicher Geschwindigkeit konvergieren.

## Root-Cause-Einschaetzung
Primaere Ursache: Konvergenz des Runtime-Zustands der Umgebung, kein Modellfehler in Profil/Payload.

Wahrscheinliche Mitverursacher:
- Warm-up-Fenster nach Rebuild/Install bei laufenden Terminologiejobs.
- Reihenfolge-/Dependency-Sensitivitaet in der Pre-Expansion.
- Moegliche Timing-Differenzen in Clusterknoten.

## Risikobewertung
### Niedriges Risiko (temporaer)
- Warnungen treten kurz nach Deploy/Rebuild auf.
- validate-code und Payload-Validierung werden stabil.
- Warnungen verschwinden oder nehmen nach Scheduler-Zyklen ab.

### Erhoehtes Risiko (persistent)
- Dasselbe ValueSet bleibt ueber laengere Zeit NOT_EXPANDED.
- Wiederholte Pre-Expansion mit 0 Konzepten bei ValueSets, die erwartete Codes enthalten sollten.
- Validierung toggelt zwischen Pass/Fail oder unterscheidet sich je Node.

## Verifikationskriterien
Die Umgebung gilt als gesund, wenn alle folgenden Punkte stabil erfuellt sind:
1. ValueSet-Expansion fuer HospitalOrganizationType ist erfolgreich.
2. validate-code ist erfolgreich fuer:
   - system: https://demis.rki.de/fhir/CodeSystem/organizationType
   - code: hospital
3. EmigaHospitalOrganization-Validierung ist ueber wiederholte Laeufe stabil.
4. Ergebnisse sind auf allen App-Nodes/Pods konsistent.

## Empfohlene operative Massnahmen
### Sofort
1. Nach Rebuild/Install ein definiertes Warm-up-Fenster einplanen, bevor Integrationstests starten.
2. Conformance Probe nach dem Warm-up erneut ausfuehren.
3. Verhalten pro Node pruefen (nicht nur ueber den Load Balancer).

### Bei persistierenden Warnungen
1. Alle Nodes/Pods neu starten, um Runtime-Zustaende zu synchronisieren.
2. Installation in kontrollierter Reihenfolge erneut ausfuehren:
   - CodeSystems
   - ValueSets
   - Profiles
   - Examples
3. Abschluss von Terminologie- und Search-Reindex explizit triggern und verifizieren.
4. Veraltete oder doppelte kanonische Artefakte bereinigen.
5. Effektive Runtime-Konfiguration node-uebergreifend vergleichen.

## Praeventive Kontrollen
1. Post-Deploy-Health-Gate vor Integrationstests verpflichtend machen.
2. Standardisiertes Rebuild/Install-Runbook mit fester Sequenz pflegen.
3. Automatisierte Conformance-Checks fuer expand, validate-code und profilbasierte Payload-Validierung etablieren.
4. Terminologie-Konvergenz waehrend Rollout ueber Logs/Metriken monitoren.

## Zugehoerige Artefakte
- Health-Gate-Leitfaden: [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
- Conformance-Probe-Collection: [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
- Conformance-Probe-Environment: [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
- Vollstaendiger Incident-Report: [TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md](TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md)
- Management-Summary: [TestServer/FHIR_VALIDATION_INCIDENT_MANAGEMENT_SUMMARY_2026-03-13.md](TestServer/FHIR_VALIDATION_INCIDENT_MANAGEMENT_SUMMARY_2026-03-13.md)

## Schlussfolgerung
Die beobachteten Post-Fix-Logs sind mit dem Konvergenzverhalten des HAPI-FHIR-Terminologiesubsystems vereinbar. Sie sind fuer sich genommen kein Nachweis fuer einen neuen Defekt in Payload oder Profil. Sie sollten als temporaer betrachtet werden, solange sie nicht persistent sind und nicht mit instabilen Validierungsergebnissen korrelieren.
