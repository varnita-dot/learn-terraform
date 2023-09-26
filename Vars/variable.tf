variable "fruit" {
  default = "apple"
}

variable "fruits" {

default= ["apple", "banana"]
}

variable "MapOfFruits"{
  default= {
    "apple" =10
    "banana" = 70
  }
}

output "fruit" {
  value = var.fruit
}

output "fruits" {
  value = var.fruits[1]
}

output "MapOfFruits" {
  value = "value of apple  is ${var.MapOfFruits.apple}"
}

