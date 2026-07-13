# Chapter 12 — What the Tool Cannot Do
*The honest limit chapter. Every capability claim has a boundary. Here are the ones that matter.*

---

NotebookLM's limits are specific, predictable, and diagnosable. Each produces a recognizable failure signature — output that looks plausible but is wrong. Six limits. For each: what failure looks like, how to detect it, what to do.

<!-- → [TABLE: Limit reference — columns: Limit, What failure looks like, Detection method, Mitigation. Rows: Hallucination / Scanned PDF / Embedded images / Real-time info / Large file truncation / Multi-source contradictions.] -->

![Limit reference table for NotebookLM covering hallucination, scanned PDFs, embedded images, real-time information gaps, large file truncation, and multi-source contradictions with detection methods and mitigations for each](images/12-what-the-tool-cannot-do-tbl-01.svg)
*These limits are specific and diagnosable. Learn the signature of each before you depend on the output.*

---

## Hallucination (Still Possible)

The bounded architecture reduces hallucination substantially. It does not eliminate it. The model paraphrases — and in doing so can soften a qualification, conflate two similar passages, or produce a claim that sounds like a reasonable inference from the source but is not in it. The passage is real. The citation is real. The model's version is not quite right.

**What failure looks like.** The response is fluent and cites a real passage. When you read the passage, the claim is slightly off — a hedge dropped, two findings merged, meaning shifted in a direction that matters.

**How to detect it.** Click the citation. Read the passage. The citation is not a green light — it is a pointer to where you check.

**What to do.** For any claim you intend to use: click the citation, read the passage, confirm the model's version matches — including qualifications. Never act on a claim without reading what it cites.

---

## Scanned PDFs and Image-Heavy Files

If a PDF is a scanned image — a photographed page, a fax, a re-scanned document — there is no text layer for the retrieval system to index. The upload succeeds. There is nothing to retrieve.

**What failure looks like.** The response draws from other loaded sources or produces generic output. Citations to the scanned file point to vague sections with no specific passage.

**How to detect it.** Ask a specific factual question whose answer you know is in the document — a number, a name, a date. If the model cannot cite the passage or retrieves the answer from elsewhere, the file was not ingested.

**What to do.** Use text-layer PDFs. If you have a scanned document, OCR it first — Adobe Acrobat, Google Drive, and Tesseract all produce text-layer PDFs. Re-upload and verify with the factual-question test. Do not assume ingestion succeeded because the upload completed.

---

## Embedded Images and Tables

Figures, charts, and complex tables inside PDFs are not extracted as data. The model reads the caption and surrounding text. It does not read the chart. In scientific papers, financial reports, and regulatory filings, the most important content may be in a figure the model cannot access.

**What failure looks like.** You ask about a figure's data. The model describes the caption and surrounding text — not the values, trends, or comparisons in the chart itself.

**How to detect it.** Ask about a specific data point in a figure: a value, a trend direction, a comparison. If the answer refers only to the caption, the figure was not read.

**What to do.** Extract key data from figures and add them as a Note: "Figure 3 shows [values, trends]." Promote to source if the data matters for your queries. For tables, check whether the PDF renders them as selectable text — if so, the model can read them.

---

## Real-Time Information

The corpus is static. Documents published after your upload are not there. The model does not update automatically. It also has a training cutoff for background knowledge — if you ask about something not in your corpus and newer than that cutoff, the model may answer anyway from stale data.

**What failure looks like.** You ask about a recent development. The model answers from sources that predate it. The response is internally consistent with the corpus but out of date.

**How to detect it.** Ask about a recent event that occurred after your most recent uploaded document. Note whether the model acknowledges the gap or answers anyway.

**What to do.** Upload current documents before synthesis queries on time-sensitive topics. The corpus is only as current as what you have put in it.

---

## Very Large Single Sources

Extremely large individual files may be truncated at ingestion. A very long document — a full regulatory docket, a multi-volume report — may be indexed only in part.

**What failure looks like.** Queries about the later portions return nothing or cite other sources. Early portions retrieve normally.

**How to detect it.** Ask about a passage in the document's final quarter. If the response does not cite it, the document was likely truncated at ingestion.

**What to do.** Split large documents before uploading — three 100-page sections will be indexed more completely than a single 300-page file. Verify ingestion on the latter sections before building analysis on them.

---

## Multi-Source Contradictions

When sources contradict one another, the model sometimes blends the positions rather than naming the contradiction. The output reads as a coherent finding. It is a false average. This is the most operationally dangerous limit: it does not look like failure — it looks like synthesis.

**What failure looks like.** Two sources disagree on effect size or conclusion. The Briefing Doc presents a single synthetic claim that smooths the disagreement. The reader does not know they disagree.

**How to detect it.** Ask explicitly: "Do any uploaded sources disagree about [specific claim]? Which hold which position?" Run this for any claim central to your analysis. Do not assume the model surfaces contradictions in standard outputs.

**What to do.** Probe directly. When a cross-corpus query returns a synthetic-sounding claim on a point where disagreement is possible, run the explicit contradiction query. The model surfaces it when asked.

---

## The Pattern

Every limit here has the same structure: the output looks plausible. No error message. The response is fluent, cited, formatted. The problem is in what it says.

The architecture makes errors findable — the citation points you to where you check. It does not find errors for you. Know the signatures. Run the checks.

---

## Worked Exercises

1. Upload a scanned PDF or any image-based PDF. Ask a specific factual question whose answer you know is in that document — a name, a number, a date. Document whether the response cites the file with a specific passage. Then upload a text-layer version of the same document and run the same query. Compare the two responses.

2. Ask the model about a specific recent event that occurred after your most recent uploaded document — a published paper, a regulatory change, a news event. Note what the model says. Does it acknowledge it has no source covering this? Does it answer anyway? Document the response and evaluate whether it would have misled you if you had not known to probe it.

**Expected output:** Exercise 1 — a concrete example of failed versus successful ingestion. Exercise 2 — whether the model signals the limit or papers over it.
