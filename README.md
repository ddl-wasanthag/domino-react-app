# An example React app with the Vite framework on Domino

This repository contains the example code and instructions to create a new React project in Domino with the Vite framework. You can write your application using React components in JavaScript. Then use Vite to run a development server and see your changes instantly inside a Domino workspace.  Use Vite to build your final application for production in Domino.
The example app also contains a housing price prediction endpoint based on a Domino Model API endpoint. 

There is a CICD section with an example script to create a Domino project, git credentials, and deploy the app in this repository.

## Prerequisites

- You need to have Domino git credentials set up to create a git based project from https://github.com/ddl-wasanthag/domino-react-app
- If you are running the CICD automation outside of a Domino, you will need to set the environment variable DOMINO_USER_API_KEY
- Create a Domino compute environment with NPM. The following is an example config to add to your Domino compute environments Dockerfile instructions

```
# install Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash && \. "$HOME/.nvm/nvm.sh" && nvm install 22 && nvm use 22
```

- Deploy the Domino model API endpoint with the instructions in the endpoint folder.

- Set MODEL_API_URL(Ex: https://<your domino url>:443/models/6608b3be91229570a972aa95/latest/model and MODEL_API_TOKEN

### Github configuration

The CI/CD automation in this repository is based on GitHub Actions. Therefore, all the Domino project/App parameters, as well as secrets to clone github repository and connect to Domino via API, must be defined as GitHub variables and secrets.
Github Variables- APP_NAME

Ex: Housing_predictions

- DOMINO_URL

ex: cloud-cx.domino.tech

- DOMINO_USERNAME

ex: wasantha_gamage

- ENVIRONMENT_ID

ex: 68c09e16ff02ad64bfb459d3

- GIT_PROVIDER_NAME

ex: github_creds_001

- HARDWARE_TIER_ID

ex: Small

- PROJECT_NAME

ex: app_cicd_project01

- REPO_NAME

ex: Domino_React_App01

- REPO_URI
Github Secrets
- DOMINO_USER_API_KEY

- GH_PAT

- MODEL_API_TOKEN

- MODEL_API_URL

## App Preview
This is the process to develop and preview your application inside a Domino workspace. The example code used in this example is in the my-vite-app/src directory inside the repository. Make sure to update the .gitignore file to filter unnecessary files from being checked into the git repository.

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
- 
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


