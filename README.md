This is a pandoc filter designed to be used with [Pandoc Typst PDF (`ptp`)](https://github.com/cskeeters/ptp) that outputs URLs for links as footnotes.  This makes the URLs usefull when the document is printed.

```markdown
---
title: Link Footnote Demo
author: Chad Skeeters
filters:
  - pandoc-link-footnote/0.1.0/link-footnote.lua
---

[Google](http://google.com) is a great search engine.
```

# Usage

```sh
ptp doc.md
```

## Manual

If you are not using `ptp`, you can run the filter with:

```sh
pandoc -L pandoc-link-footnote/0.1.0/link-footnote.lua doc.md -o doc.typ
typst compile doc.typ
```

# Installation

```
mkdir -p ~/.pandoc/filters/pandoc-link-footnote
cd ~/.pandoc/filters/pandoc-link-footnote
git clone https://github.com/cskeeters/pandoc-link-footnote 0.1.0
cd 0.1.0
git switch --detach v0.1.0
```
