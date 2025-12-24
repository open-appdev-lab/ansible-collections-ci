curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash


2. The Setup (Handling Secrets)
Your pipeline uses STAGING_API_KEY. You don't want to hardcode this. Create a file named .secrets in your project root (add this to .gitignore so you don't commit it!).

File: .secrets

Plaintext

STAGING_API_KEY=my-local-test-key-123
PROD_API_KEY=super-secret-do-not-use-real-prod-key



List available jobs
To see what act detects in your workflow files:

Bash

act -l
You should see build, test, deploy-staging, etc., listed.

Run the "Build" job only
Instead of running the whole pipeline, just test your compilation logic:

Bash

act -j build


Run the entire flow for a "Push" event
This simulates pushing code to the repository.

Bash

act push --secret-file .secrets


4. Advanced: Testing Your Complex Pipeline
Since you are using Artifacts and Reusable Workflows, there are two specific quirks you need to know when using act.

A. Handling Artifacts (Upload/Download)
By default, act does not persist artifacts between jobs effectively unless you create a folder for them.

Bash

# Creates a folder ./tmp-artifacts on your laptop to store the dist files
mkdir -p /tmp/artifacts

# Tells act to store artifacts there
act push --artifact-server-path /tmp/artifacts

B. Simulating the Event Context
Your deploy-prod job has an if condition: github.ref == 'refs/heads/main'. If you just run act, it usually defaults to the branch you are currently on. To force act to pretend it is on the main branch so it runs your deployment jobs:

Bash

act push --defaultbranch main --secret-file .secrets

5. Troubleshooting Common "Act" Issues
Problem: "Command not found" inside the container.

Cause: The default Docker image act uses is a "medium" size image. It might lack tools present on the real GitHub ubuntu-latest (like specific versions of curl or jq).

Fix: Force act to use a massive, full-featured image (Warning: It's ~3GB+ download).

Bash

act -P ubuntu-latest=catthehacker/ubuntu:full-latest