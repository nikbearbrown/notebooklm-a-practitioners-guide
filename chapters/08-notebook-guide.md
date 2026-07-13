# Chapter 8 — Notebook Guide
*The AI-generated navigation layer. Use it first when you don't know what to ask.*

---

## What Notebook Guide Generates

When you upload sources, NotebookLM generates a Notebook Guide automatically. It appears in the right panel alongside your Notes. It does not require you to ask for it.

The Guide contains three things: a set of suggested questions drawn from the actual content of your sources, a summary of key topics, and — in notebooks with multiple sources that cover distinct ground — a source index indicating which documents address which themes.

The suggested questions are the most useful part. They are calibrated to what is actually in your corpus, not to what you expected to find there. That distinction is the whole point.

---

## When to Use It First

Use Notebook Guide first when you are entering an unfamiliar corpus. You uploaded papers on a topic you're beginning to research. You pulled in a collection of documents for a new project. You have sources that were handed to you, not selected by you. You don't yet know what the material contains well enough to form a good question.

In these situations, asking your own first question is a liability. You ask about what you already think matters. The model answers from that frame. You get confirmation of your prior, not a map of the territory.

The Notebook Guide's suggested questions were constructed by the model after it read everything in the corpus. They reflect the structure of what's actually there. The question that surprises you — the one you wouldn't have asked — is the one most likely to open new ground.

---

## When to Skip It

Skip Notebook Guide when you already know what you're looking for. You have a specific hypothesis to test. You have a defined set of queries. You've worked with this corpus before. You're running the same kind of analysis you've run on similar material a dozen times.

In those cases, the Notebook Guide's suggestions are a distraction. They reflect the corpus's most prominent themes — which you already know. Go directly to the chat and ask what you came to ask.

The Guide is navigation assistance for the unfamiliar. It is not useful when you're not lost.

---

## How to Use the Suggested Questions

Don't treat the suggested questions as a menu to browse. Pick one and follow it.

The method is three hops.

**Hop one:** Pick the suggested question that is most surprising to you. Not the one you would have asked — the one you wouldn't have thought to ask. Ask it in the chat. Read the full answer. Read the citations. Note what the answer contains.

**Hop two:** From what the answer revealed, formulate your next question. Not a variation on the original — a question that comes directly from what the answer told you. Ask it. Read the full answer. Read the citations.

**Hop three:** Do it again. Ask a question that follows from the second answer.

<!-- → [FIGURE: Three-hop question chain from Notebook Guide — start: suggested question from Notebook Guide → answer with citations → follow-up question from the answer → answer with citations → third question from the second answer → answer. Caption: Three hops from a suggested question usually surfaces the core structure of the corpus.] -->

![Three-hop question chain showing progression from Notebook Guide suggested question through two follow-up questions, each answered with source citations](images/08-notebook-guide-fig-01.svg)
*Three hops from a suggested question usually surfaces the core structure of the corpus.*

Three hops from a single surprising question will take you deeper into the corpus than skimming every source in the notebook. The chain works because each answer reveals something the previous question didn't address — and the model always grounds answers in citations, so you can verify the path.

After three hops, you know the terrain. From there, you can ask the questions you came with. Now they're better questions because they're informed by what's actually there.

---

## The Source Index

In notebooks with multiple sources that don't all cover the same ground — a mix of empirical papers, policy documents, and practitioner reports, for example — the Notebook Guide may include a source index. It maps which sources address which topics.

Use the source index when you want to query against a subset of your corpus. If you're working on a specific angle and only some of your sources are relevant, knowing which ones up front saves you from reading model answers sourced from documents that aren't germane.

The source index also surfaces gaps. If you have seven sources and only two of them address the topic you're most interested in, the index makes that visible. You can decide whether to add more sources before you generate outputs that depend on coverage you don't have.

---

## Limits

**The Guide is static.** If you add sources after the initial upload, the Notebook Guide does not automatically update. The suggested questions and topic summary reflect the corpus at the time it was generated. To get a Guide that reflects the full, updated corpus, regenerate it manually. The option is available in the Guide panel.

This matters when you're building a notebook iteratively. If you add three papers that substantially change the coverage, the original Guide may send you toward questions that the new material has already answered — or that are now less central than the new material suggests.

**The suggested questions are sampled, not exhaustive.** The model does not generate a complete list of questions the corpus could answer. It generates a useful sample. There will be questions that are not suggested — including some that matter to your specific project. The Guide is a starting point, not a ceiling. Once you've used it to orient yourself, move to your own queries.

**The Guide summarizes, it does not synthesize.** The key topics summary reflects what's prominent across the corpus. It is not an analysis of tension, contradiction, or gap. Use it for navigation. Use the chat for analysis.

---

## Worked Exercises

1. Upload 3–5 documents on a topic you're currently researching. Open **Notebook Guide**. Read through the suggested questions before you do anything else in the notebook.

2. Pick the suggested question that is most surprising to you — the one you wouldn't have thought to ask on your own. Ask it in the chat.

3. Follow the three-hop chain: read the answer fully, including citations. Write your own follow-up question from what the answer revealed. Ask it. Read that answer. Ask one more question from what it revealed. Stop after three hops.

4. Write one sentence: what did the chain surface that you wouldn't have found by going directly to the sources with your original questions? That sentence is the practical value the Notebook Guide delivered.
