# 🚀 AWS ECS Fargate Deployment with GitHub Actions & Terraform

This project automates the deployment of a containerized application to **Amazon ECS Fargate** using **Terraform** for infrastructure and **GitHub Actions** for CI/CD.

---

## 📁 Project Structure

.
├── .github/
│   └── workflows/
│       ├── docker-build.yml         # GitHub Actions workflow: builds/pushes Docker image
│       └── terraform-deploy.yml     # GitHub Actions workflow: deploys infra with Terraform
├── terraform/                       # Terraform configuration: VPC, ECS, IAM, etc.
└── application/                     # Your Dockerized Python (or other) app source code


---

## 📦 Workflows Overview

### ✅ 1. Docker Image Build & Push

**Path:** `.github/workflows/docker-build.yml`  
**Trigger:** On push to `main` branch

**Purpose:**
- Builds Docker image from the `./application/` directory
- Tags it with `latest` and commit SHA
- Pushes the image to your ECR repository

> Use this workflow for application-only updates — no need to touch infra!

---

### ✅ 2. Terraform Infrastructure Deployment

**Path:** `.github/workflows/terraform-deploy.yml`  
**Trigger:** Manually via GitHub Actions UI (`workflow_dispatch`)

**Purpose:**
- Initializes and validates Terraform config under `./terraform/`
- Executes `terraform plan` and `apply`
- Provisions or updates:
  - ECS Cluster & Service
  - Fargate Task Definitions
  - VPC, Subnets, IAM roles, etc.

> Use this workflow for infrastructure updates or ECS rollout based on new image tags.

---

## 🚀 How to Use

### 🔁 Automatic: Build & Push Docker Image

1. Commit and push changes to the `./application/` directory
2. GitHub Actions will:
   - Build the image
   - Tag it with `latest` and commit SHA
   - Push to ECR

### 🧱 Manual: Deploy or Update Infrastructure

1. Go to your GitHub repo → **Actions** tab
2. Select **"Terraform Deploy"**
3. Click **“Run workflow”**
4. Choose branch (usually `main`) and deploy!

---

## 🔐 Required GitHub Secrets

| Secret Name              | Description                         |
|--------------------------|-------------------------------------|
| `AWS_ACCESS_KEY_ID`      | IAM user access key for deployment  |
| `AWS_SECRET_ACCESS_KEY`  | IAM user secret key                 |

> Set these in your GitHub repo:  
> **Settings → Secrets and variables → Actions → New repository secret**

---

## 🌐 AWS Infrastructure Managed by Terraform

- ECS Cluster & Fargate Service
- Task Definition with dynamic image tag
- VPC with public/private subnets
- Load Balancer (ALB)
- IAM roles and security groups

---

## 🛠️ Future Improvements (Optional)

- Add Terraform plan preview for Pull Requests
- Add tfsec, checkov, or TFLint for Terraform linting
- Add auto-deploy on image push with ECS force-redeploy
- Add staging/prod environment workflows

---

## 📬 Contact

Open an issue or fork the repo if you’d like to contribute or ask questions.

---
