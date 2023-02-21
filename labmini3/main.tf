resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = "ami-0f15e0a4c8d3ee5fe"
  instance_type = var.environment == "dev" ? "t2.micro" : "t2.small"
}
resource "aws_autoscaling_group" "hello" {
  name                      = " nuumfactory-asg-conditions-15"
  availability_zones = ["eu-west-3a","eu-west-3b","eu-west-3c"]
  min_size           = var.environment == "dev" ? 1 : 2
  max_size           = var.environment == "dev" ? 2 : 4

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.example.id
      }
    }
  }

}