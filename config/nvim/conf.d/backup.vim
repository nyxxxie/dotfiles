" Backup files also are saved in the working dir.
" This changes that too.
if isdirectory($HOME . '/.config/nvim/backup') == 0
  :silent !mkdir -p ~/.config/nvim/backup >/dev/null 2>&1
endif
set backupdir=~/.config/nvim/backup//
set backupdir+=.
set backup
