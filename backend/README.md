# How to use terraform backend

1. Create a S3 and a dynamodb table without terraform block
2. After created S3 and dynamodb table, create a terraform block
3. In terraform block, set the backend configuration
4. `terraform init` for applying backend
5. Type `yes` to copy your local state to S3
