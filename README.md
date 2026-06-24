# Lavalink2 — Railway-ready Lavalink v4 host

A [Lavalink v4](https://lavalink.dev) audio node configured for one-click deploy on **Railway**, with the **LavaSrc** plugin (Spotify) and the **youtube-source** plugin (YouTube) pre-configured.

## What's included

| File | Purpose |
|------|---------|
| `Dockerfile` | Builds on the official `ghcr.io/lavalink-devs/lavalink:4` image and copies the config in |
| `application.yml` | Full Lavalink config with LavaSrc (Spotify) + youtube-source (YouTube) plugins |
| `railway.json` | Tells Railway to build from the Dockerfile |

**Plugin versions:** LavaSrc `4.8.1`, youtube-plugin `1.16.0`.

## Deploy to Railway

1. Go to [railway.app](https://railway.app) → **New Project** → **Deploy from GitHub repo** → pick this repo.
2. Railway auto-detects the `Dockerfile`. Let it build.
3. Add the environment variables below (Project → **Variables**).
4. Under **Settings → Networking**, click **Generate Domain** so the node is reachable.

### Required environment variables

| Variable | Value | Notes |
|----------|-------|-------|
| `SERVER_PORT` | `${{PORT}}` | Maps Railway's dynamic port to Lavalink. **Required.** |
| `LAVALINK_PASSWORD` | *a strong password* | Your bot uses this to connect. Don't leave it as `youshallnotpass`. |
| `SPOTIFY_CLIENT_ID` | *from Spotify* | See below |
| `SPOTIFY_CLIENT_SECRET` | *from Spotify* | See below |

> Type `${{PORT}}` for `SERVER_PORT` exactly like that — Railway expands it to the real port.

### Getting Spotify credentials

1. Open the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard).
2. **Create app** (any name, redirect URI `http://localhost`).
3. Copy the **Client ID** and **Client Secret** into the Railway variables above.

## Connecting your bot

Once deployed, your Discord music bot connects with:

- **Host:** your Railway domain (without `https://`)
- **Port:** `443`
- **Secure (SSL/TLS):** `true`
- **Password:** the `LAVALINK_PASSWORD` you set

## Supported sources

YouTube, Spotify (resolved via YouTube), SoundCloud, Bandcamp, Twitch, Vimeo, and direct HTTP streams.

> The built-in YouTube source is intentionally disabled (`lavalink.server.sources.youtube: false`) because the dedicated `youtube-source` plugin replaces it — this is the recommended setup for Lavalink v4.
