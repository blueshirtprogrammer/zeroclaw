#!/usr/bin/env python3
"""
Rebrand Agent ZERO V 2.2 to your own brand
Reads configuration from rebrand.toml
"""

import os
import re
import sys
import tomllib
from pathlib import Path

# Default config if no toml found
DEFAULT_CONFIG = {
    "brand": {
        "name": "Agent ZERO V 2.2",
        "short_name": "Nuvho",
        "tagline": "Your General Purpose AI Assistant"
    },
    "docker": {
        "image": "agent0ai/agent-zero-x",
        "org": "agent0ai"
    },
    "colors": {
        "primary": "#6366f1",
        "secondary": "#8b5cf6", 
        "accent": "#06b6d4",
        "dark": "#0f172a",
        "light": "#f8fafc"
    }
}

def load_config():
    """Load rebrand configuration from toml file"""
    config_path = Path(__file__).parent / "rebrand.toml"
    
    if config_path.exists():
        with open(config_path, "rb") as f:
            return tomllib.load(f)
    return DEFAULT_CONFIG

def rebrand(text, old_name="Agent ZERO V 2.2", old_lower="agent-zero-x"):
    """Replace brand names in text"""
    config = load_config()
    brand = config.get("brand", {})
    new_name = brand.get("name", "Agent ZERO V 2.2")
    new_short = brand.get("short_name", "Nuvho")
    new_lower = config.get("docker", {}).get("image", "agent-zero-x").split("/")[-1]
    
    # Multi-pass replacements
    result = text
    
    # Replace "Agent ZERO V 2.2" with new name
    result = result.replace("Agent ZERO V 2.2", new_name)
    
    # Replace "agent-zero-x" with new lowercase name
    result = result.replace("agent-zero-x", new_lower)
    
    # Replace "Nuvho" with new short name (being careful)
    result = re.sub(r'\bA0\b', new_short, result)
    
    # Replace NUVHO_ prefixed env vars
    result = re.sub(r'\bA0_', f'{new_short.upper()}_', result)
    
    return result

def process_file(filepath, dry_run=False):
    """Process a single file"""
    extensions = {'.py', '.html', '.js', '.css', '.md', '.sh', '.toml', '.txt', '.yaml', '.yml'}
    
    if filepath.suffix not in extensions:
        return 0
    
    # Skip certain files
    skip_patterns = ['.git', 'node_modules', '__pycache__', '.dockerignore']
    if any(p in str(filepath) for p in skip_patterns):
        return 0
    
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            original = f.read()
        
        new_content = rebrand(original)
        
        if original != new_content:
            if not dry_run:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
            return 1
    except Exception as e:
        print(f"  Error processing {filepath}: {e}")
    
    return 0

def main():
    dry_run = "--dry-run" in sys.argv or "-n" in sys.argv
    
    config = load_config()
    brand_name = config.get("brand", {}).get("name", "Agent ZERO V 2.2")
    
    print(f"🔄 Rebranding to: {brand_name}")
    if dry_run:
        print("  (dry run - no changes will be made)")
    
    root = Path(__file__).parent
    changed = 0
    
    for filepath in root.rglob('*'):
        if filepath.is_file():
            if process_file(filepath, dry_run):
                changed += 1
                print(f"  ✓ {filepath.relative_to(root)}")
    
    print(f"\n✨ Done! Changed {changed} files")
    
    if not dry_run:
        print("\n📝 Next steps:")
        print("  git add -A")
        print('  git commit -m "Rebranded to ' + brand_name + '"')
        print("  git push origin main")

if __name__ == "__main__":
    main()
