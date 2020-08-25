variable AWS_ACCESS_KEY{}
variable AWS_SECRET_KEY{}
variable AWS_REGION
{
default = "us-east-1"
}
variable AMIS
{
type = "map"
default {
us-east-1 = "ami-02354e95b39ca8dec"
us-east-2 = "ami-09a67037138f86e67"
}
}
variable PUB_KEY_PATH { default = "firstnaveen.pub" }
variable PRIVATE_KEY_PATH {default = "firstnaveen.ppk"}