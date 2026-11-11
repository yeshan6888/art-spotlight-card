#!/bin/bash
cd "$HOME/Desktop" || exit 1
PORT=$(python3 -c 'import socket; s=socket.socket(); s.bind(("127.0.0.1",0)); print(s.getsockname()[1]); s.close()')
URL="http://127.0.0.1:${PORT}/3Dzhuiguang/"
echo "浮光珍藏本地预览：${URL}"
echo "保持此终端窗口开启；如果浏览器未自动打开，请复制上方地址。"
(sleep 1; open "$URL" >/dev/null 2>&1 || true) &
exec python3 -m http.server "$PORT" --bind 127.0.0.1
