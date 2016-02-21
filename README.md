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

## Normal mode operators, motions and text objects

[:h navigation](http://vimhelp.appspot.com/motion.txt.html)

### Operators

`[operator]{motion}` - apply [:h operator](http://vimhelp.appspot.com/motion.txt.html#operator) to the text defined by motion.

For example: `<G` - shift everything right until the end of file (`<` - right shift operator, `G` - end of file motion), `gg=G` - format the whole file (gg - jump to the top, `=` - format operator, `G` - end of file motion).

- `c` - change
- `d` - delete
- `y` - yank into register (does not change the text)
- `J` - join lines, `gJ` - join lines without adding a space between them
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

### Motions

#### Left-right motions
```
Left-right motions

    Pudding—Alice: Alice—Pudding.
          *
0   ^    h l      gm            g_   $
                        25|
```

Here `*` is a cursor position, `h` / `l` move one char right / left (can also take count), `0` - move to line start and so on. The `[count]|` moves to the specified column.

When the line is wrapped, `g^` moves to the start of screen line.
The `gm` depends on the window width and moves to the center of the screen line.

Jump to the char with `f` / `t`, `F` / `T`, `f` jumps forward to the char and `t` jumps forward till the chars (stops just before it); the `F` and `T` do the same backwards.

```
f/t, F/T jump to char

    Pudding-Alice: Alice-Pudding.
     |    *    |        |
     Fu        fc       tP
     TP
```

#### Words (letters, digits and underscores, can be configured with `'iskeyword'`) and WORDS (any non-blank chars):

```
Words and WORDs

    ┌┈┈┈┈┈┈┈┈┐ ┌┈┈┈┈┈┈┈┐ ┌┈┈┈┈┈┈┐ ┌┈┈┈┈┈┈┈┈┐ - WORDS
    ┌┈┈┈┈┈┐┌┈┐ ┌┈┈┈┐┌┈┈┐ ┌┈┈┈┐┌┈┐ ┌┈┈┈┈┈┐┌┈┐ - words
    Pudding--- Alice:::: Alice--- Pudding...
    ┆      ┆   *    ┆    ┆
    ┆      ┆        w    W ┈┈┈┈┈┈ next word / WORD
    ┆      ┆
    B      b - prev word / WORD

    Pudding--- Alice:::: Alice--- Pudding...
             ┆     ┆   ┆ *   ┆  ┆
             ┆     ┆   ┆     e  E ┈┈┈┈┈┈ end of the word / WORD
             ┆     ┆   ┆
             ┆     ┆   ge/gE ┈┈┈┈┈┈┈┈┈┈┈  end of the prev word / WORD
             ┆     ┆
             2gE   2ge ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈  two words / WORDs back
```

#### Up-down motions:

```
  Up-down motions ...                        gg
  ...
  But the Red Queen looked sulky,
  and growled                                k - line up, `+` - up and move to the start
  'Pudding—Alice: Alice—Pudding.     *
  Remove the pudding!'                       j - line down, `-` - down and move to the start

  and the waiters took it away so quickly    :+3   - range is a motion, c:+2, d:107
  that Alice couldn't return its bow.        /bow  - search is a motion, c/bow
  ...
  ...                                        G
```

Note that `:` can be in general used as motion, not only to specify the range: `d:call search('f')` will delete until the next 'f' found by search() function.

There is also `[count]_` motion which moves `count-1` lines down and jumps to the start. It is like a `^` motion, but with count. If there is no count or count=1 it moves to the current line start, with count > 1 moves down and jumps to the start.

The `[N]%` jumps to the N% of the file, `:[range]go[to] [count]` and `[count]go` jump to the `count` byte in the file.

#### Text object motions / various motions

```
Matching pair () {} []    - % - move to the matching pair, make sure to enable the
              /**/          matchit.vim (standard plugin), ":h matchit.txt"
              <tag></tag>
              if/else/endif
              etc

A sentence.               - ) / ( - [count] sentences, like y3) - yank 3 sentences

A paragraph of
text.                     - } / { - [count] paragraphs

A section                 - ]] / [[ - [count] sections, see [:h section](http://vimhelp.appspot.com/motion.txt.html#section),
                          can be redefined by filetype plugins, like move between
                          classes / methods in python.
End of the section        - ][ / [] - [count] end of section

Unmatched (               - [( / ]( - prev/next unmatched (
Unmatched {               - [{ / ]{ - prev/next unmatched {
Unmatched #if / #else     - [# / ]# - prev/next unmatched {

A method of the class     - [m / ]m, and [M / ]M move to the end of the method

A block comment /*  */    - [*, [/ / ]*, ]* - prev / next comment mark

[n] lines from the top    - [n]H
[n] lines from the bootom - [n]L
Middle line               - M
```

Each of them can be used as an operator target.

For example `c%` - change until the matching pair:

```
    if (x and y or something(b, c))
                   *
                   |
                   c% - from here it will find the bracket pair around
                        the "b, c" and will jump to the matching (end parent)
    if (x and y or ▓)

    link_to(""text"", my_p(sing(""one""), plu(fn(""two""))))
                      *   A                               B
                      |
                      c%   --- from here will change until B
                      %c%  --- will change the A-B, including brackets
                      %ci( --- here will change inside the A-B
```

See also [Vim's life-changing c%](http://thepugautomatic.com/2014/03/vims-life-changing-c-percent/).

#### Text object selection

```
 word, word_two          - aw / iw (regular / inner text object)
 WORD, word--%4-         - aW / iW

 'string'                - a' / i'
 "string"                - a" / i"
 `string`                - a` / i`

 A sentence.             - as / is

 A paragraph of
 text. It also has a
 text object.            - ap / ip

 [ block ]               - a[, a] / i[, i]
 ( block )               - a(, a), ab / i(, i), ib
 < block >               - a<, a> / i<, i>
 { block }               - a{, a}, aB / i{, i}, iB
 <tag>value</tag>        - at / it
```

More text objects: [wellle/targets.vim](https://github.com/wellle/targets.vim), [indent object](https://github.com/michaeljsmith/vim-indent-object), [column object](https://github.com/coderifous/textobj-word-column.vim).

The quotes text objects (a', a", etc) look forward if the cursor is not inside the quoted string. Like if cursor is on the `*` position in `text [*] text 'quote'`, the `ya'` will yank the quoted word.
The [wellle/targets.vim](https://github.com/wellle/targets.vim) makes other text objects also look forward (and then also backward if there is no object forward).

Inner text objects (`iw`, `iB`, etc) do not include the surrounding marks.
For words this is trailing space, for blocks - brackets.

```
"aw" vs "iw" vs "w"

    ┌┈┈┈┈┈┈┐   - yaw - yank word with trailing space - "Pudding "
    ┌┈┈┈┈┈┐    - yiw - yank only word - "Pudding"
    Pudding Alice
```

Note: motions like `yw` and `yaw` do the same and yank the word with the trailing space (same for `daw`, `caw`, etc), but it will be a bit different in visual mode. The `vaw` will also select the first letter of the next word (because `w` actually moves to there).
It works in a similar way for other objects, like sentences.
See also [:h exclusive](http://vimhelp.appspot.com/motion.txt.html#exclusive).

#### Motions and operators

There are 3 types of the effects of operators: `characterwise`, `linewise`, `blockwise`.

And `*wise` can be varied by operator and motion:

- `dw` - characterwise - delete a word
- `>j` - linewise - indent 2 lines
- `dj` - linewise - delete 2 lines

It is possible to force *wise with the following keys:

- `v` - characterwise
- `V` - linewise
- `<C-v>` - blockwise

Usage: {operator}{*wise-specifier}{motion}, see [:h o_v](http://vimhelp.appspot.com/motion.txt.html#o_v):

- `dvj` - characterwise
- `dVj` - linewise
- `d<C-v>j` - blockwise

See also: [operator, the true power of Vim](http://whileimautomaton.net/2008/11/vimm3/operator).

## Marks

[:h ](http://vimhelp.appspot.com/motion.txt.html#mark-motions).

- `a-z` - local marks (inside the buffer), reset when buffer is deleted
- `A-Z` - global (across files)
- `0-9` - automatically set from .viminfo, '0 - cursor position on last exit from Vim, '1 - previous exit, and so on, see [:h viminfo-file-marks](http://vimhelp.appspot.com/starting.txt.html#viminfo-file-marks)

Set the mark with `m{a-zA-Z}`.

Jump to the mark:

- '{a-z} `{a-z} - jump to mark in the current buffer, with ' - to the mark location, with ` - to the first non-blank char
- '{A-Z0-9} `{A-Z0-9} - jump to mark in the file (may be another file, not a motion in this case)

Jump to the mark is a motion (can be used with operators).

List of marks - `:marks`.

Delete marks with `:delm`:

```
:delm a - delete mark `a`
:delm a b or :delm ab - delete marks `a` and `b`
:delm p-z - delete all marks from `p` to `z`
:delm! - delete all marks for the current buffer (only a-z, not A-Z and 0-9)
```

## Normal mode - jump list and change list

### Change list

- `g;` / `g,` - move back / forward the [change list](http://vimhelp.appspot.com/motion.txt.html#changelist), view the list `:changes`
- `gi` - jump to last edit and start the insert mode (uses `'^` mark)
- `'.` - jump to last edit position

### Jump list

- `<C-O>` / `<C-I>` - move back / forward in the [jump list](http://vimhelp.appspot.com/motion.txt.html#jumplist), `:jumps`
- `''` / `\`\`` - jump to the previous place you jumped here from
- `gf` - open file under cursor
- `gd` / `gD` - local / global variable definition
- `C-]` - jump to the tag
- `C-^` - switch between two recent files
- `[num]<C-^>` - switch to 'num' file (see file numbers in :buffers)

### Special marks

```
'[ `[ / '] `]   - first / last char of last changed / yanked text
'< `<` / '> `>  - first / last char of last visual selected text
''  ``          - previous jump position
'" `"           - position before exiting the buffer (useful when re-open it)
'^ `^           - last insert mode position
'. `.           - last edit position
[' [` / ]' ]`   - [count] previous / next lowercase mark
```

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
ct,<C-A>"        - we enter the new command `ct,` and then use Ctrl-A to insert new_text
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

- `q:` - opens a command-line window.
- `q/` - opens a search history window.

From the command line / search prompt - press `<C-F>` to switch to the command-line window.

Don't re-map the `q:`:

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
- `ga` - show ascii value of char under cursor
- `g8` - show utf-8 byte sequence for char under cursor

`:dig` - show digraphs
