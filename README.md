# pi-shaped-workshop-GCP-Mansi

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


