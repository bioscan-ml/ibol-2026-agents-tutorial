# Exercise 2: Plan before you run

Most of my work with agents follows the same order: explore, then plan, then execute. The agent first reads the material, then we agree a written plan, and only then does it change anything. In this exercise you do that for an analysis of your own. The planning step uses a skill that questions you about the analysis before any plan is written.

Bring an analysis you are actually planning: a summary of your own BOLD export, a comparison of BINs and morphological identifications, a figure for a paper. Work on a copy of your data in a new folder, not on the only copy.

## Step 1: Set up the grill-me skill

Matt Pocock publishes a skill called grill-me in <https://github.com/mattpocock/skills> (MIT licence). It is not copied into this kit; you install it the way I install most skills, by pointing the agent at the repository. Open your analysis folder in your agent and ask:

```text
Read the grill-me skill in https://github.com/mattpocock/skills (skills/productivity/grill-me) and set it up as a skill for this project, together with the grilling skill it uses. Show me what you installed.
```

Claude Code asks your permission before writing into `.claude/`; allow it. Read what it installed. Both `SKILL.md` files are short, and there is no code in them, only instructions in English.

## Step 2: Explore

Start a new session, so the agent picks up the new skills. Before any questions, let the agent see the material:

```text
Look through this folder and describe the data: the files, the columns, how many records, anything that looks odd. Do not change anything.
```

Check its description against what you know about your data. If it has misread something, say so now; everything after this builds on it.

## Step 3: Be questioned

In Claude Code, type `/grill-me` and then a few sentences about the analysis you want. In Codex or Antigravity, ask for the grill-me skill by name. If your agent has a plan mode, leave it off for this step: the skill's author notes that plan mode pushes the agent to produce a plan when you want it to keep asking.

The agent asks its questions in rounds, each with its recommended answer. Answer them yourself. Accepting every recommendation feels productive but decides nothing; push back, say "I don't know" when you don't, and say when it has drifted from what you meant. You are the domain expert here.

## Step 4: Write the plan to a file

The grill-me skill writes nothing down, so ask for that explicitly when the questions end:

```text
Write the plan we agreed to plan.md: the question, the data and filters, each step of the analysis, and what each step should produce. Do not run anything yet.
```

Open `plan.md` in any text editor and change it until it says what you would do yourself. This is the point where your judgement does the most good, because a wrong step is cheapest to fix before anything has run.

## Step 5: Execute, one step at a time

```text
Read plan.md as I edited it. Carry out step 1 only, then stop and show me the result.
```

Check each result before you ask for the next step. If a result is wrong, correct the plan, not only the output, so later steps start from the right place.

Afterwards, compare `plan.md` with what you would have typed as a single request at the start. The difference is usually what the agent would otherwise have guessed.
