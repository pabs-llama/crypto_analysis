Automate Rebuild shell script

plug-and-play shell script that will:

Reinstall your dependencies into the correct Lambda-compatible format

Add your updated update_api_table.py

Create a fresh update_api_table.zip

Ready for upload to AWS

The script assumes:

project-root/
├── lambda_build/                 # Where everything gets built
│   ├── update_api_table.py       # Your script
│   └── ... (dependencies installed here)
├── update_api_table.py           # Your main script (source)


#!/bin/bash

# Exit if anything fails
set -e

# Step 1: Clean old build
echo "🧹 Cleaning old lambda_build/ folder..."
rm -rf lambda_build
mkdir lambda_build
cd lambda_build

# Step 2: Install dependencies for Lambda (Python 3.12)
echo "📦 Installing packages for AWS Lambda..."
pip install --platform manylinux2014_x86_64 \
  --target=. \
  --implementation cp \
  --python-version 3.12 \
  --only-binary=:all: \
  psycopg2-binary sqlalchemy

# Step 3: Copy your Lambda function file
echo "📄 Copying lambda source file..."
cp ../update_api_table.py .

# Step 4: Create the deployment zip
echo "📦 Creating update_api_table.zip..."
zip -r9 ../update_api_table.zip .

echo "✅ Done! Upload update_api_table.zip to AWS Lambda"

🔧 Make it Executable
In terminal, run:

bash
Copy
Edit
chmod +x build_lambda.sh

🚀 To Build and Deploy
Just run:

bash
Copy
Edit
./build_lambda.sh
Then upload the newly created update_api_table.zip to AWS Lambda.
