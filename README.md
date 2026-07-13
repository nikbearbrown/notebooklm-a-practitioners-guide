# NotebookLM: A Practitioner's Guide

**Features, Workflows, and Limits**

A direct feature walkthrough for researchers, analysts, writers, and professionals who want to use NotebookLM effectively — and know exactly where it will fail them.

---

## What This Book Is

NotebookLM answers only from documents you give it. Every feature — chat, audio, mind maps, notes, outputs — is an application of that one architectural fact. Understanding the boundary makes every feature predictable.

This book maps the features, explains what each one actually does, and shows you when to reach for each. Every chapter that covers a hands-on feature includes a **Worked Exercises** section: numbered steps, exact UI labels, and a described expected output so you know whether it worked.

---

## Chapters

| # | Chapter | What it covers |
|---|---|---|
| 1 | The Bounded Tool | The retrieval-augmented architecture; how it differs from a general chatbot |
| 2 | Sources | File types, upload limits, silent ingestion failures, verification discipline |
| 3 | Text Outputs | Briefing Doc, Study Guide, FAQ, Timeline, Outline — what each one does |
| 4 | Audio Overview and Interactive Mode | The podcast you didn't write; what changes when you talk back |
| 5 | Mind Map | Topology vs. argument; orientation, gap-spotting, navigation |
| 6 | Infographics, Slide Decks, Cinematic Video | The advanced outputs; starting points, not finished products |
| 7 | Notes | The feature most practitioners skip; Notes as sources |
| 8 | Notebook Guide | The AI-generated navigation layer; when to use it first |
| 9 | Sharing, Collaboration, and Account Types | What you can share; why the account type matters |
| 10 | NotebookLM Plus | What changes at the paid tier; when it's worth it |
| 11 | Workflows | Research synthesis, writing support, document review, knowledge management |
| 12 | What the Tool Cannot Do | Hallucination, scanned PDFs, real-time gaps, large files, contradictions |

---

## Building the Book

Requires [pandoc](https://pandoc.org/) 3.x.

```bash
bash build.sh
```

Outputs to `output/`:
- `notebooklm-a-practitioners-guide.epub` — EPUB3
- `notebooklm-a-practitioners-guide.html` — standalone HTML

The `output/` directory is excluded from version control. Run the build locally to generate.

---

## Repository Structure

```
chapters/        12 chapter markdown files
images/          13 SVG figures (Okabe-Ito colorblind-safe palette)
styles/          kindle.css, kindle-book.css
cover.svg        Cover (DRAFT)
cover.jpg        Cover image for EPUB
metadata.yaml    Pandoc/EPUB metadata
build.sh         Build script
```

---

## Status

**DRAFT** — Gates unsigned. Do not publish.

- GATE 0 (plan): signed
- GATE 3 (human rewrite): unsigned
- GATE 4 (fact-check): unsigned

---

## Author

**Nik Bear Brown**  
Humanitarians AI Incorporated  
[nikbearbrown@gmail.com](mailto:nikbearbrown@gmail.com)

---

*Built with the AI+1 pipeline. Human writes; AI assists; human signs every gate before publication.*
