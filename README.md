# pop-quiz + design-review

Two Agent Skills. `pop-quiz` quizzes **you** on what your agent just built — mostly *"why X over Y?"* — because you don't own a decision you can't defend against the alternative. `design-review` then turns what stayed unclear into design-level PR review comments.

## pop-quiz

### How it works

1. **Scopes** to this session's work, a topic you name, your branch's diff, or a pull request.
2. **Shows a progress map** (`✓` correct, `◐` partial, `✗` missed, `▶` current, `○` to come).
3. **Asks one question at a time**, adapting difficulty — tradeoffs, plus "what if…" and "predict what breaks".
4. **Grades the answer honestly** against a checked answer key (never you), then reveals the rejected alternatives and the deciding tradeoff.
5. **Pauses between questions**: go to the next one, dig deeper, or park it.
6. **Ends with a scorecard**: tradeoffs to remember, gaps, strengths.

Runs in your chat language.

## design-review

Reviews a pull request at **design level**, not code level: decisions, tradeoffs and rollout risks, not style or typos. It works through the points one comment at a time. For each comment it shows the diff, and it posts **one review** only after you approve. It works best right after `pop-quiz` in the same session, because the gaps from the quiz become the comments.

## Install

Each skill is one `SKILL.md` in the [agentskills.io](https://agentskills.io) standard.

**Any agent** — Claude Code, Cursor, opencode, Codex, Copilot, Gemini & 60+ more, via the [vercel `skills`](https://github.com/vercel-labs/skills) CLI:

```bash
npx skills add marnickvda/pop-quiz
```

**Claude Code plugin** — also gives you the `/pop-quiz` and `/design-review` commands:

```
/plugin marketplace add marnickvda/pop-quiz
/plugin install pop-quiz
```

**Manual, no Node** — symlinks into `~/.agents/skills/` (every tool) + `~/.claude/skills/` (Claude Code):

```bash
git clone https://github.com/marnickvda/pop-quiz
./pop-quiz/install.sh        # --copy on Windows · --uninstall to remove
```

> Native skill support needs **Cursor ≥ 2.4** or **opencode ≥ 1.16**.

## Trigger it

- `/pop-quiz` — or scope it: `/pop-quiz the caching layer`
- Or just ask: *"quiz me on what you built"*
- `/design-review` — or give a PR: `/design-review 123`
- Or just ask: *"help me comment on the design of this PR"*

## Changes in 0.5.0

`pop-quiz` no longer offers to save takeaways. The lessons file was removed.

## License

MIT — see [LICENSE](LICENSE).
