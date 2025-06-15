# ~/.config/polybar/scripts/gpu-temp.sh
#!/bin/bash
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n1)
echo " ${temp}°C"

