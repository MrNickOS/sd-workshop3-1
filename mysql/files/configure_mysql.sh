#!/usr/bin/expect -f
 spawn /usr/bin/mysql_secure_installation
 expect ":" # Enter current password for root (enter for none):
 send -- "password\r"
 expect "n]" # Set root password?
 send -- "y\r"
 expect ":" # New password:
 send -- "password\r"
 expect ":" # Re-enter new password:
 send -- "password\r"
 expect ":" # Remove anonymous users?
 send -- "n\r"
 expect ":" # Disallow root login remotely?
 send -- "n\r"
 expect ":" # Remove test database?
 send -- "n\r"
 expect ":" # Reload privilege tables now?
 send -- "y\r"
 expect eof
