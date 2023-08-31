variable "project" {

}

variable "credentials" {

}

variable "region" {
    description = "This is for region"
    default = "us-west1"
}

variable "zone" {
    description = "This is for zone"
    default = "us-west1-b"
}

variable "os_image" {
    description = "This is for OS image"
    default = "projects/debian-cloud/global/images/debian-11-bullseye-v20230814"
}
