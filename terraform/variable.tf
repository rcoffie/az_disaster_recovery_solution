variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "primary_location" {
  description = "The Azure region"
  type        = string
}

variable "secondary_location" {
  description = "The Azure region"
  type        = string
}


variable "primary_resource_group_name" {
  description = "The name of the primary resource group"
  type        = string
  default     = "primary-rg"
}

variable "secondary_resource_group_name" {
  description = "The name of the secondary resource group"
  type        = string
  default     = "secondary-rg"
}