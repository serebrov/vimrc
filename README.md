# About

This is my personal vim configuration along with some information about vim usage.

The config is common for both vim and neovim.

# Vim usage

## Insert/command mode keys

- `<C-h>` - delete prev char
- `<C-W>` - delete previous word
- `<C-U>` - delete current line
- `<C-O>` - execute normal command and get back to insert mode

## Insert/command mode - insert from the register

`<C-R><r>` - insert the text from register

Like:

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

## Insert-mode insert last text

`<C-A>` - Insert last inserted text.

Example:

```
"some_text(...)
cf(new_text"      - change "some_text" to "new_text" till the (

"some_text, ...   - now we need to do the same change, but till the comma
ct,Ctrl-A"        - we enter the new command `ct,` and then use Ctrl-A to insert new_text
```

## Insert-mode autocompletion

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


## Visual mode

- `v` / `V` / `<C-V>` - char / line / block visual mode
- `o` - move to other end of the selection
- `O` - in block mode - move to other corner on the same line
- `c` - in block mode - change block

Visual block + $ - selects a non-rectangular block. Then use `A` to append to the end of lines.

Alternative: do `A` on one line, then select a block and repeat with `:'<,'>normal .`.

## Digraphs and special chars

- `<C-K>{char1}{char2}` - insert a digraph (normal mode)
 - [alpha digraphs](./vim/digraph-alpha.txt)
 - [symbol digraphs](./vim/digraph-symbol.txt)
- `<C-V><key>` - insert the key literally (like <C-V><Tab> always inserts tab, regardless of 'expandtab' option).
- `<C-V>{code}` - insert the unicode char literally by decimal code
- `<C-Vu>{code}` - insert by hex code
