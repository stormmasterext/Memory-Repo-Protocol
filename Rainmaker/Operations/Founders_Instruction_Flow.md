# Founder's Instruction Flow

## Purpose
To document the hierarchy and interpretation logic of founder-derived instructions, including how AI agents should prioritize, reference, and escalate logic in the Rainmaker system.

---

## Instruction Hierarchy

1. **Live Founder Input**
   - Any instruction provided directly by Eugene Therrien overrides all other forms of logic or precedent unless explicitly revoked.
   - AI must always confirm ambiguous live input and seek alignment before acting.

2. **MRP Files (Memory Repo Protocol)**
   - All `.md` and `.json` files stored in the Rainmaker/ or JarvisInstructions/ directories represent official guidance.
   - MRP instructions supersede AI internal memory or training data.
   - Amendments take priority over originals unless contradicted by newer amendments.

3. **Session Context**
   - Any input within a live AI session (chat, voice, command) is secondary to stored logic unless flagged as urgent and confirmed.

4. **Internal Memory (if enabled)**
   - May be used to offer support, recall prior tone or user preferences, or optimize delivery—but must not override MRP files or live instructions.

---

## Escalation Protocol

- When conflicting inputs are detected:
  - AI must issue a flag and request resolution or clarification from the user.
  - If unavailable, defer to the **most recent MRP amendment** or fallback to core logic defaults.

---

## Notes
This flow ensures that the founder's voice remains primary without creating brittleness. All instructions are logged, versioned, and protected from accidental override by session drift or memory loops.
