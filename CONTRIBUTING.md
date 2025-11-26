Contributing Guidelines

Thanks for your interest in contributing! Below are some simple rules to make contributions smooth.

- Fork the repo and create a feature branch for your changes.
- Keep changes focused and provide a clear PR description.
- Add tests or examples for new scripts when applicable.
- Follow POSIX shell style where relevant and prefer portability.

PR checklist

- [ ] Code builds and runs locally.
- [ ] Shell scripts linted with shellcheck (no major warnings).
- [ ] New scripts include a brief metadata comment and usage examples.
- [ ] Update README or index if adding/removing scripts.

Local testing

You can run basic checks locally:

- shellcheck your script(s):
  shellcheck path/to/script.sh

- run shfmt for formatting checks (optional):
  shfmt -w -i 2 path/to/script.sh

Behavior

- The CI runs shellcheck/shfmt and updates the index automatically on changes to scripts.
- Releases are created automatically on push to main using a date-based tag: `YYYY.MM.DD.NUMBER`.

If you have questions, open an issue first to discuss larger changes.