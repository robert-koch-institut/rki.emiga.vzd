ValueSet: Fachbereich
Id: Fachbereich
Title: "Fachbereich"
Description: "Dieses ValueSet enthält die zulässigen Codes zur Abbildung von Fachbereichen (z. B. Abteilungen, Zuständigkeits- oder Aufgabenbereiche) im Kontext von EMIGA. Es dient der einheitlichen und strukturierten Kennzeichnung fachlicher Zuständigkeiten in organisatorischen und fachlichen Prozessen."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-08-01"
* ^url = "https://emiga.rki.de/fhir/vzd/ValueSet/Fachbereich"
//* include codes from system $DemisOrgType

* include codes from system $FachabteilungsschluesselErweitert

* $IHEXDSpracticeSettingCode#ANAE "Anästhesiologie"
* $IHEXDSpracticeSettingCode#PHAR "Pharmakologie"
* $IHEXDSpracticeSettingCode#REHA "Physikalische und Rehabilitative Medizin"
* $IHEXDSpracticeSettingCode#RECH "Rechtsmedizin"
* $IHEXDSpracticeSettingCode#TRAN "Transfusionsmedizin"
* $IHEXDSpracticeSettingCode#ALLG "Allgemeinmedizin"

