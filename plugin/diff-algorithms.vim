" Similar: vim-diff-enhanced instead - there is a vim script implementaion
" of pdiff (diff format conversion)
"
" pdiff script is from the 'TyeMcQueen/vim-merge-windows'
" Actually I only need 'pdiff' script from there which converts
" between git diff format and vim diff
let s:diff_algo = "patience"
" Absolute path of script dir:
let s:path = expand('<sfile>:p:h')
let s:pdiff_script = s:path . "/pdiff"
function! PDiff()
    let opt = ""
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-b -B "
    endif
    " pdiff script sets --patience option, but our options come at the end,
    " so we will overwrite the algorithm
    " supported are:
    "  default, myers
    "      The basic greedy diff algorithm. Currently, this is the default.
    "  minimal
    "      Spend extra time to make sure the smallest possible diff is produced.
    "  patience
    "      Use ""patience diff"" algorithm when generating patches.
    "  histogram
    "      This algorithm extends the patience algorithm to
    "      support low-occurrence common elements
    let opt = opt . "--diff-algorithm=" . s:diff_algo . " "
    silent execute "! ". s:pdiff_script . " -a " . opt . v:fname_in . " " .
        \ v:fname_new . " > " . v:fname_out
endfunction
function! PDiffOn(algorithm)
  let s:diff_algo = a:algorithm
  set diffexpr=PDiff()
  diffupdate
endfunction
function! PDiffOff()
  set diffexpr=
  diffupdate
endfunction
"These commands allow to set different diff algorithms
"So when vim is in diff / conflict resolution mode
"the diff can be switched with
"  :PDiffOnPatience
"to use patience diff algorithm
command! PDiffOnMyers call PDiffOn('myers')
command! PDiffOnPatience call PDiffOn('patience')
command! PDiffOnMinimal call PDiffOn('minimal')
command! PDiffOnHistogram call PDiffOn('histogram')
command! PDiffOff call PDiffOff()
