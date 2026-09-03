ValueSet: Fachbereich
Id: Fachbereich
Title: "Fachbereich"
Description: "Das ValueSet 'Fachbereich' enthält die zulässigen Codes zur Abbildung von Fachbereichen (z. B. Abteilungen, Zuständigkeits- oder Aufgabenbereiche). Es dient der einheitlichen und strukturierten Kennzeichnung fachlicher Zuständigkeiten in organisatorischen und fachlichen Prozessen."
* ^url = "https://emiga.rki.de/fhir/vzd/ValueSet/Fachbereich"
* ^version = "0.1.1"
* ^date = "2026-08-18"

* insert MetadataTerminology

//* include codes from system $DemisOrgType
* include codes from system $FachabteilungsschluesselErweitert

* $IHEXDSpracticeSettingCode#ANAE "Anästhesiologie"
* $IHEXDSpracticeSettingCode#PHAR "Pharmakologie"
* $IHEXDSpracticeSettingCode#REHA "Physikalische und Rehabilitative Medizin"
* $IHEXDSpracticeSettingCode#RECH "Rechtsmedizin"
* $IHEXDSpracticeSettingCode#TRAN "Transfusionsmedizin"
* $IHEXDSpracticeSettingCode#ALLG "Allgemeinmedizin"