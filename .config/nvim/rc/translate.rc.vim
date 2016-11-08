"--------------------------------
" Translation process 
"
" Required: webapi-vim
"--------------------------------

function! s:getSelectedText()
    let tmp = @@
    silent normal = gvy
    let selected = @@
    return selected
endfunction

function! s:getSourceLang(word)
  let all = strlen(a:word)
  let eng = strlen(substitute(a:word, '[^\t -~]', '', 'g'))
  return eng * 2 < all ? 'ja' : 'en'
endfunction

function! s:getTransrateLang(sl)
  return a:sl == 'en' ? 'ja' : 'en'
endfunction

function! Translate()
    let url = 'https://translate.google.com/'
    let header = {'User-Agent': 'w3m/0.5.3'}
    let encode = 'UTF-8'

    let word = s:getSelectedText()
    let sl = s:getSourceLang(word)
    let tl = s:getTransrateLang(sl)
    let param = {
                \     'sl': sl,
                \     'tl': tl,
                \     'ie': encode,
                \     'oe': encode,
                \     'text': word
                \ }
    let res = webapi#http#get(url, param, header)
    let dom = webapi#html#parse(iconv(res.content, encode, &encoding))
    let result = dom.find({'id': 'result_box'}).childNodes()

    let text = []
    let tmp_string = ""
    for childs in result
        for child in childs.child
            if type(child) == 4
                call add(text, tmp_string)
                let tmp_string = ""
            else
                let tmp_string.= substitute(child, '&quot', '"', 'g')
            endif
            unlet child
        endfor
    endfor

    if tmp_string != ""
        call add(text, tmp_string)
    endif

    let ret = join(text)
    redi @">
    echon ret
    redi END
endfunction

vnoremap <silent> <leader>t :<C-u>call Translate()<CR>
