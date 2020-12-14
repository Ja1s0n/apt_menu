#!/bin/bash - 

checkargs () {
	if [[ $OPTARG =~ ^-[d/g/f/a/l/r/i/s/w/e/t/y/h]$ ]] ; then
		echo "[!] Неизвестный аргумент '$OPTARG' для флага [-$opt].
Воспользуйтесь флагом [-h]."
		exit 1
	fi
}

if [ $# -lt 1 ] ; then
	apt
	echo "
	[!] Воспользуйтесь флагом [-h]."
	exit 1
fi

while getopts "dgfalr:i:s:w:e:t:y:h" opt ; do
	case $opt in
		d) checkargs ; sudo apt update ;;
		g) checkargs ; sudo apt upgrade ;;
		f) checkargs ; sudo apt full-upgrade ;;
		a) checkargs ; sudo apt autoremove ;;
		l) checkargs ; sudo apt list ;; 
		r) checkargs ; sudo apt remove $OPTARG ;;
		i) checkargs ; sudo apt install $OPTARG ;;
		s) checkargs ; sudo apt search $OPTARG ;;
		w) checkargs ; sudo apt show $OPTARG ;;
		e) checkargs ; sudo apt reinstall $OPTARG ;;
		t) checkargs ; sudo apt edit-sources $OPTARG ;;
		y) checkargs ; sudo apt satisfy $OPTARG ;;
		h) echo "Использование: $0 [флаг] <пакет> 
Отсутсвие флагов приведёт к выводу команды apt.

Список флагов: 
  [-l] list
  [-s] search <пакет>
  [-w] show <пакет>
  [-i] install <пакет>
  [-e] reinstall <пакет>
  [-r] remove <пакет>
  [-a] auto-remove
  [-d] update 
  [-g] upgrade
  [-f] full-upgrade
  [-t] edit-sources <пакет>
  [-y] satisfy <пакет>" ;;
		*) echo "[!] Данный флаг не поддерживается или не был указан аргумент. Воспользуйтесь флагом [-h].";;
	esac
done
