# Chapter 4 — Audio Overview and Interactive Mode
*The podcast you didn't write, and what happens when you talk back.*

---

## What Audio Overview Actually Generates

Audio Overview is not a summary you listen to. It is a synthesized conversation — two AI hosts who talk through the material in your notebook like a podcast. They reference specific claims, quote sources indirectly, push back on each other, and occasionally signal uncertainty. The format is designed to feel like a discussion, not a reading.

The system pulls from every source in the notebook simultaneously. It does not work through documents in order. It synthesizes across all of them, which means connections between sources will surface in the audio that you might not have found by reading serially. That is the feature's main value.

Typical output runs 10–20 minutes depending on corpus size. The exact length is not configurable directly — it is a function of how much material NotebookLM finds significant. A small corpus produces a shorter episode. A large corpus does not necessarily produce a longer one; the model compresses.

The hosts do not read verbatim. They paraphrase, interpret, and occasionally editorialize. This matters when you cite anything you heard: go back to the source passage and verify the original language. The hosts will sometimes smooth over a nuanced claim or overstate a conclusion that the source hedges.

Audio is generated once and then available for playback. It is not a live summarization.

---

## Why the Default Output Is Generic

The default prompt produces general coverage. If your notebook contains three papers on antibiotic resistance and a WHO policy brief, the default Audio Overview will discuss antibiotic resistance in broad terms. It will hit the main themes. It will not make the editorial decisions a domain expert would make about which claims are most contested, which findings replicate, or what the policy brief gets wrong.

Here is what that looks like in practice:

**Default prompt (implicit):** Summarize the notebook.

**Result:** A 12-minute episode that covers the general landscape, mentions the key papers, notes the WHO brief, and ends with a call for more research. Accurate. Not particularly useful if you already know the field.

**Targeted prompt:** "Focus on the methodological disagreements between the three lab studies. Ignore the WHO brief. Emphasize claims that contradict each other. Target 8 minutes."

**Result:** An episode that surfaces the specific points of friction between studies, flags where sample sizes differ, and names the assumptions that drive different conclusions.

The targeted version takes 30 seconds more to set up. The difference in usefulness is not marginal.

---

## Customization Options

Before generating, you can give NotebookLM instructions for the Audio Overview. These go in the customization field at generation time.

You can specify:

- **Focus area.** Name a subtopic, question, or lens. ("Focus on implementation challenges, not theoretical background.")
- **What to skip.** Exclude sources or topics you don't need covered. ("Skip the introductory material — I already know the basics.")
- **Tone.** More technical, more accessible, more critical. The model can shift register.
- **Emphasis.** Tell it what matters most. ("Spend the most time on the findings from the longitudinal studies.")
- **Rough length target.** You cannot set this precisely, but signaling "keep it under 10 minutes" or "go deep" moves the output in the right direction.

You cannot control the exact runtime, the voice selection, or the specific sentences the hosts use. Those are fixed. What you can control is the editorial direction, and that is what makes the difference.

---

## Interactive Mode

Interactive Mode changes what you are doing. You are no longer a listener. You are a participant.

In Interactive Mode, you can pause the audio and ask a question. The hosts answer from the sources in your notebook — not from general knowledge. If the answer is not in your corpus, they say so. That ground truth constraint is what makes Interactive Mode useful for research rather than just orientation.

The hosts' answers in Interactive Mode function like a Chat response with audio delivery. Each answer is grounded in source passages. You can follow up. You can ask for more detail on something that came up in the episode. The conversation goes where you direct it.

This changes the cognitive demand. Passive listening is low-effort processing — useful for a first pass or for material you want to absorb while doing something else. Interactive Mode requires you to formulate questions, evaluate answers, and decide where to probe next. That is active engagement, and it produces different outputs: notes you take, follow-up questions you generate, gaps you identify.

<!-- → [FIGURE: Audio Overview vs. Interactive Mode — two-column comparison: what the listener does, what the AI does, what gets cited, best use case. Caption: The difference is cognitive mode. Audio is receiving. Interactive is producing.] -->

![Two-column comparison of Audio Overview versus Interactive Mode showing what the listener does, what the AI does, how citations work, and best use case for each](images/04-audio-overview-and-interactive-mode-fig-01.png)
*The difference is cognitive mode. Audio is receiving. Interactive is producing.*

---

## When to Use Audio vs. Interactive

**Use Audio Overview when:**

- You are doing a first pass on an unfamiliar corpus and want orientation before reading.
- You want to process material during a commute, workout, or other context where you cannot read.
- You have a large notebook and want to hear which themes surface before deciding where to invest reading time.
- You want to share a synthesized overview with someone who has not read the sources.

**Use Interactive Mode when:**

- You have a specific question that the audio raised or didn't answer.
- You need a citation. Interactive answers link to source passages; passive audio does not.
- You want to test whether a particular claim is actually supported in your corpus.
- You are actively working through a problem and need the material to respond to your current thinking.

The two modes are not mutually exclusive. A productive sequence: listen to the Audio Overview first, note the moments where you want more depth or a source, then switch to Interactive and probe those specific points.

---

## Limits

**Platform differences.** On some platforms, Audio Overview cannot be paused and resumed mid-session. If you close the tab, you may need to start from the beginning. Check the platform before you rely on a long session.

**No editing.** The generated audio is fixed. If the hosts misrepresent a claim or you want different emphasis, you regenerate with a new prompt. There is no way to edit a clip or splice in a correction.

**Accuracy drift on nuance.** The hosts simplify. A claim that a paper states with three conditions attached may come out in the audio as a flat assertion. Do not quote the audio as a source. Quote the source passage the audio is synthesizing.

**No transcripts by default.** If you need a searchable record of what the Audio Overview said, you will need to use external transcription tools. NotebookLM does not currently provide a built-in transcript for Audio content.

---

## Worked Exercises

1. Load 2–3 sources into a notebook. Click **Generate** on Audio Overview using the default prompt. Listen for 5 minutes. Write down: What did it cover first? What specific claims did it surface? What did it not mention that you expected?

2. Regenerate the Audio Overview. Before clicking **Generate**, open the customization field. Write a targeted prompt: name the specific subtopic you care about, specify one thing to skip, and indicate whether you want a shorter or longer episode. Listen to the new version. Note the difference in editorial focus — is the output more useful for your actual question?

3. Switch to **Interactive Mode**. Ask three specific questions — make them questions where the answer must come from your sources, not from background knowledge. After each answer, click the source link provided. Verify that the passage the host cited actually supports the claim as stated. Note any cases where the answer overstated or smoothed the source.

---
