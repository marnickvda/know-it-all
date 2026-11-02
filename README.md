# know-it-all

Agent Skills for understanding a code change's design deeply, then replying to its pull request thoughtfully. It works for a change your agent built for you and for a team mate's PR you need to review.

- `quiz-me` quizzes **you** on the change — mostly *"why X over Y?"* — because you don't own a decision you can't defend against the alternative.
- `design-review` then turns what stayed unclear into design-level PR review comments.

## quiz-me

### How it works

1. **Scopes** to this session's work, a topic you name, your branch's diff, or a pull request.
2. **Shows a progress map** (`✓` correct, `◐` partial, `✗` missed, `▶` current, `○` to come).
3. **Asks one question at a time**, adapting difficulty — tradeoffs, plus "what if…" and "predict what breaks".
4. **Grades the answer honestly** against a checked answer key (never you), then reveals the rejected alternatives and the deciding tradeoff.
5. **Pauses between questions**: go to the next one, dig deeper, or park it.
6. **Ends with an assessment summary**: tradeoffs to remember, gaps, strengths.

Runs in your chat language.

## design-review

Reviews a pull request at **design level**, not code level: decisions, tradeoffs and rollout risks, not style or typos. It works through the points one comment at a time. For each comment it shows the diff, and it posts **one review** only after you approve. It works best right after `quiz-me` in the same session, because the gaps from the quiz become the comments.

## Install

Each skill is one `SKILL.md` in the [agentskills.io](https://agentskills.io) standard.

**Any agent** — Claude Code, Cursor, opencode, Codex, Copilot, Gemini & 60+ more, via the [vercel `skills`](https://github.com/vercel-labs/skills) CLI:

```bash
npx skills add marnickvda/know-it-all
```

**Claude Code plugin** — also gives you the `/quiz-me` and `/design-review` commands:

```
/plugin marketplace add marnickvda/know-it-all
/plugin install know-it-all
```

**Manual, no Node** — symlinks into `~/.agents/skills/` (every tool) + `~/.claude/skills/` (Claude Code):

```bash
git clone https://github.com/marnickvda/know-it-all
./know-it-all/install.sh        # --copy on Windows · --uninstall to remove
```

> Native skill support needs **Cursor ≥ 2.4** or **opencode ≥ 1.16**.

## Trigger it

- `/quiz-me` — or scope it: `/quiz-me the caching layer`
- Or just ask: *"quiz me on what you built"*
- `/design-review` — or give a PR: `/design-review 123`
- Or just ask: *"help me comment on the design of this PR"*

## Changes in 0.6.0

The collection is now `know-it-all`, and `pop-quiz` is now `quiz-me`. The quiz ends with an assessment summary instead of a scorecard. Handoff files now live in `<git common dir>/quiz-me/`.

If you installed with `install.sh`, remove the old skill with `rm -rf ~/.agents/skills/pop-quiz ~/.claude/skills/pop-quiz`, then run `./install.sh` again.

## License

MIT — see [LICENSE](LICENSE).
