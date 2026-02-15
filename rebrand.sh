#!/bin/bash
# Rebranding script for Nuvho AI OS
# Run this to transform Agent Zero into Nuvho AI OS

OLD_NAME="Agent Zero"
NEW_NAME="Nuvho AI OS"
OLD_NAME_LOWER="agent-zero"
NEW_NAME_LOWER="nuvho-ai-os"

echo "Rebranding $OLD_NAME to $NEW_NAME..."

# Replace in Python files
find . -name "*.py" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;
find . -name "*.py" -type f -exec sed -i "s/$OLD_NAME_LOWER/$NEW_NAME_LOWER/g" {} \;

# Replace in HTML files
find . -name "*.html" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;

# Replace in JavaScript files  
find . -name "*.js" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;

# Replace in CSS files
find . -name "*.css" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;

# Replace in markdown files
find . -name "*.md" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;

# Replace in shell scripts
find . -name "*.sh" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;

# Replace in docker files
find . -name "Dockerfile*" -type f -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} \;

# Replace favicon (would need custom assets)
# cp custom-favicon.svg webui/public/favicon.svg
# cp custom-icon.svg webui/public/icon.svg

echo "Done! Rebranded to $NEW_NAME"
