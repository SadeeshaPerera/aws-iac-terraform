resource "aws_instance" "test_server" {
  ami           = "ami-02c7683e4ca3ebf58"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleWebAppServer"
  }
}