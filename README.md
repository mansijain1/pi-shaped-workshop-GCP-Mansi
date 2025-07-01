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

  -Purpose

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

DAY-3

  1. What is the difference between declartive iac and imperative scripting ?
    - Declarative Infrastructure as Code (IaC)
      Describes the desired end state of the infrastructure (e.g., “a VM should exist”).

      Does not specify how to achieve that state — the tool figures it out.

      Tools like Terraform, CloudFormation, or Pulumi (declarative mode) follow this model.

      Idempotent by design — reapplying the same code won’t cause changes if the state is already correct.

      Maintains a state file to track the current state of the infrastructure.

      Easier to audit and review, since the code clearly shows intended outcomes.

      Great for team collaboration, because it avoids hidden logic and is more predictable.


    - Imperative Scripting
      Specifies exact steps to create or modify infrastructure (e.g., “run this command to create a VM”).

      The script controls how things are done, step by step.

      Examples include using Bash, Python, or tools like gcloud, awscli, or manual API calls.

      No built-in state tracking — the script has no memory of what's already deployed.

      Can be harder to make idempotent — requires manual checks to avoid duplication.

      More prone to human error if steps are missed or executed out of order.

  2. Why is terraform state important and how can it become a security risk?
      IMPORTANCE
        - Tracks current infrastructure and resource metadata.
        - Allows Terraform to detect what’s changed since the last apply.
        - Enables efficient, incremental updates to infrastructure.
        -  Maintains resource dependencies and relationships.
        - Required to generate accurate plans and safely destroy resources.
        - Supports remote collaboration by sharing state across teams.

      RISK
        - May contain sensitive data like passwords, keys, and connection strings.
        - Local state files are unencrypted by default.
        - Remote state storage can be exposed if access controls are weak.
        - State files accidentally committed to version control can leak secrets.
        - Attackers with access can gather detailed infrastructure info for reconnaissance.

  3. In what scenario should a team use Terraform over manual provisioning?
        - For reliable, repeatable, and scalable infrastructure management
        - To automate deployments and reduce human errors
        - To enable collaboration across teams and environments
        - To track infrastructure changes with version control
        - To maintain clear audit trails of all modifications
        - For seamless integration with CI/CD pipelines
        - To manage complex or multi-cloud environments confidently and efficiently

DAY-4

  1. What are the advantages of using Terraform modules in a microservice-oriented product team? 
    - Reusability Across Services
    - Consistency & Standardization
    - Faster Onboarding
    - Version Control & Change Management
    - Scalability & Collaboration

  2. How do workspaces simplify multi-environment deployments?
    - Isolated State Files: Each workspace (dev, staging, prod) has its own separate state.

    - Single Codebase: Reuse the same Terraform code for all environments.

    - Safe Environment Switching: Easily switch with terraform workspace select <env>.

    - Avoid Mistakes: Prevents deploying dev changes to prod by accident.

    - Clean CI/CD Pipelines: Use the same pipeline logic with different workspaces and .tfvars.

    - Automatic State Separation in Remote Backend: Remote backends (like GCS) store state under workspace-specific paths.

  3. Why is storing state remotely better than keeping it local, especially in a team setup?
    - Shared Access

      1. Team members can access the same state file across machines.

      2. Everyone works with the latest infrastructure state.

    - State Locking

      1. Prevents concurrent changes (e.g., via DynamoDB or GCS locking).

      2. Avoids race conditions and broken deployments.

    - Disaster Recovery

      1. Remote state is backed up and versioned automatically.

      2. Easy to recover from accidental changes or corruption.

    - Automation-Friendly

      1. CI/CD pipelines need centralized state to apply changes reliably.

      2. Security & Auditing

    - Remote backends support access control, encryption, and audit logs.

      1. Avoids Local Pitfalls

      2. Local state can get lost, overwritten, or misaligned across machines.