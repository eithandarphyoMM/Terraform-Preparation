#!/bin/bash
cat <<EOF > /var/www/html/index.html
<html>
  <head><title>${PREFIX} App</title></head>
  <body>
    <h1>Welcome to ${PREFIX}!</h1>
  </body>
</html>
EOF
