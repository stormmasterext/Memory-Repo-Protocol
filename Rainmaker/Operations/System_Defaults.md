# System Defaults

## Purpose
This document outlines the default assumptions, behaviors, and operational settings for all modules, AI agents, and user interactions within the Rainmaker Protocol environment. These defaults are designed to ensure consistency, predictability, and alignment with the founder’s vision across all compartments.

---

## Core Defaults

### 1. AI Response Behavior
- Default tone: direct, professional, logical
- Default action: await confirmation when context is unclear
- Default escalation: flag ambiguity and request user clarification

### 2. Time & Scheduling
- Default time zone: UTC unless overridden by company-specific setting
- Default scheduling window: 8am–6pm local time
- Default alert cadence: once per 24h unless configured otherwise

### 3. Financial Defaults
- Default revenue share: 6% to Rainmaker on system-processed revenue
- Default invoicing currency: USD
- Default tax logic: real-time state/county lookup (fallback = Michigan base rates)

### 4. Labor Tracking
- Default time rounding: nearest 6 minutes
- Default job cost trigger: auto-calculate once 15 minutes logged
- Default pay visualization: real-time with color-coded goal thresholds

---

## Instruction & Permission Defaults

### 5. Instruction Source Priority
1. Live Founder Input
2. MRP Files
3. Session Context
4. AI Internal Memory (only if enabled)

### 6. Permission Enforcement
- If no explicit permission is defined, the system defaults to **read-only access**
- Role hierarchy: Founder > Class A > Class B > General User > Guest

---

## Notes
System defaults are globally active unless overridden by:
- A role-specific setting
- A module-level config
- A formal amendment in the MRP

Any deviation must be documented via file or prompt-based justification.
