# 🚀 Quickstart Guide

Get up and running with Agentic Learning in under 10 minutes!

## Prerequisites

Ensure you have the following installed:
- **Node.js** 18+ or **Python** 3.9+
- **Git** for version control
- **Docker** (optional, for containerized deployment)

## 1. Installation (2 minutes)

### Clone and Setup

```bash
# Clone the repository
git clone https://github.com/bjpl/agentic_learning.git
cd agentic_learning

# Install dependencies
npm install

# Copy environment configuration
cp .env.example .env
```

### Configure Environment

Edit `.env` file with your settings:

```env
# Core Configuration
NODE_ENV=development
PORT=3000

# AI/ML Configuration
OPENAI_API_KEY=your_openai_key_here
MODEL_PATH=./models

# Flow Nexus (Optional)
FLOW_NEXUS_EMAIL=your_email@example.com
FLOW_NEXUS_PASSWORD=your_password

# Monitoring
PROMETHEUS_PORT=9090
ALERT_WEBHOOK=https://your-webhook-url
```

## 2. Your First Monitoring Agent (3 minutes)

### Basic Example

Create a file `my-first-monitor.js`:

```javascript
const PrometheusV5 = require('./04_implementations/prometheus/prometheus_v5_implementation');

async function main() {
    // Initialize the monitoring system
    const monitor = new PrometheusV5.ConversationalMonitor({
        mode: 'development',
        enableVoice: false  // Set to true if you want voice commands
    });

    // Start monitoring
    await monitor.start();

    // Natural language query
    const response = await monitor.query(
        "What's the current system health?"
    );

    console.log('System Health:', response);

    // Set up predictive alerting
    await monitor.setPredictiveAlert({
        query: "Alert me 30 minutes before memory runs out",
        channel: "console"  // or "slack", "email", etc.
    });

    // Check for anomalies
    const anomalies = await monitor.detectAnomalies();
    console.log('Detected Anomalies:', anomalies);
}

main().catch(console.error);
```

Run it:
```bash
node my-first-monitor.js
```

## 3. Voice-Enabled Monitoring (2 minutes)

### Enable Voice Commands

```javascript
const monitor = new PrometheusV5.VoiceMonitor();

// Start voice listener
await monitor.startVoiceListener();

// Now you can speak commands like:
// "Show me CPU usage"
// "Alert me if latency exceeds 500ms"
// "What caused the last outage?"
```

### Example Voice Commands

| Say This | What Happens |
|----------|--------------|
| "System status" | Get overall health report |
| "Show errors" | Display recent errors |
| "Predict next hour" | Get predictions for next hour |
| "Fix high memory" | Trigger autonomous remediation |

## 4. Predictive Analytics (2 minutes)

### Set Up Predictive Monitoring

```javascript
const predictor = new PrometheusV5.PredictiveEngine();

// Train on your data
await predictor.train({
    historicalData: './data/metrics.json',
    timeRange: '30d'
});

// Get predictions
const predictions = await predictor.predict({
    metric: 'cpu_usage',
    horizon: '1h',
    confidence: 0.95
});

console.log('Predictions:', predictions);

// Enable auto-remediation based on predictions
await predictor.enableAutoRemediation({
    threshold: 0.8,  // 80% confidence
    actions: ['scale', 'restart', 'optimize']
});
```

## 5. Multi-Agent Swarm (Advanced - 3 minutes)

### Deploy Agent Swarm

```javascript
const SwarmOrchestrator = require('./swarm-orchestrator');

// Initialize swarm
const swarm = new SwarmOrchestrator({
    topology: 'mesh',
    agents: [
        { type: 'observer', count: 3 },
        { type: 'analyzer', count: 2 },
        { type: 'executor', count: 1 }
    ]
});

// Start collaborative monitoring
await swarm.deploy();

// Orchestrate complex task
const result = await swarm.orchestrate({
    task: "Optimize entire infrastructure for cost while maintaining 99.9% uptime",
    constraints: {
        budget: 10000,
        sla: 0.999,
        timeframe: '30d'
    }
});

console.log('Optimization Plan:', result.plan);
```

## 6. Quick Commands Reference

### CLI Commands

```bash
# Start monitoring
npm run monitor:start

# Check status
npm run monitor:status

# Run predictions
npm run predict

# Deploy swarm
npm run swarm:deploy

# Run tests
npm test
```

### API Endpoints (when running as service)

```bash
# Natural language query
curl -X POST http://localhost:3000/query \
  -H "Content-Type: application/json" \
  -d '{"query": "Show me slow services"}'

# Get predictions
curl http://localhost:3000/predict/cpu/1h

# Trigger remediation
curl -X POST http://localhost:3000/remediate \
  -d '{"issue": "high_memory", "auto": true}'
```

## 7. Docker Deployment (Optional)

### Using Docker Compose

```yaml
# docker-compose.yml
version: '3.8'

services:
  agentic-learning:
    build: .
    ports:
      - "3000:3000"
      - "9090:9090"
    environment:
      - NODE_ENV=production
    volumes:
      - ./data:/app/data
      - ./models:/app/models
```

Run with:
```bash
docker-compose up -d
```

## 8. Next Steps

### Explore More Features

1. **📚 Read the Paradigms**
   - [Conversational Monitoring](agentic_learning_paradigms/02_paradigms/definitions/conversational_monitoring_paradigm.md)
   - [Predictive Anomaly](agentic_learning_paradigms/02_paradigms/definitions/predictive_anomaly_paradigm.md)
   - [Autonomous Remediation](agentic_learning_paradigms/02_paradigms/definitions/autonomous_remediation_paradigm.md)

2. **🛠️ Customize Your Setup**
   - Modify `config/default.json` for your environment
   - Add custom vocabulary in `config/vocabulary.json`
   - Define remediation policies in `config/policies.json`

3. **🔗 Integrate with Your Stack**
   - Connect to Prometheus/Grafana
   - Integrate with Kubernetes
   - Set up Slack/PagerDuty notifications

### Troubleshooting

| Issue | Solution |
|-------|----------|
| "Cannot find module" | Run `npm install` again |
| "API key invalid" | Check your `.env` file |
| "Voice not working" | Ensure microphone permissions are granted |
| "Predictions inaccurate" | Need more training data (>7 days) |

### Getting Help

- 📖 [Full Documentation](README.md)
- 💬 [GitHub Discussions](https://github.com/bjpl/agentic_learning/discussions)
- 🐛 [Report Issues](https://github.com/bjpl/agentic_learning/issues)

## 🎉 Congratulations!

You now have AI-native monitoring running! Your system can:
- ✅ Understand natural language queries
- ✅ Predict future issues
- ✅ Self-heal common problems
- ✅ Learn from every incident

**Ready for production?** Check out our [Deployment Guide](agentic_learning_paradigms/05_deployment/) →