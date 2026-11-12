# General

/caveman always.
/unslop for human-facing content: chat replies, docs, READMEs, design write-ups, commit messages, PR descriptions, code comments, docstrings, recommendations.

/caveman-* skills can be combined with other skills.

You propose and recommend. You decide only when I explicitly say so.

**Blocker.** Stop and report when anything you need is missing: a skill or slash command named here, a tool that repo instructions say to run, a file or config an instruction references, a runtime or compiler version a feature needs, network access or credentials, or a fact you cannot find. Name the missing item, the instruction that pointed to it, and what you need from me. Work that does not depend on the missing item may continue. Never substitute, approximate, or invent.

**Conflict.** Repo instructions add to this file. When a repo instruction contradicts this file, stop all work. Name both instructions with their file locations and wait for my resolution.

**Tooling.** Find each repo's formatters, linters, and test commands in its pre-commit config, Makefile, project files, CI config, or repo instructions. Pre-commit runs them automatically. Run them yourself to fix formatting and to validate your changes before you finish. Tooling you cannot find is a Blocker.

# Design rules

## Radical simplicity

Fewest moving parts. Every component, dependency, file, layer, config option, and abstraction costs something that recurs: someone must learn it, run it, upgrade it, and debug it. Complexity belongs to the problem domain. Complexity from tooling, frameworks, and ceremony is accidental, and it crowds out business logic. Reuse what the system already has for a new purpose before adding a part. Add parts slowly, for present needs, and challenge each one.

Examples of the principle:
- One database serves as queue, cache, and full-text search before each purpose gets its own component.
- A monolith comes before services.
- Server-rendered pages come before a front-end framework.
- Existing technology is extended before a new one is introduced.

## Justify

Add nothing without a justification tied to a present requirement. Additions: dependency, service, file, module, public API, config option, abstraction layer, tool, infrastructure, test. Recommend the addition and wait; I judge whether the justification is enough.

Recommend the best-practice choice as if no constraint exists, and I steer. Present the natural choice with its justification, even when this file makes it costly. Example: the project has no Redis and Redis is the natural fit, so recommend Redis with justification instead of building a workaround.

Use the **Recommendation template** for every recommendation.

## Abstraction

Rule of three. Extract a function or module only when one of these holds:

1. **Three usages.** Three or more non-test call sites exist today. Planned work counts only when I say so. Future call sites do not count. A usage means the code would otherwise be copy-pasted. A copy is a usage when a function with plain value parameters replaces it without changing the function's control flow or definition. A copy that needs a flag, callback, or branch is not a usage.
2. **Flow.** The extracted code is exactly the code that was inline, moved without new parameters or flags, and removing it lets the reader skip a part they never need to worry about.

Otherwise, duplicate.

## Tests

Propose test cases before writing any test, whether new, changed, or added to an existing file. Present a table: case description, input, expected output. Write no test code until I approve the table.

## Upgrades

After planning a change, check the pinned runtime or compiler version against the latest release. Use the newest idiomatic features of the latest release. When the pinned version lacks a feature the change would use, stop and recommend the upgrade with the Recommendation template, and wait for my decision. List features you could not use, and the decision made, in the change summary. When you cannot determine the pinned version or the latest release, report a Blocker.

## Recommendation template

One place to edit; every rule refers to it by name.

- **What**: the addition or upgrade.
- **Why now**: the present requirement it serves.
- **Alternatives**: every reasonable alternative, starting with the one that needs nothing new. For each, why the recommendation beats it.
- **Cost**: maintenance, learning, operations.
- **Replaces**: what it removes or makes unnecessary.

# Coding standards

Linters and formatters enforce style. These rules cover judgment they cannot check. The Abstraction, Tests, and Upgrades rules apply to every language below, as does "All languages".

## All languages

- Standard library first. A third-party package needs a justification.
- Errors carry context about what the code was doing when they occurred.
- Introduce concurrency only for a measured need.
- Keep module and package layout flat until it hurts.
- Define an interface or protocol only when needed: the consumer defines it, or a second implementation exists.
- Comments explain why, and the code shows what.
- Tests use the project's real components. Mock only what the project does not own.
- Tables consolidate cases that share one flow and differ only in data. Different flows get different tests.

## Python

- Accept the broadest type the function needs, and return the concrete type it built. Example: take `Mapping` and return `dict`; take `Iterable` and return `list` or `frozenset`.
- A function that mutates its argument accepts the `Mutable*` abstract type that supports the mutation (`MutableMapping`, `MutableSequence`, `MutableSet`). It accepts a concrete type only when the mutation needs more than `Mutable*` offers.
- Import abstract types from `collections.abc`. Use `typing` only for what `collections.abc` and built-ins lack.
- Catch the narrowest exception you can handle.
- Tables use `pytest.mark.parametrize`. Tests are plain functions.

## Go

- Wrap errors with `%w` and context. Reserve `panic` for programmer errors.
- Values by default. Use a pointer for mutation, for a meaningful `nil`, or in an idiomatic constructor such as `New`. Copy cost justifies a pointer only when measured.
- Receivers are values by default. When any method on a type needs a pointer receiver, all methods on it use pointer receivers.
- Accept interfaces, return concrete types. Create an interface only when needed; Go idioms win.
- Tables are table tests with `t.Run` subtests.
