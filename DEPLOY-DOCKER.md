# Cloud Deployment Guide - Docker Image

## Quick Deploy with Docker

### Option 1: Render (Free)

1. **Create account** at https://render.com (free, no credit card)
2. **Connect GitHub** - authorize access to your repos
3. **Create new service**:
   - Click "New" → "Web Service"
   - Connect your forked repository
   - Configure:
     - Build Command: (leave empty - using pre-built image)
     - Start Command: (leave empty)
   - Under "Advanced":
     - Add environment variables:
       - `OPENAI_API_KEY`: your key
       - `ANTHROPIC_API_KEY`: your key
     - Or use Render's secret management
4. **Deploy from image**:
   - Instead of building from repo, use:
     ```
     docker.io/agent0ai/agent-zero:latest
     ```
   - Or build your own and push to Docker Hub/GHCR

**Render Free Tier:**
- 750 hours/month
- Sleeps after 15min inactivity (spins up in ~30s)
- No custom domain without paid tier

---

### Option 2: Okteto (Free)

1. **Create account** at https://okteto.com
2. **Install Okteto CLI**: `curl https://get.okteto.com | sh`
3. **Deploy**:
   ```bash
   okteto stack deploy --deploy-image agent0ai/agent-zero
   ```

---

### Option 3: Deta Space (Free - Personal Cloud)

1. **Create account** at https://deta.space
2. Use the "Space Builder" to run containers
3. More for building apps than hosting

---

## Building Your Own Image

```bash
# Clone and rebrand
git clone https://github.com/agent0ai/agent-zero.git
cd agent-zero
./rebrand.sh  # Changes "Agent Zero" to "Nuvho AI OS"

# Build and push
docker build -f Dockerfile.nuvho -t YOUR_USERNAME/ai-os .
docker push YOUR_USERNAME/ai-os

# Deploy to Render/Docker Hub/GHCR
```

---

## Environment Variables

```
OPENAI_API_KEY=sk-...          # Required for OpenAI models
ANTHROPIC_API_KEY=sk-ant-...   # For Claude models
GROQ_API_KEY=...                # For Groq models
AZURE_OPENAI_KEY=...           # For Azure OpenAI

# Optional
A0_BRAND_NAME=Nuvho AI OS      # Your brand
A0_INACTIVITY_TIMEOUT=3600     # Auto-pause after 1 hour
WEB_UI_PORT=80                  # Port (default 80)
```

---

## Accessing Your Deployment

- Render gives you a `.onrender.com` URL
- Example: `nuvho-ai-os.onrender.com`

---

## Troubleshooting

**Container keeps restarting:**
- Check logs in Render dashboard
- Missing API keys
- Memory limits exceeded

**Slow cold start:**
- Free tier containers spin down
- Normal on Render free tier

**Want a custom domain?**
- Render: Need paid tier ($7/mo)
- Or use Cloudflare tunnel from home
