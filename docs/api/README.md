# API Documentation

**Last Updated**: 2025-10-08
**Purpose**: Central index for all API documentation

---

## Overview

This directory contains API reference documentation for all major components of the Agentic Learning Framework.

---

## Available APIs

### Flow Nexus API
Cloud-powered platform for agent orchestration, sandboxes, and neural networks.

📖 [Flow Nexus API Reference](./flow-nexus.md)

**Categories**:
- Authentication & User Management
- Swarm Orchestration
- E2B Sandboxes
- Workflows
- Neural Networks
- Challenges & Gamification

---

### Claude Flow API
Local agent coordination framework for topology setup and MCP integration.

📖 [Claude Flow API Reference](./claude-flow.md)

**Categories**:
- SPARC Methodology
- Hooks System
- Agent Coordination
- Memory Management
- GitHub Integration

---

### Paradigm APIs
Programmatic interfaces for the 15 learning paradigms.

📖 Coming Soon

**Paradigms**:
1. Symbiotic Mind Mesh
2. Quantum Learning Superposition
3. Adversarial Growth Engine
4. Knowledge Ecosystem
5. Temporal Learning Helix
6. Dissolution Protocol
7. Somatic Resonance Field
8. Collective Consciousness
9. Paradox Engine
10. Dream Weaver
11. Morphogenetic Field
12. Fractal Hologram
13. Entangled Learning
14. Akashic Interface
15. Synchronicity Weaver

---

## Quick Reference

### MCP Tool Naming Convention

```
mcp__<platform>__<operation>
```

**Examples**:
- `mcp__flow-nexus__swarm_init`
- `mcp__claude-flow__agent_spawn`

### Common Patterns

**Authentication**:
```javascript
mcp__flow-nexus__user_login({
  email: "user@example.com",
  password: "password"
})
```

**Swarm Initialization**:
```javascript
mcp__claude-flow__swarm_init({
  topology: "mesh",
  maxAgents: 5
})
```

**Task Orchestration**:
```javascript
mcp__flow-nexus__task_orchestrate({
  task: "Build feature X",
  strategy: "parallel"
})
```

---

## API Conventions

### Parameter Formats

- **Strings**: Quoted, camelCase or kebab-case
- **Numbers**: Unquoted integers or floats
- **Booleans**: `true` or `false` (lowercase)
- **Objects**: JSON format
- **Arrays**: JSON array format

### Response Formats

All API responses follow this structure:

```javascript
{
  success: boolean,
  data: any,          // Response data
  error?: string,     // Error message if success=false
  metadata?: {        // Optional metadata
    timestamp: string,
    version: string
  }
}
```

### Error Handling

```javascript
try {
  const result = await mcp__flow-nexus__operation(params)
  if (!result.success) {
    console.error(`Operation failed: ${result.error}`)
  }
} catch (error) {
  console.error(`API error: ${error.message}`)
}
```

---

## Authentication

### Flow Nexus

Requires authentication for most operations:

```javascript
// Register
await mcp__flow-nexus__user_register({
  email: "user@example.com",
  password: "secure-password",
  username: "username"
})

// Login
const session = await mcp__flow-nexus__user_login({
  email: "user@example.com",
  password: "password"
})

// Store session token
process.env.FLOW_NEXUS_TOKEN = session.token
```

### Claude Flow

No authentication required for local operations.

---

## Rate Limits

### Flow Nexus
- **Free Tier**: 100 requests/hour
- **Pro Tier**: 1000 requests/hour
- **Enterprise**: Custom limits

### Claude Flow
- No rate limits (local execution)

---

## Versioning

API versions follow the format: `v{major}`

**Current Versions**:
- Flow Nexus API: `v1`
- Claude Flow API: `v1`

**Version in URLs**: Not applicable (MCP tools use latest version)

---

## Support

### Getting Help

- **Documentation**: Check specific API docs (links above)
- **Issues**: [GitHub Issues](https://github.com/yourusername/agentic-learning/issues)
- **Examples**: See `examples/` directory in each API doc

### Reporting Bugs

Include:
1. API operation called
2. Parameters used
3. Expected behavior
4. Actual behavior
5. Error messages

---

## Contributing

To contribute to API documentation:

1. Follow [DOCUMENTATION_STANDARDS.md](../DOCUMENTATION_STANDARDS.md)
2. Include working code examples
3. Test all examples before submitting
4. Update this index when adding new APIs

---

## Related Documentation

- `../TOOLS_REFERENCE.md` - Tool usage guide
- `../GLOSSARY.md` - Term definitions
- `../../CLAUDE.md` - Agent directives

---

**Maintained By**: API Documentation Team
**Review Frequency**: Per release
