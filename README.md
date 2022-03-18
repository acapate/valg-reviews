# Distributed Algorithms (TU Wien) Review Tooling

This repository contains a [pandoc](https://pandoc.org) script for compiling
Markdown to the BBCode used in the TI admin review tool that is used in the 
Distributed Algorithms lecture at TU Wien.

Since the online editor is quite buggy and I lost my reviews while writing them
several times, I decided to write them offline. However, the rich text editor
format is a flavor of [BBCode](https://en.wikipedia.org/wiki/BBCode), which is
very tedious to write manually and since it is not a widely used, I did
not find an editor that supports exactly this format. Thus, I decided to adapt a BBCode pandoc filter to 
fit the format of the TI admin tool and be able to write _formatted reviews_ in Markdown.

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

## Example

`hw1_first/ex1.md` 

```Markdown
# Exercise 1

- Appropriateness: **1-2**
- Presentation: **3-4**

The BBCode used in the TI Admin tool is quite limited, thus the Markdown Syntax is limited to:

- Bulleted lists (as this one)
- `math` (unfortunately, this is not rendered, but rather represented as bold and italic text)
- **bold** and *italic* text
- Headings h1-h4

## Appropriateness 

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae felis
suscipit, vehicula est a, tincidunt lectus. Sed non lorem iaculis, aliquet
sapien nec, imperdiet urna. Maecenas sit amet massa non justo tempor malesuada
eget eu dui. Etiam ac faucibus mi, et eleifend mi. Orci varius natoque penatibus
et magnis dis parturient montes, nascetur ridiculus mus. Vivamus id luctus urna.
Phasellus neque libero, ornare vel ligula ac, porttitor lobortis velit. 

## Presentation

Maecenas at consequat libero. Donec pulvinar sapien id massa gravida, in lobortis nisl pharetra. Etiam ullamcorper eros sed quam elementum dignissim. In id augue purus. In dolor tellus, lacinia et maximus at, accumsan at turpis. Nulla facilisi. Integer felis odio, interdum at congue vitae, sagittis id purus. Proin eu neque at risus eleifend tincidunt. Suspendisse potenti. Etiam molestie tortor dolor, eget porttitor nulla porttitor in. 

## Comments

- comment
- _emphasized comment_
```

compiles to `hw1_first/ex1.bb`
```
[h1]Exercise 1[/h1]
[list][*]Appropriateness: [b]1-2[/b][/*]
[*]Presentation: [b]3-4[/b][/*]
[/list]
The BBCode used in the TI Admin tool is quite limited, thus the Markdown Syntax is limited to:

[list][*]Bulleted lists (as this one)[/*]
[*][b][i]math[/i][/b] (unfortunately, this is not rendered, but rather represented as bold and italic text)[/*]
[*][b]bold[/b] and [i]italic[/i] text[/*]
[*]Headings h1-h4[/*]
[/list]
[h2]Appropriateness[/h2]
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae felis
suscipit, vehicula est a, tincidunt lectus. Sed non lorem iaculis, aliquet
sapien nec, imperdiet urna. Maecenas sit amet massa non justo tempor malesuada
eget eu dui. Etiam ac faucibus mi, et eleifend mi. Orci varius natoque penatibus
et magnis dis parturient montes, nascetur ridiculus mus. Vivamus id luctus urna.
Phasellus neque libero, ornare vel ligula ac, porttitor lobortis velit.

[h2]Presentation[/h2]
Maecenas at consequat libero. Donec pulvinar sapien id massa gravida, in lobortis nisl pharetra. Etiam ullamcorper eros sed quam elementum dignissim. In id augue purus. In dolor tellus, lacinia et maximus at, accumsan at turpis. Nulla facilisi. Integer felis odio, interdum at congue vitae, sagittis id purus. Proin eu neque at risus eleifend tincidunt. Suspendisse potenti. Etiam molestie tortor dolor, eget porttitor nulla porttitor in.

[h2]Comments[/h2]
[list][*]comment[/*]
[*][i]emphasized comment[/i][/*]
[/list]

```