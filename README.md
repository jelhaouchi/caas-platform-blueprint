# CaaS Platform Blueprint

A production-ready Container-as-a-Service platform blueprint for migrating workloads from datacenter to Kubernetes.

Built from real-world experience running CaaS platforms at scale -- covering infrastructure provisioning, GitOps delivery, platform addons, and developer self-service.

## Target Platforms

| Platform | Status |
|----------|--------|
| **AWS (EKS)** | In progress |
| **OpenShift** | Planned |
| **Tanzu** | Planned |

## Architecture

```
┌─────────────────────────────────────────────────┐
│                  Developer Self-Service          │
│           (Namespace provisioning via PR)        │
├─────────────────────────────────────────────────┤
│                  GitOps (ArgoCD)                 │
│        App of Apps · ApplicationSets            │
├──────────┬──────────────────────┬───────────────┤
│ Platform Addons                                  │
│ cert-manager · external-dns · ingress-nginx     │
│ karpenter · monitoring · network policies       │
├─────────────────────────────────────────────────┤
│              Kubernetes Cluster                  │
│         EKS · OpenShift · Tanzu                 │
├─────────────────────────────────────────────────┤
│           Infrastructure (Terraform)             │
│       VPC · IAM · Node Groups · IRSA            │
└─────────────────────────────────────────────────┘
```

## Repository Structure

```
.
├── terraform/
│   └── aws/              # EKS cluster + networking + IAM
├── gitops/
│   ├── bootstrap/        # ArgoCD app-of-apps
│   ├── platform/         # Cluster addons (cert-manager, ingress, monitoring)
│   └── tenants/          # Namespace self-service per team
├── docs/
│   └── decisions/        # Architecture Decision Records
└── examples/             # Sample workload deployments
```

## Getting Started

> Coming soon -- starting with AWS (EKS) as the first target.

## Roadmap

- [x] Repository scaffold and architecture
- [ ] AWS: VPC + EKS Terraform module
- [ ] ArgoCD bootstrap with App of Apps
- [ ] Platform addons (cert-manager, external-dns, ingress-nginx, Karpenter)
- [ ] RBAC and network policies
- [ ] Tenant onboarding via GitOps PR
- [ ] OpenShift support
- [ ] Tanzu support
- [ ] Observability stack integration

## License

MIT
