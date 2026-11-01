# Glossary

Terms from the talk "Still feeling around: agents for working scientists" (iBOL 2026, Bangkok, 2026-11-02), in alphabetical order.

## Agent

A model running tools in a loop until a task is done (Simon Willison's definition).

## App

The product you use to reach a model: the claude.ai website, the ChatGPT app.

## Artifact

A web page Claude publishes privately on claude.ai, which you can share. The slides for this talk are one.

## Automated review

A second agent that reads every change you commit and reports problems against rules you wrote. I use roborev.

## Coding agent

An agent whose tools are your files and your computer's commands: Claude Code, Codex, Antigravity. Despite the name, the task need not be code.

## Context

Everything the model can see while it works: your request, the files it has read, earlier steps.

## Context compression

When the context fills up, the agent replaces earlier steps with a shorter summary so it can keep working. Details, including instructions, can be lost in the summary.

## Context engineering

Giving the agent the right material (your repository, your wiki, a past session where you solved the problem) rather than writing a cleverer prompt.

## F1 score

A single measure of a detector's accuracy that balances how many of its detections are right (precision) and how many of the real objects it finds (recall). 1 is perfect.

## GPU-hour

One hour on one graphics processor, the usual unit for computing time on a cluster such as those of the Digital Research Alliance of Canada.

## Harness

What lets the model act: read files, run code, search, and keep going over many steps. Ethan Mollick: "a system that lets the AI use tools, take actions, and complete multi-step tasks on its own".

## LLM wiki

A folder of Markdown pages that an agent writes and maintains from your sources (Andrej Karpathy's pattern), so knowledge accumulates instead of being rediscovered each time.

## Model

The trained network you are talking to (Claude Opus, GPT, Gemini). Ethan Mollick: "the underlying AI brains".

## Plan mode

A setting in which the agent may read but not change anything until you approve its plan.

## Pull request (PR)

A proposed change to someone's code on GitHub, which the owner reviews before accepting.

## Skill

A plain-English file (`SKILL.md`) that tells an agent how you want a kind of task done, loaded only when relevant. An open standard: Claude, Codex, Gemini and others read the same files.

## System prompt

Instructions the app or harness gives the model before your request, which you usually do not see.

## Terminal / CLI

The text window where you type commands; CLI means command-line interface. Claude Code started there; it now also runs in the Claude desktop app and on the web.

## Time horizon

METR's measure of agents: the length of task, in a person's working time, that an agent completes successfully half the time.
