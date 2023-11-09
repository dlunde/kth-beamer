# KTH Beamer Theme
A minimalistic LaTeX beamer theme for KTH presentations. Adds a few graphical
elements on top of the default beamer theme.

## Installation
An installable package for this theme is work in progress, but not yet ready
for use.  The simplest way to integrate kth-beamer into your project is to
extract the package into directory with your tex files:

```sh
# Create package and copy it to your project dir
make package
mv kth-beamer.zip YOUR_PROJECT_DIR
cd YOUR_PROJECT_DIR
# Extract contents
unzip kth-beamer.zip
mv kth-beamer/*{.sty,-resources} .
# Remove the remaining directory and zip archive
rm -rf kth-beamer.zip kth-beamer/
```

**If you know what you are doing and you are prepared to accept the risks**,
you can for install the package system wide by running the following:

```sh
make package
# Most likely need to run this last command with sudo
sudo make install-texlive
```

## Usage
(See the `example.tex` file for usage example.)

Use the KTH beamer theme in your presentation by adding this to the preamble
(see below for available theme options):

```tex
\usetheme[<OPTIONS>]{kth}
```

To use the KTH theme font instead of the standard beamer font, add this to the
preamble as well:

```tex
\usefonttheme{kth}
```

To include the theme specific title frame, add this directly after
`\begin{document}`:

```tex
\frame[plain, t]{\titlepage}
```

### Theme Options
Apply options in usetheme as a comma separated list
`\usetheme[opt1=val, opt2=val, ...]{kth}`. The following options are
available:

* **footerstyle**: Sets the style of the frame footer. The available values for
                   this option are:
  * `lcr` _(default)_: A horizontal line with left-, center-, and right-aligned
                       contents below it.
  * `progress`: Same as lcr, but with a progress bar above the line and
                highlighted section names above the progress bar.
* **progressincr**: Specifies what the progress bar (if used) should increment
                    with respect to. The available values for this option are:
  * `frames` _(default)_: The progress bar increments when progressing to the
                          next frame.
  * `pages`: The progress bar increments when progressing to the next page.
             This will increment the progress bar over pauses on the same
             frame.
* **lfoot**: Specifies the left-aligned contents of the footer. Default is the
             date.
* **cfoot**: Specifies the center-aligned contents of the footer. Default is
             the presentation title.
* **rfoot**: Specifies the right-aligned contents of the footer. Default is
             "CurrentFrame / TotalFrames".
* **lines**: Sets which kind of lines that should be rendered on the title
             frame. The available values for this option are:
  * `tikz` _(default)_: Render the lines using tikz.
  * `no`: Do not render any lines.
* **titlestyle**: Specified alignment of title frame contents. The available
                  values for this option are:
  * `topleft` _(default)_: Align the contents to the top left of the frame, but
                           right of the KTH logo.
  * `center`: Align the contents to the center of the frame.

These options can also be specified later on by `\kth<optname>{value}`, for
example:

```tex
% Set the left-aligned footer contents to "Left"
\usetheme[lfoot=Left]{kth}

% This has the same effect
\kthlfoot{Left}
```

## Contributions
Contributions to the theme are welcome!
