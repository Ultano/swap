# creación de ficheros swap


echo 'Antes de crear los nuevos ficheros, la memoria swap era:'
echo ''
swapon -s
echo ''
echo ''


echo 'creamos los ficheros...'
dd if=/dev/zero of=/var/swap1 bs=4096k count=512
dd if=/dev/zero of=/var/swap2 bs=4096k count=512
dd if=/dev/zero of=/var/swap3 bs=4096k count=512
dd if=/dev/zero of=/var/swap4 bs=4096k count=512
echo ''
echo ''
echo 'cambiamos permisos...'
chmod 600 /var/swap1
chmod 600 /var/swap2
chmod 600 /var/swap3
chmod 600 /var/swap4
echo ''
echo ''
echo 'establecemos los ficheros como swap...'
mkswap /var/swap1
mkswap /var/swap2
mkswap /var/swap3
mkswap /var/swap4
echo ''
echo ''
echo 'activamos nuestros nuevos ficheros swap...'
swapon /var/swap1
swapon /var/swap2
swapon /var/swap3
swapon /var/swap4
echo ''
echo ''
echo 'modificamos /etc/fstab para que se monten los archivos al iniciar...'
echo '/var/swap1  none        swap    sw     0     0' >> /etc/fstab
echo '/var/swap2  none        swap    sw     0     0' >> /etc/fstab
echo '/var/swap3  none        swap    sw     0     0' >> /etc/fstab
echo '/var/swap4  none        swap    sw     0     0' >> /etc/fstab
echo ''
echo ''
echo 'despues de crear los nuevos ficheros, la memoria swap es:'
echo ''
swapon -s
echo ''
echo ''
