# speedtest-cli munin plugin
1. Requirements:
python, speedtest_cli, jq

2. Installation:
```shell
git clone https://github.com/deadda7a/speedtest-munin.git
sudo apt update
sudo apt install python3-pip jq
pip3 install speedtest_cli
cd speedtest-munin
sudo cp speedtest-munin.sh /etc/munin/plugins
sudo systemctl restart munin-node
```

3. Notes: Be aware this plugin is going to generate quite a lot of traffic!

4. License:
GPL-3.0
