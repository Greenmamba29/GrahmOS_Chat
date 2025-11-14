# Create Your Own GitHub Repository

Since you're working with a fork, let's set up your own repository for deployment.

## Step 1: Create New Repository on GitHub

1. Go to: https://github.com/new
2. Repository name: `grahmos` (or your preferred name)
3. Description: "AI-powered search engine with fixed models"
4. Choose **Public** or **Private**
5. **DO NOT** initialize with README (we already have files)
6. Click "Create repository"

## Step 2: Update Git Remote

Replace `YOUR_USERNAME` with your actual GitHub username:

```bash
# Remove old remote
git remote remove origin

# Add your new remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/grahmos.git

# Push to your new repository
git push -u origin main
```

If you get authentication errors, you may need to use a Personal Access Token:

```bash
# Generate token at: https://github.com/settings/tokens
# Use the token as your password when prompted

# Or use SSH instead:
git remote set-url origin git@github.com:YOUR_USERNAME/grahmos.git
git push -u origin main
```

## Step 3: Deploy to Vercel

Once pushed to your GitHub:

1. Go to: https://vercel.com
2. Click "Add New" → "Project"
3. Import your GitHub repository
4. Add environment variables:
   - `OPENAI_API_KEY`
   - `TAVILY_API_KEY`
5. Click "Deploy"

Done! Your app will be live in 2-3 minutes.

---

## Alternative: Use GitHub CLI

If you have GitHub CLI installed:

```bash
# Create repo (will prompt for authentication)
gh repo create grahmos --public --source=. --remote=origin

# Push code
git push -u origin main
```

---

## Quick Reference

### Your Commit is Ready
All your changes are committed locally:
- ✅ Fixed model configuration
- ✅ 21 valid models
- ✅ Documentation added
- ✅ Ready to push

### What's Next
1. Create GitHub repository (see Step 1 above)
2. Push your code (see Step 2 above)
3. Deploy to Vercel (see Step 3 above)

Or skip GitHub entirely and use **Option 1** from the main instructions!
