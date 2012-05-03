" File: commonjs-package-json
" Author: Ash Berlin <ash.berlin@gmail.com>
" Last Change: 23-Feb-2010.
" Version: 1.1
" Usage:
"
" Use by placing something like the following in your .vimrc:
"
" let g:maintainer='{ "name": "Ash Berlin", "web": "http://ashberlin.com" }'
"
" and then save this file to ~/.vim/plugins/commonjs-package-json.vim:
"
"     mkdir -p ~/.vim/plugin
"     curl -q#L http://gist.github.com/gists/311512/download | tar xz -C ~/.vim/plugin --strip 1


function! CommonJSPackageJsonTemplate()
  let l:module_name=expand('%:p:h:t')

  if !exists('g:maintainer')
    echoerr "PackageJsonTemplate: g:maintainer needs to be set"
    return
  endif

  call append(0, [
  \'{',
  \'  "name": "' . l:module_name . '",',
  \'  "description": "",',
  \'  "version": "0.1.0",',
  \'  "keywords": [ "" ],',
  \'  "maintainers": [',
  \'    ' . g:maintainer,
  \'  ],',
  \'  "contributors": [',
  \'    ' . g:maintainer,
  \'  ],',
  \'  "licenses": [ "MIT" ],',
  \ ] )

  " g:github_user is used by gist.vim, so lets reuse that.
  if (exists('g:github_user') || executable('git'))
    if !exists('g:github_user')
      let g:github_user = substitute(system('git config --global github.user'), "\n", '', '')
    endif
    call append(line('$')-1, [
    \'  "repositories": {',
    \'    "type": "git",',
    \'    "url": "http://github.com/' . g:github_user . '/' . l:module_name . '.git"',
    \'  },',
    \'  dependencies: {}',
    \ ] )
  endif
  call append(line('$')-1, [ '}' ] )

  " And remove the empty line at the end
  normal dd

endfunction

if !exists("s:autocommands_loaded")
  let s:autocommands_loaded = 1
  autocmd BufNewFile package.json :call CommonJSPackageJsonTemplate()
endif
