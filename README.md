# OWASP ZAP Scan with Basic HTTP auth in Docker

This project adds support to perform Basic HTTP authenticated scans using the OWASP ZAP Docker

# Examples using Basic HTTP auth scan

Running a passive scan with automatic authentication.

``sudo bash baseline.sh https://example.com username password``

Running a full scan (max 10 mins spider and max 60 min scanning) with automatic authentication.

``sudo bash fullscan.sh https://example.com username password``

For more info on the different scantypes and parameters take a look at: https://www.zaproxy.org/docs/docker/
