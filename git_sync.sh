#!/bin/bash



# Check if the repository name is write or not
if [ -z "$1"]; then
    echo "Please provide the repository name."
    exit 1
fi


REPO_NAME=$1

echo "Initializing git..."

git init
if [! -f .gitignore]; then
    echo "Creating .gitignore file..."
    cat <<EOF > .gitignore
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
EOF
else
    echo ".gitignore file already exists."
fi

git add .
git commit -m "Initial commit"
echo "🌐 Creating GitHub repository..."
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

echo "🎉 Done! Repository uploaded successfully."