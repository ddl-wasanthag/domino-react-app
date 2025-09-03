# An example React app with the Vite framework on Domino

This repository has the example code and instructions to - Create a new React project with the Vite framework- Write your application using React components in JavaScript- Use Vite to run a development server and see your changes instantly-Use Vite to build your final application for production in Domino

## Prerequisites

- You need to have Domino git credentials set up to create a git based project from https://github.com/ddl-wasanthag/domino-react-app
- Create a Domino compute environment with NPM. The following is an example config to add to your Domino compute environments Dockerfile instructions
```
# install Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash && \. "$HOME/.nvm/nvm.sh" && nvm install 22 && nvm use 22
```
## App Preview
This is the process to develop and preview your application inside a Domino workspace. The example code used in this example is in the my-vite-app/src directory inside the repository. Make sure to update the .gitignore file to filter unnecessary files into the git repository.
- Create a Vite project

```

yes | npm create vite@latest my-vite-app -- --template react --force
cd my-vite-app/
npm install
```
-Create a Vite config that allows the Jupyter proxy to be used inside a Domino workspace. This has to be created inside the my-vite-app directory.
```
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
```
- Run app with Jupyter proxy
Make sure to replace x.y.z.com with your Domino URL.

```
npm run build
PROXY_URL="https://x.y.z.com/$(echo "$JUPYTER_SERVER_URL" | cut -d'/' -f4- | sed 's|/$||')/proxy/4173/"
echo $PROXY_URL
echo $PROXY_URL
echo Preview will be available $PROXY_URL
npm run preview

```

## Publish the app in Domino

The app.sh file defines the steps for the code inside my-vite-app/src directory to be run as a Domino Web App.
To run this app now as a Domino web app, publish the app using the app.sh from the Domino Deployments>app menu.
