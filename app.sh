#Configure vite to run on Domino
cd my-vite-app/

#run app
npm run build
npm install -g serve
serve -s dist -l 8888
