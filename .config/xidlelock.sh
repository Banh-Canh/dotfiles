# Run xidlehook
xidlehook \
  --detect-sleep \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen, undim if user becomes active` \
  --timer 30 \
  'light -O && light -S 0.1' \
  'light -I' \
  `# Undim & lock` \
  --timer 30 \
    'pgrep i3lock || ~/.config/i3/i3lock-custom --nofork' \
    'light -I' \
  `# Finally, suspend after it locks` \
  --timer 240 \
    'light -I && systemctl suspend-then-hibernate' \
    ''
