variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to delete all objects from the bucket on destroy"
  type        = bool
  default     = false
}

variable "acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}
