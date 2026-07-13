# NotebookLM Practitioner — CLI Video Ideas ("X with Claude")

> Scout date: 2026-07-12
> Source content: 12 substantive chapters covering the bounded RAG architecture, source ingestion failure modes, text outputs, Audio Overview + Interactive Mode, Mind Map, Infographics/Slides/Video, Notes, Notebook Guide, Sharing/Collaboration, NotebookLM Plus, Workflows, and Limits. Every chapter includes Worked Exercises. Strong BUILD and RESEARCH candidates throughout.

---

## Candidate 01 — "Build the Three-Step Source Verification Checker with Claude"
- Source: notebooklm-practitioner/chapters/02-sources.md
- Lane: BUILD (Claude Code)
- Hook: NotebookLM's Sources panel shows the same icon whether a PDF ingested with 50,000 words or zero. A scanned PDF contributes nothing — and the notebook answers anyway. Claude can write the verification script that catches what the interface hides.
- The artifact: A Python CLI that takes source files and a Q&A test set (CSV: filename, test_question, expected_keyword), runs each through a local RAG stub (TF-IDF + Claude), checks for citation returned + passage match, and outputs a color-coded terminal table: source | words_indexed | citation_found | keyword_match | verdict (PASS / MARGINAL / FAIL).
- Prompt seed: `claude "Write a Python CLI that performs NotebookLM's three-step ingestion verification check. Input: a CSV with columns [filename, test_question, expected_keyword]. For each row: (1) index the file with TF-IDF using sklearn, (2) query the index with the test question, (3) check if the top retrieved chunk contains the expected keyword (case-insensitive). Output a table with rich library: filename | words_indexed | top_chunk_found | keyword_match | verdict (PASS if words>1000 and keyword_match, FAIL otherwise). Use anthropic SDK to confirm the answer is grounded."`
- Read / check: Verify FAIL fires on a file with <100 words (simulating a scanned PDF). Check PASS fires on a text-layer PDF where the keyword appears in the retrieved chunk. Confirm the table renders in terminal with color (green PASS, red FAIL).
- Human supplies: A scanned PDF and a text-layer PDF covering the same content, plus a test CSV with at least 4 rows. The human prepares the test set — that is the real work. Script is fully synthetic.
- Output medium: screen-recording mp4 (terminal showing 4 sources being verified, color table appearing)
- The change: Add an auto-remediation branch: when a PDF fails, run pytesseract OCR on it and re-verify the OCR output — showing the before/after verification result.
- Teardown angle: Silent ingestion failure is the most common cause of bad NotebookLM output — not hallucination, not prompt quality. The verification discipline is what makes the corpus trustworthy. The interface won't tell you. The script will.
- Exclusions: Production RAG pipeline tuning, multi-language OCR, Google Drive API integration.
- Score: 9/10

---

## Candidate 02 — "Build a Multi-Source Contradiction Detector with Claude"
- Source: notebooklm-practitioner/chapters/12-what-the-tool-cannot-do.md + 11-workflows.md
- Lane: BUILD (Claude Code)
- Hook: When sources contradict each other, NotebookLM sometimes blends the positions into a synthetic claim that sounds like consensus. The Briefing Doc says "studies show X" — but one study said X and another said not-X. Claude can build the script that forces the contradiction question.
- The artifact: A Python script that takes a set of document summaries, calls Claude to identify the top 3 contested claims, then for each claim generates a two-column contradiction table: Source A position (with attribution) | Source B position (with attribution) — plus a "synthetic blended claim" showing what NotebookLM would likely output if asked.
- Prompt seed: `claude "Write a Python script that takes a list of document summaries as input and: (1) uses Claude API to identify the top 3 claims where sources most clearly disagree, (2) for each claim, generates a formatted table with three rows: Source A position (with attribution), Source B position (with attribution), and 'likely blended output' (what a RAG system might produce if asked the question without probing for contradiction). Output as markdown. Use anthropic SDK."`
- Read / check: Verify the "likely blended output" is genuinely a synthetic claim that smooths the contradiction (not just a paraphrase of one source). Check that each row includes a source attribution. Confirm the three claims are substantively different (not variations on one theme).
- Human supplies: A set of 3–5 document summaries covering a topic with known contested claims (the human selects the domain). Anthropic API key.
- Output medium: screen-recording mp4 (terminal showing the contradiction table being generated, the "blended output" row appearing last for each claim)
- The change: Add a fourth row: the "explicit contradiction query" — the prompt the practitioner should send to NotebookLM to force it to name the disagreement rather than blend it.
- Teardown angle: Multi-source contradiction blending is the most dangerous NotebookLM failure mode because it looks like synthesis. The output is fluent, cited, and wrong in the specific way that matters most: it hides the disagreement.
- Exclusions: Full systematic review methodology, meta-analysis, inter-rater reliability scoring.
- Score: 9/10

---

## Candidate 03 — "Build the Research Synthesis Workflow Pipeline with Claude"
- Source: notebooklm-practitioner/chapters/11-workflows.md
- Lane: BUILD (Claude Code)
- Hook: NotebookLM's cross-corpus query is where the tool earns its keep — holding 40 papers' methodologies in working memory simultaneously is impossible by hand. Claude can build the complete 6-step synthesis pipeline: upload, orient, cross-corpus query, gap query, Briefing Doc, and verification audit.
- The artifact: A Python script that takes a directory of PDF summaries and a research question, and runs the complete Research Synthesis Workflow: (1) indexes all documents, (2) generates the Notebook Guide questions, (3) runs the cross-corpus methodology comparison query, (4) runs the gap query, (5) generates a Briefing Doc with all results, (6) spot-checks 3 attribution claims and flags discrepancies — all output as a formatted markdown Briefing Doc.
- Prompt seed: `claude "Write a Python script implementing the full NotebookLM Research Synthesis Workflow for a directory of PDF summaries: (1) Build TF-IDF index over all docs, (2) Generate 5 'Notebook Guide' questions the corpus can answer, (3) Run cross-corpus query: 'where do methodologies disagree across papers? Table with source attribution,' (4) Run gap query: 'what questions do these papers leave unanswered?', (5) Assemble results into a markdown Briefing Doc, (6) Spot-check 3 cross-corpus attributions by retrieving the source passage and confirming the claim. Use anthropic SDK."`
- Read / check: Verify the cross-corpus table has at least 3 rows with distinct source attributions. Check that the gap query returns at least 3 distinct unanswered questions. Confirm the spot-check step retrieves actual source passages (not just restates the claim).
- Human supplies: A directory of 5–15 PDF summaries on a research topic. Anthropic API key. The human must curate the source set.
- Output medium: screen-recording mp4 (terminal showing pipeline running step by step, Briefing Doc appearing section by section)
- The change: Add a step 7: Claude synthesizes the gap queries into a prioritized research agenda, ranked by potential impact and evidence density.
- Teardown angle: The cross-corpus query is the tool's highest-leverage feature. Single-document queries use 2% of the capability. The pipeline makes the cross-corpus step the entry point, not the afterthought.
- Exclusions: Full vector database, automatic PDF download, citation manager integration.
- Score: 9/10

---

## Candidate 04 — "Build an Audio Overview Customization Optimizer with Claude"
- Source: notebooklm-practitioner/chapters/04-audio-overview-and-interactive-mode.md
- Lane: BUILD (Claude Code)
- Hook: The default Audio Overview produces general coverage — the kind you could get from Wikipedia. A targeted prompt changes everything: focus, tone, length, what to skip. Claude can generate the optimal customization prompt from a research question in 10 seconds.
- The artifact: A Python CLI that takes a research question + domain + skip list and generates 3 Audio Overview customization prompts: "deep dive" (technical, comprehensive), "orientation" (accessible, under 10 min), and "critical" (surfaces disagreements and contested claims) — each under 100 words, ready to paste into NotebookLM.
- Prompt seed: `claude "Write a Python CLI that takes: research_question, domain, skip_topics (list) as inputs, and generates 3 NotebookLM Audio Overview customization prompts: (1) 'deep dive': technical, covers methodology and findings, no length limit; (2) 'orientation': accessible to non-specialist, under 10 min, leads with context; (3) 'critical': explicitly surfaces disagreements between sources, contested findings, and areas of uncertainty. Each prompt must be under 100 words and explicitly mention the focus, what to skip, and desired depth. Use anthropic SDK."`
- Read / check: Verify the "critical" prompt explicitly asks the audio to surface contradictions between sources. Check the "orientation" prompt specifies a length target. Confirm all three prompts are under 100 words and are copy-pasteable into NotebookLM's customization field.
- Human supplies: A research question from the practitioner's current project. Anthropic API key.
- Output medium: screen-recording mp4 (terminal showing 3 prompts being generated for a literature review question, copy-pasteable output displayed)
- The change: Add a fourth prompt variant: "exam prep" — structured to surface the most testable concepts, with definitions, examples, and common misconceptions.
- Teardown angle: The default prompt is not a neutral choice — it's a menu-position choice. The 30-second customization step changes the editorial direction completely. A well-targeted Audio Overview is 10x more useful than the default.
- Exclusions: Audio file editing, transcript extraction, voice or format customization (not available).
- Score: 8/10

---

## Candidate 05 — "Build a Mind Map Gap Detector with Claude"
- Source: notebooklm-practitioner/chapters/05-mind-map.md
- Lane: BUILD (Claude Code)
- Hook: NotebookLM's Mind Map shows what concepts are present in your corpus — but it cannot show what's absent. Claude can build the gap detector: given a domain and your corpus, what concepts should be there but aren't?
- The artifact: A Python script that takes: (1) a domain description, (2) a corpus (list of document summaries), and uses Claude to: (a) generate the expected concept list for that domain (20 concepts), (b) identify which concepts appear in the corpus (with source attribution), (c) flag missing concepts and estimate whether each gap is a true absence or a labeling difference — output as a structured gap analysis table.
- Prompt seed: `claude "Write a Python script that: (1) takes a domain description and a list of document summaries as input, (2) uses Claude API to generate a 20-concept expected concept list for that domain, (3) for each concept, checks if it appears in the document summaries (with source attribution), (4) for absent concepts, generates a one-line estimate: 'true gap' (concept genuinely missing) or 'labeling difference' (concept present under different terminology). Output as a markdown table: concept | present_in_corpus | source | gap_type. Use anthropic SDK."`
- Read / check: Verify the gap analysis correctly identifies at least one "true gap" and one "labeling difference." Check that present concepts include source attribution. Confirm the output table is valid markdown.
- Human supplies: A domain description and a set of 3–5 document summaries. Anthropic API key.
- Output medium: screen-recording mp4 (terminal showing gap analysis running for a corpus on machine learning fairness, table appearing with gap types highlighted)
- The change: Add a follow-up step: for each true gap, generate a recommended source type to fill it (e.g., "add a regulatory document," "add an empirical study") — turning the gap analysis into a source acquisition plan.
- Teardown angle: The Mind Map's absent nodes are information — either the corpus doesn't engage with a concept or it uses different terminology. The gap detector makes that distinction explicit, before you build analysis on an incomplete corpus.
- Exclusions: Actual NotebookLM Mind Map API access, visual graph rendering, concept embedding comparison.
- Score: 8/10

---

## Candidate 06 — "Research How Source Quality Affects NotebookLM Output with Claude"
- Source: notebooklm-practitioner/chapters/02-sources.md + 12-what-the-tool-cannot-do.md
- Lane: RESEARCH (Claude assistant)
- Hook: NotebookLM's architecture promises grounded output — but if your sources are bad, the output is fluently wrong. Claude can research what the RAG literature says about source quality as the highest-leverage variable in retrieval-augmented systems.
- The artifact: A sourced 3-section brief: (1) the RAG literature on source quality vs retrieval accuracy — what parameters matter most (chunk size, text quality, source diversity), (2) the specific failure modes for low-quality sources in production RAG systems (2023–2025 evaluations), (3) a practical source quality rubric: 5 criteria for evaluating whether a document is likely to ingest cleanly and retrieve accurately.
- Prompt seed: `claude "Research the RAG literature (2022–2025) on source quality as the primary variable in retrieval accuracy. (1) What parameters of source quality most affect retrieval accuracy — text quality, chunk size, source diversity, document structure? Cite 3 studies. (2) What are the most commonly documented failure modes for low-quality sources in production RAG systems? (3) Based on the evidence, produce a 5-criterion source quality rubric for practitioners: what makes a document likely to ingest cleanly and retrieve accurately in a RAG system like NotebookLM? Cite sources throughout."`
- Read / check: Verify citations are real and dated 2022–2025. Check that the rubric criteria are specific enough to be actionable (not "use good documents"). Flag if the literature is too thin on specific parameters — the brief should honestly say so.
- Human supplies: Nothing — Claude synthesizes from published RAG evaluation literature. A practitioner who has run production RAG at scale would add depth.
- Output medium: slate (3-panel brief with the 5-criterion rubric as a scored checklist table, rendered as Remotion)
- The change: Find the one source quality parameter with the largest documented impact on retrieval accuracy, and build a simple test around it (e.g., compare chunk-size variants on retrieval precision).
- Teardown angle: The bounded architecture makes errors findable — but only if the sources are good. "Bad sources produce bad output, fluently" is the practitioner's prime risk. The rubric makes the risk assessable before upload.
- Exclusions: Full embedding model benchmarks, chunking strategy optimization, multi-modal RAG (image+text).
- Score: 8/10

---

## Candidate 07 — "Build a Document Review Workflow with Claude"
- Source: notebooklm-practitioner/chapters/11-workflows.md (Workflow 3: Document Review)
- Lane: BUILD (Claude Code)
- Hook: NotebookLM's document review workflow can extract every commitment, obligation, and risk carve-out from a contract in 20 minutes. Claude can automate the extraction pipeline and add a spot-check step that flags the qualifications that matter most.
- The artifact: A Python script that takes a legal/policy document as input and runs the Document Review Workflow: (1) generates FAQ questions from the document, (2) runs a commitment extraction query, (3) runs a risk/carve-out query, (4) generates a timeline if dates are present, (5) spot-checks 3 obligation items against their cited sections, and outputs a structured review markdown file.
- Prompt seed: `claude "Write a Python script that implements the NotebookLM Document Review Workflow for a legal or policy document. Input: document text. Using Claude API: (1) Generate 8 FAQ questions the document addresses, (2) Extract all commitments/obligations with their section references, (3) Extract all risk carve-outs, conditions, and exceptions that limit the commitments, (4) Extract any dates/milestones as a timeline table, (5) For 3 obligation items, retrieve the exact quoted passage and flag any qualifying language ('provided that', 'unless', 'subject to'). Output as structured markdown. Use anthropic SDK."`
- Read / check: Verify the carve-out extraction catches conditional language ("provided that," "unless"). Check that the obligation items in step 5 include the exact quote, not a paraphrase. Confirm the FAQ in step 1 reflects questions the document actually addresses.
- Human supplies: A legal or policy document (contract, regulation, MOU, policy brief). Anthropic API key. The human must provide the document — and must not act on the output without professional review.
- Output medium: screen-recording mp4 (terminal showing document review running against a public policy document, structured review appearing section by section)
- The change: Add a "jurisdiction check" step: for any legal term in the commitments, flag whether it has jurisdiction-specific meaning that the document doesn't define.
- Teardown angle: The tool shortens the extraction phase — it does not replace professional judgment. The spot-check step is mandatory: the model occasionally drops a qualifier. Any commitment you will act on requires reading the underlying section.
- Exclusions: Legal advice, jurisdiction-specific analysis, full contract lifecycle management.
- Score: 8/10

---

## Candidate 08 — "Build a Notebook Guide Three-Hop Explorer with Claude"
- Source: notebooklm-practitioner/chapters/08-notebook-guide.md
- Lane: BUILD (Claude Code)
- Hook: The Notebook Guide's three-hop method — pick the surprising suggested question, follow it two hops — surfaces the core structure of a corpus faster than linear reading. Claude can simulate the chain from any source text, showing exactly what three hops reveals that going straight to your own questions misses.
- The artifact: A Python script that takes a source text, uses Claude to generate 5 "Notebook Guide-style" questions (questions the text can answer that a reader wouldn't have thought to ask), picks the most surprising, runs two follow-up hops each with a cited passage, and outputs a formatted 3-hop Q&A chain — plus a "what you would have asked" comparison showing what a direct query would have missed.
- Prompt seed: `claude "Write a Python script that: (1) takes a source text as input, (2) uses Claude API to generate 5 'Notebook Guide' questions — questions the reader wouldn't have thought to ask but the text can answer, (3) selects the most surprising question (the one least predictable from the title), (4) answers it with a passage retrieved from the text, (5) generates a follow-up question from the answer, (6) answers that with a passage, (7) generates a third question and answers it. Also: (8) takes a direct user question as input, answers it, and compares what the direct query covered vs what the 3-hop chain surfaced. Use anthropic SDK."`
- Read / check: Verify the most surprising question is genuinely non-obvious (not "what is the main topic?"). Check that each hop's follow-up emerges from the prior answer, not directly from the source. Confirm the comparison section identifies at least one thing the 3-hop chain found that the direct query missed.
- Human supplies: A source text and a direct research question the practitioner would normally ask. Anthropic API key.
- Output medium: screen-recording mp4 (terminal showing 3-hop chain unfolding for a research paper, then the direct query comparison)
- The change: Run the 3-hop chain 3 times from 3 different starting questions and show how different entry points map different regions of the corpus — making the navigation function of the Notebook Guide visible.
- Teardown angle: Three hops from a surprising question covers more corpus than reading linearly. The chain works because each answer reveals something the prior question couldn't see from the same angle. The Notebook Guide is a navigation tool, not a summarizer.
- Exclusions: Full NotebookLM API integration, automatic question ranking by surprise score, multi-notebook comparison.
- Score: 9/10
