# Purpose
This Terraform repository does the following:
- Create a KMS Key and an alias for the same
- Create an S3 bucket Policy that denies unencrypted data from being uploaded
- Creates an S3 Bucket (iris-data-bucket-_randomhash_) for Uploads with Server Side Encryption using the KMS Key created above 
- Attaches the S3 bucket policy created above to the Upload S3 Bucket
- Creates an Athena DB (irisdb) that Points to the Upload S3 Bucket
- Creates a External Table(iris) in Glue under this Athena Db
- Creates an Athena Workgroup with outputs being sent to an S3 bucket (athena-outputs-_randomhash_)
- Uploads the iris.csv to the Upload Bucket
- Data from iris.csv can now be Queried from Athena 

# Structure
`
├── colibri/
 ├── backends
 ├── csv
 ├── modules
 ├── policies 
 ├── tfvars
 ├── main.tf
 ├── Makefile
 ├── provider.tf
 ├── tf_util.sh
 ├── variables.tf
 `  
The project directory will contain:
- backends/, Holds the State Bucket 
- csv/, a directory containing the iris.csv
- modules/, directory to hold terraform modules
- policies/, directory to hold S3 bucket policies
- tfvars/ directory that will hold dev,test and prod env variables that get fed to the TF
- Makefile - File that will drive the deployment
- tf_util.sh - Helper script to drive TF automation

## Things u MUST do before You Start deploying
- Set your AWS vars in the Env you wish to deploy 
    - $ export AWS_ACCESS_KEY_ID="anaccesskey"
    - $ export AWS_SECRET_ACCESS_KEY="asecretkey"
    - $ export AWS_DEFAULT_REGION="eu-west-2"
- Create a Bootstrap S3 bucket from the AWS Console -- this will hold your Remote State File
- Go to Folder `backends` and Change the Bucket Name to this bucket you just created
- Set your `environment` (dev,test,prod) var in the Makefile -- Only works for dev as only those .tfvars are set
- Check the `<env>.tfvars` file and change var names (Optional)

# Commands
- `make plan` - Perform a Terraform plan to see what infrastructure would be created if you were to run make apply
- `make apply` - Perform a Terraform apply to deploy your infrastructure
- `make destroy` - Perform a Terraform destroy to tear down your deployed infrastructure

Note : Please do not run terraform plan or terraform apply directly as this will fail due to the vars not being present in the root folder