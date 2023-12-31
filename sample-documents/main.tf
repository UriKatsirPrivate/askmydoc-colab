module "folders" {
  source = "./modules/folders/"
  parent = var.parent
  names  = var.common-folder-names
  # folders = var.folders
}

module "projects" {
  source              = "./modules/projects/"
  folder-id           = lookup(tomap(module.folders.ids), var.folder-name, module.folders.ids_list[0])
  project-id          = random_string.random.result
  project-name        = var.project-name
  project-id-no-vpc   = random_string.random-no-vpc.result
  folder-id-no-vpc    = lookup(tomap(module.folders.ids), var.folder-name-no-vpc, module.folders.ids_list[0])
  project-name-no-vpc = var.project-name-no-vpc
  billing_account     = var.billing_account
  activate_apis       = var.activate_apis
  organization-id     = var.organization-id
  common-folder-id    = module.folders.common-folder-id
}

module "default-vpc" {
  source                  = "./modules/vpc"
  network_name            = var.network_name
  auto_create_subnetworks = true
  # auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode = var.routing_mode
  project_id   = module.projects.seed_project_id
  # description             = var.description
}

module "custom-vpc" {
  source                  = "./modules/vpc"
  network_name            = var.network_name
  auto_create_subnetworks = false
  # auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode = var.routing_mode
  project_id   = module.projects.seed_project_id-no-vpc
  # description             = var.description
}

module "custom-subnets" {
  source       = "./modules/subnets"
  project_id   = module.projects.seed_project_id-no-vpc
  network_name = module.custom-vpc.network_name
  subnets      = var.subnets
}

module "firewall" {
  source              = "./modules/firewall"
  ssh_source_ranges   = var.ssh_source_ranges
  network             = module.default-vpc.network_name
  project_id          = module.projects.seed_project_id
  http_source_ranges  = var.http_source_ranges
  https_source_ranges = var.https_source_ranges
}

module "organization-policies" {
  source           = "./modules/OrganizationPolicies/"
  organization-id  = var.organization-id
  constraint       = "sql.restrictPublicIp"
  constraint_names = var.constraint_names
}

module "iam-audit-config" {
  source = "./modules/IamAuditConfig/"
  org_id = var.organization-id
}



resource "random_string" "random" {
  length           = 11
  special          = false
  upper            = false
  number           = false
  override_special = "/@£$"
}

resource "random_string" "random-no-vpc" {
  length           = 11
  special          = false
  upper            = false
  number           = false
  override_special = "/@£$"
}
