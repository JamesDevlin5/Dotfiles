
if did_filetype() " Filetype already set
  finish
endif

let s:shebang = getline(1)
echo s:shebang

if s:shebang =~ '^#!.*\<sh\>'
  setfiletype sh
elseif s:shebang =~ '^#!.*\<bash\>'
  setfiletype bash
endif

