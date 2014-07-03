#!/bin/bash -ue

set -u
set -e

SSH_OPTIONS="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o PasswordAuthentication=no -o ConnectTimeout=1 -o ConnectionAttempts=10"
SSH="ssh $SSH_OPTIONS"
SCP="scp $SSH_OPTIONS -q"

$SSH root@registry.audiometric.io bash <(curl -sL https://raw.githubusercontent.com/audioandpixels/now/master/run.bash) --docker-registry
$SCP ~/.ssh/id_rsa root@cloud.audiometric.iogit pull https://github.com/tsuru/now.git master:~/.ssh/id_rsa
$SSH root@cloud.audiometric.io bash <(curl -sL https://raw.githubusercontent.com/audioandpixels/now/master/run.bash)
$SSH root@node01.audiometric.io bash <(curl -sL https://raw.githubusercontent.com/audioandpixels/now/master/run.bash) --node-only