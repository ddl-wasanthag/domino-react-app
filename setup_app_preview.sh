# install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
 \. "$HOME/.nvm/nvm.sh"
nvm install 22
# Remove any pre-existing folder…
rm -rf my-vite-app
# Create vite project
yes | npm create vite@latest my-vite-app -- --template react --force
#Configure vite to run on Domino
cd my-vite-app/
npm install

#crate vite config
cat << 'EOF' > vite.config.js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0',
    allowedHosts: true
  },
  base: './'
})
EOF


#run app on jupyter proxy  
#npm run build
#VITE_MODEL_API_URL=$MODEL_API_URL VITE_MODEL_API_TOKEN=$MODEL_API_TOKEN npm run build
PROXY_URL=$(echo "$JUPYTER_SERVER_URL" | sed 's|/$||; s|http://run-68b856f6c7119a418b42d38c-kbhdb:8888|https://cloud-cx.domino.tech|')/proxy/4173/
PROXY_URL="https://cloud-cx.domino.tech/$(echo "$JUPYTER_SERVER_URL" | cut -d'/' -f4- | sed 's|/$||')/proxy/4173/"
echo $PROXY_URL
echo Preview will be available $PROXY_URL
npm run preview
