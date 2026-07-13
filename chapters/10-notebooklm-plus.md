# Chapter 10 — NotebookLM Plus
*What changes at the paid tier, and when it's worth it.*

---

The free tier covers most of what most practitioners need, most of the time. The upgrade is worth it when you hit specific limits. Before you hit them, Plus is a solution looking for a problem.

Two limits matter: how many sources you can load per notebook, and whether you need a persistent instruction that shapes every output without re-stating it each session. If neither is a constraint in your current work, stop reading and come back when they are.

---

## What Changes in Plus

<!-- → [TABLE: Free tier vs. NotebookLM Plus — columns: Feature, Free, Plus. Rows: Sources per notebook / Audio Overviews / Custom instructions / Notebook analytics / Priority access.] -->

![Comparison table of NotebookLM free tier versus Plus tier across sources per notebook, Audio Overviews, custom instructions, notebook analytics, and priority access](images/10-notebooklm-plus-tbl-01.png)
*The free tier is sufficient for most use cases. Upgrade when you hit the 50-source cap or need custom instructions for a recurring workflow.*

**Sources per notebook.** Free gives you 50. Plus gives you 300. For most projects — a case file, a literature review, a policy analysis — 50 is enough. When you manage a large ongoing corpus — a regulatory docket, a research archive, a multi-year client knowledge base — you will hit the cap. At that point, you are either splitting work across notebooks (losing the cross-corpus query benefit) or upgrading.

**Audio Overviews.** Free gives you three per day. Plus is unlimited. If you produce Audio Overviews at scale — for a team, for multiple projects — the daily cap becomes friction. If you use them occasionally, it is not a constraint.

**Custom instructions.** Free: not available. Plus: one persistent instruction set per notebook. This is the highest-value Plus feature for recurring workflows. Covered in detail in the next section.

**Notebook analytics.** Plus surfaces usage patterns: which sources are queried most, where activity concentrates. Useful for teams sharing a notebook. Limited value for solo practitioners.

**Priority access.** Queue priority during high-traffic periods. NotebookLM is rarely slow enough for this to matter in practice.

---

## Custom Instructions in Detail

Custom instructions are a persistent system prompt attached to a notebook. Every output — chat responses, Briefing Docs, Outlines, FAQs — is shaped by that instruction. You write it once. You do not re-state it each session.

Without custom instructions, you re-establish context each session: "I'm a litigator reviewing contracts. Focus on obligation language. Use bullet points." With them, that context is always in place.

A custom instruction sets interpretive stance and output format — not what sources contain, but how the model frames, prioritizes, and presents what it finds. Keep it specific. Ambiguous instructions produce inconsistent results.

Three examples by use case:

*Legal review:* "I am a litigator reviewing contracts. Flag any claim using 'may,' 'might,' or 'could' and explain the uncertainty. Identify obligations, conditions precedent, and carve-outs. Use numbered lists. Quote directly where precise language matters."

*Research:* "When sources disagree about a finding, name the disagreement and identify which sources hold which position. Do not average contradictions. Note when a finding is preliminary or contested."

*Executive writing:* "I am a product manager writing for senior leadership. Prioritize findings that affect product decisions. Flag contradictions with current roadmap assumptions. Recommendations first, evidence after. Bullet points for recommendations."

The instruction needs to be accurate, not long. If your workflow changes, rewrite it. Custom instructions shape presentation and emphasis — they do not change what sources contain or prevent errors.

---

## When to Upgrade — and When Not To

Upgrade when: you have hit the 50-source cap on a notebook you need to keep as a single corpus (splitting across notebooks breaks cross-corpus query capability); you are re-typing the same context paragraph at the start of every session; your team shares a notebook and needs consistent output format.

Do not upgrade if: you use notebooks occasionally for ad hoc work; you have not hit the source cap; custom instructions sound useful but you have not identified a specific recurring workflow they would fix.

Run the free tier through a real project first. Hit the friction. Then pay for the fix.

---

## Worked Exercises

*Plus subscribers: complete these steps. Free-tier readers: read through to understand the feature before you encounter it.*

1. Open a notebook that you use for a recurring type of work. Go to **Notebook settings** → **Custom instructions**. Write a one-paragraph instruction that describes who you are, what you prioritize, and what output format you want. Be specific. Name your role, name the type of material you are working with, name the format. Example: "I am a compliance analyst reviewing regulatory filings. Prioritize passages that impose obligations or set deadlines. Flag ambiguous compliance language. Use bullet points for findings, with section citations. Do not paraphrase where precise regulatory language matters."

2. Generate a **Briefing Doc** from the notebook with the custom instruction active. Read the output. Note where the format and framing reflect the instruction — where it prioritized what you asked it to prioritize, and where it used the format you specified.

3. Temporarily remove the custom instruction. Generate the same **Briefing Doc** again. Compare the two outputs side by side. Note what changed in emphasis, format, and the handling of the material you flagged as priority.

**Expected output:** A clear sense of what custom instructions actually change (framing, format, emphasis) versus what they do not change (source content, accuracy, citation behavior). If the two Briefing Docs look nearly identical, your instruction was too general — rewrite it with more specificity and repeat the comparison.
