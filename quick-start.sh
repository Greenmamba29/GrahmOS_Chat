#!/bin/bash
# Grahmos Quick Start Script
# This script helps you get Grahmos up and running quickly

set -e

echo "🚀 Grahmos Quick Start"
echo "======================"
echo ""

# Check if .env.local exists
if [ -f .env.local ]; then
    echo "✅ .env.local file found"
else
    echo "📝 Creating .env.local from example..."
    cp .env.local.example .env.local
    echo "⚠️  Please edit .env.local and add your API keys:"
    echo "   - OPENAI_API_KEY (required)"
    echo "   - TAVILY_API_KEY (required)"
    echo ""
    echo "Get your keys from:"
    echo "   OpenAI: https://platform.openai.com/api-keys"
    echo "   Tavily: https://app.tavily.com/home"
    echo ""
    read -p "Press Enter after adding your API keys to .env.local..."
fi

# Check for Bun
if command -v bun &> /dev/null; then
    echo "✅ Bun found"
    
    # Install dependencies
    echo "📦 Installing dependencies..."
    bun install
    
    # Validate models.json
    echo "🔍 Validating model configuration..."
    if python3 -m json.tool public/config/models.json > /dev/null 2>&1; then
        MODEL_COUNT=$(grep -c '"id":' public/config/models.json)
        echo "✅ Valid configuration with $MODEL_COUNT models"
    else
        echo "❌ Invalid JSON in models.json"
        exit 1
    fi
    
    echo ""
    echo "✅ Ready to start!"
    echo ""
    echo "Choose your preferred method:"
    echo ""
    echo "1. Development Server (recommended for local testing):"
    echo "   bun dev"
    echo ""
    echo "2. Production Build:"
    echo "   bun run build"
    echo "   bun start"
    echo ""
    echo "3. Deploy to Vercel:"
    echo "   vercel"
    echo ""
    
    read -p "Start development server now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🚀 Starting development server..."
        bun dev
    fi
    
else
    echo "❌ Bun not found"
    echo "Install Bun from: https://bun.sh"
    echo ""
    echo "Alternative: Use Docker"
    echo "  docker compose up -d"
    exit 1
fi
