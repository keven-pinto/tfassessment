resource "random_id" "uuid" {
  byte_length = 8
}

output "uuid" {
  value = random_id.uuid.hex
}