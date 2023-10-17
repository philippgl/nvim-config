" vim: ft=vim
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = 'philg'


hi Black ctermfg=0
hi Black1 ctermfg=223
hi Black2 ctermfg=250
hi Black3 ctermfg=248
hi FadedGray ctermfg=246
hi Gray ctermfg=8
hi BrightGray ctermfg=243
hi White3 ctermfg=241
hi White2 ctermfg=239
hi White1 ctermfg=15
hi White ctermfg=235
hi Red ctermfg=1
hi Green ctermfg=2
hi Yellow ctermfg=3
hi Blue ctermfg=4
hi Purple ctermfg=5
hi Aqua ctermfg=6
hi Orange ctermfg=166
hi BrightRed ctermfg=9
hi BrightGreen ctermfg=10
hi BrightYellow ctermfg=11
hi BrightBlue ctermfg=12
hi BrightPurple ctermfg=13
hi BrightAqua ctermfg=14
hi BrightOrange ctermfg=130
hi FadedRed ctermfg=167
hi FadedGreen ctermfg=142
hi FadedYellow ctermfg=214
hi FadedBlue ctermfg=109
hi FadedPurple ctermfg=175
hi FadedAqua ctermfg=108
hi FadedOrange ctermfg=208
hi FadedGrayItalic ctermfg=246 cterm=italic
hi BlackOnRedBold ctermfg=0 ctermbg=1 cterm=bold
hi GreenBold ctermfg=2 cterm=bold
hi RedBold ctermfg=1 cterm=bold
hi BlueBold ctermfg=4 cterm=bold
hi OrangeBold ctermfg=166 cterm=bold
hi BrightYellowBold ctermfg=11 cterm=bold
hi GreenItalic ctermfg=2 cterm=italic
hi YellowItalic ctermfg=3 cterm=italic
hi GrayOnBlack1Italic ctermfg=8 ctermbg=223 cterm=italic
hi GrayOnBlack1 ctermfg=8 ctermbg=223
hi Bold cterm=bold
hi OrangeBgReverse ctermfg=166 cterm=reverse
hi RedFgReverseBold ctermbg=166 cterm=reverse,bold
hi YellowBgReverse ctermfg=3 cterm=reverse
hi OrangeBg ctermbg=166
hi YellowBg ctermbg=3
hi Underline cterm=underline
hi BlackOnWhite1 ctermfg=0 ctermbg=15
hi White3OnBlack2 ctermfg=241 ctermbg=250
hi Black1Bg ctermbg=223


hi! link ColorColumn Black1Bg
hi! link Conceal NonText
hi! link CursorColumn Black1Bg
hi! link CursorLine Black1Bg
hi! link Directory BlueBold
hi! link DiffAdd Green
hi! link DiffChange Yellow
hi! link DiffDelete Red
hi! link DiffText BrightYellowBold
hi! link ErrorMsg BlackOnRedBold
hi! link VertSplit Gray
hi! link Folded GrayOnBlack1Italic
hi! link FoldColumn GrayOnBlack1
hi! link SignColumn GrayOnBlack1
hi! link IncSearch OrangeBgReverse
hi! link LineNr Aqua
hi! link MatchParen YellowBgReverse
hi! link ModeMsg Yellow
hi! link Pmenu YellowBgReverse
hi! link PmenuSel OrangeBgReverse
hi! link PmenuSbar YellowBg
hi! link PmenuThumb OrangeBg
hi! link Question Yellow
hi! link Search YellowBgReverse
hi! link Sneak Yellow
hi! link SpecialKey Cyan
hi! link SpellBad Underline
hi! link SpellCap Underline
hi! link SpellLocal Underline
hi! link SpellRare Underline
hi! link StatusLine BlackOnWhite1
hi! link StatusLineNC White3OnBlack2
hi! link TabLine White3OnBlack2
hi! link TabLineFill White1
hi! link TabLineSel BlackOnWhite1
hi! link Title GreenBold
hi! link User1 RedFgReverseBold
hi! link WarningMsg BlackOnWhite1
hi! link Whitespace Black2
hi! link WildMenu OrangeBg
hi! link Error BlackOnRedBold
hi! link Comment FadedGrayItalic
hi! link NonText Black2
hi! link Todo YellowBgReverse
hi! link Underlined Bold
hi! link Identifier Blue
hi! link String Green
hi! link Function GreenBold
hi! link Type YellowItalic
hi! link PreProc Gray
hi! link StorageClass GreenItalic
hi! link Constant Purple
hi! link cppAccess GreenItalic
hi! link Statement Red
hi! link Conditional Red
hi! link Special Purple
hi! link Ignore NonText

let g:highlight_whitespace = 0

function! Toggle_highlight_whitespace()
    if g:highlight_whitespace == 0
        hi! link Whitespace BlackOnRedBold
        let g:highlight_whitespace = 1
    else
        hi! link Whitespace Black2
        let g:highlight_whitespace = 0
    endif
    redraw!
endfunction

noremap <leader>ll <esc>:call Toggle_highlight_whitespace()<cr>
