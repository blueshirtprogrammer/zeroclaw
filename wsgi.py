"""
PythonAnywhere WSGI configuration for Agent ZERO V 2.2
"""
import os
import sys

# Add your project directory to the path
project_home = '/home/YOUR_USERNAME/agent-zero-x'
if project_home not in sys.path:
    sys.path.insert(0, project_home)

# Set environment variables
os.environ['WEB_UI_PORT'] = '80'
os.environ['NUVHO_INACTIVITY_TIMEOUT'] = '3600'

# Run the Flask app
from run_ui import app as application
