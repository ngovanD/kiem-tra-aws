module "ssh_key_pair" {
  source                = "cloudposse/key-pair/aws"
  version               = "0.18.3"
  name                  = var.keyname
  ssh_public_key_path   = "."
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}