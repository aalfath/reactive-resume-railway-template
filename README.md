[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/reactive-resume-1?utm_medium=integration&utm_source=button&utm_campaign=reactive-resume)

# Reactive Resume on Railway

This repo builds the [Reactive Resume](https://github.com/reactive-resume/reactive-resume) Railway template: a free, open-source resume builder you host yourself.

## What it deploys

| Service | Source | Data |
|---|---|---|
| `Reactive Resume` | this repo's `Dockerfile`: the official image `ghcr.io/reactive-resume/reactive-resume:v6.1.1`, pinned by digest, plus a small entrypoint | volume at `/app/data` (uploads) |
| `Postgres` | Railway PostgreSQL | volume (accounts, resumes, cover letters) |

Health check: `GET /api/health` (checks the database and the upload folder).

## Variables

| Variable | Default | Notes |
|---|---|---|
| `APP_URL` | `https://${{RAILWAY_PUBLIC_DOMAIN}}` | Public address. Change it if you add a custom domain. |
| `DATABASE_URL` | `${{Postgres.DATABASE_URL}}` | Private connection to Postgres. |
| `AUTH_SECRET` | generated, 64 hex characters | Signs sessions. Keep it for the life of the instance. |
| `ENCRYPTION_SECRET` | generated, 64 hex characters | Encrypts saved AI and web-access keys. Keep it. |
| `PORT` | `3000` | Port the server listens on. |

Nothing to fill in at deploy time. Optional features (SMTP email, OAuth sign-in, a shared AI provider, `FLAG_DISABLE_SIGNUPS`) are plain variables you add later; see the [environment variable reference](https://docs.rxresu.me/self-hosting/environment-variables).

After you create your own account, set `FLAG_DISABLE_SIGNUPS=true` on the `Reactive Resume` service if nobody else should sign up.

## Updates

Railway tells everyone who deployed this template when a change is merged to `main` here, and you choose when to apply it. Each change is listed in [CHANGELOG.md](CHANGELOG.md), breaking changes first. Major upgrades of Reactive Resume or PostgreSQL that need a manual data migration are called out there.

## License

The wrapper files in this repo are MIT. Reactive Resume itself is MIT, by Amruth Pillai and contributors.
