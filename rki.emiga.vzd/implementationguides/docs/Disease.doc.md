Das abstrakte **[Disease](https://simplifier.net/rki.demis.disease/~resources?canonical=https://demis.rki.de/fhir/structuredefinition/disease)**-Profil ist eine Spezialisierung der FHIR [Condition](https://www.hl7.org/fhir/condition.html). 

In diesem Profil werden allgemeine Festlegungen (Kardinalität etc.) bzgl. der für alle Meldetatbestände gemäß §6 Absatz 1 IfSG relevanten Inhalte getroffen. Aus logischer Sicht sind dies u.a.: Diagnose/Meldetatbestand, Verifikationsstatus der Diagnose, Symptome und Manifestationen, Datum der Diagnosestellung, Datum des Erkrankungsbeginns und wichtige textuelle Hinweise zur Diagnose/Meldetatbestand.

Eine weitere Verfeinerung dieses Zuschnitts (z.B. das normative Binding von krankheitsspezifischen Symptomen/Manifestationen an ausgewählte ValueSets) findet in krankheitsspezifischen Unterprofilen (z.B. [DiseaseCVDD](https://simplifier.net/rki.demis.disease/~resources?canonical=https://demis.rki.de/fhir/structuredefinition/diseasecvdd)) statt.
