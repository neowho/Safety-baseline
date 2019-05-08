#!/bin/sh

mv -f /etc/login_bak.defs /etc/login.defs
mv -f /etc/pam.d/system-auth_bak /etc/pam.d/system-auth

echo "back complete"
