# install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
 \. "$HOME/.nvm/nvm.sh"
 nvm install 22
#Configure vite to run on Domino
cd my-vite-app/
npm install
#run app
npm run build
npm install -g serve
serve -s dist -l 8888
