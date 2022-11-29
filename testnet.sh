#    NEED PRIVILEGE ACCESS root:x:0:0:root:/root:/bin/bash
#

echo ""
if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "[!] NEED PRIVILEGE ACCESS root:x:0:0:root:/root:/bin/bash";
    echo "[!] TYPE 'sudo bash testnet.sh'";
    echo ""
exit 1

# Update
sudo apt-get update && sudo apt-get upgrade -y

# Install Package
sudo apt-get install ufw net-tools unzip -y

# Enable UFW
sudo ufw allow 22
sudo ufw allow 9000:9005/udp
sudo ufw enable

# Get testnet version of Dusk Network
cd $HOME
DUSK_BINARIES_URL="https://dusk-infra.ams3.digitaloceanspaces.com/rusk/itn-pack-binaries-linux.zip"
VERIFIER_KEYS_URL="https://dusk-infra.ams3.digitaloceanspaces.com/keys/vd-keys.zip"

check_installed() {
    binary_name=$1
    which $binary_name >/dev/null 2>&1
    if [ $? -eq 1 ]; then
        echo "INSTALLING $binary_name"
        apt install $binary_name -y
    fi
}

check_installed unzip
check_installed net-tools

mkdir -p /opt/dusk/installer

echo "CREATING DUSK SERVICE USER"
id -u dusk >/dev/null 2>&1 || useradd -r dusk

curl -so /opt/dusk/installer/itn-pack-binaries-linux.zip "$DUSK_BINARIES_URL"
unzip -d /opt/dusk /opt/dusk/installer/itn-pack-binaries-linux.zip
chmod +x /opt/dusk/bin/detect_ips.sh

mkdir -p /opt/dusk/data/.rusk
mkdir -p /opt/dusk/data/chain

curl -so /opt/dusk/installer/vd-keys.zip "$VERIFIER_KEYS_URL"
unzip -d /opt/dusk/data/ /opt/dusk/installer/vd-keys.zip

mv /opt/dusk/services/dusk.service /etc/systemd/system/dusk.service
mv /opt/dusk/services/rusk.service /etc/systemd/system/rusk.service

systemctl enable dusk rusk
systemctl daemon-reload

echo "DUSK NODE INSTALLED"
rm -rf /opt/dusk/installer

# Set Path Wallet And Password
if [ ! $DUSK_WALLLET_PATH ]; then
    echo ""
    echo "[!] EXAMPLE /root/.dusk/rusk-wallet"
    echo "[!] PROVISIONER KEY-PAIR"
    echo ""
	read -p "[ENTER YOUR PATH] > " DUSK_WALLLET_PATH
	echo 'export DUSK_WALLLET_PATH='$DUSK_WALLLET_PATH >> $HOME/.bash_profile
fi
if [ ! $DUSK_WALLLET_PASSWORD ]; then
    echo ""
    echo "[!] MATCH THE PASSWORD IN THE WALLET"
    echo ""
	read -p "[ENTER YOUR PASSWORD] > " DUSK_WALLLET_PASSWORD
	echo 'export DUSK_WALLLET_PASSWORD='$DUSK_WALLLET_PASSWORD >> $HOME/.bash_profile
fi
echo ""
echo "YOUR PATH DUSK WALLET      : $DUSK_WALLLET_PATH"
echo "YOUR PASSWORD DUSK WALLET  : $DUSK_WALLLET_PASSWORD"
echo ""

# Excutions Path Wallet And Password
cd $DUSK_WALLLET_PATH
mv *.key /opt/dusk/conf/consensus.keys

echo "DUSK_CONSENSUS_KEYS_PASS=$DUSK_WALLLET_PASSWORD" > /opt/dusk/services/dusk.conf

# Starting Service
service rusk start
service dusk start

echo "SETUP FINISHED"
echo ""
echo "CHECK RUNNING LOGS : tail -f /var/log/rusk.log"
echo ""

# End
