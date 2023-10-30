Within AWS this shell script will query the metadata of AWS instance. jq needs to be installed in the linux vm where this shell script will be executed.
After execution of the shell script it will print the following values.

ubuntu@ip-172-31-x-x:~$ ./challenge2.sh
{
  "ami-id": "ami-0747.......",
  "ami-launch-index": "0",
  "ami-manifest-path": "(unknown)",
  "hostname": "ip-172-31-x-x.ec2.internal",
  "instance-action": "none",
  "instance-id": "i-01bbd.......",
  "instance-life-cycle": "on-demand",
  "instance-type": "t2.micro",
  "local-hostname": "ip-172-31-x-x.ec2.internal",
  "local-ipv4": "172.31.x.x",
  "mac": "12:71:x:x:x:x",
  "profile": "default-hvm",
  "public-hostname": "ec2-54-89-x-x.compute-1.amazonaws.com",
  "public-ipv4": "54.89.x.x",
  "reservation-id": "r-044935......",
  "security-groups": "assignment-SG"
}
AWS instance metadata is retrieved successfully.