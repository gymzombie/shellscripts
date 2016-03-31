# Not really a bash_history, but a scratchpad to keep commands that I pickup or use
# and want to keep handy. Some sysadmin stuff, some pentesty stuff. 

apt-get upgrade | tee upgrade-$( date +%F ).log
openssl s_client -connect customer.website.com:443
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
cat /etc/default/ntp
sudo vi /etc/default/ntp
sudo service ntp restart
netstat -ant
for file in $(ls -1 .); do if [ -s "$file" ]; then rm $file; fi; done
sudo apt-get install java
sudo apt-get search java
apt-get -h
sudo apt-get install metasploit
sudo apt-get install msfconsole
ls
./quick-msf-setup 
sudo ./quick-msf-setup 
source ~/.bashrc
ls
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





