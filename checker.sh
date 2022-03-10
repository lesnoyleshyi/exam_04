gcc -Wall -Wextra -Werror microshell3.c -o microshell
if [ $? -ne 0 ]
then
  echo -e '\033[0;31m' COMPILATION FAILED '\033[0m'
  exit 1
fi
echo "~~~text in the file~~~" >> file.txt
touch temp_my_out
touch temp_bash_out

echo -e "\033[1;36mTEST 1 :
 /bin/ls\033[0;37m"
./microshell /bin/ls &> temp_my_out
              /bin/ls &> temp_bash_out

if [ "$(diff temp_my_out temp_bash_out)" ]
then
  echo -e '\033[0;31m'TEST KO'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
else
  echo -e '\033[0;32m'TEST OK'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
fi

echo -e "\n\033[1;36mTEST 2 :
 /bin/cat file.txt "\|" /bin/cat -e\033[0;37m"
./microshell /bin/cat file.txt "|" /bin/cat -e &> temp_my_out
              /bin/cat file.txt | /bin/cat -e &> temp_bash_out
if [ "$(diff temp_my_out temp_bash_out)" ]
then
  echo -e '\033[0;31m'TEST KO'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
else
  echo -e '\033[0;32m'TEST OK'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
fi

echo -e "\n\033[1;36mTEST 3 :
 /bin/cat file.txt\033[0;37m"
./microshell /bin/cat file.txt &> temp_my_out
              /bin/cat file.txt &> temp_bash_out
if [ "$(diff temp_my_out temp_bash_out)" ]
then
  echo -e '\033[0;31m'TEST KO'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
else
  echo -e '\033[0;32m'TEST OK'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
fi

echo -e "\n\033[1;36mTEST4 :
 /bin/ls microshell.c\033[0;37m"
./microshell /bin/ls microshell.c &> temp_my_out
              /bin/ls microshell.c &> temp_bash_out
if [ "$(diff temp_my_out temp_bash_out)" ]
then
  echo -e '\033[0;31m'TEST KO'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
else
  echo -e '\033[0;32m'TEST OK'\n'Your output: '\t\t\t\t\t\t\t'Bash output:
  diff -y temp_my_out temp_bash_out
  echo -e '\033[0m'
fi

echo -e "\n\033[1;36mTEST5 :
 /bin/ls salut\033[0;37m"
./microshell /bin/ls salut

echo -e "\n\033[1;36mTEST6 :
 "\;"\033[0;37m"
./microshell ";"

echo -e "\n\033[1;36mTEST7 :
 "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;"\033[0;37m"
./microshell ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";"

echo -e "\n\033[1;36mTEST8 :
 "\;" "\;" /bin/echo OK:\033[0;37m"
./microshell ";" ";" /bin/echo OK

echo -e "\n\033[1;36mTEST9 :
 "\;" "\;" /bin/echo OK "\;":\033[0;37m"
 ./microshell ";" ";" /bin/echo OK ;

echo -e "\n\033[1;36mTEST10 :
 "\;" "\;" /bin/echo OK "\;" /bin/echo OK:\033[0;37m"
./microshell ";" ";" /bin/echo OK ";" /bin/echo OK

echo -e "\n\033[1;36mTEST11 :
 "\;" "\;" /bin/echo OK "\;" "\;" /bin/echo OK\033[0;37m"
./microshell ";" ";" /bin/echo OK ";" ";" /bin/echo OK

echo -e "\n\033[1;36mTEST12 :
 "\;" "\;" /bin/echo OK "\;" "\;" "\;" /bin/echo OK\033[0;37m"
./microshell ";" ";" /bin/echo OK ";" ";" ";" /bin/echo OK

echo -e "\n\033[1;36mTEST13 :
 /bin/ls "\|" /usr/bin/grep microshell\033[0;37m"
./microshell /bin/ls "|" /usr/bin/grep microshell

echo -e "\n\033[1;36mTEST14 :
 /bin/ls "\|" /usr/bin/grep microshell "\|" /usr/bin/grep micro\033[0;37m"
./microshell /bin/ls "|" /usr/bin/grep microshell "|" /usr/bin/grep micro

echo -e "\n\033[1;36mTEST15 :
 /bin/ls "\|" /usr/bin/grep microshell "\|" /usr/bin/grep micro "\|" /usr/bin/grep shell "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell "\|" /usr/bin/grep shell\033[0;37m"
./microshell /bin/ls "|" /usr/bin/grep microshell "|" /usr/bin/grep micro "|" /usr/bin/grep shell "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro

echo -e "\n\033[1;36mTEST16 :
 /bin/ls "\|" /usr/bin/grep microshell "\|" /usr/bin/grep micro "\|" /usr/bin/grep shell "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro "\|" /usr/bin/grep micro\033[0;37m"
./microshell /bin/ls "|" /usr/bin/grep microshell "|" /usr/bin/grep micro "|" /usr/bin/grep shell "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep micro "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell "|" /usr/bin/grep shell

echo -e "\n\033[1;36mTEST17 :
 /bin/ls ewqew "\|" /usr/bin/grep micro "\|" /bin/cat -n "\;" /bin/echo dernier "\;" /bin/echo\033[0;37m"
./microshell /bin/ls ewqew "|" /usr/bin/grep micro "|" /bin/cat -n ";" /bin/echo dernier ";" /bin/echo

echo -e "\n\033[1;36mTEST18 :
 /bin/ls "\|" /usr/bin/grep micro "\|" /bin/cat -n "\;" /bin/echo dernier "\;" /bin/echo ftest "\;"\033[0;37m"
./microshell /bin/ls "|" /usr/bin/grep micro "|" /bin/cat -n ";" /bin/echo dernier ";" /bin/echo ftest ";"

echo -e "\n\033[1;36mTEST19 :
 /bin/echo ftest "\;" /bin/echo ftewerwerwerst "\;" /bin/echo werwerwer "\;" /bin/echo qweqweqweqew "\;" /bin/echo qwewqeqrtregrfyukui "\;"\033[0;37m"
./microshell /bin/echo ftest ";" /bin/echo ftewerwerwerst ";" /bin/echo werwerwer ";" /bin/echo qweqweqweqew ";" /bin/echo qwewqeqrtregrfyukui ";"

echo -e "\n\033[1;36mTEST20 :
 /bin/ls ftest "\;" /bin/ls "\;" /bin/ls werwer "\;" /bin/ls microshell.c "\;" /bin/ls subject.fr.txt "\;"\033[0;37m"
./microshell /bin/ls ftest ";" /bin/ls ";" /bin/ls werwer ";" /bin/ls microshell.c ";" /bin/ls subject.en.txt ";"

echo -e "\n\033[1;36mTEST21 :
 /bin/ls ewqew "\|" /usr/bin/grep micro "\|" /bin/cat -n "\;" /bin/echo dernier "\;" /bin/echo\033[0;37m"
./microshell /bin/ls ewqew "|" /usr/bin/grep micro "|" /bin/cat -n ";" /bin/echo dernier ";" /bin/echo

echo -e "\n\033[1;36mTEST22 :
 /bin/ls "\|" /usr/bin/grep micro "\;" /bin/ls "\|" /usr/bin/grep micro "\;" /bin/ls "\|" /usr/bin/grep micro "\;" /bin/ls "\|" /usr/bin/grep micro "\;"\033[0;37m"
./microshell /bin/ls "|" /usr/bin/grep micro ";" /bin/ls "|" /usr/bin/grep micro ";" /bin/ls "|" /usr/bin/grep micro ";" /bin/ls "|" /usr/bin/grep micro ";"

echo -e "\n\033[1;36mTEST23 :
 /bin/cat file.txt "\|" /usr/bin/grep a "\|" /usr/bin/grep b "\;" /bin/cat file.txt "\;"\033[0;37m"
./microshell /bin/cat file.txt "|" /usr/bin/grep a "|" /usr/bin/grep b ";" /bin/cat file.txt ";"

echo -e "\n\033[1;36mTEST24 :
 /bin/cat file.txt "\|" /usr/bin/grep a "\|" /usr/bin/grep w "\;" /bin/cat file.txt "\;"\033[0;37m"
./microshell /bin/cat file.txt "|" /usr/bin/grep a "|" /usr/bin/grep w ";" /bin/cat file.txt ";"

echo -e "\n\033[1;36mTEST25 :
 /bin/cat file.txt "\|" /usr/bin/grep a "\|" /usr/bin/grep w "\;" /bin/cat file.txt\033[0;37m"
./microshell /bin/cat file.txt "|" /usr/bin/grep a "|" /usr/bin/grep w ";" /bin/cat file.txt

echo -e "\n\033[1;36mTEST26 :
 /bin/cat file.txt "\;" /bin/cat file.txt "\|" /usr/bin/grep a "\|" /usr/bin/grep b "\|" /usr/bin/grep z "\;" /bin/cat file.txt\033[0;37m"
./microshell /bin/cat file.txt ";" /bin/cat file.txt "|" /usr/bin/grep a "|" /usr/bin/grep b "|" /usr/bin/grep z ";" /bin/cat file.txt

echo -e "\n\033[1;36mTEST27 :
 "\;" /bin/cat file.txt "\;" /bin/cat file.txt "\|" /usr/bin/grep a "\|" /usr/bin/grep b "\|" /usr/bin/grep z "\;" /bin/cat file.txt\033[0;37m"
./microshell ";" /bin/cat file.txt ";" /bin/cat file.txt "|" /usr/bin/grep a "|" /usr/bin/grep b "|" /usr/bin/grep z ";" /bin/cat file.txt

echo -e "\n\033[1;36mTEST28 :
 blah "\|" /bin/echo OK\033[0;37m"
./microshell blah "|" /bin/echo OK

echo -e "\n\033[1;36mTEST29 :
 blah "\|" /bin/echo OK "\;"\033[0;37m"
./microshell blah "|" /bin/echo OK ";"

echo -e "\n\033[1;36mTEST30 :
 "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" blah "\|" /bin/echo OK "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;" "\;"\033[0;37m"
./microshell ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" blah "|" /bin/echo OK ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";" ";"
rm file.txt
rm temp_my_out
rm temp_bash_out