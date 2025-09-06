#!/bin/bash

# Start i3status and read its JSON output line-by-line
i3status | while read -r line; do
    # Get VPN status string from your script
    vpn_text=$(bash /etc/htb/i3status-server.sh)

    # Decide color based on VPN status
    if [[ "$vpn_text" == ⬢* ]]; then
        vpn_color="#FF0000"  # green if connected
    else
        vpn_color="#FF0000"  # red if not connected or error
    fi

    # Build JSON object for VPN block
    vpn_block="{\"full_text\": \"$vpn_text\", \"color\": \"$vpn_color\"}"

    # Insert VPN block into i3status line (must be valid JSON array)
    if [[ "$line" == *"["* ]]; then
        echo "${line/[/[$vpn_block,}"
    else
        echo "$line"
    fi
done
