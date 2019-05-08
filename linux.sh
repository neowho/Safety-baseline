#!/bin/sh
:<<\EOF
About configuration file scan
Script author is neo_will
EOF
#复制要修改的文件login.defs为login_bak.defs
cp /etc/login.defs /etc/login_bak.defs
#定位要修改的数字99999，并修改为90
sed -i 's/99999/90/' /etc/login.defs
#复制要修改的文件system-auth为system-auth_bak
cp /etc/pam.d/system-auth /etc/pam.d/system-auth_bak
#在第17行插入密码复杂度要求，最小12位，大小写字符特殊字符各1位
sed -i '17 i\password    requisite     pam_cracklib.so difok=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=1' /etc/pam.d/system-auth
#在第9行插入启用pam_tally2.so
sed -i '9 i\account  required  pam_tally2.so' /etc/pam.d/system-auth
#在第4行插入认证行，密码出错5次锁定1分钟
sed -i '4 i\auth        required      pam_tally2.so deny=5 onerr=fail no_magic_root unlock_time=60'  /etc/pam.d/system-auth
echo  "success complete"