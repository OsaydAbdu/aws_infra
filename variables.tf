variable "osaydio_ip" {
	description = "Static ip address for osayd.io"
	default     = "3.132.158.106"
}


variable "upspin_osayd_io_txt_record" {
	default = "upspin:2e7f160de175852592ab4b3e5d69b070232e2057a16f88d3eb597de43baeba27-83ffa7a7bfec7481502d994584f06225abee3c60ef07b505305763245a74ed00"
}

variable "osayd_io_ns_records" {
	default = [
		"ns-1403.awsdns-47.org.",
		"ns-810.awsdns-37.net.",
		"ns-1769.awsdns-29.co.uk.",
		"ns-111.awsdns-13.com.",
	]
}

variable "osayd_io_soa_records" {
	default = "ns-1403.awsdns-47.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
}