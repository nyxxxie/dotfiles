" Backup files also are saved in the working dir.
" This changes that too.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir=~/.vim/backup//
set backupdir+=.
set backup
