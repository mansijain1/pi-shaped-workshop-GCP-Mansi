# pi-shaped-workshop-GCP-Mansi

DAY-1

1. Why would a startup choose GCP over other providers for compute and storage?
  - Generous Free Tier and Startup Credits:
   GCP offers a free tier that includes: 1 f1-micro VM per month (in some regions), 5 GB of regional Cloud Storage.
   Lower barrier to entry, allowing experimentation and growth without upfront costs.

 - Best-in-Class Networking and Performance:
  Google’s backbone network is one of the fastest and most reliable globally, reducing latency and improving performance. Live migration of VMs means less downtime compared to AWS or Azure.

 - Simpler, Developer-Friendly Tools:
    GCP services like Cloud Run, App Engine, and Firebase are designed with developers in mind. Speed to market and ease of use fewer ops people needed to deploy and scale apps.

 - Competitive and Transparent Pricing:
   Predictable and often lower costs, especially as workloads scale.

- Strong Security Defaults:
  Identity and Access Management (IAM), encryption at rest and in transit, and Google-grade security as a baseline. Shared VPC and firewall rules simplify secure multi-tenant app design.

2. What are the advantages of using VPCs over default networking?

    - Security
    1. No open firewall rules by default
    2. You define access

   - Custom IP Ranges
    1. Set your own CIDR blocks and subnet sizes.
    2. Better control and planning
    
    - Scalability
    1. Use Shared VPC, Peering, VPNs
    2. Works well for multi-project setups

     - Compliance Ready
    1. Enable logging, flow logs, restricted access
    2. Meets audit and regulatory needs

3. How do GCP regions and zones impact performance and availability in global apps?
   - Performance
     1. Latency: Placing resources closer to users (in the right region) reduces latency.
     2. Data locality: Keeps data near the app, improving speed and compliance.
   - Cost vs. Redundancy
      More zones/regions = higher redundancy but also higher cost and complexity.
    - Availability
      1. Zones = High availability
         Deploying across multiple zones in a region ensures uptime during zone failures.
      2. Regions = Disaster recovery
         Using multiple regions helps survive regional outages.

DAY-2

1. Why is it dangerous to assign Editor role to all users in a production environment?

  Assigning the Editor role (roles/editor) to all users in a production environment is dangerous because it violates the principle of least privilege and exposes your environment to multiple risks.
  -  Accidental deletion or Misconfiguration
  - Auditability & Compliance Issues
  - Increases Attack Surface

2. How do service accounts differ from user accounts in managing backend services?

  - Purpose

      1. Service Account: Used by applications, VMs, and services (non-human).
  
      2. User Account: Used by people to interact with GCP (human identity).

  - Authentication

      1. Service Account: Authenticates via keys or workload identity (no login needed).
    
      2. User Account: Authenticates via Google login (email, password, 2FA).

  - Access Management

      1. Service Account: Scoped, automated, least privilege by design.
    
      2. User Account: Broader access, tied to a person — riskier for automation.


3. What practices help secure IAM in a multi-project GCP setup?
  - Use Organizations and Folders
  - Apply the Principle of Least Privilege
  - Use IAM Groups Instead of Individual Users
  - Use Service Accounts Correctly
  - Audit and Monitor IAM Policies
  - Use Conditions with IAM Policies

