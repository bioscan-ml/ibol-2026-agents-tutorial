# Reading list

What I would read after the talk, roughly in the order I would read it. Dates are publication dates; links checked 2026-10-28.

## Getting started

- **Ethan Mollick, "A Guide to Which AI to Use in the Agentic Era"**, One Useful Thing, 2026-02-18. <https://www.oneusefulthing.org/p/a-guide-to-which-ai-to-use-in-the>. The clearest account I know of the difference between a model, the app you use to reach it and the harness that lets it act.
- **John Platt on Latent Space, "An Oscar, Two Asteroids, and the Algorithm in Your sklearn"**, 2026-09-22. <https://www.latent.space/p/john-platt>. The source of the talk's title. The chapter from 1:29:19, "Scientific Taste, Domain Expertise, and Learning the Hard Way", is where he discusses what scientists should do now and why domain expertise is not going away.

## Context: what the agent sees

- **Simon Willison, "Context engineering"**, 2025-06-27. <https://simonwillison.net/2025/Jun/27/context-engineering/>. A short post on why "context engineering" describes the work better than "prompt engineering".
- **Anthropic, "Effective context engineering for AI agents"**, 2025-09-29. <https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents>. The best single explanation of why choosing what the agent sees matters more than the wording of the request.
- **Andrej Karpathy, llm-wiki**, GitHub gist, 2026-04-04. <https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f>. A pattern in which the agent keeps a wiki of linked notes from your sources, so that what it learns accumulates between sessions.

## Planning before you run

- **Harper Reed, "My LLM codegen workflow atm"**, 2025-02-16. <https://harper.blog/2025/02/16/my-llm-codegen-workflow-atm/>. An early written account of the explore, plan, execute habit: refine the idea, write a plan, then carry it out.
- **Armin Ronacher, "What Actually Is Claude Code's Plan Mode?"**, 2025-12-17. <https://lucumr.pocoo.org/2025/12/17/what-is-plan-mode/>. Argues for keeping the plan in an ordinary file you can edit, which is what exercise 2 does.
- **plannotator**. <https://github.com/backnotprop/plannotator>. A tool for commenting on an agent's plan line by line, the way you would mark up a student's draft; I used it to answer the agent's questions while preparing this talk. Works with Claude Code, Codex, Gemini CLI and others.

## Skills

- **Agent Skills**, <https://agentskills.io>. The open standard for `SKILL.md` files, released as an open standard in December 2025, with the format specification and a list of the agents that read it.

## Review and human attention

- **Anthropic, "How the Claude Code team does code review"**, 2026-10-15. <https://claude.dev/blog/solving-code-review-at-anthropic/>. How a team whose code is mostly written by agents decides what people still review, and what automated checks handle.
