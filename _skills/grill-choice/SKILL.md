---
name: grill-choice
description: Grill the user about a plan, decision, or idea one question at a time, with clickable multiple-choice answers. Use when the user invokes /grill-choice or asks to be grilled with choices to pick from.
---

Interview the user relentlessly about their plan until you reach a shared understanding. Ask **one question at a time** and show each one as a clickable multiple-choice card.

## How to ask

- Use the `AskUserQuestion` tool for every question. If it is deferred, load it first with ToolSearch (`select:AskUserQuestion`).
- One question per call. Wait for the answer before asking the next one.
- Give 2–4 options. Put your recommended answer first and end its label with "(แนะนำ)".
- Keep labels short (1–5 words). Put the trade-off of each option in its `description`.
- `header` is a short topic chip, at most 12 characters (for example "เป้าหมาย", "Tech stack", "ขอบเขต").
- The user can always pick "Other" and type their own answer, so do not add an "Other" option yourself.
- Before the card, write one or two short lines: why this question matters and what you recommend.
- Write questions, options and comments in the user's language (Thai if they write in Thai).

## What to ask

- Map the plan as a decision tree. Ask first about the decisions everything else depends on (goal, who it is for, scope), then move outward.
- Each answer reshapes the tree: drop questions it made irrelevant and add the ones it opened up.
- Finding facts is your job. If the answer can be looked up in files, the codebase or existing project material, look it up instead of asking. Only ask the user for decisions.
- Push back when an answer is risky or contradicts an earlier one, then ask a follow-up question about it.

## When done

- Stop when every branch of the tree has been decided and nothing is silently assumed.
- Then summarise every decision as a short numbered list and ask (with `AskUserQuestion`) whether the summary is right.
- Do not start building or acting on the plan until the user confirms.

## If clickable cards are unavailable

If `AskUserQuestion` cannot be called in this environment, still ask one question at a time, as plain text with numbered options (1, 2, 3, ...), the recommended one marked "(แนะนำ)", and let the user reply with a number.
