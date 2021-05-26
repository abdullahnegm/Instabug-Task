variable AWS_ACCESS_KEY    {}
variable AWS_SECRET_KEY    {}
variable AWS_SESSION_TOKEN {}

variable REGION        {
    default = "us-east-1"
}

variable AMIS {
    type = map(string)
    default = {
        "us-east-1" = "ami-09e67e426f25ce0d7",
        "us-east-2" = "ami-00399ec92321828f5"
    }
}

variable key_path          {}
variable key_name          {}

variable inventory_path    {}
