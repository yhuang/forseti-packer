# Forseti Packer

#### Required Software

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstarts)
- [jq](https://stedolan.github.io/jq/download)
- [Packer](https://packer.io/downloads.html)

#### Project Configuration

  1. Deploy your [Terraform Admin project](https://github.com/yhuang/terraform-admin).

  2. Deploy your [Trusted Images project](https://github.com/yhuang/trusted-images).

  3. Configure `gcloud` to use your Terraform Admin service account key:
  ```
  $ gcloud auth activate-service-account --key-file <Path to the Terraform Admin service account key>
  ```

  GOOGLE_APPLICATION_CREDENTIALS=<Path to the Terraform Admin service account key>
  TRUSTED_IMAGES_PROJECT_NAME=<Your Trusted Images Project Name (Not Its Project ID)>
  TF_VAR_trusted_images_states_bucket=<Your Trusted Images States Bucket Name>

  4. Set the following environment variables in the Forseti Packer repo's `forseti-packer.env` file to fit your Terraform Admin project and Trusted Images project deployment:
  ```
  GOOGLE_APPLICATION_CREDENTIALS=<path to the Terraform Admin service account key>
  TRUSTED_IMAGES_PROJECT_NAME=<your Terraform Admin project name (not its project ID)>
  REGION=<the region in which your packer builder instance will run>
  FORSETI_VERSION=<the version of Forseti Security you plan to deploy>
  ```

  5. From the Forseti Packer repo's root directory, export the updated environment variables:
  ```
  $ source forseti-packer.env
  ```

  6. At this point, Packer should be able to build the Forseti Security compute image in the Trusted Images environment.  From the Forseti Packer repo's root directory:
  ```
  $ packer build -only=googlecompute templates/forseti-security.json
  ```
