#	Modified by Y.Hashimoto
#	May 19, 2004
#

#       Exit if not an interactive shell
setenv PATH  ""
if ($?USER == 0 || $?prompt == 0) then
  if (! $?path) set path = "."
  foreach element ( \
      /bin /sbin /usr/bin /usr/sbin /usr/local/bin /opt/bin \
    )
    if (-d $element) if ( "$path" !~ *" $element"*) set path = ($path $element)
  end
  if (-f /opt/tools/process/etc/cshrc) source /opt/tools/process/etc/cshrc
exit
endif

#	Interactive shell

# execute tcsh without using .login
if (($?prompt) && ("$shell" == "/bin/csh") && (-x /bin/tcsh) && ("$?tcsh" == 0)) then
	exec /bin/tcsh -l
endif

if (! $?path) set path = "."

if ( "$path" !~ *"$HOME/bin"*) \
   set path = ($path $HOME/bin)

if ( "$path" !~ *" /bin"*) \
   set path = ($path /bin)

if ( "$path" !~ *" /sbin"*) \
   set path = ($path /sbin)

if ( "$path" !~ *"/usr/bin"*) \
   set path = ($path /usr/bin)

if ( "$path" !~ *"/usr/sbin"*) \
   set path = ($path /usr/sbin)

if ( "$path" !~ *" /usr/local/bin"*) \
   set path = ($path /usr/local/bin)

if ( "$path" !~ *"/opt/bin"*) \
   set path = ($path /opt/bin)

if ( "$path" !~ *"/usr/X11R6/bin"*) \
   set path = ($path /usr/X11R6/bin)

if ( "$path" !~ *"/usr/kde/3.2/sbin"*) \
   set path = ($path /usr/kde/3.2/sbin)

if ( "$path" !~ *"/usr/kde/3.2/bin"*) \
   set path = ($path /usr/kde/3.2/bin)

if ( "$path" !~ *"/usr/i686-pc-linux-gnu/gcc-bin/3.3"*) \
   set path = ($path /usr/i686-pc-linux-gnu/gcc-bin/3.3)

if ( "$path" !~ *"/opt/local/bin"*) \
   set path = ($path /opt/local/bin)

set path = ( $path /opt/tools/cadence/vipcat1130016/tools.lnx86/lib/64bit )

setenv P4PORT 172.16.0.158:1667
setenv P4USER amey.kulkarni
setenv P4PASSWD amey.kulkarni
setenv P4CONFIG .p4config
setenv P4_VERSION 2014.3
setenv P4DIFF meld

set path = ( $path /opt/tools/perforce/$P4_VERSION/bin)

#### Proj vars #######

setenv LOCALWORK /opt/project/starlink/amethyst/users/$USER
setenv RESPO /opt/project/starlink/cvsdb/
setenv CVSROOT /opt/project/starlink/cvsdb/
setenv PROJ /opt/scratch/$USER/sapphire

set path=($path /opt/tools/process/bin\
                /opt/tools/process/bin/linux\
                /opt/tools/common/bin\
                /opt/tools/common/bin/linux\
                /opt/tools/common/bin/linux\
                /usr/lib/openoffice/program\
		/usr/openwin/bin\
		/opt/project/starlink/bin /$PROJ/digital/sims/bin\
		)


 umask	022
 set	filec
 set	history=90
 set	savehist=10
 set	editmode=emacs
 set	visiblebell
 set	ignoreeof
 set	term=vt100
 set	noclobber

 unset	autologout
 setenv	HOSTNAME `uname -n`
 setenv	OSVER `uname -r | /bin/awk -F\. '{print $1}' `
 if ( $?USER == "0" ) then
 	if ( $?LOGNAME ) then
 		setenv USER	$LOGNAME
 	else
 		setenv USER	` who am i | /bin/awk '{print $1}' `
 	endif
 endif

if (($?prompt) && ("$?tcsh" == 1)) then
	# prompt for tcsh
	 set	prompt='[%B%n@%m%b] %B%~%b %h %# '
else
	 set	prompt=''$USER'('`uname -n`')<%\!> '
endif

#setenv MANPATH "/usr/local/man:/usr/share/man:/usr/local/share/man:/opt/local/gnu/man"

# Source aliases
source ~/.aliases

#	biff n

#################################################################

if (-f /opt/tools/process/etc/cshrc) source /opt/tools/process/etc/cshrc

# My stuff
#
setenv TERM xterm-color
set autolist
set autocorrect     # Check spellings before attempting to complete commands
set autoexpand      # Expand history during command completion
setenv PAGEER less
alias cdw 'cd $PROJ'
alias emacs 'emacs -nw'
#setenv PRINTER lp2
setenv PRINTER lp10

alias cvsstf 'cvs st | grep -A 3 "Locally" | grep Repository'

#source	/opt/tools/process/bin/synopsys2009.06-4.src
#source /opt/tools/process/bin/synopsys2011.03.src
#source  /opt/tools/sunsource/sge/6.0/default/common/settings.csh

umask   022
# End

