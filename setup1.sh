## Setup proxy

read -p "Is your workstation behind a proxy server (y/N)? " answer
case ${answer:0:1} in
    y|Y )
        reap -p "Proxy host:" _proxy_host
        read -p "Proxy port:" _proxy_port
        read -p "Proxy user:" _proxy_user
        read -p "Proxy password:" _proxy_pass
        if [[ $_proxy_user ]]; then
          _proxy_url="$_proxy_user:$_proxy_pass@$_proxy_host:$_proxy_port@"
        fi
        _proxy_url="$_proxy_url$_proxy_host:$_proxy_port"
        echo "export HTTP_PROXY=http://$_proxy_url/" >> ~/.bashrc
        echo "export HTTPS_PROXY=https://$_proxy_url/" >> ~/.bashrc
    ;;
    * )
        echo "Not setting up a proxy server..."
    ;;
esac

# Update system

sudo apt update
sudo apt upgrade -y

# Install and configure various system tools

sudo apt install git ssh tilix

### Configure git

read -p "Git username:" git_user
read _p "Git email:" git_email
git config --global user.name $git_user
git config --global user.mail $git_email

# Setup python

sudo apt install python3-pip

echo "export PATH=\$PATH:~/.local/bin/" >> ~/.bashrc
source ~/.bashrc
pip3 install -U virtualenv
virtualenv venv -p python3 ~/.
source ~/venv/bin/activate

read -p "Do you wish to install Python Data Science libraries (y/N)? " answer
case ${answer:0:1} in
    y|Y )
        pip install numpy matplotlib pandas dask datashader scikit-learn jupyter-lab
    ;;
    * ) ;;
esac

source ~/.bashrc

# Setup docker

read -p "Do you wish to install Docker (y/N)? " answer
case ${answer:0:1} in
    y|Y )
        sudo apt remove docker docker-engine docker.io containerd runc
        sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
        sudo apt update
        sudo apt install docker-ce docker-ce-cli containerd.io docker-compose
        sudo usermod -aG $USER docker
        echo "Docker will work properly at your next login."
    ;;
    * ) ;;
esac
