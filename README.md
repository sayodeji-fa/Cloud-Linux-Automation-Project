# Project Overview 
This project is a fully automated Linux cloud‑monitoring system built on an Ubuntu Server VM. It uses scheduled cron jobs to collect system metrics, generate health reports, and upload logs to an AWS S3 bucket for centralized storage. An S3 lifecycle rule automatically deletes old logs to optimize storage costs. All scripts, automation logic, and architecture documentation are version‑controlled through GitHub.
This project demonstrates practical skills in:
Linux system administration
Bash scripting
Cron automation
AWS S3 storage and lifecycle management
Cloud architecture design
Git and GitHub version control

# Cloud-Linux-Automation-Project
Cloud‑Hosted Linux Automation Project (SysAdmin + Cloud Ops)
A Linux‑based automation environment deployed on AWS EC2 that runs scheduled analytics workloads, stores outputs in S3, and is monitored using CloudWatch. The system is secured with SSH key authentication, firewall rules, and IAM least‑privilege access. A local VMware Fusion VM is used for testing and development.

Architecture Overview
This project combines systems administration, automation, and cloud operations. The workflow is:
Develop and test scripts locally on a VMware Fusion Ubuntu VM
Deploy a production Linux server on AWS EC2
Automate analytics execution using cron
Store datasets and outputs in S3
Monitor system performance and logs with CloudWatch
Apply system hardening and secure access controls

## Architecture Diagram 
This diagram shows the automation flow between the Ubuntu VM, cron jobs, AWS S3, lifecycle rules, and Github intergration.
![Cloud Architecture](https://github.com/sayodeji-fa/Cloud-Linux-Automation-Project/blob/main/assets/Cloud%20Architech%20Diagram-dark.drawio.png?raw=true)


# 1. system-info.sh -- Daily System Snapshot
This script collects a general overview of the system once per day and stores the results in your AWS S3 bucket.

Purpose
-Capture daily system state
-Provide historical logs for auditing and troubleshooting
-Automate routine system reporting

Data Collected
-System uptime
-Hostname and OS information
-CPU details
-Memory usage
-Disk usage
-Active network interfaces

Automation
-Runs daily at 12:00 PM via cron
-Log file is timestamped
-Automatically uploaded to S3

Cron Entry
0 12 * * * /home/ubuntu/Cloud-Linux-Automation-Project/server/system-info.sh

# 2. health-check.sh -- Hourly Health Monitoring 
This script performs deeps system monitoring and uploads detailed health reports to S3 every hour.

Purpose
-Provide continuous system health visibility
-Track performance trends
-Detect abnormal CPU, memory, or disk usage
-Maintain centralized cloud logs

Data Collected
-CPU load average
-Memory usage (free -h)
-Disk usage (df -h)
-Top 5 CPU‑consuming processes
-Timestamped health report

Automation
-Runs every hour via cron
-Generates a uniquely timestamped log
-Automatically uploads to S3

Cron Entry
0 * * * * /home/ubuntu/Cloud-Linux-Automation-Project/server/health-check.sh

# 3. AWS S3 Lifecycle Rule
Purpose
Manage storage costs and keep logs organized automatically.

Configuration
-Applies to all objects in the bucket
-Deletes logs older than 30 days
-Ensures long‑term cost efficiency

Benefits
-No manual cleanup required
-Cloud‑native cost optimization
-Keeps bucket clean and manageable

## 4. Repository Structure 
```
Cloud-Linux-Automation-Project/
│
├── server/
│   ├── system-info.sh
│   ├── health-check.sh
│
├── assets/
│   ├── Cloud Architech Diagram-dark.drawio.png
│
├── README.md
└── (additional files)
```

## How It Works
This project automates Linux system monitoring and cloud log management using cron jobs, Bash scripts, and AWS S3. The workflow operates as follows:

1. Cron Schedules the Automation
```
-system-info.sh runs daily at 12:00 PM
-health-check.sh runs every hour
-Cron ensures the scripts execute reliably without manual intervention
```
2. Scripts Collect System Metrics
```   
-Each script gathers specific system information:
-CPU load and usage
-Memory utilization
-Disk space usage
-System uptime
-Network information
-Top resource‑consuming processes
```
Each run generates a timestamped log file.

3. Logs Are Uploaded to AWS S3
 ```  
-Both scripts automatically upload their logs to an S3 bucket using the AWS CLI:
-Centralized cloud storage
-Accessible from anywhere
-Organized by timestamp
```
4. S3 Lifecycle Rule Manages Storage
 ```  
-A lifecycle rule automatically:
-Deletes logs older than 30 days
-Reduces storage costs
-Keeps the bucket clean and manageable
```
5. GitHub Stores All Code and Documentation
  ``` 
-Scripts are version‑controlled
-Architecture diagram included
-README provides full project documentation
```
## Technologies Used
This project integrates multiple technologies across Linux, cloud services, automation, and version control:

Operating System
```
Ubuntu Server (Linux environment for scripting and automation)
```
Scripting & Automation
```
Bash scripting for system monitoring and log generation
Cron for scheduled task automation (hourly and daily jobs)
```
Cloud Services
```
AWS S3 for centralized log storage
S3 Lifecycle Rules for automated log retention and cleanup
AWS CLI for programmatic uploads from the VM
```
Version Control & Documentation
```
Git for tracking changes
GitHub for hosting code, diagrams, and documentation
Draw.io  for architecture diagram design
```

## Setup Instructions 
1. Clone the repository
   ```
   git clone https://github.com/sayodeji-fa/Cloud-Linux-Automation-Project.git
   cd Cloud-Linux-Automation-Project
   ```
2. Install AWS CLI
   ```
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ```
3. Configure AWS Credentials
   ```
   aws configure
   ```
   Provide:
   - AWS Access Key
   - AWS Secret Key
   (Both keys are only displayed ONCE! , make sure to copy/write it down somewhere secure)
   - Region (ex. us-east-1)
   - Output format (json)
  
 4. Make the scripts Executable
    ```
    chmod +x server/system-info.sh
    chmod +x server/health-check.sh
    ```
5. Set Up Cron Jobs (what the scripts are doing)

Open the cron editor:
```
crontab -e
```
Add the following at the end of the code:
```
# Daily system snapshot at 12 PM
0 12 * * * /home/ubuntu/Cloud-Linux-Automation-Project/server/system-info.sh

# Hourly health check
0 * * * * /home/ubuntu/Cloud-Linux-Automation-Project/server/health-check.sh
```
6. Verify Logs in S3 (AWS)
After the first con run, check your AWS S3 bucket to see if the updated log files were uploaded

# Future Enhancements 
This project can be expanded with additional cloud and automation features:

Cloud Monitoring & Alerts
```
Integrate AWS CloudWatch for real‑time metrics
Add SNS notifications for high CPU, low disk space, or failed scripts
```
Server Hardening
```
Add automated security patching
Implement log rotation and compression
```
Infrastructure as Code
```
Use Terraform to deploy the S3 bucket and lifecycle rules
Automate VM provisioning with cloud-init or Ansible
```
Dashboarding
```
Build a Grafana dashboard using CloudWatch metrics
Visualize trends from the hourly/daily logs
```
CI/CD Integration
```
Add GitHub Actions to lint scripts and validate changes
Automate deployment of updated scripts to the VM
```
