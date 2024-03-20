Profile: PractitionerDirectory
Parent: Practitioner
Id: PractitionerDirectory
Title: "Practitioner in RKI Directory"
Description: "Practitioner in RKI Directory"
* insert Meta
* insert Security
* ^version = "0.1.0-alpha.1"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* identifier MS
* name 1..1 MS
  * text 1.. MS
  * family 1.. MS
  * given 1.. MS
  * prefix MS
  * suffix MS
* telecom MS
  * system MS
  * value MS
  * use MS
* gender MS
* birthDate MS
* photo MS
* qualification MS
* communication MS