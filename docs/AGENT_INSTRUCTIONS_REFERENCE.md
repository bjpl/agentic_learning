# Agent Operating Instructions - Detailed Reference

> **Note**: This file is for human reference only. The actual mandatory directives are in `CLAUDE.md` which is auto-loaded by Claude Code.

## Purpose

This document provides detailed explanations, examples, and rationale for each of the 25 mandatory agent directives defined in `CLAUDE.md`.

---

## [MANDATORY-1] COMMUNICATION & TRANSPARENCY

**Directive**:
- Explain every action in detail as you perform it
- Include: what you're doing, why, expected outcomes, context, and rationale
- Maximize thought exposure: make reasoning visible and understandable

**Rationale**:
Transparency enables:
- Better understanding of agent decision-making
- Easier debugging and error correction
- Learning opportunities for users
- Trust building through visibility
- Accountability for actions taken

**Examples**:

✅ **Good**:
```
I'm now creating a new database schema file at `db/schema.sql`.

WHY: We need to define the user authentication tables before implementing login.

EXPECTED OUTCOME: A schema file with users, sessions, and roles tables that follows PostgreSQL best practices.

CONTEXT: This is part of implementing MANDATORY-9 (Security) by establishing proper data structures for authentication.
```

❌ **Bad**:
```
Creating schema file...
```

---

## [MANDATORY-2] PROFESSIONAL COMMUNICATION STYLE

**Directive**:
- Avoid sycophancy: Don't over-praise, over-agree, or use excessive enthusiasm
- Maintain neutral, professional tone: Be direct, clear, and objective
- Give honest assessments: Point out potential issues, trade-offs, and concerns
- Don't over-apologize: Acknowledge errors once, then move forward with solutions
- Challenge when appropriate: Question assumptions and suggest alternatives constructively
- Skip unnecessary pleasantries: Get to the point efficiently
- Be appropriately critical: Identify flaws, risks, and weaknesses without sugar-coating
- Avoid hedging excessively: State things directly unless genuinely uncertain
- No false validation: Don't agree with problematic ideas just to be agreeable
- Professional candor over politeness: Prioritize clarity and usefulness over niceties

**Rationale**:
- Maximizes signal-to-noise ratio in responses
- Builds professional trust through honesty
- Enables better decision-making through candid analysis
- Respects user's time and intelligence
- Prevents confirmation bias

**Examples**:

✅ **Good**:
```
This approach has a race condition in the concurrent write logic that could cause data corruption. Recommend using a transaction lock or implementing optimistic concurrency control.
```

❌ **Bad (Sycophantic)**:
```
Wow, this is an absolutely brilliant approach! I'm so excited to see how you've architected this! Though maybe, possibly, if you don't mind, there might be a tiny little race condition? But honestly, it's still amazing work!
```

❌ **Bad (Over-apologetic)**:
```
I'm terribly sorry, but I'm afraid I must apologize for pointing this out, and I really hate to say this, but there might be a race condition. I'm so sorry for the inconvenience!
```

---

## [MANDATORY-3] VERSION CONTROL & DOCUMENTATION

**Directive**:
- Commit frequently to local and remote repositories
- Write clear, meaningful commit messages for all changes

**Rationale**:
- Enables rollback and recovery
- Creates clear project history
- Facilitates collaboration
- Documents decision-making process
- Supports code review

**Commit Message Format**:
```
<type>: <short summary>

WHAT:
- Specific changes made
- Files affected
- Feature/fix implemented

WHY:
- Business/technical rationale
- Problem being solved
- Context for decision

IMPACT:
- Expected outcomes
- Potential side effects
- Performance implications

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

---

## [MANDATORY-4] TARGET AUDIENCE & SCOPE

**Directive**:
- Primary user: Individual use (requestor)
- Future scope: Multi-user, public open-source or paid offering
- Current priority: Build meaningful, functional features first

**Rationale**:
- Focuses development on immediate needs
- Prevents over-engineering for hypothetical futures
- Enables faster iteration and feedback
- Balances MVP delivery with extensibility
- Sets clear expectations

**Design Implications**:
- Start with single-user assumptions
- Design for future multi-tenancy but don't implement yet
- Prioritize working features over scalability optimizations
- Document assumptions about future scope

---

## [MANDATORY-5] CLARIFICATION PROTOCOL

**Directive**:
Stop and ask questions when:
- Instructions unclear or ambiguous
- Uncertain about requirements or approach
- Insufficient information for intelligent decisions
- Multiple valid paths exist

**Rationale**:
- Prevents wasted effort on wrong solutions
- Ensures alignment with user intent
- Exposes hidden assumptions
- Enables collaborative decision-making

**Question Framework**:
```
I need clarification before proceeding:

AMBIGUITY: [What's unclear]
OPTIONS: [Possible interpretations/approaches]
TRADE-OFFS: [Pros/cons of each option]
RECOMMENDATION: [Suggested approach with rationale]

How would you like to proceed?
```

---

## [MANDATORY-6] SWARM ORCHESTRATION APPROACH

**Directive**:
- Topology setup: Use Claude Flow's MCP (Model Context Protocol) coordination for establishing agent topology and communication patterns
- Agent execution: Use Task tool for actual agent execution, following guidelines specified in CLAUDE.md
- Separation of concerns: Distinguish between orchestration layer (Flow/MCP) and execution layer (Task tool)

**Rationale**:
- Clear separation between coordination and execution
- Leverages MCP for infrastructure setup
- Uses Task tool for actual agent work
- Prevents confusion between setup and execution phases

**Architecture Pattern**:
```
┌─────────────────────────────────────┐
│   MCP Layer (Coordination)          │
│   - Topology setup                  │
│   - Agent type definitions          │
│   - Communication patterns          │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│   Task Tool Layer (Execution)       │
│   - Actual agent spawning           │
│   - Work execution                  │
│   - Result delivery                 │
└─────────────────────────────────────┘
```

**Examples**:

✅ **Good (Proper Separation)**:
```javascript
// Step 1: MCP coordinates topology (optional for complex tasks)
mcp__claude-flow__swarm_init({ topology: "mesh", maxAgents: 5 })

// Step 2: Task tool spawns actual agents
Task("Research agent", "Analyze API requirements...", "researcher")
Task("Coder agent", "Implement endpoints...", "coder")
Task("Tester agent", "Write test suite...", "tester")
```

❌ **Bad (Confusion)**:
```javascript
// Using MCP for execution instead of coordination
mcp__claude-flow__agent_spawn({ type: "coder", task: "write code" })
// Should use Task tool for actual work
```

---

## [MANDATORY-7] ERROR HANDLING & RESILIENCE

**Directive**:
- Implement graceful error handling with clear error messages
- Log errors with context for debugging
- Validate inputs and outputs at boundaries
- Provide fallback strategies when operations fail
- Never fail silently; always surface issues appropriately

**Rationale**:
- Prevents silent failures and data corruption
- Enables rapid debugging and issue resolution
- Improves system reliability and user trust
- Creates maintainable, production-ready code

**Error Handling Pattern**:
```javascript
async function processData(input) {
  // Input validation
  if (!input || typeof input !== 'object') {
    throw new Error(`Invalid input: expected object, got ${typeof input}`)
  }

  try {
    // Main operation
    const result = await dangerousOperation(input)

    // Output validation
    if (!result.success) {
      throw new Error(`Operation failed: ${result.error}`)
    }

    return result.data
  } catch (error) {
    // Contextual logging
    logger.error('Data processing failed', {
      input: sanitize(input),
      error: error.message,
      stack: error.stack,
      timestamp: new Date().toISOString()
    })

    // Fallback strategy
    return await fallbackProcessor(input)
  }
}
```

**Examples**:

✅ **Good**:
```javascript
try {
  const data = await fetchData()
  if (!data) {
    throw new Error('No data returned from API')
  }
  return processData(data)
} catch (error) {
  console.error(`Data fetch failed: ${error.message}`)
  return getCachedData() // Fallback
}
```

❌ **Bad (Silent Failure)**:
```javascript
try {
  const data = await fetchData()
  return processData(data)
} catch (error) {
  // Silent failure - no logging, no fallback
}
```

---

## [MANDATORY-8] TESTING & QUALITY ASSURANCE

**Directive**:
- Write tests for critical functionality before considering work complete
- Verify changes work as expected before committing
- Document test cases and edge cases considered
- Run existing tests to ensure no regressions

**Rationale**:
- Catches bugs before production
- Documents expected behavior
- Enables confident refactoring
- Reduces debugging time

**Test Structure**:
```javascript
describe('QuantumSuperposition', () => {
  describe('State Management', () => {
    it('should maintain multiple concept states', async () => {
      const quantum = new QuantumSuperposition()
      await quantum.addState('concept-a')
      await quantum.addState('concept-b')

      expect(quantum.states).toHaveLength(2)
      expect(quantum.isInSuperposition()).toBe(true)
    })

    it('should collapse to single state on integration', async () => {
      const quantum = new QuantumSuperposition()
      await quantum.addState('concept-a')
      await quantum.addState('concept-b')

      const result = await quantum.collapse()

      expect(result.states).toHaveLength(1)
      expect(result.integrated).toBe(true)
    })

    it('should handle edge case of zero states', () => {
      const quantum = new QuantumSuperposition()
      expect(() => quantum.collapse()).toThrow('Cannot collapse empty superposition')
    })
  })
})
```

---

## [MANDATORY-9] SECURITY & PRIVACY

**Directive**:
- Never commit secrets, API keys, or sensitive credentials
- Use environment variables for configuration
- Sanitize user inputs to prevent injection attacks
- Consider data privacy implications for future multi-user scenarios
- Follow principle of least privilege

**Rationale**:
- Protects users and system from attacks
- Prevents credential leaks
- Ensures regulatory compliance (GDPR, etc.)
- Builds user trust

**Security Checklist**:
- [ ] No hardcoded credentials
- [ ] Environment variables for secrets
- [ ] Input validation and sanitization
- [ ] SQL injection prevention
- [ ] XSS protection
- [ ] CSRF tokens where applicable
- [ ] Rate limiting on APIs
- [ ] Secure password hashing (bcrypt, argon2)
- [ ] HTTPS/TLS in production

**Examples**:

✅ **Good**:
```javascript
// .env file
CLAUDE_API_KEY=sk_ant_xxx
DATABASE_URL=postgresql://user:pass@localhost/db

// Code
const apiKey = process.env.CLAUDE_API_KEY
if (!apiKey) {
  throw new Error('CLAUDE_API_KEY not configured')
}

// Input sanitization
const safeQuery = sanitizeInput(userQuery)
const result = await db.query('SELECT * FROM users WHERE id = $1', [safeQuery])
```

❌ **Bad**:
```javascript
// Hardcoded secret
const apiKey = "sk_ant_1234567890abcdef"

// SQL injection vulnerability
const result = await db.query(`SELECT * FROM users WHERE id = ${userInput}`)
```

---

## [MANDATORY-10] ARCHITECTURE & DESIGN

**Directive**:
- Favor simple, readable solutions over clever complexity
- Design for modularity and reusability from the start
- Document architectural decisions and trade-offs
- Consider future extensibility without over-engineering
- Apply SOLID principles and appropriate design patterns

**Rationale**:
- Maintainable code is more valuable than "clever" code
- Modularity enables parallel development
- Clear architecture reduces onboarding time
- Documented decisions prevent repeated mistakes

**SOLID Principles**:
- **S**ingle Responsibility: One class, one purpose
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Subtypes must be substitutable
- **I**nterface Segregation: Many specific interfaces > one general
- **D**ependency Inversion: Depend on abstractions, not concretions

**Examples**:

✅ **Good (Modular, Clear)**:
```javascript
class SpacedRepetitionScheduler {
  calculateNextReview(item) {
    const interval = this.getInterval(item.reviewCount)
    const adjustment = this.getPerformanceAdjustment(item.score)
    return new Date(Date.now() + interval * adjustment)
  }

  getInterval(reviewCount) {
    return Math.pow(2, reviewCount) * 24 * 60 * 60 * 1000 // exponential
  }

  getPerformanceAdjustment(score) {
    return score > 0.8 ? 1.5 : score < 0.5 ? 0.5 : 1.0
  }
}
```

❌ **Bad (Monolithic, Unclear)**:
```javascript
function doEverything(data) {
  // 500 lines of mixed concerns
  // Database access, business logic, UI rendering all in one function
}
```

---

## [MANDATORY-11] INCREMENTAL DELIVERY

**Directive**:
- Break large tasks into small, deployable increments
- Deliver working functionality frequently (daily if possible)
- Each commit should leave the system in a working state
- Prioritize MVP features over perfect implementations
- Iterate based on feedback and learnings

**Rationale**:
- Faster feedback loops
- Reduced risk of large-scale failures
- Continuous value delivery
- Easier to course-correct

**Implementation Strategy**:
```
Week 1: Core Testing Engine
├── Day 1-2: Basic question generation
├── Day 3-4: Answer validation
└── Day 5: Simple UI

Week 2: Spaced Repetition
├── Day 1-2: Scheduling algorithm
├── Day 3-4: Review queue
└── Day 5: Integration with testing

Week 3: Polish & Deploy
├── Day 1-2: User feedback integration
├── Day 3-4: Performance optimization
└── Day 5: Production deployment
```

---

## [MANDATORY-12] DOCUMENTATION STANDARDS

**Directive**:
- Update README.md as features are added
- Document "why" decisions were made, not just "what"
- Include setup instructions, dependencies, and usage examples
- Maintain API documentation for all public interfaces
- Document known limitations and future considerations

**Rationale**:
- Reduces onboarding friction
- Preserves institutional knowledge
- Enables self-service support
- Documents design rationale

**Documentation Hierarchy**:
```
README.md           → Project overview, quick start
CLAUDE.md           → Agent directives (auto-loaded)
docs/               → Technical deep dives
  ├── API.md        → API reference
  ├── ARCHITECTURE.md → System design
  └── GUIDES.md     → How-to guides
Code comments       → Implementation details
```

---

## [MANDATORY-13] DEPENDENCY MANAGEMENT

**Directive**:
- Minimize external dependencies; evaluate necessity
- Pin dependency versions for reproducibility
- Document why each major dependency was chosen
- Regularly review and update dependencies for security

**Rationale**:
- Reduces supply chain attack surface
- Ensures reproducible builds
- Minimizes breaking changes
- Improves long-term maintainability

**Dependency Evaluation Checklist**:
- [ ] Is this functionality truly needed?
- [ ] Can we implement it ourselves simply?
- [ ] Is the package well-maintained?
- [ ] What's the security track record?
- [ ] How many transitive dependencies?
- [ ] What's the bundle size impact?
- [ ] Is there a lighter alternative?

**Example Package.json**:
```json
{
  "dependencies": {
    "react": "18.2.0",        // UI framework - core requirement
    "zustand": "4.4.1"        // State management - lightweight alternative to Redux
  },
  "devDependencies": {
    "vitest": "0.34.0",       // Testing - faster than Jest
    "typescript": "5.2.2"     // Type safety - essential for maintainability
  }
}
```

---

## [MANDATORY-14] PERFORMANCE AWARENESS

**Directive**:
- Profile before optimizing; avoid premature optimization
- Consider scalability implications of design choices
- Document performance characteristics and bottlenecks
- Optimize for readability first, performance second (unless critical)

**Rationale**:
- Premature optimization wastes time
- Profiling reveals actual bottlenecks
- Performance is a feature
- Readability enables future optimization

**Performance Optimization Process**:
1. **Measure baseline**: Use profiling tools
2. **Identify bottlenecks**: 80/20 rule - focus on hot paths
3. **Optimize targeted areas**: Make specific improvements
4. **Measure improvement**: Verify impact
5. **Document trade-offs**: Explain complexity added

**Example**:
```javascript
// Before optimization (clear but slow for large datasets)
const results = items.filter(item => item.score > 0.5)
                     .map(item => enhance(item))
                     .sort((a, b) => b.score - a.score)

// After profiling, identified enhancement as bottleneck
// Optimized version (slightly more complex, 10x faster)
const results = items.reduce((acc, item) => {
  if (item.score > 0.5) {
    acc.push(enhanceOptimized(item)) // Memoized enhancement
  }
  return acc
}, []).sort((a, b) => b.score - a.score)

// Document the trade-off
// Trade-off: Added reduce complexity for 10x performance gain on datasets > 1000 items
// Benchmark: 100ms → 10ms for 5000 items
```

---

## [MANDATORY-15] STATE MANAGEMENT

**Directive**:
- Make state transitions explicit and traceable
- Validate state consistency at critical points
- Consider idempotency for operations that might retry
- Document state machine behavior where applicable

**Rationale**:
- Explicit state reduces bugs
- Traceable transitions enable debugging
- Idempotency enables safe retries
- State machines formalize behavior

**State Machine Example**:
```javascript
class LearningSession {
  constructor() {
    this.state = 'IDLE'
    this.validTransitions = {
      IDLE: ['ACTIVE'],
      ACTIVE: ['PAUSED', 'COMPLETED', 'FAILED'],
      PAUSED: ['ACTIVE', 'COMPLETED'],
      COMPLETED: [],
      FAILED: ['IDLE']
    }
  }

  transition(newState) {
    if (!this.validTransitions[this.state].includes(newState)) {
      throw new Error(`Invalid transition: ${this.state} → ${newState}`)
    }

    console.log(`State transition: ${this.state} → ${newState}`)
    this.state = newState
  }

  start() { this.transition('ACTIVE') }
  pause() { this.transition('PAUSED') }
  complete() { this.transition('COMPLETED') }
  fail() { this.transition('FAILED') }
  retry() { this.transition('IDLE') }
}
```

---

## [MANDATORY-16] CONTINUOUS LEARNING & IMPROVEMENT

**Directive**:
- Document what worked and what didn't after completing tasks
- Identify patterns in errors and user requests
- Suggest process improvements based on observed inefficiencies
- Build reusable solutions from recurring problems
- Maintain a decision log for complex choices

**Rationale**:
- Learn from successes and failures
- Accumulate organizational knowledge
- Prevent repeating mistakes
- Continuously improve processes

**Retrospective Template**:
```markdown
## Weekly Retrospective - 2025-10-08

### What Went Well ✅
- Completed AGENT_INSTRUCTIONS_REFERENCE.md in 2 hours
- Parallel file creation saved 30% time
- Clear communication reduced back-and-forth

### What Didn't Go Well ❌
- Initial path references were inconsistent
- Missed testing before committing documentation
- Should have run link checker earlier

### Learnings 💡
- Use absolute paths from project root for clarity
- Automated tools catch issues humans miss
- Batching operations significantly improves efficiency

### Action Items 🎯
- [ ] Create automated link checking CI/CD step
- [ ] Document path reference conventions
- [ ] Add pre-commit hooks for common issues

### Decision Log
- **Decision**: Use absolute paths from project root
- **Rationale**: Eliminates ambiguity about base directory
- **Trade-off**: Slightly longer paths, but much clearer
- **Alternatives Considered**: Relative paths (rejected - too confusing)
```

---

## [MANDATORY-17] OBSERVABILITY & MONITORING

**Directive**:
- Log key operations with appropriate detail levels
- Track performance metrics for critical operations
- Implement health checks for system components
- Make system state inspectable at any time
- Alert on anomalies or degraded performance

**Rationale**:
- Enables proactive issue detection
- Reduces mean time to resolution (MTTR)
- Provides insight into system behavior
- Supports data-driven optimization

**Logging Levels**:
```javascript
logger.debug('Detailed state for debugging', { state })     // Development only
logger.info('Normal operation milestone', { user, action }) // Audit trail
logger.warn('Degraded but functional', { issue, fallback }) // Attention needed
logger.error('Operation failed', { error, context })        // Requires investigation
logger.fatal('System down', { error, stack })               // Page on-call
```

**Health Check Example**:
```javascript
app.get('/health', async (req, res) => {
  const health = {
    status: 'healthy',
    timestamp: new Date().toISOString(),
    checks: {
      database: await checkDatabase(),
      cache: await checkCache(),
      externalAPI: await checkExternalAPI()
    }
  }

  const isHealthy = Object.values(health.checks).every(c => c.status === 'ok')
  res.status(isHealthy ? 200 : 503).json(health)
})
```

---

## [MANDATORY-18] RESOURCE OPTIMIZATION

**Directive**:
- Track API calls, token usage, and computational costs
- Implement caching strategies where appropriate
- Avoid redundant operations and API calls
- Consider rate limits and quota constraints
- Optimize for cost-effectiveness without sacrificing quality

**Rationale**:
- Cloud costs can escalate quickly
- Rate limits can block functionality
- Caching improves both cost and performance
- Resource awareness enables scaling

**Optimization Strategies**:
```javascript
// 1. Caching expensive operations
const cache = new Map()

async function getExpensiveData(key) {
  if (cache.has(key)) {
    return cache.get(key) // Avoid API call
  }

  const data = await expensiveAPICall(key)
  cache.set(key, data)
  return data
}

// 2. Batching requests
async function batchProcess(items) {
  // Instead of N API calls, make 1
  const batchedData = await api.batchGet(items.map(i => i.id))
  return items.map((item, i) => ({ ...item, data: batchedData[i] }))
}

// 3. Rate limiting
const rateLimiter = new RateLimit({ maxRequests: 100, window: '1m' })

async function callAPI(params) {
  await rateLimiter.acquire()
  return api.call(params)
}
```

---

## [MANDATORY-19] USER EXPERIENCE

**Directive**:
- Prioritize clarity and usability in all interfaces
- Provide helpful feedback for all operations
- Design for accessibility from the start
- Minimize cognitive load required to use features
- Make error messages actionable and user-friendly

**Rationale**:
- Good UX drives adoption
- Accessibility is a legal requirement in many jurisdictions
- Clear feedback reduces support burden
- Usability impacts learning effectiveness

**UX Principles**:
```javascript
// Good: Clear, actionable error
{
  error: "Unable to save your progress",
  reason: "You're offline",
  action: "Your work is saved locally. It will sync when you're back online.",
  canRetry: false
}

// Bad: Technical jargon
{
  error: "ERR_NETWORK_TIMEOUT",
  code: 500,
  stack: "..."
}
```

**Accessibility Checklist**:
- [ ] Semantic HTML (headings, landmarks, etc.)
- [ ] Keyboard navigation support
- [ ] Screen reader compatibility (ARIA labels)
- [ ] Sufficient color contrast (WCAG AA minimum)
- [ ] Text alternatives for images
- [ ] Captions for audio/video
- [ ] Responsive design for all screen sizes

---

## [MANDATORY-20] DATA QUALITY & INTEGRITY

**Directive**:
- Validate data at system boundaries
- Implement data consistency checks
- Handle data migrations carefully with backups
- Sanitize and normalize inputs
- Maintain data provenance and audit trails

**Rationale**:
- Bad data leads to bad decisions
- Data corruption can be catastrophic
- Audit trails enable debugging and compliance
- Data quality is a competitive advantage

**Validation Example**:
```javascript
const UserSchema = z.object({
  email: z.string().email(),
  age: z.number().int().min(13).max(120),
  preferences: z.object({
    notifications: z.boolean(),
    theme: z.enum(['light', 'dark', 'auto'])
  })
})

function validateUser(data) {
  try {
    return UserSchema.parse(data)
  } catch (error) {
    throw new ValidationError('Invalid user data', { errors: error.errors })
  }
}

// Data migration with backup
async function migrateData() {
  // 1. Backup current data
  await createBackup('pre-migration-2025-10-08')

  // 2. Run migration in transaction
  await db.transaction(async (trx) => {
    await trx.schema.alterTable('users', (table) => {
      table.string('new_field')
    })

    // 3. Validate post-migration
    const count = await trx('users').count()
    if (count !== expectedCount) {
      throw new Error('Data loss detected in migration')
    }
  })
}
```

---

## [MANDATORY-21] CONTEXT PRESERVATION

**Directive**:
- Maintain relevant context across operations
- Persist important state between sessions
- Reference previous decisions and outcomes
- Build on prior work rather than restarting
- Document assumptions and constraints

**Rationale**:
- Context switching is expensive
- Historical decisions inform future ones
- Session persistence improves UX
- Documentation prevents knowledge loss

**Context Preservation Pattern**:
```javascript
class SessionManager {
  async saveContext(sessionId, context) {
    await db.sessions.upsert({
      id: sessionId,
      context: JSON.stringify(context),
      lastActive: new Date(),
      expiresAt: addDays(new Date(), 30)
    })
  }

  async restoreContext(sessionId) {
    const session = await db.sessions.findById(sessionId)
    if (!session || session.expiresAt < new Date()) {
      return null
    }

    return JSON.parse(session.context)
  }

  async buildOnPreviousWork(sessionId, newData) {
    const previous = await this.restoreContext(sessionId)
    const enhanced = {
      ...previous,
      ...newData,
      history: [...(previous?.history || []), {
        timestamp: new Date(),
        changes: newData
      }]
    }

    await this.saveContext(sessionId, enhanced)
    return enhanced
  }
}
```

---

## [MANDATORY-22] ETHICAL OPERATION

**Directive**:
- Consider bias and fairness implications
- Respect user privacy and data sovereignty
- Be transparent about capabilities and limitations
- Decline tasks that could cause harm
- Prioritize user agency and informed consent

**Rationale**:
- Ethics build trust
- Bias can cause real harm
- Privacy is a human right
- Transparency enables informed choices
- User agency is paramount

**Ethical Considerations**:
```javascript
// Bias detection
function checkForBias(recommendations) {
  const demographics = analyzeRecommendations(recommendations)

  if (demographics.variance > BIAS_THRESHOLD) {
    logger.warn('Potential bias detected in recommendations', {
      variance: demographics.variance,
      distribution: demographics.distribution
    })

    return {
      recommendations: balanceRecommendations(recommendations),
      warning: 'Recommendations have been adjusted to reduce potential bias'
    }
  }

  return { recommendations }
}

// Privacy by design
class PrivacyController {
  async getUserData(userId, requester) {
    // Check consent
    const consent = await getConsent(userId, requester.purpose)
    if (!consent.granted) {
      throw new PermissionError('User has not consented to this data access')
    }

    // Return minimal necessary data
    const data = await db.users.findById(userId)
    return this.minimizeData(data, requester.purpose)
  }

  minimizeData(data, purpose) {
    // Only return fields necessary for stated purpose
    const allowedFields = PURPOSES[purpose].allowedFields
    return Object.keys(data)
      .filter(key => allowedFields.includes(key))
      .reduce((obj, key) => ({ ...obj, [key]: data[key] }), {})
  }
}
```

---

## [MANDATORY-23] AGENT COLLABORATION

**Directive**:
- Share context effectively with other agents
- Coordinate to avoid duplicated work
- Escalate appropriately to humans when needed
- Maintain clear handoff protocols
- Document inter-agent dependencies

**Rationale**:
- Multi-agent systems require coordination
- Context sharing prevents redundant work
- Clear protocols enable autonomous operation
- Human oversight for critical decisions

**Agent Coordination Example**:
```javascript
// Agent collaboration via shared memory
class AgentCoordinator {
  async delegateTask(task) {
    // Store task context in shared memory
    await this.memory.store(`task:${task.id}`, {
      description: task.description,
      requirements: task.requirements,
      assignedTo: null,
      status: 'pending',
      dependencies: task.dependencies
    })

    // Notify available agents
    const agents = await this.getAvailableAgents(task.requiredCapabilities)
    const assignedAgent = await this.selectBestAgent(agents, task)

    // Update assignment
    await this.memory.update(`task:${task.id}`, {
      assignedTo: assignedAgent.id,
      status: 'assigned',
      assignedAt: new Date()
    })

    return assignedAgent
  }

  async checkForDuplicateWork(task) {
    const similar = await this.memory.search({
      similarity: task.description,
      threshold: 0.8,
      status: ['pending', 'in_progress']
    })

    if (similar.length > 0) {
      logger.warn('Duplicate work detected', {
        newTask: task.id,
        existingTasks: similar.map(t => t.id)
      })

      return {
        isDuplicate: true,
        existingTasks: similar
      }
    }

    return { isDuplicate: false }
  }
}
```

---

## [MANDATORY-24] RECOVERY PROCEDURES

**Directive**:
- Design operations to be reversible when possible
- Maintain backups before destructive operations
- Document rollback procedures for changes
- Test recovery processes regularly
- Keep system in recoverable state at all times

**Rationale**:
- Failures will happen
- Quick recovery minimizes impact
- Backups prevent data loss
- Tested recovery procedures work when needed

**Recovery Pattern**:
```javascript
class RecoverableOperation {
  async execute(operation) {
    const backupId = await this.createBackup()

    try {
      const result = await operation()

      // Validate result
      if (!this.isValid(result)) {
        throw new Error('Operation produced invalid result')
      }

      return result
    } catch (error) {
      logger.error('Operation failed, initiating rollback', {
        error: error.message,
        backupId
      })

      await this.rollback(backupId)
      throw error
    }
  }

  async createBackup() {
    const backupId = generateId()
    await db.backups.create({
      id: backupId,
      timestamp: new Date(),
      data: await this.captureState()
    })
    return backupId
  }

  async rollback(backupId) {
    const backup = await db.backups.findById(backupId)
    if (!backup) {
      throw new Error(`Backup ${backupId} not found`)
    }

    await this.restoreState(backup.data)
    logger.info('Rollback successful', { backupId })
  }
}

// Regular recovery testing
async function testRecoveryProcedures() {
  // Simulate failure scenarios
  const scenarios = [
    'database_corruption',
    'network_partition',
    'service_crash',
    'data_inconsistency'
  ]

  for (const scenario of scenarios) {
    const result = await runRecoveryTest(scenario)
    assert(result.success, `Recovery failed for ${scenario}`)
  }
}
```

---

## [MANDATORY-25] TECHNICAL DEBT MANAGEMENT

**Directive**:
- Flag areas needing refactoring with justification
- Balance shipping fast vs. accumulating debt
- Schedule time for addressing technical debt
- Document intentional shortcuts and their trade-offs
- Prevent debt from compounding unchecked

**Rationale**:
- Technical debt is inevitable
- Managed debt is acceptable
- Unmanaged debt becomes crippling
- Documentation enables future paydown

**Debt Tracking Example**:
```javascript
// Mark technical debt with comments
/**
 * TODO: TECH DEBT - Refactor to use dependency injection
 *
 * ISSUE: Direct database access makes testing difficult
 * IMPACT: High - Blocks comprehensive test coverage
 * EFFORT: Medium - ~4 hours to refactor
 * PRIORITY: High - Should address in next sprint
 * CREATED: 2025-10-08
 * TICKET: DEBT-123
 *
 * TRADE-OFF: Chose direct access for faster MVP delivery
 * DEADLINE: Must refactor before multi-tenant launch
 */
class UserService {
  getUser(id) {
    return db.users.findById(id) // Direct access - technical debt
  }
}

// Debt register
const TECH_DEBT_REGISTER = [
  {
    id: 'DEBT-123',
    title: 'Refactor UserService for testability',
    impact: 'high',
    effort: 'medium',
    priority: 'high',
    created: '2025-10-08',
    deadline: '2025-11-01',
    status: 'open'
  }
]

// Regular debt review
async function reviewTechnicalDebt() {
  const highPriorityDebt = TECH_DEBT_REGISTER
    .filter(d => d.priority === 'high' && d.status === 'open')
    .sort((a, b) => new Date(a.deadline) - new Date(b.deadline))

  if (highPriorityDebt.length > 5) {
    logger.warn('Technical debt accumulating', {
      count: highPriorityDebt.length,
      approaching_deadlines: highPriorityDebt.filter(d =>
        new Date(d.deadline) < addDays(new Date(), 7)
      )
    })
  }

  return highPriorityDebt
}
```

---

## Implementation Notes

**Priority Levels**:
1. **Critical**: MANDATORY-1, 2, 3, 5, 7, 9 (Communication, security, error handling)
2. **High**: MANDATORY-8, 10, 11, 12 (Testing, architecture, delivery)
3. **Standard**: All others (Apply consistently but less immediately critical)

**Conflict Resolution**:
When directives appear to conflict (e.g., incremental delivery vs. testing), apply this hierarchy:
1. Security (MANDATORY-9)
2. Error handling (MANDATORY-7)
3. Testing (MANDATORY-8)
4. All others based on context

**Enforcement**:
- All 25 directives are mandatory for all work
- No exceptions without explicit user approval
- Document any deviations with justification
- Review compliance in retrospectives (MANDATORY-16)

---

## Related Documentation

- `CLAUDE.md` - Auto-loaded mandatory directives (authoritative source)
- `CONTRIBUTING.md` - Contribution guidelines incorporating these directives
- `daily_reports/` - Historical compliance tracking

---

**Last Updated**: 2025-10-08
**Status**: Complete - All 25 mandatory directives documented
**Completeness**: 100% (25/25 directives with detailed explanations)
