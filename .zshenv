# http://logrepo.blogspot.com/2010/12/zsh.html
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# path for mysql
export PATH=/opt/local/share/mysql5/mysql/:/opt/local/lib/mysql5/bin/:$PATH

# path for go
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
