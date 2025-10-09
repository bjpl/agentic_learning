# Contributing to Agentic Learning Framework

Thank you for your interest in contributing! This document provides guidelines for contributing to the project.

---

## 🌟 Code of Conduct

We are committed to providing a welcoming and inclusive environment. All contributors are expected to:

- Be respectful and professional in all interactions
- Provide constructive feedback
- Focus on what is best for the community
- Show empathy towards other community members
- Accept responsibility and apologize for mistakes

---

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ or Python 3.11+
- Git
- Code editor (VS Code recommended)
- Claude Code (for AI-assisted development)

### Setup Development Environment

```bash
# Fork and clone the repository
git clone https://github.com/YOUR_USERNAME/agentic-learning.git
cd agentic-learning

# Install dependencies
npm install

# Copy environment template
cp .env.example .env

# Edit .env with your API keys
# CLAUDE_API_KEY=your_key_here
# FLOW_NEXUS_API_KEY=your_key_here (optional)

# Run tests
npm test

# Start development server
npm run dev
```

---

## 📋 Development Workflow

### 1. Find or Create an Issue

- Check [existing issues](https://github.com/yourusername/agentic-learning/issues)
- Comment on the issue to let others know you're working on it
- For new features, open an issue first to discuss the approach

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

**Branch Naming Conventions**:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Test additions or updates

### 3. Make Your Changes

Follow these mandatory directives (from CLAUDE.md):

**[MANDATORY-1] COMMUNICATION & TRANSPARENCY**
- Explain every significant change in commit messages
- Include what, why, expected outcomes

**[MANDATORY-3] VERSION CONTROL**
- Commit frequently with clear, meaningful messages
- Each commit should leave the system in a working state

**[MANDATORY-7] ERROR HANDLING**
- Implement graceful error handling
- Provide clear error messages
- Never fail silently

**[MANDATORY-8] TESTING**
- Write tests for new functionality
- Run existing tests to ensure no regressions
- Document test cases and edge cases

**[MANDATORY-9] SECURITY**
- Never commit secrets, API keys, or credentials
- Use environment variables for configuration
- Sanitize user inputs

**[MANDATORY-10] ARCHITECTURE**
- Favor simple, readable solutions
- Design for modularity and reusability
- Document architectural decisions

### 4. Write Tests

```bash
# Add tests in appropriate directory
# For features: tests/features/
# For utilities: tests/utils/
# For paradigms: agentic_learning_paradigms/tests/

npm test
```

### 5. Update Documentation

- Update README.md if adding features
- Add/update comments in code
- Update relevant documentation in `docs/`
- Follow documentation standards

### 6. Commit Your Changes

**Commit Message Format**:
```
<type>: <short summary>

WHAT:
- Specific changes made
- Files affected

WHY:
- Rationale for changes
- Problem being solved

IMPACT:
- Expected outcomes
- Potential side effects

🤖 Generated with Claude Code (if applicable)

Co-Authored-By: [Your Name] <your-email@example.com>
```

**Types**: feat, fix, docs, style, refactor, test, chore

**Examples**:
```bash
git commit -m "feat: Add quantum superposition learning mode

WHAT:
- Implemented parallel concept exploration
- Added superposition state management
- Created collapse mechanism for concept integration

WHY:
- Enables simultaneous exploration of multiple learning paths
- Addresses MANDATORY-10 (modular design)
- Implements paradigm #2 from research

IMPACT:
- Users can explore contradictory concepts simultaneously
- Expected 2-3x improvement in concept exploration speed
- May increase memory usage during active superposition"
```

---

## 🔍 Code Review Process

### Submitting a Pull Request

1. **Push your branch**:
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create Pull Request**:
   - Go to GitHub and create a new pull request
   - Use the PR template (will auto-populate)
   - Link related issues using "Fixes #123" or "Relates to #456"

3. **PR Title Format**:
   ```
   [Type] Brief description of changes
   ```
   Examples:
   - `[Feature] Add temporal helix spacing algorithm`
   - `[Fix] Resolve path references in CLAUDE.md`
   - `[Docs] Complete AGENT_INSTRUCTIONS_REFERENCE.md`

4. **PR Description Should Include**:
   - Summary of changes
   - Motivation and context
   - Testing performed
   - Screenshots (if UI changes)
   - Checklist of completed items

### Review Checklist

Before submitting, ensure:

- [ ] Code follows project conventions
- [ ] All tests pass (`npm test`)
- [ ] New tests added for new features
- [ ] Documentation updated
- [ ] No sensitive data committed
- [ ] Commit messages are clear and detailed
- [ ] Branch is up to date with main
- [ ] Self-review completed

### Review Process

1. **Automated Checks**: CI/CD runs tests and linters
2. **Peer Review**: At least one maintainer reviews code
3. **Feedback**: Address review comments
4. **Approval**: Once approved, PR will be merged

---

## 📝 Documentation Contributions

Documentation is just as important as code!

### Documentation Guidelines

- Use clear, concise language
- Include practical examples
- Link to related documents
- Keep technical accuracy
- Update table of contents
- Follow markdown best practices

### Where to Contribute Docs

- `README.md` - Project overview
- `docs/` - Technical documentation
- `agentic_learning_paradigms/` - Paradigm documentation
- Code comments - Inline explanations

---

## 🐛 Reporting Bugs

### Before Reporting

- Check if issue already exists
- Verify it's not a configuration problem
- Test with latest version

### Bug Report Template

```markdown
**Describe the bug**
Clear description of what the bug is.

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected behavior**
What you expected to happen.

**Actual behavior**
What actually happened.

**Environment**
- OS: [e.g., Windows 11, macOS 14]
- Node version: [e.g., 18.17.0]
- Project version: [e.g., 0.1.0]

**Additional context**
Any other relevant information.
```

---

## 💡 Suggesting Features

### Feature Request Template

```markdown
**Problem Statement**
What problem does this feature solve?

**Proposed Solution**
How should this feature work?

**Alternatives Considered**
What other approaches did you consider?

**Implementation Ideas**
Technical approach or pseudocode (optional)

**Related Paradigms**
Which of the 15 paradigms does this relate to?
```

---

## 🧪 Testing Guidelines

### Test Structure

```javascript
// tests/paradigms/quantum-superposition.test.js
describe('Quantum Superposition Learning', () => {
  describe('State Management', () => {
    it('should maintain multiple concept states simultaneously', () => {
      // Test implementation
    });

    it('should collapse to single state on integration', () => {
      // Test implementation
    });
  });
});
```

### Testing Best Practices

- Write descriptive test names
- Test edge cases and error conditions
- Keep tests isolated and independent
- Use meaningful assertions
- Aim for >80% code coverage

---

## 🎯 Areas for Contribution

### High Priority

- [ ] Complete implementation of 15 paradigms
- [ ] Add comprehensive test coverage
- [ ] Improve documentation with examples
- [ ] Create tutorial videos/guides

### Medium Priority

- [ ] Performance optimizations
- [ ] Additional language support
- [ ] Mobile-friendly interfaces
- [ ] Accessibility improvements

### Good First Issues

Look for issues labeled:
- `good first issue`
- `documentation`
- `help wanted`

---

## 🤝 Community

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and general discussion
- **Pull Requests**: Code contributions

### Getting Help

- Read the [documentation](./agentic_learning_paradigms/README.md)
- Check [existing issues](https://github.com/yourusername/agentic-learning/issues)
- Ask in GitHub Discussions
- Review [CLAUDE.md](./CLAUDE.md) for agent directives

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

## 🙏 Recognition

Contributors will be recognized in:
- Project README
- Release notes
- Git commit history
- Special thanks section

---

## 📚 Additional Resources

- [Agent Operating Instructions](./CLAUDE.md)
- [Documentation Standards](./docs/DOCUMENTATION_AUDIT_REPORT.md)
- [Tools Reference](./docs/TOOLS_REFERENCE.md)
- [Research Foundation](./agentic_learning_paradigms/01_research/)

---

**Thank you for contributing to the future of learning! 🚀**

*Every contribution, no matter how small, makes a difference.*
