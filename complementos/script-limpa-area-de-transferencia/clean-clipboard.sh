# ~/.local/bin/clear-clipboard.sh
#!/bin/bash

# Limpa o histórico do cliphist
rm -f ~/.cache/cliphist/db

# Limpa o clipboard ativo do Wayland
wl-copy --clear 2>/dev/null || true
