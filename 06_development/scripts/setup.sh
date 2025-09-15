#!/bin/bash

# Agentic Learning Development Setup Script
# Sets up the development environment for the project

set -e  # Exit on error

echo "🚀 Setting up Agentic Learning Development Environment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check prerequisites
echo "Checking prerequisites..."

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    print_status "Node.js installed: $NODE_VERSION"
else
    print_error "Node.js not found. Please install Node.js 18+"
    exit 1
fi

# Check Python
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    print_status "Python installed: $PYTHON_VERSION"
else
    print_warning "Python 3 not found. Python implementations won't work"
fi

# Check Docker (optional)
if command -v docker &> /dev/null; then
    print_status "Docker installed"
else
    print_warning "Docker not found. Container features won't be available"
fi

# Create necessary directories
echo -e "\nCreating project directories..."

mkdir -p 06_development/src/prometheus_v5
mkdir -p 06_development/src/alexandria
mkdir -p 06_development/src/cognitive_os
mkdir -p 06_development/tests/unit
mkdir -p 06_development/tests/integration
mkdir -p 06_development/config
mkdir -p 07_resources/examples/voice_monitoring
mkdir -p 07_resources/examples/predictive_analytics
mkdir -p 07_resources/examples/autonomous_agents
mkdir -p 07_resources/templates/docker
mkdir -p 07_resources/templates/kubernetes
mkdir -p 07_resources/templates/config
mkdir -p data/metrics
mkdir -p data/models
mkdir -p logs

print_status "Directories created"

# Install Node.js dependencies
if [ -f "package.json" ]; then
    echo -e "\nInstalling Node.js dependencies..."
    npm install
    print_status "Node.js dependencies installed"
else
    print_warning "package.json not found in current directory"
fi

# Install Python dependencies
if [ -f "requirements.txt" ]; then
    echo -e "\nInstalling Python dependencies..."
    pip3 install -r requirements.txt
    print_status "Python dependencies installed"
elif command -v python3 &> /dev/null; then
    echo -e "\nInstalling basic Python packages..."
    pip3 install numpy asyncio dataclasses typing-extensions
    print_status "Basic Python packages installed"
fi

# Setup environment file
if [ ! -f ".env" ]; then
    if [ -f ".env.example" ]; then
        echo -e "\nSetting up environment configuration..."
        cp .env.example .env
        print_status "Created .env file from .env.example"
        print_warning "Please edit .env with your configuration"
    else
        echo -e "\nCreating default .env file..."
        cat > .env << EOL
# Agentic Learning Configuration
NODE_ENV=development
PORT=3000

# AI/ML Configuration
MODEL_PATH=./data/models
DATA_PATH=./data/metrics

# Monitoring
PROMETHEUS_PORT=9090
ENABLE_VOICE=false
ENABLE_PREDICTIONS=true
ENABLE_AUTO_REMEDIATION=false

# Logging
LOG_LEVEL=info
LOG_PATH=./logs
EOL
        print_status "Created default .env file"
    fi
fi

# Create default configuration
echo -e "\nCreating default configuration..."
cat > 06_development/config/default.json << EOL
{
    "monitoring": {
        "enabled": true,
        "interval": 10000,
        "metrics": ["cpu", "memory", "disk", "network"]
    },
    "predictions": {
        "enabled": true,
        "horizon": 3600,
        "confidence_threshold": 0.8
    },
    "agents": {
        "max_agents": 10,
        "types": ["observer", "analyzer", "remediation"]
    },
    "voice": {
        "enabled": false,
        "language": "en-US"
    }
}
EOL
print_status "Default configuration created"

# Create example test file
echo -e "\nCreating example test..."
cat > 06_development/tests/unit/test_nlp.js << 'EOL'
// Example test for Natural Language Processing
const assert = require('assert');

describe('Natural Language Processor', () => {
    it('should extract intent from query', () => {
        // Test implementation here
        assert.equal(1 + 1, 2);
    });

    it('should identify metrics in query', () => {
        // Test implementation here
        assert.equal(true, true);
    });
});
EOL
print_status "Example test created"

# Create run scripts
echo -e "\nCreating run scripts..."

# Start script
cat > 06_development/scripts/start.sh << 'EOL'
#!/bin/bash
echo "Starting Prometheus v5 Monitoring..."
node ../04_implementations/prometheus/prometheus_v5_implementation.js
EOL
chmod +x 06_development/scripts/start.sh

# Test script
cat > 06_development/scripts/test.sh << 'EOL'
#!/bin/bash
echo "Running tests..."
npm test
EOL
chmod +x 06_development/scripts/test.sh

# Build script
cat > 06_development/scripts/build.sh << 'EOL'
#!/bin/bash
echo "Building project..."
# Add build commands here
echo "Build complete!"
EOL
chmod +x 06_development/scripts/build.sh

print_status "Run scripts created"

# Initialize git hooks (optional)
if [ -d ".git" ]; then
    echo -e "\nSetting up git hooks..."
    mkdir -p .git/hooks

    # Pre-commit hook
    cat > .git/hooks/pre-commit << 'EOL'
#!/bin/bash
# Run tests before commit
npm test
EOL
    chmod +x .git/hooks/pre-commit
    print_status "Git hooks configured"
fi

# Final summary
echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Development environment setup complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "\nNext steps:"
echo "1. Edit .env file with your configuration"
echo "2. Run './06_development/scripts/start.sh' to start monitoring"
echo "3. Run './06_development/scripts/test.sh' to run tests"
echo "4. Check README.md for full documentation"
echo -e "\nHappy coding! 🚀"