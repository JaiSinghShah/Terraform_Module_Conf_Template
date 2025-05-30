
output "vpc_id" {
  value = module.networking.vpc_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "bucket_name" {
  value = module.storage.bucket_name
}
    