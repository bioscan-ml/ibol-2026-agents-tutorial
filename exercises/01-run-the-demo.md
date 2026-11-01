# Exercise 1: Run the demo yourself

In the talk I gave the same request to two agent sessions and compared what they did, then added a short skill and ran it again. Here you do the same, with the same data, the same request and the same skill. It takes about 15 minutes once the data is downloaded.

## What you need

- A coding agent (see the [README](../README.md)).
- R with the tidyverse packages. If you do not have R, see [Without R](#without-r) below.
- The data: run `data/fetch-bold.sh`, or ask your agent to run it ([Getting the data](../README.md#getting-the-data)).
- A separate folder to work in, outside the kit's folder. The kit holds this exercise, its answers and the skill, and an agent that looks around its folder will find and read them, which spoils the comparison. Make a folder called `ibol-demo` next to the kit's folder (not inside it), with only two things in it: the data file, in `ibol-demo/data/`, and the source code of the BIOSCAN Browser, in `ibol-demo/bioscan-browser/`. The Browser's code is public on GitHub under the MIT licence. In a session in the kit's folder, ask your agent:

  ```text
  Make a folder called ibol-demo next to this folder. Copy data/bold-thailand-coleoptera.tsv into ibol-demo/data/, and make a shallow clone of https://github.com/bioscan-ml/bioscan-browser into ibol-demo/bioscan-browser. Copy nothing else.
  ```

  Claude Code asks your permission before it writes outside the folder it started in; allow it. If you do not have `git`, download the ZIP file from that page (Code, then Download ZIP), unzip it into `ibol-demo` and rename the folder to `bioscan-browser`.

## Step 1: The same request, twice

Open `ibol-demo` as the project, not the kit's folder. Start a new session there and paste this request exactly. It is the request from the talk; only the location of the data file has changed.

```text
This folder has a file of public BOLD records for beetles (Coleoptera) collected in Thailand, data/bold-thailand-coleoptera.tsv. Using R and the tidyverse, tell me how many specimens there are, how many BINs, the five families with the most BINs, and how many specimens lack a genus or a species identification. The source code of the BIOSCAN Browser is in bioscan-browser/. For three specimens without a genus identification, give a link to each record's page in the Browser.

Finish with exactly these lines:
SPECIMENS: <n>
BINS: <n>
NO_GENUS: <n>
NO_SPECIES: <n>
TOP_FAMILIES: <family (n BINs); ...>
LINKS: <url>; <url>; <url>
```

When it finishes, delete any files it added to the folder (usually an R script), so the next run starts from the same place. Then start a second new session and paste the same request.

Compare the two sessions:

- Did they take the same steps? Which files did each read, and how many times did each run R?
- Did they give the same numbers? Check them against [the answers](#the-answers) below.
- How did each work out the number of specimens?

When I rehearsed this on 2026-10-28, the routes varied from 4 to 14 steps, and 23 of 24 runs got every number right.

## Step 2: Add the skill

The file [skills/bold-summary/SKILL.md](../skills/bold-summary/SKILL.md) in the kit holds six rules for this kind of task. Read it first; it takes a minute. Then copy the kit's `skills/bold-summary` folder into `ibol-demo`, and in a session in `ibol-demo` ask your agent to set it up:

```text
Read bold-summary/SKILL.md and set it up as a skill for this project.
```

Claude Code will put it in `.claude/skills/bold-summary/`; Codex and Antigravity in `.agents/skills/bold-summary/`. Claude Code asks your permission before writing there; allow it. An agent reads the list of skills when a session starts, so start a new session, delete the files the earlier runs added, and paste the same request again.

Look at what changed. In my rehearsal, with the skill, 24 of 24 runs were right, each wrote one script and ran it, and none took longer than 33 seconds.

## The answers

From the file fetched on 2026-10-28 (12,003 rows):

- `SPECIMENS: 11831`
- `BINS: 3945`
- `NO_GENUS: 10995`
- `NO_SPECIES: 11253`
- `TOP_FAMILIES: Staphylinidae (819 BINs); Chrysomelidae (451 BINs); Curculionidae (362 BINs); Coccinellidae (261 BINs); Mordellidae (164 BINs)`
- `LINKS`: any three specimens without a genus, each as `https://browser.bioscan-ml.org/record/<processid>`.

If your download has a different number of rows, BOLD has changed since 2026-10-28 and your numbers will differ a little. The links follow the Browser's address pattern, but they open a record only when the Browser is up and the specimen is also in BIOSCAN-5M; not every public BOLD record is. On 2026-11-01, 5,325 of the 11,831 specimens in this file were in BIOSCAN-5M, but none of the first 899 without a genus, so the first three links an agent gives usually do not open. To see a record that does open, try `https://browser.bioscan-ml.org/record/GMTTB003-23`.

## What to watch for: rows are not specimens

The file has 12,003 rows but 11,831 specimens. 82 specimens have more than one row, one per genetic marker (COI-5P, COI-3P, H3, 16S, CYTB, 18S-5P), which adds 172 rows. A specimen is a unique `processid`, not a row.

This is the one wrong answer I saw in rehearsal. The agent noticed that there were 11,831 unique process IDs, said so in its answer, and still reported 12,003 specimens and 11,255 specimens without a species. If you see `SPECIMENS: 12003` or `NO_SPECIES: 11255`, the agent counted rows. Rule 2 of the skill is there because of that run.

One more thing to watch: in two rehearsal runs the agent started a command that waited for input that never came, and sat for two minutes before it recovered. If a step seems stuck, stop it and tell the agent what you saw.

## Without R

If R or the tidyverse is not installed, ask for Python instead, and say so in the request: replace "Using R and the tidyverse" with "Using Python". For step 2, ask the agent to change rule 1 of the skill to use Python and a script called `summary.py` before it sets the skill up. The answers should be the same. My rehearsal runs used R only.

Installing R and the tidyverse is also something an agent can do for you, but it is a large download and may need an administrator password, so leave it for a better connection.
