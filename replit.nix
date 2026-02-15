# Replit deployment configuration
# "nix" is the Nix package manager, which lets you install system packages
{ pkgs }: {
  # Add system packages if needed
  packages = [
    # ffmpeg for audio processing if needed
    pkgs.ffmpeg
  ];

  # The command to run the web server
  run = "python3 run_ui.py";

  # The init command runs once at startup
  init = '';

  # Environment variables
  env = {
    WEB_UI_PORT = "8080";
    A0_BRAND_NAME = "Agent Zero";
    A0_INACTIVITY_TIMEOUT = "3600";
  };

  # Hidden secret environment variables (set in Replit secrets)
  # OPENAI_API_KEY
  # ANTHROPIC_API_KEY
  # etc.
}
