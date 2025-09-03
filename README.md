# An example React app with Vite framework on Domino

## Pre requistes

- Createa Domino compute enviornment with NPM. The following is an exampel config to add to your Domino compyte enviornments Dockerfile instructions


```
# install Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash && \. "$HOME/.nvm/nvm.sh" && nvm install 22 && nvm use 22
```
## App Preview

### The following code can be run inside a workspace for development and preview.

```
# Create vite project
yes | npm create vite@latest my-vite-app -- --template react --force

#Configure vite to run on Domino
cd my-vite-app/
npm install

#create vite config
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
npm run build
PROXY_URL=$(echo "$JUPYTER_SERVER_URL" | sed 's|/$||; s|http://run-68b856f6c7119a418b42d38c-kbhdb:8888|https://domino.astrazeneca.net|')/proxy/4173/
echo $PROXY_URL
echo Preview will be available $PROXY_URL
npm run preview

```
## Publish the app in Domino

### To run this app now as a Domino web app publish the app using the app.sh

