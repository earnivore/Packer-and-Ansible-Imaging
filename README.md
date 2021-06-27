# Packer-and-Ansible-Imaging

A repository containing Packer and Ansible files for imaging a Terraria server into Google Cloud Platform (GCP). A GCP project should be created and the Compute API should be enabled on the project. After the image is created, a virtual machine can be spun up with the image for an automatically-starting Terraria server.

## Google Cloud Access

Packer needs to assume a GCP identity to create the image. The identity should be a service account with Compute Instance Admin and Service Account User permissions.

```shell
export GOOGLE_APPLICATION_CREDENTIALS="PATH_TO_MY_SERVICE_ACCOUNT_KEY_JSON_FILE"
```

## Packer Commands

Packer files need to have `.pkr.hcl` file extensions in order for HCL2 to be recognized. Otherwise, Packer will unsuccessfully try to parse JSON. A GCP Project ID needs to be specified as the destination for the new image.

```shell
packer build -var 'project-id=MY_PROJECT_ID_HERE' terraria.pkr.hcl
```

## Terraria Server Options

Terraria options are passed for a headless server start in `config_file.txt`. The base options provided in the file are insecure and should be changed.

## References

https://www.linode.com/docs/guides/host-a-terraria-server-on-your-linode/
