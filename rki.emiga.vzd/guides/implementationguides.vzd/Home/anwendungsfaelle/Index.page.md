# {{page-title}}

## Inhaltsverzeichnis

{{index:children}}

---
## Anwendungsfälle Überblick
Dieser Abschnitt bietet eine Übersicht über alle in diesem Implementierungsleitfaden definierten **Anwendungsfälle**, die in Form von UML-Diagrammen dargestellt werden und die für dieses Modul relevanten Anwendungsfälle in komprimierter Form abbilden. Der Schwerpunkt liegt auf den zentralen Use Cases und den dafür erforderlichen Funktionen, um eine klare und gut nachvollziehbare Übersicht zu gewährleisten.
<br>&nbsp;<br>

#### Enthaltene Anwendungsfälle:

1. **Standort**  
   Ein 'physischer' Ort, der besucht werden kann. Einem physischen Ort können grundsätzlich Geo-Koordinaten und zumeist auch eine Straßenadresse zugeordnet werden.

2. **Organisation**  
   Unter der EMIGA Organization werden alle Organisationen zusammengefasst, die NICHT EMIGA direkt nutzende ÖDG-Organisationen sind, die eine Code-Side-ID besitzen. Damit werden unter EMIGA Organisationen sowohl Behörden, Transport-Unternehmen, wie Krankenhäuser, Labore oder Arztpraxen aber auch jede andere Organisation subsummiert. Die jeweiligen Organisation werden durch ihren Typen und/oder ihren Identifier eindeutig charakterisiert. EmigaOrganisationen müssen nicht zwingend eine Straßenanschrift haben, verfügen häufig jedoch zumindest über eine Postanschrift.

3. **Practitioner**  
   Personen, die im weiteren Sinne einen Bezug zur Erbringung von Leistungen/Erfüllung von Aufgaben innerhalb der Gesundheitsversorgung (hier: ÖGD) haben. Dies sind somit explizit nicht nur Ärztinnen und Ärzte sondern auch andere Personengruppen, wie z.B. MitarbeiterInnen im Gesundheitsamt, LeiterInnen/AnsprechpartnerInnen von Gemeinschaftseinrichtungen. Patienten, Kontaktpersonen etc. fallen jedoch explizit NICHT unter diese Kategorie.

4. **Krankenhaus**  
   Krankenhäuser sind medizinische Einrichtungen, in denen Patientinnen und Patienten stationär und/oder ambulant behandelt werden. Im Kontext von EMIGA werden Krankenhäuser als eigenständige Organisationseinheiten mit eindeutigen Kennungen (z. B. IK, internen IDs) geführt, die im Melde- und Kommunikationsprozess mit den Gesundheitsämtern eine zentrale Rolle spielen. Dazu gehören u. a. die Übermittlung meldepflichtiger Daten, Rückfragen von Behörden sowie die Koordination weiterer Maßnahmen.


