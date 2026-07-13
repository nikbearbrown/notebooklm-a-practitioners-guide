# Chapter 6 — Infographics, Slide Decks, and Cinematic Video
*The advanced outputs: starting points, not finished products.*

---

## What These Three Outputs Have in Common

Infographics, Slide Decks, and Cinematic Video are the presentation layer of NotebookLM. They take your source corpus and produce artifacts that are ready — or nearly ready — to share with someone who has not read the sources.

None of them is finished without your review and edits.

The model handles volume and consistency: it pulls claims from every source, applies a template, and assembles a coherent artifact faster than you would. What it does not handle is editorial judgment about which claims carry the most weight, which framing serves your audience, and where the generated content is factually off or emphasis-wrong. That part is yours.

All three features are restricted to users 18 and older.

<!-- → [TABLE: Advanced output comparison — columns: Output, What it generates, What you edit, Best use case, 18+ only?. Rows: Infographic / Slide Deck / Cinematic Video.] -->

![Table comparing three advanced NotebookLM outputs — Infographic, Slide Deck, Cinematic Video — showing what each generates, what the user edits, best use case, and age restriction](images/06-infographics-slides-cinematic-video-tbl-01.png)
*All three are starting points. The model handles volume and consistency. You handle the slides and frames that carry the most cognitive weight.*

---

## Infographics

NotebookLM can generate infographics in multiple visual styles. Current styles include statistical (data-forward, chart-heavy), timeline (chronological sequence), comparison (two or more options side by side), process (step-by-step flow), hierarchy (org-chart or classification structure), geographic (location-based), narrative (story arc), how-to (instructional steps), list (ranked or unranked items), and quote-callout (featured text with visual emphasis). The available styles may expand over time.

**Choosing a style.** The style should match the structure of your content. If your sources describe a sequence of events, timeline. If they compare two competing frameworks, comparison. If they present statistical findings, statistical. Do not force an interesting style onto content that does not fit — a hierarchy infographic for content that has no hierarchy will produce a misleading visual.

**What the model does.** It extracts key claims from your sources, selects the most visualizable ones for the style you chose, formats them, and produces the layout. It applies visual consistency you would otherwise spend time on: type sizing, color relationships, spacing.

**What you still do.** Check every factual claim in the output. Infographics compress. A nuanced finding becomes a short label. Compression introduces error. Before you share an infographic externally, verify each labeled claim against the source passage. Adjust emphasis if the model foregrounded a minor finding over the central one. Replace generic visual choices if they do not fit your brand or audience expectations.

**Practical use cases.** Client briefs where the reader has 90 seconds, not 20 minutes. Executive summaries that need to be skimmable at a glance. One-pagers for a meeting where you cannot count on anyone to have read the documents.

---

## Slide Decks

NotebookLM generates a complete slide deck from your sources: title slide, section headers, bullet content on body slides, and citations linking claims back to source passages. You can export the deck to PPTX and open it in PowerPoint or Keynote for editing.

**What gets generated.** The deck follows a standard presentation structure. Slides are organized by theme or section, pulled from the corpus. Citations appear on slides so the source of each claim is traceable. The model does not know your audience, your brand, or your specific argument — it knows your sources.

**Which slides to always manually edit.** Three categories of slide carry the most cognitive weight, and the model is least reliable on all three:

- **Opener.** The opening slide sets the frame for everything that follows. The model will produce something generic. Rewrite it to match your actual purpose and audience.
- **Thesis statement slide.** If your deck is making an argument, the thesis slide is where that argument lives. The model produces a synthesis of what the sources say. That is not the same as the argument you want to make. Edit it.
- **Closing synthesis.** The final slide is where the audience takes away the one thing you want them to remember. The model's closing is usually a summary of what was covered. That is not a conclusion. Write one.

**Which slides are usually acceptable as-is.** Background and context slides. Definition slides. Slides that introduce a framework or present a finding that is a direct extraction from a source. These are lower-stakes, and the model handles them reasonably. Verify facts, but the structure is usually fine.

**Do not regenerate the whole deck to fix one slide.** If a body slide has an error or needs a different emphasis, edit that slide directly in PPTX. Regenerating the entire deck to fix one problem loses any edits you have already made and does not guarantee a better result on the slide you care about.

---

## Cinematic Video

Cinematic Video generates a narrated video from your sources. The narration is synthesized from source content. Visual elements — text overlays, graphics, transitions — are generated to support the narration. The output is a video file.

**Use cases.** Explainer videos for a concept or finding you want to communicate to a non-specialist audience. Onboarding material for a new team member who needs to understand a domain quickly. Overview communication when a recorded walkthrough is more appropriate than a document.

**Limits you need to know before you generate.**

The video cannot be edited after generation. If the narration misstates a claim, if the visual choices are wrong, or if the emphasis is off, you regenerate. There is no timeline editor, no way to swap a clip, no way to overdub a sentence. This makes it a high-stakes generation: get the source quality right and give clear direction before you generate, because revision means starting over.

It is not a replacement for a produced video. A produced video has a script you wrote, a narrator you chose, visuals you selected, and a review cycle. Cinematic Video has none of those. It is fast and it is adequate for many internal and exploratory use cases. It is not adequate when production quality or exact accuracy is required.

---

## The Common Thread

These three outputs reward a specific division of labor. Use the model for the parts where consistency and volume matter: pulling claims across all sources, applying a template, assembling an artifact in a format you would otherwise spend hours on. Reserve your attention for the parts where editorial judgment matters: the opener, the thesis, the closing, the factual spot-checks, the emphasis decisions.

The model handles the scaffolding. You handle the weight-bearing elements.

---

## Worked Exercises

1. Load 2–3 sources into a notebook. Click **Infographic** and choose a style that matches your content structure — if the sources describe a process, choose process; if they compare options, choose comparison. After the infographic generates, identify one specific claim in the output. Find the source passage it came from. Verify that the label on the infographic accurately represents what the source actually says. If it does not, note what was compressed or changed.

2. Generate a **Slide Deck** from the same notebook. Export to PPTX. Open the file. Go directly to the opener slide, the thesis slide, and the closing slide. Rewrite all three. When you are done, note how long that took. Compare it to how long it would have taken to build the full deck from scratch — the model gave you the body slides; you wrote the three that mattered most.

---
