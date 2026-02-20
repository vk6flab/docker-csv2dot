# csv2dot

`csv2dot` was written by Reinier Post at the Eindhoven Technical University. This repository packages it into a Docker container to facilitate installation.
- Source: [https://rp.win.tue.nl/bin/csv2dot](https://rp.win.tue.nl/bin/csv2dot)
- Author: [https://rp.win.tue.nl/](https://rp.win.tue.nl/)
- Other scripts by the same author: [https://rp.win.tue.nl/bin.html](https://rp.win.tue.nl/bin.html)

**Note:** This repository does not contain Reinier Post's `csv2dot` tool or any `Graphviz` tools.

## Example Usage

The tool has many options, this example is a minimum viable product.

1. Create a CSV file with two columns.
2. Each row represents a relationship between each entity.
3. I use the left column for inputs and the right column for outputs.
   - This is so that when you display the graph, you'll see the relationship from left to right.
   - For example, a microphone goes into a radio, so the microphone is in the left column and the radio in the right.
   - A headphone comes out of a radio, so the radio is in the left column and the headphone in the right.
4. In order for all connectors to end up on the correct device, you must ensure that they all have the *exact* same *unique* device name.
   - So, you cannot have two devices called "radio", one needs to be called "hf-radio", the other "vhf-radio", or "yaesu" and "plutosdr".
   - Regardless of the column in which they appear, each device is connected to all the other devices if they have the same name.
5. In my experience, the most effective way to document this is to create a device, like "main radio" and create a row for every single socket on that device (whilst putting the inputs in the left column and the outputs in the right - see the example CSV file).
6. The Graphviz tools have many options, below are the commands I used to create the example SVG file.

```sh
csv2dot vk6flab.csv > vk6flab.dot
dot vk6flab.dot -Grankdir=LR -Tsvg > vk6flab.svg
```

## Installation

`Perl` runs on over 100 different platforms, so there's likely one for you. It's needed to run the `csv2dot` tool, which in turn requires a CPAN module called `Text::CSV_XS`. If you have a functioning `Perl` installation, you likely do not need this repository, but if you don't this might make it easier.

`Docker` runs on most popular platforms and is assumed to be installed and running. To test your installation, you can run: `docker run hello-world`

### Build
To install the software, you need to clone this repository, then build the container and then you can use the included `csv2dot` script to test it.

```sh
git pull https://github.com/vk6flab/docker-csv2dot.git
cd docker-csv2dot
./build.sh
```

This should give you a running copy of `csv2dot`.

### Test
To test and use the tool:

```sh
./csv2dot -h
```

## Notes
- This repository does *not* contain Reinier Post's tool, it uses the URL where the tool exists online. The point of this repository is to document a use-case and provide examples.
- I considered calling the script something other than `csv2dot`, but I couldn't think of anything more appropriate, since renaming it to `csv2dot.sh` for example, would mean that the code examples would not work for someone who had actually installed Reinier's script. If you have suggestions, let me know.
- Microsoft Word used `.dot` as a file extension for template files which are NOT text files and cannot be opened in a text-editor. The `.dot` files here ARE text files and can be opened in any text editor on any platform. I'm aware that there are some people who use `.gv` as an extension. I might at some point change this repo to reflect that.
- The original reference to this script came from a post by Reinier, explaining how to create a visualisation of a `Makefile`: [https://help-make.gnu.narkive.com/ksFPwn5V/diagramming-a-makefile#post7](https://help-make.gnu.narkive.com/ksFPwn5V/diagramming-a-makefile#post7)
- Again, I am not the author of the `Perl` script `csv2dot`, just a very happy user.

Onno VK6FLAB, February 2026
