variable "location" {
  type = string
}
variable "rg-name" {
  type = string
}
variable "std_tags" {
  type = map(string)
}
variable "postgres_admin_username" {
  type = string
}
variable "postgres_admin_password" {
  type = string
}