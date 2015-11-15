#!/bin/sh



# create user
create_user()
{
	adduser $1
	echo $2 | passwd --stdin $1
	gpasswd --add $1 wheel

	mkdir /home/$1/.ssh
	echo "$3" > /home/$1/.ssh/authorized_keys
	chmod 700 /home/$1/.ssh
	chmod 600 /home/$1/.ssh/authorized_keys
	chown -R $1:$1 /home/$1
}

# execute
create_user your-user your-password "your-publickey"
