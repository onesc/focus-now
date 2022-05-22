# focus-now
#### Temporarily block websites and improve productivity

# Usage
Edit the records in `blocked.txt` to add or remove any sites you want to block yourself out of
```
127.0.0.1   facebook.com
127.0.0.1   www.facebook.com
127.0.0.1   youtube.com
127.0.0.1   www.youtube.com
```
By default, you will be locked out for 25 mins (one pomodoro)
```
$ bash focus.sh
```
```
Focus! Sites will unblock in 1500 seconds...
```

Cancelling the process with `CTRL + C` will unblock the sites early

You can input an amount of minutes to be block sites for
```
$ bash focus.sh 60
```
```
Focus! Sites will unblock in 3600 seconds...
```

For ease of use, add an alias to your `~/.bash_profile` so the command can be run from anywhere
```
alias focus="bash $(dirs +0)/focus.sh"
echo -e "\nalias focus=\"bash $(dirs +0)/focus.sh\"" >> ~/.bash_profile
focus
```

Now go get some work done 😃