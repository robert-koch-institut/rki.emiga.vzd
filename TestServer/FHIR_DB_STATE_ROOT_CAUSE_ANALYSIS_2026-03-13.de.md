# FHIR Datenbank-Zustand Root-Cause-Analyse

## Titel
Tiefenanalyse der Ursachen und Loesungsstrategie fuer instabile FHIR-Terminologievalidierung in der Entwicklungsumgebung aufgrund von Datenbankzustandsproblemen.

## Datum
2026-03-13

## Ursachenanalyse

### 1. Das ist kein Payload-/Profilmodellierungsproblem mehr
- Die korrigierte Payload validiert in Test und lokal.
- Dieselbe Profillogik funktioniert dort stabil.
- Damit sind FHIR-Inhalt und Slicing-Regeln grundsaetzlich korrekt.

### 2. Das Problem ist an den Umgebungszustand in Development gebunden
- Beobachtung Backend: Nach Neustart sind Konzepte weg.
- Beobachtung Backend: Pre-Expansion-Jobs werden nicht fortgefuehrt oder nicht gestartet.
- Beobachtung Backend: Eine lokal vorbereitete Datenbank validiert korrekt.

Zusammengenommen spricht das sehr klar fuer ein Problem im Datenbank-/Terminologiezustand der urspruenglichen Dev-DB, nicht fuer fehlerhafte Profile.

### 3. Was die Logs technisch bedeuten
- **Pre-expanded ... saved 0 concepts**: Ein Hintergrundjob lief, aber es wurden zu diesem Zeitpunkt keine Konzepte persistiert.
- **NOT_EXPANDED**: Das ValueSet ist bekannt, aber die persistente Expansion ist nicht abgeschlossen.
- **In-memory fallback**: HAPI validiert dann uebergangsweise im Speicher statt ueber persistente Expansion.

Wenn das nach Neustarts wiederkehrt, deutet es auf eine gestoerte Konvergenz hin: Expansion erreicht keinen stabilen, dauerhaften Zustand.

### 4. Warum dadurch die urspruenglichen Validierungsfehler entstehen koennen
- Profile-Slicing nutzt `memberOf`-Pruefungen.
- `memberOf` haengt von Terminologie-Readiness ab.
- Wenn Expansion fehlt, veraltet ist oder nicht stabil persistiert wird, koennen Slice-Matches scheitern, obwohl die Payload korrekt ist.
- So entstehen False-Negative-Validierungsfehler nur in einer Umgebung.

## Wahrscheinliche Root-Cause-Klasse

### 1. Drift, Korruption oder unvollstaendige Migration in der Dev-Datenbank
- Terminologie-Tabellen koennen inkonsistent sein.
- Expansion-Status und Konzeptzeilen koennen auseinanderlaufen.
- Neustarts machen das oft erst sichtbar.

### 2. Terminologie-Hintergrundverarbeitung persistiert nicht zuverlaessig
- Jobs laufen evtl., aber Persistenz ist unvollstaendig oder schlaegt still fehl.
- Oder Jobs werden scheduler-/clusterbedingt nicht sauber aufgenommen.
- Oder verschiedene Nodes sehen unterschiedliche Zustandsstaende.

### 3. Unsaubere Installationsreihenfolge bzw. partieller Installationszustand
- Bei falscher Reihenfolge koennen Expansionen leer bleiben oder festhaengen.

## Warum die lokal vorbereitete Datenbank funktioniert hat
- Sie ist ein sauberer, konsistenter Ausgangszustand.
- Das beweist: Die Anwendung kann korrekt validieren, wenn die Persistenzschicht gesund ist.
- Der nachhaltige Weg ist daher sauberer Bootstrap, nicht punktuelle Reparatur auf der alten problematischen DB.

## Loesungsstrategie

### Sofort stabile Loesung
1. Problematische Dev-DB durch einen nachweislich funktionierenden Basiszustand ersetzen.
2. Installationen in kontrollierter Reihenfolge ausfuehren:
   - CodeSystems
   - ValueSets
   - StructureDefinitions
   - Examples/Testdaten
3. Danach alle App-Instanzen neu starten.
4. Health Gate ausfuehren, bevor Integrationstests starten.

### Health Gate pro Deployment (verpflichtend)
1. `ValueSet/$expand` fuer HospitalOrganizationType liefert erwartete Codes.
2. `validate-code` fuer `system=https://demis.rki.de/fhir/CodeSystem/organizationType` und `code=hospital` ist erfolgreich.
3. Profilgebundene Organization-Validierung ist mehrfach stabil erfolgreich.
4. Gleiches Ergebnis auf jedem Node, nicht nur hinter dem Load Balancer.

### Wenn das Problem erneut auftritt
1. Als Infrastruktur-/DB-Lifecycle-Incident behandeln, nicht als Inhaltsproblem.
2. Erneut sauber bootstrappen statt inkrementell zu reparieren.
3. Post-Restart-Readiness-Pruefung fuer Terminologiejob-Abschluss einfuehren.
4. Monitoring/Alerting setzen, wenn kritische ValueSets laenger als definiert auf `NOT_EXPANDED` bleiben.

## Operative Schlussfolgerung
Die Evidenz ist stark:
- Root Cause war Instabilitaet im Persistenz-/Terminologiezustand der urspruenglichen Dev-Datenbank.
- Die wirksame Abhilfe ist sauberer DB-Bootstrap + kontrollierte Installation + verpflichtendes Post-Deploy-Health-Gate.
- Weitere Payload-/Profilanpassungen sind nicht der primaere Behebungsweg.

## Zugehoerige Artefakte
- Health-Gate-Leitfaden: [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
- Conformance-Probe-Collection: [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
- Conformance-Probe-Environment: [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)
- Incident-Report (DE): [TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.de.md](TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.de.md)
- Management-Summary (DE): [TestServer/FHIR_VALIDATION_INCIDENT_MANAGEMENT_SUMMARY_2026-03-13.de.md](TestServer/FHIR_VALIDATION_INCIDENT_MANAGEMENT_SUMMARY_2026-03-13.de.md)
- Terminologie-Post-Fix-Bericht (DE): [TestServer/FHIR_TERMINOLOGY_POSTFIX_BEHAVIOR_REPORT_2026-03-13.de.md](TestServer/FHIR_TERMINOLOGY_POSTFIX_BEHAVIOR_REPORT_2026-03-13.de.md)
