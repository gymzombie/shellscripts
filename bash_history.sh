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







