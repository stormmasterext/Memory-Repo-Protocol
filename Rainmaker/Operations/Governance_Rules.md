# Governance Rules

## Purpose
To define the core governance mechanics of Rainmaker Protocol, including how decisions are made, who has voting rights, and how amendments are proposed, adopted, and recorded.

---

## Governance Structure

### 1. Shareholder Classes
- **Class A:** Foundational contributors with voting rights on system architecture, amendments, and royalty changes.
- **Class B:** Business participants with operational voting power within their own company logic layer.
- **Class C:** Observer or royalty-only shareholders with no operational voting power but tracked ownership and access to future disclosures.

### 2. Voting Protocol
- All governance actions must be logged as a proposal, include a rationale, and offer a formal yes/no voting window.
- AI agents may summarize votes but may not initiate governance actions unless authorized via MRP.

### 3. Proposal Format
Each proposal must include:
- `Title`
- `Rationale`
- `Affected Modules`
- `Impact Summary`
- `Voting Window`
- `Required Majority` (default: simple majority unless otherwise specified)

---

## Amendments

### 1. Amendment Rules
- All `.md` and `.json` files under Rainmaker or JarvisInstructions may be amended via `-AmendmentX` format
- Amendments do not overwrite previous files but are treated as overrides or extensions unless explicitly marked “repealed”

### 2. Amendment Acknowledgment
- Any active Jarvis agent must track which version or amendment is being followed.
- Amendment compliance must be logged during execution of related logic.

---

## Notes
Governance is designed to be lightweight but traceable, with every logic shift auditable through amendments and proposals. Long-term evolution may include tokenized governance or smart contract voting.
