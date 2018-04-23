#!/bin/bash

acbuild begin
acbuild set-name mikejoh/go-web-app
acbuild copy go-web-app /bin/go-web-app
acbuild set-exec /bin/go-web-app
acbuild port add www tcp 5000
acbuild label add version 0.0.1
acbuild label add arch amd64
acbuild label add os linux
acbuild annotation add authors "mikejoh"
acbuild write go-web-app-0.0.1-linux-amd64.aci
acbuild end
