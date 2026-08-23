# CNFP1 Session 39 - Terraform Session 05

# 1.Security Group

inbound rule : allow 
port range 22
Source My IP 122.216.76.74

outbound rule

allow any : 0.0.0.0

Subnet : default
public ip address 1 ku ya

# 2.create an EC2 instance(in public subnet)

 create key pair login(name : master-jp-keypair)
 VPC
 Subnet
 Public IP

 what are security control?
 only two point
 1.security group
 2.private key

ssh -i master-jp-keypair.pem ubundu@18.182.1.60

chmod 400 master-jp-keypair.pem

now can login-----


# 3.create an EC2 instance(in private subnet)

create a private subnet

what do we need?
1.master-sgp-key.pem
2.security group (allow the bustion-host-sg)


ssh -i master-jp-keypair.pem ubundu@18.182.1.60

sudo vi master-jp-keypair.pem
copy/paste
:wq!

sudo chmod 400 master-jp-keypair.pem

ssh -i master-jp-keypair.pem ubundu@172.31.53.251

->#permission denied

sudo chown ubundu:ubundu master-jp-keypair.pem

ssh -i master-jp-keypair.pem ubundu@172.31.53.251

-------------------------------------------------------------------------------------------

# NAT gtw create (in public subnet)

Edit routes in private-subnet

netstat

sudo apt-get update -y

sudo apt install net-tools

when install complete, delete natgw

# also install netstat on bastion-host-sg 

netstat

sudo apt-get update -y

sudo apt install net-tools

# to check which host are working to go through the internet

netstat -tanlp

local address mean current pc ip address (source)

Foreign Address -> which ip communicate (destination)

# 1st EC2 (public subnet)
inbound rule (our pc ip address)
outbound rule（protocol : all tcp）
# 2nd EC2 (private subnet)
inbound rule ()
outbound rule 

--------------------------
Terraform
video starts from 1:42:00
1.generate keypair
# pwd
# ssh-keygen
# Enter file in which to save the key {# pwd result}/master-japan-key


2. add keypair（private key） by Terraform on AWS
    public key on PC
