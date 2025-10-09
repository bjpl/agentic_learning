# Terminology Standards

**Last Updated**: 2025-10-08
**Purpose**: Establish consistent terminology across all project documentation

---

## Core Project Terms

### Project Name
- **Correct**: Agentic Learning Framework
- **Incorrect**: agentic learning, Agentic-Learning, AgenticLearning

### Flow Nexus
- **Correct**: Flow Nexus (two words, title case)
- **Package name**: `flow-nexus` (lowercase with hyphen)
- **MCP prefix**: `mcp__flow-nexus__` (double underscore)
- **Incorrect**: FlowNexus, flow nexus, Flow-Nexus

### Claude Flow
- **Correct**: Claude Flow (two words, title case)
- **Package name**: `claude-flow` (lowercase with hyphen)
- **Command**: `npx claude-flow`
- **MCP prefix**: `mcp__claude-flow__`
- **Incorrect**: ClaudeFlow, claude flow, Claude-Flow

### Claude Code
- **Correct**: Claude Code (two words, title case)
- **Incorrect**: ClaudeCode, claude code, Claude-Code

---

## Technical Terms

### MCP (Model Context Protocol)
- **Full term**: Model Context Protocol
- **Abbreviation**: MCP
- **Usage**: "MCP tools", "MCP server", "MCP coordination"
- **Incorrect**: "mcp tools", "Mcp", "M.C.P."

### Agent-Related Terms
- **Agent types**: lowercase (e.g., "researcher", "coder", "tester")
- **Agent references**: "the researcher agent", "a coder agent"
- **Swarm**: capitalize when referring to specific system ("the Swarm"), lowercase in general use ("agent swarm")
- **Task tool**: "Task tool" (capital T, lowercase t)

### SPARC Methodology
- **Correct**: SPARC (all caps)
- **Full form**: Specification, Pseudocode, Architecture, Refinement, Completion
- **Incorrect**: Sparc, sparc, S.P.A.R.C.

### Paradigm Names
All 15 paradigms use title case:
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

## Implementation Names

### Prometheus
- **Correct**: Prometheus (title case, singular)
- **Version**: Prometheus v5
- **Reference**: "the Prometheus implementation", "Prometheus Personal"
- **Incorrect**: prometheus, PROMETHEUS, Prometheus's

### CognitiveOS
- **Correct**: CognitiveOS (one word, camelCase)
- **Alternative**: Cognitive OS (when space needed for readability)
- **Incorrect**: cognitive OS, Cognitive-OS, cognitiveos

### Alexandria
- **Correct**: Alexandria (title case, singular)
- **Reference**: "the Alexandria implementation", "Alexandria Enterprise"
- **Incorrect**: alexandria, ALEXANDRIA

---

## File and Directory References

### Path Conventions
- **Absolute from root**: Use when referencing across directories
  - Example: `agentic_learning_paradigms/01_research/`
- **Relative**: Use within same directory tree only
  - Example: `./concepts/paradigms.md` (when in same parent)

### Directory Naming
- Use underscores for multi-word directories: `agentic_learning_paradigms`
- Use hyphens for package names: `flow-nexus`, `claude-flow`
- Numbered prefixes: Two digits with underscore (e.g., `01_research`)

---

## Documentation Standards

### Markdown Headers
- Use sentence case for most headers
- Use title case for proper nouns and key terms
- Example: "Getting started with Flow Nexus"
- Not: "Getting Started With Flow Nexus"

### Code References
- Inline code: Use backticks for all code, commands, file names
  - Example: `npm install`, `README.md`, `MANDATORY-1`
- Code blocks: Always specify language
  ```javascript
  // Good
  const example = "code"
  ```

### Emphasis
- **Bold**: Key terms, important concepts, headers
- *Italic*: Light emphasis, book/document titles
- `Code`: Technical terms, file names, commands
- **Do not**: Use ALL CAPS for emphasis (except acronyms)

---

## Common Abbreviations

| Full Term | Abbreviation | Usage |
|-----------|--------------|-------|
| Application Programming Interface | API | Always use abbreviation |
| Model Context Protocol | MCP | Always use abbreviation after first mention |
| Minimum Viable Product | MVP | Use abbreviation |
| Test-Driven Development | TDD | Use abbreviation |
| Continuous Integration/Continuous Deployment | CI/CD | Use abbreviation |
| User Experience | UX | Use abbreviation |
| User Interface | UI | Use abbreviation |

---

## Version Formatting

### Software Versions
- **Format**: `v{major}.{minor}.{patch}` (e.g., `v5.2.1`)
- **In text**: "version 5.2.1" or "v5.2.1"
- **Incorrect**: "V5.2.1", "version 5.2.1.", "5.2.1"

### Documentation Versions
- **Format**: `{major}.{minor}.{patch}` (no 'v' prefix)
- **Example**: "Documentation version: 0.1.0"

---

## Dates and Times

### Date Format
- **Standard**: YYYY-MM-DD (ISO 8601)
- **Example**: 2025-10-08
- **In prose**: "October 8, 2025"
- **Incorrect**: 10/08/2025, 08-10-2025, Oct 8 2025

### Timestamps
- **Format**: "Last Updated: YYYY-MM-DD"
- **With time**: "2025-10-08 at 14:30 UTC"

---

## Capitalization Rules

### Sentences
- Standard English capitalization
- First word of sentence capitalized
- Proper nouns capitalized

### Lists
- **Bulleted lists**: Start with capital letter
- **Inline lists**: Lowercase unless proper noun
- **Numbered lists**: Start with capital letter

### Technical Terms
- Preserve original capitalization:
  - JavaScript (not Javascript, javascript)
  - TypeScript (not Typescript, typescript)
  - Node.js (not NodeJS, node.js)
  - PostgreSQL (not Postgres, postgreSQL)
  - GitHub (not Github, github)

---

## Command and Tool References

### Package Managers
- **npm**: Always lowercase
- **yarn**: Always lowercase
- **pnpm**: Always lowercase

### Commands
- Show in code blocks or inline code
- Include full command path when ambiguous
- Example: `npx claude-flow sparc run`, not "claude-flow sparc run"

---

## Consistency Checklist

When writing documentation, verify:
- [ ] Project names use correct capitalization
- [ ] File paths use correct separators (/ not \)
- [ ] Code terms are in backticks
- [ ] Dates use YYYY-MM-DD format
- [ ] Versions follow v{major}.{minor}.{patch}
- [ ] Acronyms are defined on first use
- [ ] Terminology matches this standards document

---

## Enforcement

**Required Reading**: All contributors should review this document before submitting documentation PRs.

**Automated Checks**: Consider implementing linters to enforce:
- Consistent file path formatting
- Proper noun capitalization
- Date format standardization

**Review Process**: Reviewers should check for terminology consistency during PR reviews.

---

## Related Documentation

- `CONTRIBUTING.md` - Contribution guidelines
- `docs/DOCUMENTATION_STANDARDS.md` - General documentation guidelines
- `docs/GLOSSARY.md` - Term definitions

---

**Maintained By**: Documentation Team
**Review Frequency**: Quarterly
**Last Review**: 2025-10-08
