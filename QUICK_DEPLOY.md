# Quick Deployment Guide - Modalis (Fixed Models)

## Changes Made

### Fixed Model Configuration
The following issues have been resolved:

1. **Removed Invalid OpenAI Models**:
   - ❌ `gpt-4.1`, `gpt-4.1-mini`, `gpt-4.1-nano`, `o3-mini` (these don't exist)
   - ✅ Kept valid models: `gpt-4o`, `gpt-4o-mini`, `gpt-4-turbo`, `gpt-3.5-turbo`

2. **Updated Google Models**:
   - ❌ Removed experimental models with specific dates
   - ✅ Added stable models: `gemini-2.0-flash-exp`, `gemini-1.5-pro`, `gemini-1.5-flash`

3. **Updated Other Provider Models**:
   - Groq: Added `llama-3.3-70b-versatile` and `llama-3.1-70b-versatile`
   - Fireworks: Updated to stable Llama models
   - DeepSeek: Kept R1 and V3 models (working)

4. **Removed Placeholder Entries**:
   - Removed `<AZURE_DEPLOYMENT_NAME>`, `<OLLAMA_MODEL_ID>`, `<OPENAI_COMPATIBLE_MODEL>`
   - Removed experimental `grok-3-beta`

## Quick Deploy Options

### Option 1: Vercel (Fastest - 5 minutes)

1. **Set Environment Variables** (minimum required):
   ```bash
   OPENAI_API_KEY=your_openai_key_here
   TAVILY_API_KEY=your_tavily_key_here
   ```

2. **Deploy to Vercel**:
   ```bash
   # Install Vercel CLI if not already installed
   bun add -g vercel
   
   # Deploy
   vercel
   ```

   Or use the one-click deploy button:
   [![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2FOwusu1946%2Fmodalis)

### Option 2: Docker (Quick Local - 2 minutes)

1. **Create `.env.local`**:
   ```bash
   cp .env.local.example .env.local
   ```

2. **Edit `.env.local`** with your API keys:
   ```bash
   OPENAI_API_KEY=your_key_here
   TAVILY_API_KEY=your_key_here
   ```

3. **Run with Docker**:
   ```bash
   docker compose up -d
   ```

   Visit: http://localhost:3000

### Option 3: Local Development (3 minutes)

1. **Install Dependencies**:
   ```bash
   bun install
   ```

2. **Setup Environment**:
   ```bash
   cp .env.local.example .env.local
   # Edit .env.local with your API keys
   ```

3. **Run Development Server**:
   ```bash
   bun dev
   ```

   Visit: http://localhost:3000

## Minimal Configuration (Just 2 Required Keys!)

For a working deployment, you only need:

```bash
OPENAI_API_KEY=sk-...        # Get from https://platform.openai.com/api-keys
TAVILY_API_KEY=tvly-...      # Get from https://app.tavily.com/home
```

All other features are optional!

## Optional Enhancements

### Add Authentication (Supabase)
```bash
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key
```

### Add Chat History (Upstash Redis)
```bash
ENABLE_SAVE_CHAT_HISTORY=true
UPSTASH_REDIS_REST_URL=your_redis_url
UPSTASH_REDIS_REST_TOKEN=your_redis_token
```

### Add More AI Models (Optional)
```bash
# Anthropic (Claude)
ANTHROPIC_API_KEY=your_key

# Google Gemini (Free tier available!)
GOOGLE_GENERATIVE_AI_API_KEY=your_key

# Groq (Fast & Free tier)
GROQ_API_KEY=your_key

# DeepSeek (Cost-effective)
DEEPSEEK_API_KEY=your_key
```

## Production Deployment Checklist

- [ ] Set `OPENAI_API_KEY` in production environment
- [ ] Set `TAVILY_API_KEY` in production environment
- [ ] (Optional) Configure Supabase for authentication
- [ ] (Optional) Configure Upstash Redis for chat history
- [ ] (Optional) Add additional AI provider keys
- [ ] Test model selection in UI after deployment
- [ ] Verify API key access for selected models

## Troubleshooting

### "Model not found" errors
- Check that you have the corresponding API key set for the provider
- Use the BYOK (Bring Your Own Key) feature in the UI to add keys

### Models not loading
- The app will fallback to `default-models.json` if `public/config/models.json` fails
- Check browser console for errors
- Verify JSON syntax in models.json files

### Build failures
- Run `bun install` to ensure all dependencies are installed
- Check that Node.js/Bun version meets requirements (Bun 1.2.12+)

## Testing Your Deployment

1. Open your deployed app
2. Click on the model selector (top of page)
3. Verify models are listed correctly
4. Try a simple query with GPT-4o mini (most cost-effective)
5. Check that search results appear

## Cost Optimization Tips

1. **Default to cheaper models**: Set `gpt-4o-mini` as default (90% cheaper than GPT-4)
2. **Use Groq for free/fast inference**: Groq offers free tier with fast speeds
3. **Google Gemini**: Free tier available for Gemini models
4. **DeepSeek**: Very cost-effective alternative ($0.14/1M tokens)

## Support

- Documentation: See `docs/CONFIGURATION.md` for detailed setup
- Issues: Check GitHub issues for common problems
- Original repo: https://github.com/Owusu1946/modalis
