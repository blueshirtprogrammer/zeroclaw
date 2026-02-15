# Cloud Deployment Guide

## Quick Deploy Options

### Option 1: Replit (Recommended for free tier)

1. **Create a Replit account** at https://replit.com
2. **Import the project**:
   - Click "Create Repl" → "Import from GitHub"
   - Or upload these files to a new Replit
3. **Install dependencies**:
   ```bash
   pip install -r requirementsMinimal.txt
   ```
4. **Set environment variables** in Replit Secrets:
   - `WEB_UI_PORT`: 8080
   - `OPENAI_API_KEY`: your key (if using OpenAI)
   - `ANTHROPIC_API_KEY`: your key (if using Claude)
5. **Run**: Click the "Run" button

**Pros:** Easy setup, can install system packages (ffmpeg), better free tier
**Cons:** Sleeps after inactivity on free tier

---

### Option 2: PythonAnywhere

1. **Create account** at https://pythonanywhere.com (free tier)
2. **Upload files** via the Files tab or Git
3. **Create web app**:
   - Go to Web tab → Add a new web app
   - Choose "Flask" and Python 3.10+
   - Edit the WSGI file to point to your app
4. **Install dependencies** in the Consoles tab:
   ```bash
   pip install --user -r requirementsMinimal.txt
   ```
5. **Set environment variables** in the Web tab

**Pros:** Reliable, stays awake
**Cons:** Can't install system packages, no browser automation

---

## Limitations on Free Tiers

The following features are disabled in `requirementsMinimal.txt`:
- ❌ Browser automation (Playwright)
- ❌ Voice synthesis (Kokoro TTS)
- ❌ Voice transcription (Whisper)
- ❌ PDF OCR (Tesseract)

These require too much memory for free cloud tiers.

---

## Required Environment Variables

```
OPENAI_API_KEY=sk-...          # For OpenAI models
ANTHROPIC_API_KEY=sk-ant-...   # For Claude models
GROQ_API_KEY=...               # For Groq models
AZURE_OPENAI_KEY=...           # For Azure OpenAI
```

---

## To Enable Full Features

For full functionality (browser, voice, etc.), you'll need a paid tier or self-host on:
- A VPS (Hetzner, DigitalOcean, Linode)
- A dedicated server
- Your own machine with tunnel (cloudflared)
