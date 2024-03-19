
RuleSet: Meta
* ^status = #active
* ^experimental = false
* ^publisher = "Robert Koch-Institut"


RuleSet: Security
* meta
  * security
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
    * ^slicing.description = "Slicing security attributey by coding system"
    * ^slicing.ordered = false
  * security contains
      visibility 1..1 and
      responsibility 1..1
  * security[visibility] from VisibilityType
    * system = $visibilityType
  * security[responsibility] from DataResponsibility
    * system = $dataResponsibility
  