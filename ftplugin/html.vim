if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1


nnoremap ,html :-1read ~/.vim/config/skeletal.html<CR>gg7jf>a
nnoremap ,b :read ~/.vim/config/break-tag.html<CR>kJ==f<f<i
nnoremap ,str :read ~/.vim/config/strong.html<CR>kJ==f<f<i
nnoremap ,a :read ~/.vim/config/a.html<CR>kJ==f<f"a
nnoremap ,lia :read ~/.vim/config/lia.html<CR>kJ==^f"a
