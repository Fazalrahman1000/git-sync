# Check if repository name is provided
if (-not $args[0]) {
    Write-Host "Please provide the repository name."
    exit 1
}

$REPO_NAME = $args[0]

Write-Host "Initializing git..."

git init

# Create .gitignore if it does not exist
if (-not (Test-Path ".gitignore")) {
    Write-Host "Creating .gitignore file..."

@"
__pycache__/
*.py[code]
*.sqlite3
env/
venv/
*.log
media/
staticfiles/
.vscode/
.idea/
*.env
"@ | Out-File -Encoding utf8 .gitignore
}
else {
    Write-Host ".gitignore file already exists."
}

git add .
git commit -m "Initial commit"

Write-Host "🌐 Creating GitHub repository..."

gh repo create $REPO_NAME --public --source=. --remote=origin --push

Write-Host "🎉 Done! Repository uploaded successfully."
