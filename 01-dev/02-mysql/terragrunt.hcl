terraform {
  source = "git::https://github.com/prodyna/terragrunt-training-modules//modules/mysql-db"

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
    
    db_user = include.env.locals.db_user
    db_pw = include.env.locals.db_pw
    mysql_name = "base01-db"
    private_dns_zone_id = dependency.base01.outputs.private_dns_zone_id
    db_subnet_id = dependency.base01.outputs.db_subnet_id
    
}

dependency "base01" {
    config_path = "../01-base"

}