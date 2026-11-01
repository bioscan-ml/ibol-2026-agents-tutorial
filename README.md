# Agents for working scientists: take-home kit

This kit accompanies my talk "Still feeling around: agents for working scientists" in the workshop "AI for Biodiversity Research: Multimodal Methods for Taxonomic Discovery" at iBOL 2026, Bangkok, on 2026-11-02. It is written for people who use chat assistants such as ChatGPT, Claude or Gemini but have not yet used a coding agent. You can work through it during the question period or afterwards.

Graham Taylor, University of Guelph and Vector Institute

If you meet a term you do not know, it is probably in the [glossary](GLOSSARY.md).

**Slides:** a PDF of the talk, including the backup slides, is attached to the [latest release](https://github.com/bioscan-ml/ibol-2026-agents-tutorial/releases/latest).

## What a coding agent is

A chat assistant answers in text, and you copy the answer out and run it yourself. A coding agent uses the same kind of model, but it can act on your computer: it reads the files in a folder you choose, writes and runs scripts, looks at the output, and tries again until the task is done or it needs you. You describe the task in plain English, and you can see each step it takes.

Despite the name, the task need not be programming. I use agents to summarize data, reproduce someone else's analysis, set up accounts on a computing cluster and organize the material for a talk. What makes an agent useful is the folder you give it and your judgement of what it produces. Ask it only for work you can check.

## Starting without a terminal

Coding agents began in the terminal, the text window where you type commands. You no longer need one. Each of the three large providers offers an agent in an ordinary app:

- **Claude Code** (Anthropic), in the Code tab of the Claude desktop app, or in a browser at [claude.ai/code](https://claude.ai/code). Included with a paid Claude plan. The desktop app works on folders on your own computer, which is what this kit assumes; claude.ai/code works in the cloud on a copy of a GitHub repository.
- **Codex** (OpenAI), in the ChatGPT desktop app. Included with ChatGPT Plus or above.
- **Antigravity** (Google), Google's agent app. Included with Google AI Pro or above.

I use Claude Code every day, so the exercises are written with it in mind and I tested them in Claude Code. Codex and Antigravity read the same skill files, and the requests are plain English, so they should work there too; tell me if they do not.

To start: install the app, sign in, open this kit's folder as the project or workspace, and type a request. Each app has a setting for how much the agent may do without asking you first. Choose the most cautious one, in which it asks before it runs a command or changes a file, until you have seen how the agent works. Give it a folder that holds only what the task needs, and work on a copy of any data you cannot afford to lose.

## Skills

A skill is a short plain-English file, `SKILL.md`, that tells an agent how you want a kind of task done. The agent reads the skill's name and description at the start of a session and loads the rest only when a task calls for it. Skills are an open standard ([agentskills.io](https://agentskills.io)): Claude, Codex and Gemini (including Antigravity) read the same files, so a skill written for one works in the others. Only the folder it goes in differs; see [exercise 3](exercises/03-write-a-skill.md).

## Getting the data

The exercises use public BOLD records for beetles (Coleoptera) collected in Thailand. The data file is not in this kit, because it is about 20 MB and can be fetched in seconds. Either run the script from the kit's folder:

```sh
bash data/fetch-bold.sh
```

or ask your agent:

```text
Run data/fetch-bold.sh and tell me how many rows it wrote.
```

The script downloads the records from the BOLD portal API to `data/bold-thailand-coleoptera.tsv` and removes the `identifier_email` column. It needs `bash`, `curl` and `python3`, which most macOS and Linux computers have; on Windows, ask your agent to run it. On 2026-10-28 the file had 12,003 rows. BOLD is updated continually, so a later download may differ slightly. If you are on a slow connection, fetch it before you start.

## Exercises

1. [Run the demo yourself](exercises/01-run-the-demo.md): the task from the talk, twice without a skill and once with it, with the answers so you can check.
2. [Plan before you run](exercises/02-plan-before-you-run.md): have an agent question you about an analysis you are planning, then write the plan to a file you edit before anything runs.
3. [Write a skill](exercises/03-write-a-skill.md): write down a convention from your own field so the agent follows it every time.

## What else is here

- [GLOSSARY.md](GLOSSARY.md): the terms from the talk, in plain words.
- [READING.md](READING.md): what I would read next, with links and dates.
- [skills/bold-summary/SKILL.md](skills/bold-summary/SKILL.md): the skill from the demo.
- [data/fetch-bold.sh](data/fetch-bold.sh): the script that fetches the data.
