FROM golang

# RUN export GOPATH=$HOME/go
# RUN export PATH=$PATH:$GOPATH/bin
ENV GOOS=darwin GOARCH=386 
WORKDIR /go/src/app/vendor/github.com/hashicorp/packer/
COPY . .

CMD ["go", "build", "-o", "bin/packer", "."]