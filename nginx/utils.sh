#!/bin/bash

function createAvailableSite() {
cat <<- EOF > /tmp/${1}
server {
  listen 80;
  listen [::]:80;

  server_name ${1};

  location / {
    include proxy_params;
    proxy_pass http://127.0.0.1:${2};
  }
}
EOF
}
