Profile: OrganizationDirectory
Parent: Organization
Id: OrganizationDirectory
Title: "Organization in RKI Directory"
* id MS
* meta.tag MS
* identifier MS
// * identifier ^slicing.discriminator.type = #value
// * identifier ^slicing.discriminator.path = "system"
// * identifier ^slicing.rules = #open
// * identifier contains
//     TelematikID 1..1 MS and
//     BSNR 0..1 MS and
//     KZVA 0..1 MS and
//     IKNR 0..1 MS
// * identifier[TelematikID] only $identifier-telematik-id
// * identifier[BSNR] only $identifier-bsnr
// * identifier[KZVA] only $identifier-kzva
// * identifier[IKNR] only $identifier-iknr
* type 1.. MS
* name 1.. MS
* alias MS
* contact MS