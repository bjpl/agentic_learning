# Tools & Infrastructure Reference

> **Note**: This file is for human reference only. Core tool information is in `CLAUDE.md` which is auto-loaded by Claude Code.

## Overview

This document provides detailed reference information about the tools and infrastructure available for the Agentic Learning Framework project.

---

## Flow Nexus Cloud Platform

### Authentication & Setup

**Initial Setup**:
```bash
# Add MCP server
claude mcp add flow-nexus npx flow-nexus@latest mcp start

# Verify installation
claude mcp list
```

**Authentication**:
```javascript
// Register new account
mcp__flow-nexus__user_register({
  email: "your-email@example.com",
  password: "secure-password",
  username: "your-username"
})

// Login to existing account
mcp__flow-nexus__user_login({
  email: "your-email@example.com",
  password: "your-password"
})

// Check credit balance
mcp__flow-nexus__check_balance()
```

---

## Available MCP Tools

### Swarm Orchestration

**Initialize Swarm**:
```javascript
mcp__flow-nexus__swarm_init({
  topology: "mesh" | "hierarchical" | "star",
  maxAgents: 5,
  coordinationStrategy: "consensus" | "leader-based"
})
```

**Spawn Agents**:
```javascript
mcp__flow-nexus__agent_spawn({
  type: "researcher" | "coder" | "tester" | "reviewer",
  capabilities: ["code-analysis", "testing"],
  resources: { cpu: "2", memory: "4GB" }
})
```

**Task Orchestration**:
```javascript
mcp__flow-nexus__task_orchestrate({
  task: "Build REST API with authentication",
  strategy: "parallel" | "sequential",
  agents: ["backend-dev", "security-reviewer"],
  timeout: 3600
})
```

---

### E2B Sandboxes

**Create Sandbox**:
```javascript
mcp__flow-nexus__sandbox_create({
  template: "node" | "python" | "react" | "nextjs",
  name: "api-development",
  environmentVariables: {
    NODE_ENV: "development",
    API_KEY: process.env.API_KEY
  }
})
```

**Execute Code**:
```javascript
mcp__flow-nexus__sandbox_execute({
  sandboxId: "sandbox-123",
  code: "console.log('Hello from sandbox')",
  language: "javascript"
})
```

**Upload Files**:
```javascript
mcp__flow-nexus__sandbox_upload({
  sandboxId: "sandbox-123",
  files: [
    { path: "src/index.js", content: "..." },
    { path: "package.json", content: "..." }
  ]
})
```

---

### Workflows

**Create Workflow**:
```javascript
mcp__flow-nexus__workflow_create({
  name: "ci-cd-pipeline",
  trigger: "git-push",
  steps: [
    { name: "test", action: "run-tests" },
    { name: "build", action: "build-app" },
    { name: "deploy", action: "deploy-staging" }
  ]
})
```

**Execute Workflow**:
```javascript
mcp__flow-nexus__workflow_execute({
  workflowId: "workflow-123",
  parameters: { branch: "main", environment: "staging" }
})
```

---

### Neural Networks

**Train Model**:
```javascript
mcp__flow-nexus__neural_train({
  architecture: "transformer" | "cnn" | "rnn",
  dataset: "training-data.json",
  hyperparameters: {
    learningRate: 0.001,
    batchSize: 32,
    epochs: 100
  },
  distributedTraining: true
})
```

**Inference**:
```javascript
mcp__flow-nexus__neural_inference({
  modelId: "model-123",
  input: { text: "Sample input" },
  outputFormat: "json"
})
```

---

## Claude Flow (Local)

### SPARC Methodology

**Run Specific Mode**:
```bash
npx claude-flow sparc run spec-pseudocode "Build user authentication"
npx claude-flow sparc run architect "Design database schema"
npx claude-flow sparc run refinement "Implement login endpoint"
```

**Full TDD Workflow**:
```bash
npx claude-flow sparc tdd "Add password reset feature"
```

**Batch Processing**:
```bash
npx claude-flow sparc batch spec-pseudocode,architect "Build REST API"
```

---

### Hooks Integration

**Pre-Task Hook**:
```bash
npx claude-flow hooks pre-task --description "Implement feature X"
```

**Post-Edit Hook**:
```bash
npx claude-flow hooks post-edit --file "src/auth.js" --memory-key "swarm/auth/implementation"
```

**Session Management**:
```bash
npx claude-flow hooks session-restore --session-id "swarm-123"
npx claude-flow hooks session-end --export-metrics true
```

---

## Available Agents

### Flow Nexus Agents

Located in `.claude/agents/flow-nexus/`:

1. **flow-nexus-auth** - Authentication and user management
2. **flow-nexus-sandbox** - E2B sandbox deployment and management
3. **flow-nexus-swarm** - AI swarm orchestration and scaling
4. **flow-nexus-workflow** - Event-driven workflow automation
5. **flow-nexus-neural** - Neural network training and deployment
6. **flow-nexus-challenges** - Coding challenges and gamification
7. **flow-nexus-app-store** - Application marketplace management
8. **flow-nexus-payments** - Credit management and billing
9. **flow-nexus-user-tools** - User management and system utilities

**Usage Example**:
```bash
# Via slash command
/flow-nexus:sandbox

# Direct task tool invocation
Task("Deploy sandbox", "Create Node.js sandbox for API development", "flow-nexus-sandbox")
```

---

## Slash Commands

Available in `.claude/commands/flow-nexus/`:

- `/flow-nexus:login-registration` - Authentication workflows
- `/flow-nexus:sandbox` - E2B sandbox management
- `/flow-nexus:swarm` - AI swarm deployment
- `/flow-nexus:workflow` - Automation workflows
- `/flow-nexus:neural-network` - ML model training
- `/flow-nexus:challenges` - Coding challenges
- `/flow-nexus:app-store` - App marketplace
- `/flow-nexus:payments` - Credit management
- `/flow-nexus:user-tools` - User utilities

---

## Integration Patterns

### Pattern 1: Coordinated Swarm Development

```javascript
// 1. Initialize coordination (MCP)
mcp__flow-nexus__swarm_init({ topology: "mesh", maxAgents: 5 })

// 2. Spawn agents (Claude Code Task tool)
Task("Backend Dev", "Build REST API with auth", "backend-dev")
Task("Frontend Dev", "Create React UI", "coder")
Task("Test Engineer", "Write comprehensive tests", "tester")
Task("Security Auditor", "Review security", "reviewer")

// 3. Agents coordinate via hooks
// Each agent runs:
// - npx claude-flow hooks pre-task
// - npx claude-flow hooks post-edit (after changes)
// - npx claude-flow hooks post-task (on completion)
```

### Pattern 2: Sandbox-Based Development

```javascript
// 1. Create isolated environment
const sandbox = mcp__flow-nexus__sandbox_create({
  template: "node",
  name: "feature-dev"
})

// 2. Develop in sandbox
mcp__flow-nexus__sandbox_execute({
  sandboxId: sandbox.id,
  code: "npm install && npm test"
})

// 3. Deploy to production when ready
mcp__flow-nexus__workflow_execute({
  workflowId: "production-deploy",
  parameters: { sandboxId: sandbox.id }
})
```

---

## Resource Management

### Credits & Billing

**Check Balance**:
```javascript
mcp__flow-nexus__check_balance()
// Returns: { credits: 1000, tier: "free" | "pro" | "enterprise" }
```

**Usage Tracking**:
```javascript
mcp__flow-nexus__usage_stats({
  period: "day" | "week" | "month",
  groupBy: "service" | "agent" | "sandbox"
})
```

**Auto-Refill**:
```javascript
mcp__flow-nexus__configure_auto_refill({
  threshold: 100, // Credits
  amount: 500,    // Credits to add
  enabled: true
})
```

---

## Troubleshooting

### Common Issues

**Issue**: MCP tools not available
```bash
# Solution: Verify MCP server running
claude mcp list
claude mcp restart flow-nexus
```

**Issue**: Authentication failed
```bash
# Solution: Re-login
mcp__flow-nexus__user_login({ email: "...", password: "..." })
```

**Issue**: Sandbox timeout
```javascript
// Solution: Increase timeout in sandbox config
mcp__flow-nexus__sandbox_create({
  template: "node",
  timeout: 600 // 10 minutes
})
```

---

## Related Documentation

- `CLAUDE.md` - Auto-loaded configuration (includes core tool references)
- `AGENT_INSTRUCTIONS_REFERENCE.md` - Detailed directive explanations
- Flow Nexus Docs: https://github.com/ruvnet/claude-flow#flow-nexus
- Claude Flow Docs: https://github.com/ruvnet/claude-flow

---

**Last Updated**: 2025-10-07
**Status**: Reference documentation for project tools and infrastructure
