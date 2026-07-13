#!/bin/bash
set -e

cd "$(dirname "$0")"
BOOK_SLUG="$(basename "$(pwd)")"   # derive from the book's directory name (canonical, no per-book edit)
METADATA="metadata.yaml"
OUTPUT_DIR="output"

mkdir -p "$OUTPUT_DIR"

# Combine with explicit blank-line separators to prevent --- bleedthrough
python3 -c "
import glob, os
files = ['metadata.yaml'] + sorted(glob.glob('chapters/*.md'))
parts = []
for f in files:
    with open(f) as fh:
        parts.append(fh.read().rstrip())
print('\n\n'.join(parts))
" > "$OUTPUT_DIR/combined.md"

# Rewrite ../images/ → images/ for pandoc (chapters use ../images/ for GitHub; pandoc needs images/ relative to book root)
sed 's|(../images/|(images/|g' "$OUTPUT_DIR/combined.md" > "$OUTPUT_DIR/combined-build.md"

pandoc "$OUTPUT_DIR/combined-build.md" \
  --from markdown \
  --to epub3 \
  --resource-path=. \
  --epub-cover-image=cover.jpg \
  --css=styles/kindle.css \
  --css=styles/kindle-book.css \
  --toc --toc-depth=2 \
  --output="$OUTPUT_DIR/$BOOK_SLUG.epub"

pandoc "$OUTPUT_DIR/combined-build.md" \
  --from markdown \
  --to html5 \
  --standalone \
  --resource-path=. \
  --css=styles/kindle.css \
  --css=styles/kindle-book.css \
  --toc \
  --output="$OUTPUT_DIR/$BOOK_SLUG.html"

echo "Built: $OUTPUT_DIR/$BOOK_SLUG.epub"
echo "Built: $OUTPUT_DIR/$BOOK_SLUG.html"
