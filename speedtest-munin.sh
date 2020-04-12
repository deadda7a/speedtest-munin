#!/usr/bin/env bash
: <<=cut
=head1 NAME
speedtest-munin: This script runs speedtest_cli and acts as a Munin plugin
=head1 APPLICABLE SYSTEMS
All systems with bash, jq and python
=head1 REQUIREMENTS
python, speedtest_cli, jq
=head1 CONFIGURATION
None
=head1 VERSION
0.1
=head1 AUTHOR
Sebastian Elisa Pfeifer <hallo @ basti . su>
=head1 LICENSE
GPLv3
=cut

# Check if requirements are installed!
if [! command -v jq > /dev/null 2>&1 ]; then
  echo "Error: jq not installed!"
  exit 1
elif ! command -v speedtest-cli > /dev/null 2>&1; then
  echo "Error: speedtest_cli not installed!"
  exit 1
fi

# Config section
if [ "$1" = "config" ]; then
	cat << EOF
"graph_title speedtest_cli"
"graph_args --base 1000 --lower-limit 0"
"graph_vlabel Traffic"
"graph_category network"
"graph_info Total network traffic in bytes."
"totaltx.label Sent"
"totaltx.info Total data sent."
"totaltx.cdef totaltx,1000000,*"
"totalrx.label Received"
"totalrx.info Total data received."
"totalrx.cdef totalrx,1000000,*"
EOF
	exit 0
fi;
