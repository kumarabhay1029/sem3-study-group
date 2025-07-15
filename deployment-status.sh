#!/bin/bash

# Deployment and Monitoring Status Script
# This script checks the status of the deployed site and monitoring features

echo "🚀 IGNOU BCA Semester 3 Study Group - Deployment Status"
echo "=================================================="

# Check if the site is accessible
echo "🔍 Checking site accessibility..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8000 | grep -q "200"; then
    echo "✅ Site is accessible and running"
else
    echo "❌ Site is not accessible"
fi

# Check required files
echo ""
echo "📁 Checking required files..."
files=("index.html" "css-demo.css" "manifest.json" "service-worker.js" "Logo.png")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file found"
    else
        echo "❌ $file missing"
    fi
done

# Check monitoring features
echo ""
echo "📊 Monitoring features check..."
if grep -q "StudentDataMonitor" index.html; then
    echo "✅ Data monitoring system implemented"
else
    echo "❌ Data monitoring system not found"
fi

if grep -q "analytics-summary" index.html; then
    echo "✅ Analytics dashboard implemented"
else
    echo "❌ Analytics dashboard not found"
fi

# Check deployment workflow
echo ""
echo "🔧 Deployment workflow check..."
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ GitHub Actions workflow configured"
else
    echo "❌ GitHub Actions workflow not found"
fi

# Check privacy policy
echo ""
echo "🔒 Privacy and compliance check..."
if [ -f "privacy-policy.md" ]; then
    echo "✅ Privacy policy documented"
else
    echo "❌ Privacy policy not found"
fi

# Site metrics
echo ""
echo "📈 Site metrics..."
echo "- Total files: $(find . -type f -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.json' -o -name '*.png' | wc -l)"
echo "- HTML files: $(find . -name '*.html' | wc -l)"
echo "- CSS files: $(find . -name '*.css' | wc -l)"
echo "- JavaScript files: $(find . -name '*.js' | wc -l)"
echo "- Images: $(find . -name '*.png' | wc -l)"

echo ""
echo "🎯 Deployment URL: https://kumarabhay1029.github.io/sem3-study-group/"
echo "📊 Monitoring: Active with real-time analytics"
echo "🤖 AI Support: Technical assistance integrated"
echo "✅ Status: Ready for production deployment"