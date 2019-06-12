[ -f package.json ] &&
  echo "npm-init-ship-my-component did nothing. because a package.json was found; Delete the pacakage.json for the correct functionality" || {
dir=${PWD##*/}
read -p "Package publish name: ($dir)" name;
read -p "Version: (1.0.0)" version;
read -p "Project description: " description;
# version='1.0.1'
# description=''

/usr/bin/expect <<!
spawn npm init
expect "package name:"
send "$name\n"
expect "version:"
send "$version\n"
expect "description:"
send "$description\n"
expect "entry point:"
send "build/index.js\n"
expect "test command:"
send "webpack\n"
expect "git repository"
send "\n"
expect "keywords:"
send "\n"
expect "author:"
send "\n"
expect "license:"
send "\n"
expect "Is this O*"
send "\n"
expect eof
!

# send "$name\n"
# send "$entryPoint\n"
# send "$testCommand\n"
# send "$gitRepo\n"
# send "$keywords\n"
# send "$author\n"
# send "$license\n"
# send "$isOkay\n"
}
