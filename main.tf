module "vpcinfra" {
  source = "./modules/vpcinfra"
}

module "autoscalling" {
  source = "./modules/autoscal"
  subnetsid_loadbalancer = [module.vpcinfra.publicsub1_id, module.vpcinfra.publicsub2_id]
  vpc_id = module.vpcinfra.vpc_id
}