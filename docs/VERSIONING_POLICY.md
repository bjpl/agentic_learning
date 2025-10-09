# Versioning Policy

**Last Updated**: 2025-10-08
**Purpose**: Define version numbering semantics for all project components

---

## Overview

This project follows **Semantic Versioning 2.0.0** ([semver.org](https://semver.org)) for all components.

**Version Format**: `MAJOR.MINOR.PATCH`

- **MAJOR**: Incompatible API changes or significant architectural shifts
- **MINOR**: Backward-compatible functionality additions
- **PATCH**: Backward-compatible bug fixes

---

## Component Versioning

### Implementation Systems

**Prometheus**, **CognitiveOS**, **Alexandria** use distinct version lines:

#### Version Semantics

- **v1.x.x**: Foundation release
  - Baseline functionality
  - Core architecture established
  - May have limitations noted in docs

- **v2.x.x**: Enhanced capabilities
  - Significant feature additions
  - Performance improvements
  - Maintains backward compatibility with v1 where possible

- **v3.x.x - v4.x.x**: Production maturity
  - Enterprise-grade features
  - Advanced optimizations
  - Full API stability

- **v5.x.x+**: AI-native evolution
  - Next-generation capabilities
  - May introduce breaking changes
  - Requires migration from prior versions

#### Status Labels

- **Alpha**: Early development, unstable API
- **Beta**: Feature complete, stabilizing API
- **RC (Release Candidate)**: Production-ready, final testing
- **Stable**: Production-ready, fully supported
- **LTS (Long Term Support)**: Extended support period
- **Deprecated**: No longer recommended, support ending
- **EOL (End of Life)**: No longer supported

---

## Current Version Status

| System | Latest Version | Status | Production Ready |
|--------|----------------|--------|------------------|
| Prometheus | v5.0.0 | Beta | ⚠️ Testing |
| CognitiveOS | v2.0.0 | Stable | ✅ Yes |
| Alexandria | v2.0.0 | Stable | ✅ Yes |

---

## Breaking Changes Policy

### Major Version Increments (X.0.0)

Require breaking changes when:
- Public API contracts change incompatibly
- Data storage formats change without migration path
- Configuration file formats change
- Core architectural paradigms shift
- Minimum dependencies increase significantly

### Deprecation Process

1. **Announce**: Deprecation notice in changelog
2. **Grace Period**: Minimum one minor version before removal
3. **Warnings**: Runtime warnings when deprecated features used
4. **Removal**: Only in next major version
5. **Migration Guide**: Document upgrade path

**Example Timeline**:
```
v2.3.0 - Feature X deprecated (warnings added)
v2.4.0 - Feature X still available (warnings continue)
v2.5.0 - Feature X still available (last minor version)
v3.0.0 - Feature X removed (migration guide provided)
```

---

## Minor Version Increments (x.Y.0)

Add minor version when:
- New features added (backward-compatible)
- Existing features enhanced
- Dependencies updated (non-breaking)
- Performance improvements
- New optional configuration options

**Backward Compatibility Requirements**:
- Existing code continues to work without modification
- Configuration files remain valid
- Data formats readable by prior minor versions
- Deprecated features continue functioning (with warnings)

---

## Patch Version Increments (x.y.Z)

Increment patch for:
- Bug fixes (no new features)
- Security patches
- Documentation corrections
- Dependency security updates
- Performance fixes (no API changes)

**Patch Release Criteria**:
- No new functionality
- No API changes
- No configuration changes
- No database schema changes
- Fixes only

---

## Version Lifecycle

### Support Periods

| Version Type | Bug Fixes | Security Patches | Feature Updates |
|--------------|-----------|------------------|-----------------|
| Latest Stable | ✅ Active | ✅ Active | ✅ Active |
| Previous Minor | ✅ 6 months | ✅ 12 months | ❌ None |
| LTS Versions | ✅ 18 months | ✅ 24 months | ❌ None |
| Deprecated | ❌ None | ⚠️ Critical only | ❌ None |
| EOL | ❌ None | ❌ None | ❌ None |

### Example Lifecycle

```
v2.0.0 Released: 2025-01-01
├─ v2.1.0 (2025-03-01) - New features
├─ v2.2.0 (2025-06-01) - More features
├─ v2.3.0 (2025-09-01) - Latest stable
│
v3.0.0 Released: 2025-10-01
├─ v2.3.x - Bug fixes until 2026-04-01 (6 months)
├─ v2.3.x - Security patches until 2026-10-01 (12 months)
└─ v2.3.x - EOL after 2026-10-01
```

---

## Pre-release Versions

### Alpha Releases
- **Format**: `v{major}.{minor}.{patch}-alpha.{number}`
- **Example**: `v3.0.0-alpha.1`
- **Purpose**: Early testing, unstable
- **Support**: None

### Beta Releases
- **Format**: `v{major}.{minor}.{patch}-beta.{number}`
- **Example**: `v3.0.0-beta.2`
- **Purpose**: Feature complete, stabilizing
- **Support**: Bug reports accepted

### Release Candidates
- **Format**: `v{major}.{minor}.{patch}-rc.{number}`
- **Example**: `v3.0.0-rc.1`
- **Purpose**: Production candidate, final testing
- **Support**: Critical fixes only

---

## Documentation Versioning

Documentation versions track major/minor project versions:

- **Format**: `{major}.{minor}.{patch}`
- **Example**: "Documentation version: 0.1.0"
- **Versioning**: Increment when documentation structure changes significantly

---

## Migration Guides

Every major version increment requires:

1. **Migration Guide Document**
   - Location: `docs/migrations/v{old}-to-v{new}.md`
   - Example: `docs/migrations/v2-to-v3.md`

2. **Breaking Changes List**
   - All backward-incompatible changes documented
   - Grouped by component/feature
   - Before/after code examples

3. **Automated Migration Tools** (when feasible)
   - Scripts to update configuration
   - Data migration utilities
   - Validation tools

---

## Changelog Requirements

Every release requires changelog entry in `CHANGELOG.md`:

### Format

```markdown
## [v2.3.0] - 2025-10-08

### Added
- New feature X with capability Y
- Support for Z protocol

### Changed
- Improved performance of A by 50%
- Updated dependency B to v3.0

### Deprecated
- Feature C will be removed in v3.0
  (Use Feature D instead)

### Fixed
- Bug causing E under condition F
- Memory leak in G component

### Security
- Patched vulnerability H (CVE-2025-12345)
```

### Sections
- **Added**: New features
- **Changed**: Changes to existing functionality
- **Deprecated**: Soon-to-be removed features
- **Removed**: Removed features (major versions only)
- **Fixed**: Bug fixes
- **Security**: Security patches

---

## Special Editions

Some versions have descriptive suffixes:

- **Format**: `v{major}_{descriptor}`
- **Examples**:
  - `prometheus_v3_open_source_stack`
  - `alexandria_v2_enterprise`

**Use Case**: Differentiate between:
- Different technology stacks
- Different deployment targets
- Special-purpose builds

---

## Version Numbering Examples

### Correct
- `v1.0.0` - Major release
- `v1.2.3` - Minor update with patches
- `v2.0.0-beta.1` - Second major version, first beta
- `v1.5.2-rc.3` - Release candidate

### Incorrect
- `v1.0` - Missing patch number
- `1.2.3` - Missing 'v' prefix (in text/tags)
- `v1.2.3.4` - Too many segments
- `V1.2.3` - Uppercase V

---

## Git Tagging

### Tag Format
- **Releases**: `v{major}.{minor}.{patch}`
- **Pre-releases**: `v{major}.{minor}.{patch}-{stage}.{number}`

### Tagging Process
```bash
# Create annotated tag
git tag -a v2.3.0 -m "Release version 2.3.0"

# Push tag to remote
git push origin v2.3.0

# Create pre-release tag
git tag -a v3.0.0-beta.1 -m "Beta 1 for version 3.0.0"
```

---

## Version Comparison Matrix

| Scenario | v1 → v2 | v2.0 → v2.1 | v2.1.0 → v2.1.1 |
|----------|---------|-------------|-----------------|
| Breaking changes | ✅ Allowed | ❌ Not allowed | ❌ Not allowed |
| New features | ✅ Expected | ✅ Expected | ❌ Not allowed |
| Bug fixes | ✅ Allowed | ✅ Allowed | ✅ Required |
| Migration guide | ✅ Required | ⚠️ If complex | ❌ Not needed |
| Deprecations | ✅ Announce | ✅ Announce | ❌ Not allowed |

---

## Related Documentation

- `CHANGELOG.md` - Version history
- `docs/migrations/` - Version migration guides
- `CONTRIBUTING.md` - Contribution workflow including versioning

---

**Maintained By**: Core Development Team
**Review Frequency**: As needed for major releases
**Last Review**: 2025-10-08
