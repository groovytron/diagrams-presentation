# Slides

This folder contains some slides' source code.

## Requirements

You will need the following softwares installed:

- `make`
- `pandoc`
- `pandoc-crossref`
- `inotify-tools`

## Edit the slides

Run `make watch` to build the slides and rebuild on change.

You can then edit the slides and access their HTML export in the `build` directory.

You can also edit the `metadata.yaml` file following your use case.
More information about this metadata file can be found on
[pandoc's `yaml_metadata_block`'s documentation](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block).
