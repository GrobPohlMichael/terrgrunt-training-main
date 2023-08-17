locals {
    db_user = "myUser"
    db_pw = "MySecret123!"
    vnet_cidr = "10.1.0.0/16"
    default_subnet_cidr = "10.1.0.0/24"
    db_subnet_cidr = "10.1.1.0/24"
 
    #asg_id = 
}

inputs = {
       resource_prefix = "prod"
}
