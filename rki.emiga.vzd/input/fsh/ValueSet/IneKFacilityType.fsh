ValueSet: IneKFacilityType
Id: IneKFacilityType
Title: "IneK Einrichtungstyp (Werteliste)"
Description: "Werteliste mit Konzepten, die die Art/den Typ einer Einrichtung aus IneK Standortverzeichnis."
* insert MetadataTerminology
* ^version = "0.1.0"
* ^date = "2025-06-18"

//* include all codes from system $IneKFacilityType
* include codes from system $IneKFacilityTypeCS

* ^compose.include[0].concept[0].code = #00
* ^compose.include[0].concept[0].display = "Stationäre Behandlung"
* ^compose.include[0].concept[1].code = #01
* ^compose.include[0].concept[1].display = "reserviert"
* ^compose.include[0].concept[2].code = #02
* ^compose.include[0].concept[2].display = "Behandlung nach § 116b Abs. 2 SGB V (ASV)"
* ^compose.include[0].concept[3].code = #03
* ^compose.include[0].concept[3].display = "Behandlung nach § 116b Abs. 8 SGB V"
* ^compose.include[0].concept[4].code = #04
* ^compose.include[0].concept[4].display = "Behandlung nach § 117 SGB V (HSA)"
* ^compose.include[0].concept[5].code = #05
* ^compose.include[0].concept[5].display = "Behandlung nach § 118 Abs. 1 SGB V (PIA)"
* ^compose.include[0].concept[6].code = #06
* ^compose.include[0].concept[6].display = "Behandlung nach § 118 Abs. 2 SGB V (PIA)"
* ^compose.include[0].concept[7].code = #07
* ^compose.include[0].concept[7].display = "Behandlung nach § 118 Abs. 3 SGB V (PsIA)"
* ^compose.include[0].concept[8].code = #08
* ^compose.include[0].concept[8].display = "Behandlung nach § 118 Abs. 4 SGB V (PIA)"
* ^compose.include[0].concept[9].code = #09
* ^compose.include[0].concept[9].display = "Behandlung nach § 118a SGB V (GIA)"
* ^compose.include[0].concept[10].code = #10
* ^compose.include[0].concept[10].display = "Behandlung nach § 119 SGB V (SPZ)"
* ^compose.include[0].concept[11].code = #11
* ^compose.include[0].concept[11].display = "Behandlung nach § 119c SGB V (Medizinische Behandlungszentren)"
* ^compose.include[0].concept[12].code = #12
* ^compose.include[0].concept[12].display = "Kinderspezialambulanz nach § 120 Abs. 1a SGB V"
* ^compose.include[0].concept[13].code = #13
* ^compose.include[0].concept[13].display = "Notfallambulanz"
* ^compose.include[0].concept[14].code = #14
* ^compose.include[0].concept[14].display = "Zentrale Notaufnahme (ZNA)"
* ^compose.include[0].concept[15].code = #15
* ^compose.include[0].concept[15].display = "Zentrale Notaufnahme (ZNA) Erwachsene"
* ^compose.include[0].concept[16].code = #16
* ^compose.include[0].concept[16].display = "Zentrale Notaufnahme (ZNA) Kinder u. Jugendliche"