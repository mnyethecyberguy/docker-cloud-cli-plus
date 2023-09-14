# Cloud CLI Tools Plus

My Docker container for Cloud CLI Tools.

This Dockerfile builds on a Ubuntu image and installs CLI tools for interacting with AWS, Azure, and GCP, along with additional utilities:

- `awscliv2` - AWS CLIv2
- `azure-cli` - Microsoft Azure CLI
- `gcloud` - Google Cloud SDK
- `terraform` - Terraform (1.5.7 at this time)
- `powershell` - Powershell (7.3.6 at this time)
- `jq` - Used for parsing and working with JSON

The image also creates and runs under a non-root user.

## Using the Image

You can build the image yourself using this Dockerfile or pull from [Docker Hub](https://hub.docker.com/r/mnyethecyberguy/cloud-cli-plus)

```
docker pull mnyethecyberguy/cloud-cli-plus
```