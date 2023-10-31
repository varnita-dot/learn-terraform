resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = <<EOF
    echo: "hello world"
    pwd
    ls
EOF
  }
}