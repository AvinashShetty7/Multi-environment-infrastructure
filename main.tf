module "vpcinfra" {
  source = "./modules/vpcinfra"
}

module "autoscalling" {
  source = "./modules/autoscal"
  subnetsid_loadbalancer = [module.vpcinfra.publicsub1_id, module.vpcinfra.publicsub2_id]
  vpc_id = module.vpcinfra.vpc_id
  vpc_zone_identifier_to_autoscale = [module.vpcinfra.privatesub1_id,module.vpcinfra.privatesub2_id]
  subnetid_for_bastian = module.vpcinfra.publicsub1_id
  depends_on = [ module.vpcinfra ]
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  autoscale_grpname = module.autoscalling.autoscalgroupname
}




