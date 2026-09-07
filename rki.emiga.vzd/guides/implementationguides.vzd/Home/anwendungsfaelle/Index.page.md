# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Anwendungsfälle Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **Anwendungsfälle**, die in Form von UML-Diagrammen dargestellt werden und die für dieses Modul relevanten Anwendungsfälle in komprimierter Form abbilden. Der Schwerpunkt liegt auf den zentralen Use Cases und den dafür erforderlichen Funktionen, um eine klare und gut nachvollziehbare Übersicht zu gewährleisten.
<br>&nbsp;<br>

{{render:guides/implementationguides.vzd/PlantUML/PNGs/VzdOverview.png}}

#### Enthaltene Anwendungsfälle:

1. **EpiWarn Organisationen**  
EpiWarn Organisationen sind ereignisbasierte Public-Health-Surveillance Systeme für die organisierte und schnelle Erhebung, Analyse, Bewertung sowie Kommunikation von Informationen über Ereignisse, die eine potenzielle Gefahr für die internationale Public Health darstellen.

2. **Generische Organisation**  
Generische Organisationen sind EMIGA Organisationen, die alle Organisationen beinhalten, die nicht EMIGA direkt nutzende ÖDG-Organisationen sind und eine CodeSite-ID besitzen. Damit werden unter EMIGA Organisationen sowohl Behörden, Transport-Unternehmen, wie Krankenhäuser, Labore oder Arztpraxen aber auch jede andere Organisation subsummiert. Die jeweiligen Organisation werden durch ihren Typen und/oder ihren Identifier eindeutig charakterisiert. Diese Organisationen müssen nicht zwingend eine Straßenanschrift haben, verfügen häufig jedoch zumindest über eine Postanschrift. Krankenhäuser sind keine generischen Organisationen.

3. **Inek Krankenhausorganisationen**  
   Krankenhäuser sind medizinische Einrichtungen, in denen Patientinnen und Patienten stationär und/oder ambulant behandelt werden. Im Kontext von EMIGA werden Krankenhäuser als eigenständige Organisationseinheiten mit eindeutigen Kennungen (z. B. IK, internen IDs) geführt, die im Melde- und Kommunikationsprozess mit den Gesundheitsämtern eine zentrale Rolle spielen. 