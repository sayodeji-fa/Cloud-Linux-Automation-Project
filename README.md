Project Overview 
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


