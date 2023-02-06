variable "compute_flavour_control-plane" {
    type = string
    default = "eb1487f4-ff9d-4d50-b9c5-dd8c43e19e34"
}

variable "compute_flavour_worker-plane" {
    type = string
    default = "afa3b301-4a91-4016-ba1b-19169d13ad8e"
}

variable "base_os_image" {
    type = string
    default = "b394becf-f5b6-417c-9d48-7adb92e1cb28"
}

variable "cloudns_api_user" {
    type = string
}

variable "cloudns_api_password" {
    type = string
}