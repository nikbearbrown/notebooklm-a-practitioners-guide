# Chapter 3 — Text Outputs
*Briefing Doc, Study Guide, FAQ, Timeline, Outline — what each one does and when to reach for which.*

---

NotebookLM's Studio panel offers a menu of outputs. They look like format choices. They aren't.

Each text output performs a different cognitive operation on your sources. A Briefing Doc synthesizes and argues. A Timeline extracts and sequences. A Study Guide covers comprehensively. An FAQ anticipates questions. An Outline structures for writing. Choosing one without knowing what it does is guessing. You might get lucky, but you haven't made a decision.

This chapter tells you what each output does so you can choose deliberately.

---

## The Five Text Outputs

### Briefing Doc

A Briefing Doc reads like a staff briefing — the kind of document a senior analyst prepares so a decision-maker can walk into a meeting informed. NotebookLM structures it with headers, identifies key claims, and cites throughout. It synthesizes rather than catalogues. If your sources make an argument, the Briefing Doc traces it. If they present competing positions, the Briefing Doc surfaces both.

What it produces: an executive synthesis of the corpus, organized by theme or argument, with citations at every major claim.

What cognitive work it does for you: it reads all your sources and extracts the signal — the central claims, the key findings, the important tensions. You don't have to hold the whole corpus in your head to see the shape of it.

What you still have to do: judge whether the synthesis is accurate. The Briefing Doc will sometimes flatten a nuanced finding or overstate a point that the source actually qualified. Click the citations. Read the passages. The doc is a starting map, not a final document.

Best single use case: getting up to speed on an unfamiliar corpus fast. You've been handed twelve papers on a topic you don't know. You need to be useful in a meeting tomorrow. Generate a Briefing Doc, read it, click three citations, and you have a working orientation.

---

### Study Guide

A Study Guide produces structured coverage: topic sections, subtopic breakdowns, key terms defined, major claims organized under headers. It doesn't synthesize so much as catalogue — it maps what's in the sources rather than arguing a position about them.

What it produces: comprehensive coverage organized for learning or review, with definitions, explanations, and citations at every section.

What cognitive work it does for you: it parses your sources by topic and makes coverage gaps visible. If the sources say nothing about a topic you expected to find, the Study Guide's absence of that section is information.

What you still have to do: decide what the coverage means. The Study Guide treats all topics as roughly equivalent unless your sources weight them differently. You need to know which sections matter more for your purpose and engage with those actively rather than reading the guide end to end.

Best single use case: building a comprehensive overview of a topic you need to learn. Unlike the Briefing Doc, it isn't trying to argue — it's trying to cover. Use it when you need to know the terrain, not just the headlines.

---

### FAQ

The FAQ generates question-and-answer pairs derived from what your sources actually address. This is different from generating questions you think someone might ask — the FAQ surfaces what your corpus has content to answer.

What it produces: a question-and-answer format organized around the information actually present in the sources. Each answer cites the source passage.

What cognitive work it does for you: it reveals what questions your corpus is and isn't positioned to answer. If someone will ask a question and your corpus doesn't address it, the FAQ will either skip it or produce a thin answer — which tells you the gap is there.

What you still have to do: check whether the questions are the right questions. The FAQ is generated from what the sources contain, not from what your audience cares about. You may need to fill in questions the FAQ didn't generate because the sources skipped them.

Best single use case: anticipating what someone else will ask about the material. You're preparing a briefing or a presentation and you want to know what questions will come from the audience. The FAQ tells you what questions the corpus supports good answers to — which is useful both for prep and for identifying where you need better sources.

---

### Timeline

The Timeline extracts chronological events from your corpus and sequences them. It works best on sources that are naturally temporal — historical accounts, case files, project documentation, incident reports, legal proceedings.

What it produces: a dated or sequenced list of events drawn from the sources, with citations.

What cognitive work it does for you: it linearizes material that may have been described out of order across multiple documents. If three sources each mention the same event from different angles at different points in their narrative, the Timeline consolidates them at the right position in the sequence.

What you still have to do: verify the dates. Temporal extraction is one of the places where the model's paraphrase can go wrong in subtle ways — a source might say "by early 2019" and the Timeline might render that as a specific month. Check the citations on any dates that matter.

Best single use case: historical documents, case files, and project post-mortems where the sequence of events is the analysis. If your question is "what happened and in what order," the Timeline gives you a working draft of the answer.

---

### Outline

The Outline produces a hierarchical structure of your corpus's argument or content — the skeleton of what's there without the flesh. Think of it as a reverse-engineering of the source material: given what these documents contain, what is the structure underneath?

What it produces: a multi-level outline — major sections, subsections, key claims nested under each — with citations.

What cognitive work it does for you: it shows you the architecture of the sources' content. If you're about to write a document that responds to or synthesizes the corpus, the Outline tells you what structure you're working with or against.

What you still have to do: decide whether the Outline's structure serves your purpose. The model will find the structure that's in the sources — which may not be the structure you need for what you're writing. Use the Outline as a starting point for your own structure, not a template to fill in.

Best single use case: before writing a document that must synthesize or respond to the corpus. Generating the Outline before you draft tells you what you're working with and where your argument needs to depart from or build on the sources.

---

### Table of Contents

The Table of Contents produces a navigational index of the corpus — what's in each source and roughly where. It's less analytical than the other outputs. It's a map.

What it produces: an indexed overview of the corpus by source and section, with enough description of each section to navigate.

What cognitive work it does for you: it makes a large or multi-source corpus browsable. If you have twenty sources in a notebook and you need to find where a specific topic is covered, the Table of Contents gives you a faster path than asking questions and hoping the retrieval surfaces the right section.

What you still have to do: use it as navigation, not as analysis. The Table of Contents tells you where things are, not what they mean.

Best single use case: large corpora where you need to find sections quickly. You've built a research notebook with thirty documents and you need to locate the three that discuss a specific methodology. The Table of Contents surfaces that faster than repeated queries.

---

<!-- → [TABLE: Text output comparison — columns: Output type, What it produces, Cognitive work it does, What you still do, Best single use case. Rows: Briefing Doc / Study Guide / FAQ / Timeline / Outline / Table of Contents.] -->

![Table comparing six NotebookLM text outputs — Briefing Doc, Study Guide, FAQ, Timeline, Outline, Table of Contents — across what each produces, the cognitive work it does, what the user still does, and the best use case](images/03-text-outputs-tbl-01.png)
*These are not format choices. Each output performs a different cognitive operation. Choose based on what work you need done, not what the result will look like.*

---

## Combining Outputs

The outputs work better in sequence than in isolation.

**Briefing Doc → Outline → write.** The Briefing Doc gives you the argument. The Outline gives you the structure. You write from both, knowing the shape of the corpus before you draft a word.

**Table of Contents → targeted queries → Briefing Doc on selected sources.** Use the Table of Contents to identify which sources contain the relevant material. Remove the rest temporarily or ask targeted questions only referencing those sources. Generate a Briefing Doc that's focused rather than sprawling.

**FAQ → identify gaps → add sources → regenerate.** Run the FAQ first. Note where the questions are thin or absent. Those gaps tell you what sources you're missing. Add them, re-run the FAQ, and compare.

**Timeline → Briefing Doc.** For historical or case-based work, generate the Timeline first to establish the sequence of events, then generate the Briefing Doc to understand the analysis. You'll read the Briefing Doc differently when you know the chronology.

The outputs are not static deliverables. They're intermediate steps in a workflow. Treat them as drafts to interrogate, not products to ship.

---

## Prompting for Specificity

Generic prompts produce generic outputs. The outputs described above are what NotebookLM generates by default. You can constrain them with the custom prompt field.

**Generic:** Generate a Briefing Doc.

**Specific:** Generate a Briefing Doc focused on the regulatory landscape described in these sources. Include only claims with direct citations. Flag any claim that appears in only one source rather than multiple.

**Generic:** Generate an FAQ.

**Specific:** Generate an FAQ from the perspective of a procurement officer evaluating this vendor's proposal. Focus on risk, cost, and implementation timeline. Skip general background questions.

The difference in output quality is substantial. The generic version gives you what the model thinks a Briefing Doc or FAQ looks like. The specific version gives you what you actually need from your specific corpus for your specific purpose. Spend sixty seconds on the prompt. It saves twenty minutes of editing.

If the custom prompt field isn't visible, look for a settings or customize option within the output generation panel. The interface surfaces this differently depending on the output type.

---

## Worked Exercises

**Exercise 1 — All five outputs on the same corpus**

1. Load two or three sources on the same topic — something you know well enough to evaluate the output quality.
2. Generate all five text outputs: Briefing Doc, Study Guide, FAQ, Timeline, Outline. If your sources aren't temporal, the Timeline may be thin — note that rather than skipping it.
3. Read each output. For each one, click at least two citations and confirm the passages match the claims.
4. Write one sentence per output completing this prompt: "I would reach for this when ___."
5. Compare: Which output gave you the most useful information fastest? Which required the most follow-up work?

**Expected output:** A clear working sense of what each output is optimized for, grounded in a specific corpus you know. The one-sentence completions are the deliverable — they become your personal reference for which output to reach for in future work.

**Exercise 2 — Generic prompt vs. specific prompt**

1. Generate a Briefing Doc using the default prompt.
2. Generate a second Briefing Doc using a specific prompt: define a role (researcher, analyst, executive, auditor), a focus area (specific topic, specific question), and a constraint (only multiply-sourced claims, only claims from the last five years, only claims relevant to a named decision).
3. Compare the two outputs side by side. How do they differ in focus, depth, and usefulness for your actual purpose?

**Expected output:** Direct evidence of how much prompt specificity changes output quality, in a corpus you can evaluate. Use this as calibration for how much time to spend on prompts going forward.
