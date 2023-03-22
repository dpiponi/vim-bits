" Upload the visual selection to godbolt.org
" Hardcoded for tools I use
" wslview came from https://github.com/wslutilities/wslu
" (Useful if you're running on WSL)

fun! GodboltRegion(s,e)
  let lines = getline(a:s,a:e)
  let file = tempname()
  cal writefile(['{',' "sessions": [',' { "id": 1,',' "language": "c++",',' "source": "'.substitute(escape(join(lines, '\n'), '"'), "\<TAB>", '\\t', 'g').'",','       "compilers": [],', '      "executors": [', '        {', '          "compiler": {', '            "id": "clang_trunk",', '            "libs": [],', '            "options": "-std=c++20"', '
}', '        }', '      ]', '    }', '  ]', '}' ], file)
  "redir @g
"   silent exec 'echom system("cat '.file.'")'
  silent exec system('wslview "https://godbolt.org/clientstate/"`base64<'.file.'`')
  "cal delete(file)
  redraw
  "redir END
  echo "Region Godbolted."
endf
augroup GodboltEval
  au!
 :command! -range Godbolt  :cal GodboltRegion(<line1>,<line2>)
 :vnoremap <silent> q   :Godbolt<CR>
augroup END
