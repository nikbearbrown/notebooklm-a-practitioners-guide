# Chapter 2 — Sources
*What you can upload, what happens when you do, and how to know if it worked.*

---

The Sources panel accepting a file is not confirmation the file was read.

This is the most important thing to understand about how NotebookLM works, and the most commonly missed. The interface shows you a list of sources. Everything in the list looks the same — same icon, same status. But what's behind the icon varies enormously. Some sources extracted cleanly. Others extracted partially. Others contributed nothing — no text, no content, nothing — while the notebook kept answering from whatever else you gave it.

Silent ingestion failure is the most common cause of bad output in NotebookLM. Not hallucination. Not prompt failure. The source didn't load, the notebook didn't say so, and you built work on top of a gap.

Verification isn't a one-time setup step. It's a discipline you apply every time you add a source.

---

## What You Can Upload

NotebookLM accepts a wider range of source types than most people expect. The current list:

- **PDFs** — text-based or scanned
- **Google Docs** — syncs from Drive
- **Google Slides** — slide decks from Drive
- **Google Sheets** — spreadsheet data from Drive
- **Plain text and Markdown files** — .txt, .md
- **Audio files** — MP3, M4A, WAV, and similar
- **YouTube URLs** — transcribed from captions
- **Website URLs** — scraped at time of upload
- **Copied text** — paste directly into the source input

Each source type has a different ingestion path, different failure modes, and different reliability. Knowing the list is the start. Knowing what happens to each type after you upload it is what actually matters.

<!-- → [TABLE: Source types — columns: Source type, How to add, Character limit, Silent-failure risk. Rows: PDF (text), PDF (scanned), Google Doc, Google Slides, Google Sheet, Plain text/Markdown, Audio file, YouTube URL, Website URL.] -->

![Table of NotebookLM source types showing how to add each, character limits, and silent-failure risk for PDF text, PDF scanned, Google Docs, Slides, Sheets, plain text, audio, YouTube URLs, and website URLs](images/02-sources-tbl-01.png)
*The Sources panel tells you a file was accepted. It does not tell you it was read. Run the three-step verification before you trust any output.*

---

## Upload Limits

NotebookLM enforces limits at two levels: per notebook and per source.

**Per notebook:** Free accounts can add up to 50 sources per notebook. Google One AI Premium subscribers (the paid tier) can add up to 300.

**Per source:** Each source is capped at approximately 500,000 words. For most documents this isn't a binding constraint — a standard research paper runs 5,000–10,000 words, a long report might reach 50,000. But for long transcripts, full-length books, or large datasets, the cap matters. Text beyond the limit is silently truncated. The notebook doesn't tell you where the cutoff happened.

**Audio:** Long audio files get transcribed up to the per-source word limit. If your recording runs past that point, the later content doesn't exist in the notebook. There's no visible indicator of where the transcript ends.

**YouTube:** The notebook transcribes from the video's caption track. Videos without captions — or with auto-generated captions that are heavily corrupted — yield an unreliable or empty transcript. Check before you build on a YouTube source.

**Websites:** The notebook scrapes at upload time and does not update automatically. If the page changes after upload, the notebook is working from the old version.

---

## How Ingestion Works

When you upload a source, NotebookLM runs it through an extraction pipeline before anything reaches the language model. The pipeline's job is to pull out the text content in a form the model can work with.

For text-based PDFs, this usually works well. The PDF contains actual character data; the extractor pulls it. For Google Docs and plain text, it works reliably — these formats exist as structured text. For audio and YouTube, the pipeline runs a transcription step first, then feeds the transcript to the model.

The failure cases all share the same structure: the extraction pipeline encounters a format it can't handle, extracts little or nothing, and doesn't surface that failure in the interface. The source stays in your list. The notebook answers from other sources, or falls back on weak inference, and produces output that looks plausible.

---

## Silent Failures

Five failure modes account for most of the problems practitioners run into.

**Scanned PDFs.** A PDF created by photographing pages contains images, not text. The extraction pipeline has nothing to pull. The source lists in the panel, the notebook accepts it, and the content contributes zero words to your corpus. This is the highest-risk failure mode — it's common (many PDFs from older documents are scanned), completely invisible, and easy to miss if you're not checking.

**Heavy formatting and complex layouts.** Two-column academic papers, PDFs with large embedded tables, documents where the main content is structured as images or figures — these extract unevenly. Some sections come through clean. Others get scrambled or dropped. The model answers from whatever extracted correctly, which may be less than half the document. You can't tell from the Sources panel which sections made it.

**Password-protected files.** If a PDF requires a password to open, the extraction pipeline can't access it. The file may or may not appear in your sources depending on when the failure is caught. Either way, no content is available.

**Audio and YouTube with caption problems.** Long audio files get truncated at the word limit. YouTube videos without accurate captions yield corrupted or empty transcripts. Auto-generated captions for heavy accents, technical vocabulary, or fast speech are often substantially wrong. Every output built on a bad transcript inherits those errors.

**Google Docs modified after upload.** The notebook indexes the document at upload time. If you update the doc later, the notebook may be working from an older version. The sync isn't always immediate, and the interface doesn't display a version timestamp. If you're maintaining a living document and feeding it into a notebook, re-upload when the content changes.

<!-- → [FIGURE: Three-step ingestion verification sequence — Step 1: ask a specific factual question from a known passage; Step 2: click the citation chip; Step 3: confirm the highlighted passage matches. Caption: If Step 3 fails, the source did not ingest. Find the file format problem before you trust the output.] -->

![Three-step verification sequence: Step 1 ask a specific factual question, Step 2 click the citation chip, Step 3 confirm the highlighted passage matches the claim](images/02-sources-fig-01.png)
*If Step 3 fails, the source did not ingest. Find the file format problem before you trust the output.*

---

## Verification Discipline

The Sources panel can't tell you whether ingestion worked. You have to ask the notebook a question it can only answer if it has your content.

The three-step check:

**Step 1 — Ask a specific factual question.** Pick something with a precise, identifiable answer in the source — a figure, a name, a date, a defined term. Not "summarize this document." Something that requires the notebook to retrieve a specific passage. If the source isn't there, the answer will be wrong, vague, or drawn from other sources.

**Step 2 — Click the citation.** NotebookLM should return a citation chip alongside its answer. Click it. The source pane should jump to a highlighted passage in the relevant document.

**Step 3 — Confirm the passage matches.** Read the highlighted text. Does it actually contain the information you asked about? If the citation points to a passage that's vaguely related but doesn't contain the specific answer — or if there's no citation at all, or the citation points to a different source entirely — the source didn't ingest correctly.

If Step 3 fails, stop. Don't continue working with that notebook until you've resolved the source problem. Everything downstream of a failed source is unreliable.

This check costs two minutes per source. Run it every time you add something new. Run it again if you're returning to a notebook after the source documents may have changed.

---

## What to Do When Ingestion Fails

When a source fails the three-step check, the diagnosis usually falls into one of a few paths.

**Scanned PDF:** Convert to text first. Run OCR on the file using a tool like Adobe Acrobat, ABBYY FineReader, or even Google Drive's built-in OCR (upload the PDF to Drive, then open it with Google Docs — Drive will offer to extract the text). Export the extracted text as a new PDF or paste it as a plain text source. Then re-verify.

**Heavy-layout PDF:** Export the content as plain text from the original application if possible, or paste the relevant sections directly into NotebookLM as a copied-text source. This bypasses the extractor and guarantees the content lands.

**YouTube with bad captions:** Download the video's auto-generated captions if available and clean them manually, or find a manually transcribed version. Paste the corrected transcript as a text source.

**Large document hitting the word limit:** Split the document into sections and upload them as separate sources. Label each clearly so you know which section contributed to which answer.

**Google Doc out of sync:** Remove the source and re-add it from Drive. This forces a fresh index.

---

## One Pattern Behind All Failures

Every silent failure has the same structure: something went wrong between the file and the text that reaches the model, and the interface didn't surface it.

NotebookLM is not going to add a visible extraction quality indicator anytime soon — that feature doesn't exist as of this writing. So the discipline falls on you. The three-step verification check is the only mechanism available for confirming that a source actually contributed content to your notebook.

This isn't a criticism of the tool. It's a structural fact about how ingestion pipelines work. Any system that accepts files from the wide variety of formats NotebookLM accepts will have edge cases where extraction degrades or fails. The question is whether you know when it happened.

Run the check. Don't assume. The cost of assuming is building work on a notebook that isn't grounded in what you think it's grounded in — and not discovering that until you're presenting the output to someone who catches the error.

---

## Worked Exercises

**Exercise 1 — Three source types, three verifications**

1. Create a new notebook.
2. Upload a text-based PDF — a research paper, a report, or any document you know well.
3. Add a website URL — a long article or organization page with substantial text content.
4. Add a YouTube video URL — a talk or presentation with a known transcript.
5. For each source, run the three-step verification check: ask a specific factual question, click the citation, confirm the passage. Record what you find for each source — did the citation appear? Did it point to the right passage? Did the passage match the answer?

**Exercise 2 — Deliberate failure**

1. Locate a scanned PDF — an older document, a photographed page, anything created by scanning rather than digital authoring. If you don't have one, most government archives and older academic databases have scanned documents.
2. Upload it to the notebook alongside a text-based source.
3. Ask a factual question that should be answerable from the scanned PDF.
4. Run the three-step check. Document what happens: Does the notebook cite the scanned source? Does clicking the citation reveal a readable passage? Does the passage match the question?
5. Compare the result to the same check on the text-based source.

**Expected output:** A clear record of what successful verification looks like versus what failure looks like. At minimum, you should have caught one ingestion failure through the three-step check rather than through a downstream mistake in your work product.
