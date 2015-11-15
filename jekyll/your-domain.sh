#!/bin/bash



# dir
dir="$(cd "$(dirname "$0")"; pwd)"

# git
cd /home/your-user
mkdir your-domain.git
cd your-domain.git
git --bare init

# hook
cp $dir/your-domain.post-receive hooks/post-receive
chown -R your-user:your-user ..
