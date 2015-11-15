#!/bin/bash



# execute
./init/init.sh
./security/firewall.sh
./security/user.sh
./security/ssh.sh

./nginx/nginx.sh
./jekyll/jekyll.sh
./jekyll/your-domain.sh
