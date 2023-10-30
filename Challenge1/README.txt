Created one VNet having 3 subnets.
Each subnet is having one virtual machine.
Web virtual machine allows inbound traffic from internet.
App virtual machine allows traffic from web virtual machine only and can response to the same VM again.
App VM can access the database and vice-versa. But database cannot connect to web VM.

Following are the steps to execute these files.

STEP 1: terraform init
STEP 2: terraform plan
STEP 3: terraform apply