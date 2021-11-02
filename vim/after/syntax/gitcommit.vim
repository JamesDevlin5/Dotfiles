
setlocal spell

syn clear gitcommitSummary
syn match gitcommitSummary "^.\{0,50\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell
