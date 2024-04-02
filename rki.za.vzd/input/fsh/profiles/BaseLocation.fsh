Profile: BaseLocation
Parent: Location
Id: BaseLocation
Title: "Location in RKI Directory"
Description: """Defines the data structure for medical, regulatory and technical
organisations specific for german Healthcare and Telematics Infrastructure."""
* insert Meta
* insert Security
* ^version = "1.0.0"
* ^date = "2024-03-18"
* id MS
* meta.tag MS
* name MS
* description MS
* type from LocationType
* address MS
  * use MS
  * text MS
  * line MS
  * city MS
  * district MS
  * state MS
  * postalCode MS
  * country MS
* position MS
  * longitude MS
  * latitude MS
  * altitude MS
* hoursOfOperation MS
  * daysOfWeek MS
  * allDay MS
  * openingTime MS
  * closingTime MS
* availabilityExceptions MS