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
  value1 = var.fruits[1]
  value3 = var.MapOfFruits.apple
}