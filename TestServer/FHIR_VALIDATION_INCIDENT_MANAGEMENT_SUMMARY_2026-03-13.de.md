# Management-Zusammenfassung: FHIR-Validierungs-Incident

## Incident
Die Validierung von Krankenhaus-Organization-Payloads schlug ausschliesslich in der Entwicklungsumgebung fehl, waehrend dieselbe Payload in lokaler und Test-Umgebung erfolgreich validierte.

## Geschaeftliche Auswirkungen
- Integrationstests in Development waren blockiert.
- Teamzeit wurde fuer teamuebergreifendes Debugging aufgewendet (Profil, Backend, Test).
- Risiko verzoegerter Release-Sicherheit aufgrund inkonsistenten Umgebungsverhaltens.

## Was ist passiert
Die ersten Validierungsfehler deuteten auf Profil-Slice-Mismatches in Organization.type hin. Die technische Pruefung bestaetigte, dass Payload und Profil korrekt ausgerichtet waren. Die Ursache lag letztlich in einer Inkonsistenz des Umgebungszustands (Runtime/Index/Datenbank-Initialisierung) in Development, nicht in einem Defekt des FHIR-Profils oder der Payload.

## Root Cause
Umgebungsbedingte Inkonsistenz auf dem Entwicklungsserver fuehrte trotz identischer Artefakte und Payload zu abweichendem Validierungsverhalten.

## Loesung
Das Backend-Team loeste das Problem durch:
1. Stoppen der Anwendung.
2. Neuaufbau der Datenbank per CLI.
3. Start mit unterdrueckten Installationen und Dry-Run.
4. Anschliessendes erneutes Anstossen der Installationen.

Nach der Wiederherstellung war die Validierung inklusive hospital-Code wieder erfolgreich.

## Aktueller Status
Abgeschlossen. Das Umgebungsverhalten ist fuer das untersuchte Szenario wieder konsistent mit lokal/test.

## Risikobewertung
- Restrisiko: Wiederauftreten nach kuenftigen Rebuilds/Deployments, wenn die Initialisierungssequenz nicht kontrolliert wird.
- Produkt-/Inhaltsrisiko: niedrig (kein Profil- oder Payload-Defekt festgestellt).

## Umgesetzte Praeventivmassnahmen
1. Post-Deploy-Health-Gate-Checkliste im Server-Testleitfaden aufgenommen:
   - [TestServer/Postman/FHIR_SERVER_TESTING.md](TestServer/Postman/FHIR_SERVER_TESTING.md)
2. Conformance-Probe-Collection/Environment fuer schnelle Cross-Environment-Verifikation erstellt:
   - [TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json](TestServer/Postman/FHIR_Conformance_Probe_Collection.postman_collection.json)
   - [TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json](TestServer/Postman/FHIR_Conformance_Probe.postman_environment.json)

## Empfohlene Governance-Folgeschritte
1. Health-Gate nach jedem Deployment/Rebuild in allen Non-Prod-Umgebungen verpflichtend machen.
2. Standardisiertes Environment-Rebuild-/Install-Runbook pflegen und Sequenzdisziplin durchsetzen.
3. Bestehen der Conformance-Probe vor Integrationstest-Freigabe verlangen.

## Referenz
Vollstaendiger technischer Report:
- [TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md](TestServer/FHIR_VALIDATION_INCIDENT_REPORT_2026-03-13.md)
