apt-get update
apt-get -y dist-upgrade

apt-get -y install curl tcpdump fail2ban htop

cd /tmp && wget https://sos-ch-gva-2.exo.io/mcorbin.fr.exemple-infra/cloud-init_19.3-24-g3baabe76-1~bddeb_all.deb && dpkg --force-confold -i cloud-init_19.3-24-g3baabe76-1~bddeb_all.deb

