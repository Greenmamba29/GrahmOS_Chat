# Deploy to Vercel - Step by Step Guide

## Option 1: GitHub + Vercel Dashboard (Recommended - No CLI needed!)

This is the easiest method and doesn't require Node.js or the Vercel CLI.

### Step 1: Push to GitHub

If you haven't already, push your code to GitHub:

```bash
# Initialize git if needed
git init

# Add all files
git add .

# Commit changes
git commit -m "Fixed model configuration for deployment"

# Add your GitHub remote (replace with your repo URL)
git remote add origin https://github.com/YOUR_USERNAME/grahmos.git

# Push to GitHub
git push -u origin main
```

### Step 2: Deploy from Vercel Dashboard

1. **Go to Vercel**: https://vercel.com
2. **Sign up/Login** with your GitHub account
3. **Click "Add New"** → "Project"
4. **Import your GitHub repository** (grahmos)
5. **Configure Project**:
   - Framework Preset: **Next.js** (auto-detected)
   - Build Command: `bun run build` or leave default
   - Output Directory: `.next` (default)
   
6. **Add Environment Variables** (CRITICAL!):
   Click "Environment Variables" and add:
   
   ```
   OPENAI_API_KEY = your_openai_key_here
   TAVILY_API_KEY = your_tavily_key_here
   ```
   
   **Get your API keys from:**
   - OpenAI: https://platform.openai.com/api-keys
   - Tavily: https://app.tavily.com/home

7. **Click "Deploy"** and wait 2-3 minutes

8. **Your app will be live!** Vercel will provide a URL like:
   `https://grahmos-xyz123.vercel.app`

### Step 3: Test Your Deployment

1. Visit your Vercel URL
2. Click the model selector dropdown
3. Verify 21 models are listed
4. Select "GPT-4o mini"
5. Try a test query

---

## Option 2: One-Click Deploy Button

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2FYOUR_USERNAME%2Fgrahmos&env=OPENAI_API_KEY,TAVILY_API_KEY&envDescription=API%20Keys%20required%20for%20Grahmos&envLink=https%3A%2F%2Fgithub.com%2FYOUR_USERNAME%2Fgrahmos%2Fblob%2Fmain%2FVERCEL_DEPLOY.md)

**Note:** Replace `YOUR_USERNAME` with your GitHub username in the URL above.

Steps:
1. Click the "Deploy with Vercel" button
2. Vercel will ask you to fork/clone the repo
3. Add your API keys when prompted
4. Click Deploy
5. Done!

---

## Option 3: Vercel CLI (Requires Node.js)

### Prerequisites
```bash
# Install Node.js first (if not installed)
# Visit: https://nodejs.org/

# Install Vercel CLI
npm i -g vercel
# or
bun add -g vercel
```

### Deploy
```bash
# From your project directory
vercel

# Follow the prompts:
# - Set up and deploy? Yes
# - Which scope? (your account)
# - Link to existing project? No
# - What's your project's name? grahmos
# - In which directory is your code located? ./
# - Want to override settings? No
```

### Add Environment Variables via CLI
```bash
# Add OpenAI API Key
vercel env add OPENAI_API_KEY

# Add Tavily API Key
vercel env add TAVILY_API_KEY

# Redeploy with new env vars
vercel --prod
```

---

## Post-Deployment Configuration

### Add Optional Features (Later)

Once your app is deployed, you can add optional features by adding more environment variables in the Vercel dashboard:

#### Authentication (Supabase)
```
NEXT_PUBLIC_SUPABASE_URL=your_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_key
```

#### Chat History (Upstash Redis)
```
ENABLE_SAVE_CHAT_HISTORY=true
UPSTASH_REDIS_REST_URL=your_url
UPSTASH_REDIS_REST_TOKEN=your_token
```

#### Additional AI Providers
```
ANTHROPIC_API_KEY=your_key
GOOGLE_GENERATIVE_AI_API_KEY=your_key
GROQ_API_KEY=your_key
DEEPSEEK_API_KEY=your_key
```

### How to Add Environment Variables in Vercel Dashboard

1. Go to your project dashboard on Vercel
2. Click "Settings" tab
3. Click "Environment Variables" in sidebar
4. Add variable name and value
5. Select environments (Production, Preview, Development)
6. Click "Save"
7. Redeploy your app (Deployments → Three dots → Redeploy)

---

## Troubleshooting

### Build Fails

**Issue**: Build command fails
**Solution**: 
- Check Vercel build logs
- Verify `bun` is set as the package manager in settings
- Or change to `npm run build` in settings

### Models Not Loading

**Issue**: Models don't appear in dropdown
**Solution**:
- Check browser console for errors
- Verify `public/config/models.json` is in your repo
- Check deployment logs for any errors

### "Model not found" Errors

**Issue**: API errors when using models
**Solution**:
- Verify environment variables are set correctly
- Check that API keys have no extra spaces
- Ensure keys are added to "Production" environment
- Try redeploying after adding keys

### Rate Limit Errors

**Issue**: Too many requests to OpenAI
**Solution**:
- Use `gpt-4o-mini` (cheaper, higher limits)
- Add Groq API key for free alternatives
- Check your OpenAI usage limits

---

## Cost Monitoring

After deploying, monitor your costs:

1. **OpenAI Dashboard**: https://platform.openai.com/usage
2. **Tavily Dashboard**: https://app.tavily.com/home
3. Set up billing alerts in each platform

**Pro Tip**: Start with `gpt-4o-mini` as your default model to keep costs low!

---

## Custom Domain (Optional)

To add a custom domain:

1. Go to your project in Vercel
2. Click "Settings" → "Domains"
3. Add your domain
4. Update DNS records as instructed
5. Wait for SSL certificate (automatic)

---

## Automatic Deployments

Once connected to GitHub:
- Every push to `main` branch → Production deployment
- Every PR → Preview deployment
- Automatic rollback on failure

---

## Support & Resources

- **Vercel Docs**: https://vercel.com/docs
- **Next.js Deployment**: https://nextjs.org/docs/deployment
- **Your Project Status**: https://vercel.com/dashboard

---

## Quick Reference

### Essential Environment Variables (Required)
```bash
OPENAI_API_KEY=sk-...
TAVILY_API_KEY=tvly-...
```

### Recommended Settings
- **Framework**: Next.js
- **Build Command**: `bun run build` or `npm run build`
- **Output Directory**: `.next`
- **Install Command**: `bun install` or `npm install`
- **Node Version**: 18.x or higher (in vercel.json if needed)

### Deployment Checklist
- [ ] Code pushed to GitHub
- [ ] Repository imported to Vercel
- [ ] Environment variables added
- [ ] First deployment successful
- [ ] App accessible via Vercel URL
- [ ] Model selector shows 21 models
- [ ] Test query works with GPT-4o mini

---

**Ready to deploy?** Start with Option 1 (GitHub + Dashboard) - it's the easiest! 🚀
