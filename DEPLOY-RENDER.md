# ZeroClaw - Deploy to Render (Free)

## Quick Deploy

1. Go to: https://render.com
2. Sign in → New → Web Service
3. Connect your GitHub: `blueshirtprogrammer/zeroclaw`
4. Settings:
   - **Name:** `zeroclaw`
   - **Region:** Oregon
   - **Environment:** Docker
   - **Docker Image:** `agent0ai/agent-zero:latest`
   - **Plan:** Free

5. Add Environment Variables:
   - `ZC_BRAND_NAME` = `ZeroClaw`
   - `ZC_INACTIVITY_TIMEOUT` = `3600`
   - `OPENAI_API_KEY` = your key (add in dashboard)

6. Click **Create Web Service**

---

## Or Use CLI

```bash
# Install Render CLI
brew install render-cli render/templates

# Or on Linux:
curl -s -o /usr/local/bin/render https://render.com/download.sh && chmod +x /usr/local/bin/render

# Login
render login

# Deploy (after connecting repo)
render blueprints apply
```

---

## After Deploy

- URL: `https://zeroclaw.onrender.com`
- First request takes ~30s (cold start on free tier)
