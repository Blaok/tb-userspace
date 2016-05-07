# tb-userspace
Tunnel Broker provided by HE.net Running at User Space for Systemd.

Requires `iproute2` and `gcc`. Tested and used on an OpenVZ VPS running Debian 8.

## Motivation

OpenVZ VPS do not allow 6in4 tunnel at kernel space. To use an OpenVZ VPS as an HE.net tunnel broker end point, some tricks are needed, as provided in this repo.

## How to Use

Clone first.
```
git clone https://github.com/Blaok/tb-userspace
cd tb-userspace
```

Make and install.
```
make
sudo make install
```

Edit configuration(s) accordingly.
Do not use the name `example.conf` as it would be removed when `make uninstall`.
Configuration files are located at `/etc/tb-userspace` by default.
Create something like `/etc/tb-userspace/someconfig.conf`.
Then
```
sudo systemctl start tb@someconfig
sudo systemctl enable tb@someconfig
```

## Notes

The makefile will add a `10 tb` entry to `/etc/iproute/rt_tables` when `make install` and remove any `10 tb` line when `make uninstall`. Make sure there is no conflict with exsiting `rt_tables`.

The tb-userspace source code is obtained from `https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/tb-tun/tb-tun_r18.tar.gz`. I commented out line 106 and 142 to avoid unnecessary debugging information. Besides, I renamed it from `tb_userspace.c` to `tb-userspace.c`.
