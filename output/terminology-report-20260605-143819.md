# Terminology Binding Comparison Report

**Generated:** 2026-06-05T14:38:19.424Z
**Profiles with Differences:** 13
**Common Bindings Across All Profiles:** 1

This report shows differences in terminology bindings between R4 and R6 profiles.

---

## All Resources

The following binding changes occur in **all** profiles:

### Other Elements

### Binding Strength and ValueSet Changes

**language**
- Must Support: no
- Strength: `preferred` → `required`
- R4 ValueSet: http://hl7.org/fhir/ValueSet/languages
- R6 ValueSet: http://hl7.org/fhir/ValueSet/all-languages|6.0.0-ballot3

---

## Must Support

The following profiles contain binding differences on Must-Support elements:

### EmigaDepartmentOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganizationR6
- **Differences:** 2

### Removed Bindings in R6

**Organization.address.state**
- Must Support: yes
- ValueSet (R4): http://fhir.de/ValueSet/iso/bundeslaender
- Strength (R4): `preferred`

**Organization.telecom.system**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1
- Strength (R4): `required`

---

### EmigaHealthcareServiceR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareServiceR6
- **Differences:** 2

### Removed Bindings in R6

**HealthcareService.availableTime.daysOfWeek**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

**HealthcareService.telecom.system**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1
- Strength (R4): `required`

---

### EmigaHospitalFacilityLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocationR6
- **Differences:** 1

### Removed Bindings in R6

**Location.physicalType**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/location-physical-type
- Strength (R4): `example`

---

### EmigaHospitalLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocationR6
- **Differences:** 1

### Removed Bindings in R6

**Location.physicalType**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/location-physical-type
- Strength (R4): `example`

---

### EmigaHospitalOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganizationR6
- **Differences:** 2

### Removed Bindings in R6

**Organization.address.state**
- Must Support: yes
- ValueSet (R4): http://fhir.de/ValueSet/iso/bundeslaender
- Strength (R4): `preferred`

**Organization.telecom.system**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1
- Strength (R4): `required`

---

### EmigaHospitalRoomLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalRoomLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalRoomLocationR6
- **Differences:** 2

### Binding Strength and ValueSet Changes

**Location.type**
- Must Support: yes
- Strength: `extensible` → `preferred`
- R4 ValueSet: http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType
- R6 ValueSet: http://terminology.hl7.org/ValueSet/service-type

### Removed Bindings in R6

**Location.physicalType**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/location-physical-type
- Strength (R4): `example`

---

### EmigaOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganizationR6
- **Differences:** 2

### Removed Bindings in R6

**Organization.address.state**
- Must Support: yes
- ValueSet (R4): http://fhir.de/ValueSet/iso/bundeslaender
- Strength (R4): `preferred`

**Organization.telecom.system**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1
- Strength (R4): `required`

---

### EmigaPublicHealthOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganizationR6
- **Differences:** 2

### Removed Bindings in R6

**Organization.address.state**
- Must Support: yes
- ValueSet (R4): http://fhir.de/ValueSet/iso/bundeslaender
- Strength (R4): `preferred`

**Organization.telecom.system**
- Must Support: yes
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1
- Strength (R4): `required`

---

## Non Must Support

The following profiles contain binding differences on elements without Must Support:

### EmigaDepartmentOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaDepartmentOrganizationR6
- **Differences:** 7

### New Bindings in R6

**Organization.qualification.code**
- Must Support: no
- Strength: `example`

**Organization.qualification.status**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/qualification-status
- Strength: `preferred`

### Removed Bindings in R6

**Organization.address.country**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/iso3166-1-2
- Strength (R4): `preferred`

**Organization.address.type**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-type|4.0.1
- Strength (R4): `required`

**Organization.address.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-use|4.0.1
- Strength (R4): `required`

**Organization.contact.purpose**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contactentity-type
- Strength (R4): `extensible`

**Organization.telecom.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1
- Strength (R4): `required`

---

### EmigaHealthcareServiceR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareService
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHealthcareServiceR6
- **Differences:** 4

### Binding Strength and ValueSet Changes

**HealthcareService.communication**
- Must Support: no
- Strength: `preferred` → `required`
- R4 ValueSet: http://hl7.org/fhir/ValueSet/languages
- R6 ValueSet: http://hl7.org/fhir/ValueSet/all-languages|6.0.0-ballot3

### ValueSet Changes

**HealthcareService.characteristic**
- Must Support: no
- R4 ValueSet: none
- R6 ValueSet: http://hl7.org/fhir/ValueSet/service-mode
- Binding Strength: `example` → `example`

**HealthcareService.eligibility.code**
- Must Support: no
- R4 ValueSet: none
- R6 ValueSet: http://hl7.org/fhir/ValueSet/eligibility
- Binding Strength: `example` → `example`

### Removed Bindings in R6

**HealthcareService.telecom.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1
- Strength (R4): `required`

---

### EmigaHospitalFacilityLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalFacilityLocationR6
- **Differences:** 3

### New Bindings in R6

**Location.characteristic**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-characteristic
- Strength: `example`

**Location.form**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-form
- Strength: `example`

### Removed Bindings in R6

**Location.hoursOfOperation.daysOfWeek**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

---

### EmigaHospitalLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalLocationR6
- **Differences:** 3

### New Bindings in R6

**Location.characteristic**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-characteristic
- Strength: `example`

**Location.form**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-form
- Strength: `example`

### Removed Bindings in R6

**Location.hoursOfOperation.daysOfWeek**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

---

### EmigaHospitalOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalOrganizationR6
- **Differences:** 7

### New Bindings in R6

**Organization.qualification.code**
- Must Support: no
- Strength: `example`

**Organization.qualification.status**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/qualification-status
- Strength: `preferred`

### Removed Bindings in R6

**Organization.address.country**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/iso3166-1-2
- Strength (R4): `preferred`

**Organization.address.type**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-type|4.0.1
- Strength (R4): `required`

**Organization.address.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-use|4.0.1
- Strength (R4): `required`

**Organization.contact.purpose**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contactentity-type
- Strength (R4): `extensible`

**Organization.telecom.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1
- Strength (R4): `required`

---

### EmigaHospitalRoomLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalRoomLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaHospitalRoomLocationR6
- **Differences:** 3

### New Bindings in R6

**Location.characteristic**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-characteristic
- Strength: `example`

**Location.form**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-form
- Strength: `example`

### Removed Bindings in R6

**Location.hoursOfOperation.daysOfWeek**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

---

### EmigaLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaLocationR6
- **Differences:** 5

### Binding Strength and ValueSet Changes

**Location.type**
- Must Support: no
- Strength: `extensible` → `preferred`
- R4 ValueSet: http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType
- R6 ValueSet: http://terminology.hl7.org/ValueSet/service-type

### New Bindings in R6

**Location.characteristic**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-characteristic
- Strength: `example`

**Location.form**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-form
- Strength: `example`

### Removed Bindings in R6

**Location.hoursOfOperation.daysOfWeek**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

**Location.physicalType**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/location-physical-type
- Strength (R4): `example`

---

### EmigaOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaOrganizationR6
- **Differences:** 7

### New Bindings in R6

**Organization.qualification.code**
- Must Support: no
- Strength: `example`

**Organization.qualification.status**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/qualification-status
- Strength: `preferred`

### Removed Bindings in R6

**Organization.address.country**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/iso3166-1-2
- Strength (R4): `preferred`

**Organization.address.type**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-type|4.0.1
- Strength (R4): `required`

**Organization.address.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-use|4.0.1
- Strength (R4): `required`

**Organization.contact.purpose**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contactentity-type
- Strength (R4): `extensible`

**Organization.telecom.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1
- Strength (R4): `required`

---

### EmigaPractitionerR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitioner
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerR6
- **Differences:** 4

### ValueSet Changes

**Practitioner.qualification.code**
- Must Support: no
- R4 ValueSet: http://terminology.hl7.org/ValueSet/v2-2.7-0360
- R6 ValueSet: http://terminology.hl7.org/ValueSet/v2-0360
- Binding Strength: `example` → `example`

### New Bindings in R6

**Practitioner.communication.language**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/all-languages|6.0.0-ballot3
- Strength: `required`

**Practitioner.qualification.status**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/qualification-status
- Strength: `preferred`

### Removed Bindings in R6

**Practitioner.communication**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/languages
- Strength (R4): `preferred`

---

### EmigaPractitionerRoleR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRole
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPractitionerRoleR6
- **Differences:** 3

### New Bindings in R6

**PractitionerRole.characteristic**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/service-mode
- Strength: `example`

**PractitionerRole.communication**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/all-languages|6.0.0-ballot3
- Strength: `required`

### Removed Bindings in R6

**PractitionerRole.availableTime.daysOfWeek**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

---

### EmigaPublicHealthLocationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthLocation
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthLocationR6
- **Differences:** 5

### Binding Strength and ValueSet Changes

**Location.type**
- Must Support: no
- Strength: `extensible` → `preferred`
- R4 ValueSet: http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType
- R6 ValueSet: http://terminology.hl7.org/ValueSet/service-type

### New Bindings in R6

**Location.characteristic**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-characteristic
- Strength: `example`

**Location.form**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/location-form
- Strength: `example`

### Removed Bindings in R6

**Location.hoursOfOperation.daysOfWeek**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/days-of-week|4.0.1
- Strength (R4): `required`

**Location.physicalType**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/location-physical-type
- Strength (R4): `example`

---

### EmigaPublicHealthOrganizationR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganization
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/EmigaPublicHealthOrganizationR6
- **Differences:** 7

### New Bindings in R6

**Organization.qualification.code**
- Must Support: no
- Strength: `example`

**Organization.qualification.status**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/qualification-status
- Strength: `preferred`

### Removed Bindings in R6

**Organization.address.country**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/iso3166-1-2
- Strength (R4): `preferred`

**Organization.address.type**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-type|4.0.1
- Strength (R4): `required`

**Organization.address.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/address-use|4.0.1
- Strength (R4): `required`

**Organization.contact.purpose**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contactentity-type
- Strength (R4): `extensible`

**Organization.telecom.use**
- Must Support: no
- ValueSet (R4): http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1
- Strength (R4): `required`

---

### OrgVBundleR6

- **R4 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/OrgVBundle
- **R6 URL:** https://emiga.rki.de/fhir/vzd/StructureDefinition/OrgVBundleR6
- **Differences:** 1

### New Bindings in R6

**Bundle.link.relation**
- Must Support: no
- ValueSet: http://hl7.org/fhir/ValueSet/iana-link-relations|6.0.0-ballot3
- Strength: `required`

---
