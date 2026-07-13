# Chapter 7 — Notes
*The feature most practitioners skip. It is the one that makes the tool remember.*

---

## What Notes Are

A Note is a text block you write directly inside a notebook. It lives in the same panel as your sources. You can write anything in it — a hypothesis, a summary you drafted, a quote you pulled, a running list of observations. Notes save automatically.

You can insert citations in a Note. Highlight a passage in chat, click to create a citation, and the link to the source is embedded inline. The Note becomes anchored to the corpus, not floating free.

The distinction that matters: a Note is not a saved chat response. When you save a chat response, you get a static record of what the model returned. A Note is something you wrote. The difference is authorship, and authorship has consequences.

---

## Creating and Editing Notes

Open a notebook. In the right panel, you'll see a **+** button to create a new Note. Click it, and a text editor opens in the panel. Write what you need to write. Format with basic markdown if you want structure.

To insert a citation: switch to the chat, find a claim you want to anchor, and use the citation control to pull the source reference into the Note. Now the Note references the source. The model can see that reference later.

Editing is inline. Click the Note to open it. Change what you wrote. The update saves immediately.

One habit worth building: keep Notes short and specific. A Note that says "Hypothesis: the 2019 policy shift caused the divergence" is more useful than a Note that says "Lots of interesting material here." The model retrieves based on content. Give it content worth retrieving.

---

## The Critical Move: Promoting a Note to a Source

This is the step most practitioners miss.

By default, a Note is private to you — visible in the notebook panel, not part of what the model draws on when it generates outputs. The model answers from your uploaded sources. Your Note just sits there.

When you promote a Note to a source, that changes. The Note's text enters the retrieval corpus. When the model generates a Briefing Doc, answers a query, or creates an Audio Overview, it now draws from your framing, not only from the original documents.

**How to do it:**

1. Open the Note you want to promote.
2. Click the options menu on the Note (three dots or equivalent).
3. Select **Add to sources** (or **Promote to source** — the label varies slightly by interface version).
4. The Note moves from the Notes panel into the Sources list. It will appear with a different icon to distinguish it from uploaded documents.

That's it. From that point on, your Note is part of the corpus.

<!-- → [FIGURE: Note-to-source loop — four stages: (1) you write an observation or framing as a Note; (2) you promote the Note to a source; (3) you generate an output — the model draws from original sources AND your Note; (4) you observe the output and update the Note. Caption: The loop makes the notebook more accurate about your specific problem over time.] -->

![Four-stage Note-to-source feedback loop: write observation, promote to source, generate output grounded in documents and Note, observe and update the Note](images/07-notes-fig-01.svg)
*The loop makes the notebook more accurate about your specific problem over time.*

**Why this matters.** When you ask the model a question or generate an output, it retrieves from everything in the source list. If your Note is in that list, your framing competes with — and sometimes overrides — the framing implicit in the original documents. You are not just asking questions of the corpus. You are shaping the lens through which the corpus is interpreted.

A promoted Note that says "I am treating the 2019 restructuring as the causal event — evaluate all regulatory changes against that anchor" will change what a Briefing Doc looks like. The model will organize material around that anchor. Without the Note, the model has no anchor. It invents one, usually a generic one.

---

## Use Cases

**Running synthesis across a long project.** You have fifty papers. You've been querying for three weeks. You've accumulated a working theory. Write that theory in a Note, with citations embedded where the theory touches the corpus. Promote it. Now every subsequent output is calibrated against where you actually are in your thinking, not where you were at the start of the project.

**Client or project context that should persist.** You're analyzing a company's competitive position. You upload their annual reports, industry filings, analyst notes. Before you generate anything, write a Note: the client's stated goal, the question they're actually trying to answer, the constraints on the recommendation. Promote it. Now the model is generating with the client frame in the corpus, not reconstructing it from scratch every session.

**Accumulated observations across multiple sessions.** NotebookLM has no conversation history across sessions. The chat resets. Your Notes do not. If you update a promoted Note at the end of each session — adding what you learned, sharpening the hypothesis — the notebook accumulates. Your next session starts from where your last one ended.

**Personal framing of a contested topic.** You're researching a question where the literature disagrees. Write your working hypothesis as a Note. Promote it. Then ask the model to evaluate the hypothesis against the sources. You get a direct assessment of your position, not a generic summary of the debate.

---

## Building a Notebook Over Time

A notebook that sits static is a search engine with extra steps. A notebook with updated, promoted Notes is something different: a record of your analytical progress that feeds back into the outputs.

The pattern is iterative. You start with sources and Notes close to zero. You generate early outputs. You write a Note about what you learned or what you now believe. You promote it. You generate again. The output is better because it's calibrated to more of what you know. You update the Note with new observations. The loop closes.

This does not happen automatically. You have to do the work of writing the Notes and promoting them. But the return is that the notebook becomes more useful with time, not equally useful on day one and day thirty.

An important practical note: if you update a Note that has already been promoted to a source, the model will use the updated content. You don't need to demote and re-promote. Edit the Note in the Sources list directly, and the changes are live on the next query.

---

## What a General Chatbot Cannot Replicate

A general-purpose chatbot is stateless across conversations. You can paste in context at the start of each session, but that's manual, and it resets. Nothing accumulates without effort on every session.

A NotebookLM notebook with promoted Notes is not stateless. The sources persist. The Notes persist. The promoted Notes persist in the retrieval corpus. Your analytical work from session one is part of what generates output on session ten. You are not starting over each time.

This is not a small difference. It means the notebook is capable of being shaped toward a specific analytical problem in a way that a general chatbot cannot sustain. The model's capabilities are the same. What differs is the context it operates in — and context determines most of the quality of the output.

If you use NotebookLM only through the chat interface, ignoring Notes, you are getting roughly the same experience you would get from a chatbot with your documents pasted in. The Notes system is the mechanism that makes the tool more than that.

---

## Worked Exercises

1. Open a notebook with 2–3 sources. Write a Note that states your hypothesis or the core question you're bringing to the material. Keep it under 100 words. Where the hypothesis touches a specific claim in the sources, insert a citation.

2. Click the options on the Note and select **Add to sources** (or **Promote to source**). Confirm it appears in your Sources list with a Note icon.

3. Generate a **Briefing Doc**. Read through it with one question in mind: is there a place where the output reflects your framing, your hypothesis, your organizing frame — rather than what's simply prominent in the original sources? Mark it.

4. Remove the Note from Sources (or create a fresh notebook with the same sources but without the promoted Note). Generate the same Briefing Doc. Compare the two. The difference is the value the Note contributed.
