Plug 'haystackandroid/cosmic_latte'

augroup LatteOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme cosmic_latte
    autocmd User PlugLoaded ++nested set background=light
augroup end
