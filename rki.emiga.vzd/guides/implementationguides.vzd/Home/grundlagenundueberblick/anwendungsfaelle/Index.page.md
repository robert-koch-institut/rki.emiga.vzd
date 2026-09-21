# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Anwendungsfälle Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **Anwendungsfälle**. Diese werden in Form von UML-Diagrammen dargestellt und bilden die für dieses Modul relevanten Anwendungsszenarien in komprimierter Form ab. Der Schwerpunkt liegt auf den zentralen Use Cases und den dafür erforderlichen Funktionen, um eine klare und gut nachvollziehbare Übersicht zu gewährleisten.
<br>&nbsp;<br>

{{render:guides/implementationguides.vzd/PlantUML/SVGs/EINRVOverview.svg}}

#### Enthaltene Anwendungsfälle:

1. **ÖGD Einrichtungen**  
ÖGD-Einrichtungen sind die EMIGA direkt nutzende ÖDG-Einrichtungen sind und eine CodeSite-ID besitzen.

2. **Generische Einrichtungen**  
Generische Einrichtungen sind EMIGA Einrichtungen, die alle Einrichtungen beinhalten, die nicht EMIGA direkt nutzende ÖDG-Einrichtungen sind und eine CodeSite-ID besitzen. Damit werden unter EMIGA Einrichtungen sowohl Behörden, Transport-Unternehmen, wie Labore oder Arztpraxen aber auch jede andere Einrichtung subsummiert. Die jeweiligen Einrichtung werden durch ihren Typen und/oder ihren Identifier eindeutig charakterisiert. Diese Einrichtungen müssen nicht zwingend eine Straßenanschrift haben, verfügen häufig jedoch zumindest über eine Postanschrift. Krankenhäuser sind keine generischen Einrichtungen. **EpiWarn Organizationen**: Sind eine Grouppierung von Organizationen die nach Paragraf 2 IfSG-Koordinierungs-VwV mit einen Tag als soclhe gekenzeichnet sind.

3. **Krankenhausorganisationen nach INeK**  
   Das Institut für das Entgeltsystem im Krankenhaus (INeK) stellt Daten zu allen Krankhäusern in Deutschland bereit. Diese Daten werden in das Einrichtungsverzeichnis importiert. Krankenhäuser sind medizinische Einrichtungen, in denen Patientinnen und Patienten stationär und/oder ambulant behandelt werden. Im Kontext von EMIGA werden Krankenhäuser als eigenständige Einrichtungseinheiten mit eindeutigen Kennungen (z. B. IK, internen IDs) geführt, die im Melde- und Kommunikationsprozess mit den Gesundheitsämtern eine zentrale Rolle spielen. 