terraform {
  source = "git::https://github.com/GrobPohlMichael/terrgrunt-training-module-base//.?ref=v0.0.1"

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

    vnet_cidr = include.env.locals.vnet_cidr
    default_subnet_cidr = include.env.locals.default_subnet_cidr
    db_subnet_cidr = include.env.locals.db_subnet_cidr
   

}