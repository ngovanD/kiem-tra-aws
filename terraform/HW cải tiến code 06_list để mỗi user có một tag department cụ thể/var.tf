variable "user_names" {
  description = "Create IAM users"
  type        = list(object({
    name = string
    tag = map(string)
  }))
  default     = [
    {name = "Paul", tag = {"deparment" = "Sale"}},
    {name = "John", tag = {"deparment" = "Software"}},
    {name = "Hai", tag = {"deparment" = "Accounting"}}
  ]
}