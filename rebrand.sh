#!/bin/bash
# Rebranding script for Agent ZERO V 2.2
# Run this to transform Agent ZERO V 2.2 into Agent ZERO V 2.2

OLD_NAME="Agent ZERO V 2.2"
NEW_NAME="Agent ZERO V 2.2"
OLD_NAME_LOWER="agent-zero-x"
NEW_NAME_LOWER="nuvho-agent-zero-x"

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
