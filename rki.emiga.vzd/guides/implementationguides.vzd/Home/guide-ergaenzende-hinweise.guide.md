# {{page-title}}

## Bedeutung von MustSupport

Mit der MustSupport-Markierung eines Elementes wird zusätzlich zu der Kardinalität eine Information darüber vorgegeben inwieweit ein Element unterstützt werden muss.

Aus Sicht der Gesundheitsamts(GA)-Fachverfahren bedeutet das: Die entsprechende Information muss dem Nutzer mindestens angezeigt werden können. Die entsprechende Information soll ins interne Informationsmodelle der Anwendung überführt werden. Die Überführung kann ein einfaches Kopieren oder komplexeres Mappen der Daten sein.

Aus Sicht der Emiga-Nutzende Systeme bedeutet das: Die entsprechende Information soll durch die Anwendung bereitgestellt werden, sofern sie vorhanden ist.

## Bedeutung von partOf

Bei Einrichtungen kann unter "partOf" eine Referenz auf die übergeordnete Einrichtung angegeben werden.

Die übergeordnete Einrichtung wird unter Verwendung des FHIR-Profiles Organization angegeben. Es genügt die Angabe von Einrichtungsname und Adresse. Diese Informationen sollen von der Anwendung der GA-Fachverfahren dargestellt werden.

---

Grundlage dieses Implementierungsleitfadens ist **HL7 FHIR** in der Version **4.0.1 (R4)**.

* [HL7 FHIR](https://hl7.org/fhir/): Spezifikation des diesem Implementierungsleitfaden zugrunde liegenden FHIR-Standards.

<!-- outcommented weil redundant mit weiterfuehrende informationen. Kann weg?
Weiterführende Informationen zu EMIGA und den zugrunde liegenden Standards sind unter folgenden Links verfügbar:


* [EMIGA – Robert Koch-Institut](https://www.rki.de/DE/Institut/Organisation/Abteilungen/Abteilung-3/FG32/EMIGA/emiga.html): Allgemeine Informationen zu EMIGA und zum Projektkontext.

* [IT-Plattform für den ÖGD – BMG](https://gesundheitsamt-2025.de/digitalisierung/it-plattform-oegd): Informationen zum Digitalen Gesundheitsamt und zur Entwicklung einer modularen IT-Plattform für den Öffentlichen Gesundheitsdienst (ÖGD).


*/
-->