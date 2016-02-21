# About

This is my personal vim configuration along with some information about vim usage.

The config is common for both vim and neovim.

Essential resources:

- [Vim documentation](http://vimhelp.appspot.com/)
- [Drew Neil's Vimcasts](http://vimcasts.org/)
- [Derek Wyatt's Video Tutorials](http://derekwyatt.org/vim/tutorials/)
- [Tim Pope's plugins](https://github.com/search?q=user%3Atpope+vim)

# Vim usage

## Normal mode - dot to repeat the last command

`.` (dot) - repeat the last normal-mode command, automatic mini-macro.

## Normal mode operators

`[operator]{motion}` - apply [operator](http://vimhelp.appspot.com/motion.txt.html#operator) to the text defined by motion.

For example: `<G` - shift everything right until the end of file (`<` - right shift operator, `G` - end of file motion), `gg=G` - format the whole file (gg - jump to the top, `=` - format operator, `G` - end of file motion).

- `c` - change
- `d` - delete
- `y` - yank into register (does not change the text)
- `~` - swap case (only if 'tildeop' is set)
- `g~`- swap case, visual mode `~`
- `gu`- make lowercase, visual mode `u`
- `gU`- make uppercase, visual mode `U`
- `!` - filter through an external program
- `=` - text indenting, using `equalprg` or internal function
- `gq`- text formatting, using `formatexpr` or `formatprg` or internal function
- `g?`- ROT13 encoding
- `>` - shift right, visual mode `>>`
- `<` - shift left, visual mode `<<`
- `zf`- define a fold
- `g@`-  call function set with the 'operatorfunc' option

More info: [how to define own operator, :h :map-operator](http://vimhelp.appspot.com/map.txt.html#%3Amap-operator), [how to define own motion, :h omap-info](http://vimhelp.appspot.com/map.txt.html#omap-info).

## Normal mode - jump list and change list

- `g;` / `g,` - move back / forward the [change list](http://vimhelp.appspot.com/motion.txt.html#changelist), view the list `:changes`
- `gi` - jump to last edit and start the insert mode (uses `'^` mark)
- `'.` - jump to last edit position

- `<C-O>` / `<C-I>` - move back / forward in the [jump list](http://vimhelp.appspot.com/motion.txt.html#jumplist), `:jumps`
- `''` / ```` - jump to the previous place you jumped here from
- `gf` - open file under cursor
- `gd` / `gD` - local / global variable definition
- `C-]` - jump to the tag
- `C-^` - switch between two recent files
- `[num]<C-^>` - switch to 'num' file (see file numbers in :buffers)

## Insert/command mode keys

- `<C-H>` - delete prev char
- `<C-W>` - delete previous word
- `<C-U>` - delete current line, this often used in mappings to clear the command line, for example to remove the automatic `'<,'>` when there is a visual selection
- `<C-T>` / `<C-D>` - indent / un-indent, useful for markdown lists
- `<C-E>` / `<C-Y>` - insert char above / below the cursor
- `<C-A>` / `<C-X>` - increment/decrement number under the cursor
- `<C-O>` - execute normal command and get back to insert mode

[:h insert.txt](http://vimhelp.appspot.com/insert.txt.html)

## Insert/command mode - insert from the register

`<C-R><r>` - insert the text from the register.

Examples:

- `<C-R>0` (zero) - paste yanked text
- `<C-R>"` - paste the text from the unnamed register

If we have "Hello" in the `a` register and "World" in the `b`, we can insert them like this:
`"ap"bp` from normal mode.

But it is easy to do from the insert mode `<C-R>a<C-R>b` and change will be repeatable with dot.

## Insert/command mode - calculate the expression and insert the result

`<C-R>=` - prompt for the expression and insert it

```
<C-R>=3*0.65  -- will insert 1.95
```

## Insert-mode - insert the last text

`<C-A>` - Insert the last inserted text.

Example:

```
"some_text(...)
cf(new_text"      - change "some_text" to "new_text" till the (

"some_text, ...   - now we need to do the same change, but till the comma
ct,Ctrl-A"        - we enter the new command `ct,` and then use Ctrl-A to insert new_text
```

There is also `<C-@>` - Insert the last inserted text and stop the insert mode.

## Insert-mode autocompletion

- `<C-N>` / `<C-P>` - generic completion, [:h i\_CTRL\_N](http://vimhelp.appspot.com/insert.txt.html#compl-generic)
- `<C-X><C-O>` - omni-completion, :h ins-completion
- `<C-X><C-L>` - lines
- `<C-X><C-F>` - file names, based on `:pwd`
- `<C-X><C-]>` - tags
- `<C-X><C-K>` - dictionary
- `<C-X><C-N>` - keywords in current file
- there are more, see [:h ins-completion](http://vimhelp.appspot.com/insert.txt.html#ins-completion)

Work with autocomplete menu:

- <C-p> / <C-n> Use the prev/ next match from the word list (next match)
- <C-y> Accept the currently selected match (yes)
- <C-e> Revert to the originally typed text (exit from autocompletion)
- <C-h> (and <BS>) Delete one character from current match
- <C-l> Add one character from current match

Open the popup without selecting the first item: <C-N><C-P> (will actually select the first item and then un-select it).

## Insert-mode complete whole lines

Complete whole lines with `<C-X><C-L>`:

- type some text, do `<C-X><C-L>`
- if there are few suggestions - type a bit more and `<C-L>`
- now you at the end of line, and complete mode is still active
- press `<C-X><C-L>` few more times to get more lines which follow the line you've got

From [Let Vim Do the Typing](https://www.youtube.com/watch?v=3TX3kV3TICU).

Similarly it is possible to complete sentences word-by-work with `<C-X><C-P>`.

## Command line window

It is super-useful to edit long commands, or search patterns.

`q:` - opens a command-line window.
`q/` - opens a search history window.

From the command line / search prompt - press `<C-F>` to switch to the command-line window.

It is super-useful to edit long commands, don't re-map the `q:`.

If you often invoke it accidentally, you probably have a problem with entering `:q` correctly. In this case whether remap the `:q` to something else (for example, to `<Leader>q`) or type it like this: left pinky - Shift, right pinky - ':', left pinky - 'q' (there is no chance to type it backwards this way).

## Visual mode

In normal mode - `v` / `V` / `<C-V>` - char / line / block visual mode.
Same keys in visual mode switch between selection modes.

In normal mode `gv` - re-select the last visual selection (very useful).

In visual mode:

- `o` - move to other end of the selection
- `gv` - switch current and previous visual selection
- `c` - change the selection (can re-paste after the change with `<C-R>"`, convenient for wrapping)
- `d` - delete the selection
- `r` - replace the selection with entered char

In visual block mode:

- `O` - move to other corner on the same line
- `$` - select until the end of line, will work for all lines even if length is different
- `A` / `I` - append / prepend the block with entered text

Visual block + $ - selects a non-rectangular block. Then use `A` to append to the end of lines.

Alternative: do `A` on one line, then select a block and repeat with `:'<,'>normal .`.

Select function body (between { and }): `vaBV` - select "a block" and then change the selection mode to line-wise.
To select 2 levels up - `v2aBV` (when inside other {} block inside function) or `vaBaB` (repeat `aB` to move to the next block).
A mapping to work from any level inside the function: `:map t ? function <CR>f{vaBV` (search backwards for `function`, move to the `{` and then do `vaBV`).

## Show full file name and stats

- `<C-G>` - normal mode, show current file name and path and cursor position
- `<g C-G> - show file stats (numer of columns, lines, words, bytes)

## Digraphs and special chars

- `<C-K>{char1}{char2}` - insert a digraph (normal mode)
 - [alpha digraphs](./vim/digraph-alpha.txt)
 - [symbol digraphs](./vim/digraph-symbol.txt)
- `<C-V><key>` - insert the key literally (like <C-V><Tab> always inserts tab, regardless of 'expandtab' option).
- `<C-V>{code}` - insert the unicode char literally by decimal code
- `<C-Vu>{code}` - insert by hex code
- ga - show ascii value of char under cursor
- g8 - show utf-8 byte sequence for char under cursor

`:dig` - show digraphs
