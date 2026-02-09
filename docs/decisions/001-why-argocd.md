# ADR-001: ArgoCD as GitOps Engine

## Status

Accepted

## Context

We need a GitOps operator to manage cluster addons and tenant workloads declaratively across multiple CaaS platforms (EKS, OpenShift, Tanzu).

Options considered:
- **ArgoCD** -- Mature, App of Apps pattern, ApplicationSets, multi-cluster support
- **Flux** -- Lightweight, native Kubernetes, good Terraform integration
- **Rancher Fleet** -- Built for multi-cluster, tighter Rancher integration

## Decision

ArgoCD, using the App of Apps pattern for bootstrapping and ApplicationSets for tenant onboarding.

## Rationale

- App of Apps provides a clean hierarchy: bootstrap → platform addons → tenant workloads
- ApplicationSets enable template-driven tenant onboarding without manual Application manifests
- Strong multi-cluster support for managing EKS, OpenShift, and Tanzu from a single control plane
- Broad community adoption and ecosystem (notifications, RBAC, SSO)

## Consequences

- ArgoCD itself needs to be bootstrapped (chicken-and-egg solved via Terraform Helm provider)
- Operators need to learn ArgoCD-specific sync policies and health checks
