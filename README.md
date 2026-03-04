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

