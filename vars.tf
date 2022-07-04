# ver localizaciones disponibles
# az account list-locations -o table
# ver tamaños disponibles:
# az vm list-sizes --location westeurope
variable "location" {
	type = string
	description = "region de azure para crear la infra"
	default = "West Europe"
}
variable "vm_size" {
	type = string
	description = "tamaño de la máquina virtual"
	default = "A2 v2" #modificar y poner de 4Gb y 2vcpu
}
variable "vms_workers" {
    description = "Maquinas virtuales a crear para CP2"
    type = list(string)
    default = [  "worker1", "worker2"]
}
