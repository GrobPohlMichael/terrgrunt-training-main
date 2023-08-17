terraform {
  source = "git::https://github.com/prodyna/terragrunt-training-modules//modules/wordpress-vm"

}
include "global" {
  path   = find_in_parent_folders("global.hcl")
  expose = true
}
include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}
inputs = {
    
    vm_user = "VMUser1"
    vm_pw = "MySecretVM123!"
    db_url = dependency.sql.outputs.db_url
    db_user = include.env.locals.db_user
    db_pw = include.env.locals.db_pw
    asg_id=  dependency.base01.outputs.asg_id
    pip_ids = dependency.base01.outputs.pip_ids
    subnet_id = dependency.base01.outputs.default_subnet_id


}

dependency "base01" {
    config_path = "../01-base"

}
dependency "sql" {
    config_path = "../02-mysql"

}