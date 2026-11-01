# Exercise 3: Write a skill

A skill is your conventions, written down once, so that the agent follows them every time instead of guessing. The skill in the demo ([skills/bold-summary/SKILL.md](../skills/bold-summary/SKILL.md)) is six rules I would tell a new student on their first day with BOLD data. In this exercise you write one for a convention from your own work.

## Pick one convention

Choose something you correct often, in students' work or in your own. For example:

- How your lab names specimens, samples and plates, so that new records follow the pattern and malformed IDs are flagged rather than fixed silently.
- Which BOLD fields you trust and which you check first, and what to do when a field is empty.
- Your rules for BINs and species: when a BIN with no species name counts as a separate taxon, how to report a BIN that carries more than one species name, and whether interim names count as identified.
- How you want a summary reported: which counts, in what order, with which caveats.

One convention per skill. Several small skills are easier to keep right than one large one.

## What goes in SKILL.md

A skill is a folder containing one file, `SKILL.md`. The file has two parts:

1. A short header with a `name` and a `description`. The name uses lowercase letters, numbers and hyphens, and matches the folder's name. The description says what the skill is for and when to use it. The agent reads only these two fields at the start of a session and loads the rest when a task matches the description, so name the kind of data and task in it.
2. The rules, in plain English. Numbered rules are easy to refer to later ("you broke rule 3").

A sketch, with placeholder rules for you to replace:

```markdown
---
name: lab-specimen-ids
description: Our lab's rules for specimen and sample IDs. Use when creating, checking or summarizing specimen records from our collections.
---

1. <The pattern an ID must follow, with one correct example.>
2. <What to do with an ID that does not match: list it, do not change it.>
3. <Which field holds the ID in our exports.>
```

Keep it short. The demo's skill is six rules in under 200 words. Write each rule as you would say it to a colleague, and include the reason when it is not obvious.

## Add a rule only when something fails

Do not try to anticipate everything. Start with the two or three rules you are sure of, run a real task with the skill in place, and read what the agent did. When it gets something wrong, add one rule that would have prevented it, and run the task again. That is how the demo's skill was written: rule 2, "A specimen is a unique `processid`", is there because one rehearsal run counted rows as specimens.

Expect to delete rules later as well. Models improve, and a rule that was needed last year may now only add noise.

You can also ask the agent to draft the skill. After a session in which you corrected it several times, ask: "Write a skill that captures the corrections I made in this session." Then edit what it writes; it is your convention, not the agent's.

## Where to put it

The same `SKILL.md` works in each agent; only the folder differs. For a skill that belongs to one project, put it inside that project's folder:

- **Claude Code:** `.claude/skills/<name>/SKILL.md`
- **Codex:** `.agents/skills/<name>/SKILL.md`
- **Antigravity:** `.agents/skills/<name>/SKILL.md`. Gemini CLI also reads `.gemini/skills/<name>/SKILL.md`.

Folders whose names start with a dot are hidden by default in Finder and File Explorer. The simplest way to put a skill in the right place is to ask the agent: "Set up this file as a skill for this project."

Each agent reads its skills when a session starts, so start a new session after adding or changing one. Then check that it is used: give the agent a task the skill covers and see whether it follows the rules.
