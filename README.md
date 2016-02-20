## Insert-mode keys (also work in command-line mode)

- `<C-h>` - delete prev char
- `<C-W>` - delete previous word
- `<C-U>` - delete current line
- `<C-O>` - execute normal command and get back to insert mode
- `<C-R><r>` - insert the text from register, `<C-R>0` (zero) - paste yanked text, `<C-R>"` - paste the text from the unnamed register
- `<C-R>=` - prompt for the expression and insert it 3*0.65=1.95

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
