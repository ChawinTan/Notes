## Usefull linux commands and articles

When encountering `could not get lock error`

https://itsfoss.com/could-not-get-lock-error/

When setting up virtualbox on ubuntu 18.04 and above and encountering permission errors:

https://askubuntu.com/questions/760671/could-not-load-vboxdrv-after-upgrade-to-ubuntu-16-04-and-i-want-to-keep-secur

### Setting up a mac os vm 

https://www.youtube.com/watch?v=FTnn4BrpJro

Google drive notes:

https://drive.google.com/drive/folders/1WlpFNP9yXLt4Gho23WS01b-hxRTHocSs

/*** remember to change version from sierra to just mac os x 64bit ***/

### Debugging a mouse that is connected but can't move

`sudo /etc/init.d/bluetooth restart`

### Kill a process

To find running processes:

`sudo lsof -i -P -n | grep LISTEN`

To kill a running process:

`sudo kill -9 $(sudo lsof -t -i:<port-number>)`

### keys, ssh and funcky cloud stuff

Private keys should be in the `.ssh` folder, without the `.gpg` behind.

To log into a remote machine: `ssh -i ~/.ssh/[key-name] user@remoteAddress`

`scp` -i ~/.ssh/key user@remoteAdd:/path/to/file path/to/local can be used to copy files from remote machine to local

 
