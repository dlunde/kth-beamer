# KTH Beamer Theme
A minimalistic LaTeX beamer theme for _KTH Royal Institute of Technology_
presentations. Adds a few graphical elements on top of the default beamer
theme.

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
\usetheme[accept kth terms, <OPTIONS>]{kth}
```

The presence of `accept kth terms` in the theme options, with or without
spaces, indicates that you acknowledge the KTH logotype usage terms and that
you are allowed to use it for the purposes of your presentation. **This usually
means that (a) you are an employee of KTH, or (b) you are a student of KTH who
is presenting a thesis or dissertation.** If you do not accept the KTH logotype
usage terms then the logotype will not be shown. See the `logo` option below
for more information.

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

**It is recommended to compile the presentation at least three times.** Certain
features of the presentation rely on a complete table of contents and will not
show correctly until that is present.

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
* **logo**: Specifies path to the logotype to show in the top-left corner of
            each frame. No logotype is shown by default. **To show the KTH
            logo, add `accept kth terms` to the list of options:**
  * ```tex
    \usepackage[accept kth terms, <other options>]{kth}
    ```

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
