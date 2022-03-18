# Distributed Algorithms (TU Wien) Review Tooling

This repository contains a [pandoc](https://pandoc.org) script for compiling
Markdown to the BBCode used in the TI admin review tool that is used in the 
Distributed Algorithms lecture at TU Wien.

Since the online editor is quite buggy and I lost my reviews while writing them several
times, I decided to write them offline. However, this does not allow formatting that is
accepted by the rich text editor in the TI admin tool. Since I didn't want to format the
locally written reviews manually, I decided to adapt a BBCode pandoc filter to fit the
format of the TI admin tool.

During this process I discovered that the editor actually accepts some BBCode
syntax that cannot be created using the rich text editor, as for example
bulleted lists. Also, since the lecture and therefore reviews are quite
math-notation-heavy, I decided to add custom formatting for `inline code`
(bold-italic), that is supposed to be used for inline math-notation. Although
this is of course not pretty, it makes the math notation stand out and be a
little more readable, in my opinion.

## Building the BBCode files

The `hwX_first` and `hwX_final` folders in this repository are structured to
suit the layout of the rich text fields in the review tool, providing _one
Markdown file for each rich text box_ in the first and final homework reviews,
respectively. Using `make` in the respective folders, you can build the `.bb`
files for the respective Markdown files the content of which can then be pasted
into the "Source" view in the rich text editor. 

As for dependencies, you only need [pandoc](https://pandoc.org), which is avaliable
on all major package managers. Alternatively, when using [Nix(OS)](https://nixos.org/download.html), you can also use the provided `shell.nix` file for spawning a shell with pandoc.

