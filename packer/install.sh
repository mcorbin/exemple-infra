apt-get update
apt-get -y dist-upgrade

apt-get -y install curl tcpdump fail2ban htop

## upgrade cloud init

cd /tmp && wget https://sos-ch-gva-2.exo.io/mcorbin.fr.exemple-infra/cloud-init_19.3-24-g3baabe76-1~bddeb_all.deb && dpkg --force-confold -i cloud-init_19.3-24-g3baabe76-1~bddeb_all.deb

## configure the exoscale datasource

cat << EOF > /etc/cloud/cloud.cfg.d/99_exoscale.cfg
datasource:
  Exoscale: {}
  None: {}
datasource_list: ["Exoscale"]
EOF

## clean cloud init data

cloud-init clean
