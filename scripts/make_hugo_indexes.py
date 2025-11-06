#!/usr/bin/env python3
#
# adapted from https://jacobian.org/til/hugo-obsidian/

import sys
from pathlib import Path


def make_indexes(content_dir: Path) -> None:
    for dir, _, _ in content_dir.walk():
        # skip the top-level directory
        if dir == content_dir:
            continue

        # concatenation and removal of space characters happens automagically
        index_file = dir / "_index.md"
        if not index_file.exists():
            index_file.write_text(f"---\ntitle: {dir.name}\n---\n")


if __name__ == "__main__":
    make_indexes(Path(sys.argv[1]))
