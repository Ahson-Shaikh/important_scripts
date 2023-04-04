#! /bin/bash

# Statistics on tcp connections with different states (except LISTEN)
all_status_tcp=$(netstat -nt | awk 'NR>2 {print $6}' | sort | uniq -c)

# Print tcp connections and number of connections by status
all_tcp=$(netstat -na | awk '/^tcp/ {++S[$NF]};END {for(a in S) print a, S[a]}')

# Statistics on which IP addresses are connected to local port 80 (ipv4)
connect_80_ip=$(netstat -ant| grep -v 'tcp6' | awk '/:80/{split($5,ip,":");++S[ip[1]]}END{for (a in S) print S[a],a}' |sort -n)

# Output the first ten IP addresses connected to local port 80 (ipv4)
top10_connect_80_ip=$(netstat -ant| grep -v 'tcp6' | awk '/:80/{split($5,ip,":");++S[ip[1]]}END{for (a in S) print S[a],a}' |sort -rn|head -n 10)

echo -e "\e[31mThe different states (except LISTEN) of tcp connections and the number of connections are：\e[0m\n${all_status_tcp}"
echo -e "\e[31mThe individual state tcp connections and the number of connections are\e[0m\n${all_tcp}"
echo -e "\e[31mThe IP address and number of connections to the local port 80 are：\e[0m\n${connect_80_ip}"
echo -e "\e[31mThe first ten IP addresses and connections to local port 80 are：\e[0m\n${top10_connect_80_ip}"