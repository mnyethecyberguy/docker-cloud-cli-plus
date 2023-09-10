# Cloud CLI Tools Plus

My Docker container for Cloud CLI Tools.

This Dockerfile builds on a Ubuntu image and installs a number of tools for interacting with AWS, Azure, and GCP:

- `awscliv2` - AWS CLIv2
- `azure-cli` - Microsoft Azure CLI
- `gcloud` - Google Cloud SDK
- `powershell` - Powershell (7.3.6 at this time)
- `jq` - Used for parsing and working with JSON

The image also creates and runs under a non-root user.

Latest build on my Docker Hub: [mnyethecyberguy/cloud-cli](https://hub.docker.com/r/mnyethecyberguy/cloud-cli-plus)