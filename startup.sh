if [ ! -z "$PUBLIC_KEY" ]; then
  echo "$PUBLIC_KEY" > /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys
fi
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
echo 'Port 22' >> /etc/ssh/sshd_config
/usr/sbin/sshd -D