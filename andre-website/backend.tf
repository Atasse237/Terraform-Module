 #backend to store terraform state file in s3
 terraform {
   bucket ="andre-terraform-remote-state"
   key = "andre-website"
   region = "us-east-1"
   profile = "terraform_user"
 }