# Reactive Resume for Railway.
# Official image, pinned by version and digest. Bump both together and add a CHANGELOG.md entry.
FROM ghcr.io/reactive-resume/reactive-resume:v6.1.1@sha256:6390bd3dfa2e1acd41dceef3e4be6724f4564346bfc9d0cd54316552cca9545d

# Railway mounts volumes owned by root. The wrapper gives the upload folder to the `node` user
# (UID 1000) and then hands over to the image's own entrypoint, which drops root.
COPY --chmod=755 railway-entrypoint.sh /usr/local/bin/railway-entrypoint.sh

ENV NODE_ENV=production \
    PORT=3000 \
    LOCAL_STORAGE_PATH=/app/data

EXPOSE 3000
ENTRYPOINT ["railway-entrypoint.sh"]
CMD ["node", "apps/server/dist/index.mjs"]
