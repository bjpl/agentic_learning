# Documentation Standards

**Last Updated**: 2025-10-08
**Purpose**: Guidelines for creating and maintaining project documentation

---

## Overview

Quality documentation is essential for project success. These standards ensure consistency, clarity, and maintainability across all documentation.

---

## File Organization

### Directory Structure

```
docs/
├── README.md                          # Documentation index
├── AGENT_INSTRUCTIONS_REFERENCE.md    # Directive details
├── TOOLS_REFERENCE.md                 # Tool APIs
├── GLOSSARY.md                        # Term definitions
├── TERMINOLOGY_STANDARDS.md           # Naming conventions
├── VERSIONING_POLICY.md               # Version semantics
├── DOCUMENTATION_STANDARDS.md         # This file
└── api/                               # API documentation
    ├── README.md                      # API overview
    ├── flow-nexus.md                  # Flow Nexus API
    └── claude-flow.md                 # Claude Flow API
```

### File Naming

- **Lowercase with hyphens**: `getting-started.md`
- **Descriptive names**: `prometheus-v5-implementation.md`
- **ALL CAPS for special docs**: `README.md`, `CONTRIBUTING.md`, `LICENSE`
- **Avoid**: Spaces, special characters, camelCase

---

## Markdown Structure

### Document Header

Every markdown file should start with:

```markdown
# Document Title

**Last Updated**: YYYY-MM-DD
**Purpose**: Brief description of document purpose
**Status**: [Draft | Review | Final]

---
```

### Table of Contents

For documents >200 lines, include TOC:

```markdown
## Table of Contents

- [Section 1](#section-1)
- [Section 2](#section-2)
  - [Subsection 2.1](#subsection-21)
- [Section 3](#section-3)

---
```

### Headers

Use hierarchical headers:

```markdown
# H1 - Document Title (one per file)
## H2 - Major Sections
### H3 - Subsections
#### H4 - Details (use sparingly)
```

**Rules**:
- Only one H1 per document
- Don't skip levels (H1 → H3)
- Use sentence case, not title case
- Keep headers concise (<60 characters)

---

## Content Guidelines

### Writing Style

**Tone**:
- Professional and neutral (MANDATORY-2)
- Direct and concise
- Avoid sycophancy and excessive enthusiasm
- Point out issues without sugar-coating

**Voice**:
- Use active voice: "Run the command" not "The command should be run"
- Second person for instructions: "You can configure..."
- First person plural for project: "We designed this feature..."

**Clarity**:
- One idea per sentence
- Short paragraphs (2-4 sentences)
- Use examples liberally
- Define terms before using

### Examples

Every concept should include examples:

```markdown
### Feature Name

**Description**: What the feature does

**Example**:
\```javascript
const example = "working code"
\```

**Output**:
\```
Expected result
\```

**Common Errors**:
- Error 1: cause and solution
- Error 2: cause and solution
```

### Code Blocks

**Always specify language**:

````markdown
```javascript
// Good - language specified
const code = "example"
```

```
// Bad - no language
const code = "example"
```
````

**Supported languages**:
- `javascript`, `typescript`
- `python`, `bash`
- `json`, `yaml`, `markdown`
- `sql`, `html`, `css`

### Links

**Internal links** (within repository):
```markdown
[Link text](./relative/path/to/file.md)
[Another link](../sibling/directory/file.md)
```

**External links** (outside repository):
```markdown
[Flow Nexus](https://github.com/ruvnet/flow-nexus)
```

**Reference links** (for repeated URLs):
```markdown
See the [documentation][docs] for more.

[docs]: https://example.com/docs
```

### Images

```markdown
![Alt text describing image](./images/diagram.png)

**Figure 1**: Caption explaining the image
```

**Image guidelines**:
- Alt text is required
- Use relative paths
- Store in `images/` subdirectory
- Optimize file size (<500KB)
- Prefer SVG for diagrams

---

## Formatting Standards

### Lists

**Unordered lists**:
```markdown
- Item one
- Item two
  - Nested item
  - Another nested item
- Item three
```

**Ordered lists**:
```markdown
1. First step
2. Second step
   1. Sub-step A
   2. Sub-step B
3. Third step
```

**Task lists**:
```markdown
- [x] Completed task
- [ ] Pending task
- [ ] Another pending task
```

### Tables

```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Data 1   | Data 2   | Data 3   |
| Data 4   | Data 5   | Data 6   |
```

**Table guidelines**:
- Headers required
- Left-align text columns
- Right-align number columns
- Keep tables simple (<6 columns)

### Emphasis

```markdown
**Bold** - Important terms, strong emphasis
*Italic* - Light emphasis, book titles
`Code` - Technical terms, file names, commands
~~Strikethrough~~ - Deprecated content (use sparingly)
```

**Rules**:
- Use **bold** for key concepts
- Use *italic* sparingly
- Always use `code` for technical terms
- Don't use ALL CAPS for emphasis

### Blockquotes

```markdown
> **Note**: Important information that needs attention.

> **Warning**: Critical warning about potential issues.

> **Tip**: Helpful suggestion or best practice.
```

### Horizontal Rules

Use `---` to separate major sections:

```markdown
## Section 1

Content here.

---

## Section 2

More content here.
```

---

## Special Elements

### Admonitions

```markdown
> **💡 Tip**: Helpful suggestion

> **⚠️ Warning**: Potential issue to watch for

> **🚨 Critical**: Must-know information

> **📝 Note**: Additional context
```

### ASCII Diagrams

Use for simple architecture diagrams:

```
┌─────────────────┐
│   Component A   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Component B   │
└─────────────────┘
```

### Code Annotations

```javascript
// CONCEPT: What this demonstrates
function example() {
  // WHY: Rationale for this approach
  const result = compute()

  // PATTERN: Design pattern name
  return result
}
```

---

## Documentation Types

### Tutorials

**Structure**:
1. What you'll learn
2. Prerequisites
3. Step-by-step instructions
4. Verification steps
5. Next steps

**Example**:
```markdown
# Getting Started with Flow Nexus

## What You'll Learn
- How to install Flow Nexus
- Basic swarm initialization
- First agent deployment

## Prerequisites
- Node.js 18+
- Claude API key

## Steps
### 1. Installation
\```bash
npm install flow-nexus
\```
...
```

### How-To Guides

**Structure**:
1. Goal statement
2. Solution overview
3. Detailed steps
4. Troubleshooting

**Example**:
```markdown
# How to Deploy a Multi-Agent Swarm

## Goal
Deploy 5 coordinated agents for parallel development.

## Overview
We'll use Flow Nexus MCP tools for coordination
and Task tool for execution.

## Steps
...
```

### Reference Documentation

**Structure**:
1. Brief description
2. Parameters/Arguments
3. Return values
4. Examples
5. Related functions

**Example**:
```markdown
## `mcp__flow-nexus__swarm_init`

**Description**: Initialize agent swarm with topology.

**Parameters**:
- `topology` (string): "mesh" | "hierarchical" | "star"
- `maxAgents` (number): Maximum agents (1-10)

**Returns**: Swarm ID (string)

**Example**:
\```javascript
const swarmId = await mcp__flow-nexus__swarm_init({
  topology: "mesh",
  maxAgents: 5
})
\```
```

### Explanations

**Structure**:
1. Context and background
2. Conceptual explanation
3. Why it matters
4. Connections to related concepts

**Example**:
```markdown
# Understanding Swarm Orchestration

## Background
Traditional single-agent systems have limitations...

## How Swarms Work
Multiple agents coordinate through shared memory...

## Benefits
- Parallel processing
- Fault tolerance
- Scalability

## Related Concepts
- Agent collaboration (MANDATORY-23)
- Task tool vs MCP (MANDATORY-6)
```

---

## Version Control

### Commit Messages

For documentation commits:

```
docs: [brief description]

WHAT:
- Files changed/added
- Content updated

WHY:
- Reason for changes
- Issues addressed

IMPACT:
- Who benefits
- What improves
```

### Change Tracking

Track significant changes:

```markdown
## Changelog

### 2025-10-08
- Added section on code formatting
- Updated examples for clarity
- Fixed broken links

### 2025-10-01
- Initial document creation
```

---

## Review Process

### Self-Review Checklist

Before submitting documentation:

- [ ] Spell check passed
- [ ] Grammar checked
- [ ] All links tested
- [ ] Code examples verified
- [ ] Terminology consistent
- [ ] Headers hierarchical
- [ ] TOC updated (if applicable)
- [ ] Timestamps current
- [ ] Examples working

### Peer Review

Reviewers should check:

1. **Accuracy**: Technical correctness
2. **Clarity**: Easy to understand
3. **Completeness**: All necessary information included
4. **Consistency**: Matches other docs
5. **Style**: Follows these standards

---

## Accessibility

### Screen Readers

- Use descriptive link text (not "click here")
- Provide alt text for all images
- Use semantic headings (H1, H2, H3)
- Avoid ASCII art for critical info

### Internationalization

- Use clear, simple English
- Avoid idioms and slang
- Define acronyms on first use
- Use consistent terminology

---

## Maintenance

### Review Schedule

- **Monthly**: Check for outdated content
- **Quarterly**: Review all docs for accuracy
- **Per release**: Update version-specific info

### Deprecation

Mark deprecated content:

```markdown
> **⚠️ Deprecated**: This feature is deprecated as of v3.0.
> Use [new feature](./new-feature.md) instead.
```

### Archiving

Move outdated docs to `docs/archive/`:

```markdown
> **📦 Archived**: This document is archived as of 2025-10-08.
> See [current version](./current-doc.md) for up-to-date information.
```

---

## Tools

### Recommended

- **Linters**: `markdownlint`, `prettier`
- **Link checkers**: `markdown-link-check`
- **Spell check**: `cspell`, `aspell`
- **Diagram tools**: `mermaid`, `draw.io`

### Configuration

`.markdownlint.json`:
```json
{
  "default": true,
  "MD013": false,
  "MD033": false
}
```

---

## Related Documentation

- `CONTRIBUTING.md` - Contribution workflow
- `docs/TERMINOLOGY_STANDARDS.md` - Term usage
- `docs/GLOSSARY.md` - Definitions

---

**Maintained By**: Documentation Team
**Review Frequency**: Quarterly
**Last Review**: 2025-10-08
