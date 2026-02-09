# Tenant Onboarding

Each tenant (team) gets a dedicated namespace provisioned via a GitOps pull request.

## How to onboard a new team

1. Create a new directory under `tenants/` with the team name
2. Add a `namespace.yaml` and `rbac.yaml`
3. Open a PR -- ArgoCD syncs automatically on merge

## Example

See `example-team/` for a reference tenant setup.
