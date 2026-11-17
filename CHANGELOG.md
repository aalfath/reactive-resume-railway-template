# Changelog

Each entry is one version of this Railway template. Breaking changes are listed first.

## Unreleased (2026-11-17): README button

No change to the app or its configuration.

- README starts with the Deploy on Railway button for the published template `reactive-resume-1`.

## v6.1.1 (2026-11-17)

First release of the template.

- Reactive Resume v6.1.1, image `ghcr.io/reactive-resume/reactive-resume:v6.1.1@sha256:6390bd3dfa2e1acd41dceef3e4be6724f4564346bfc9d0cd54316552cca9545d`.
- Uploads (profile photos, generated files) on a Railway volume at `/app/data`; accounts and resumes in Railway PostgreSQL.
- `AUTH_SECRET` and `ENCRYPTION_SECRET` generated per deployment; `APP_URL` derived from the Railway domain.
