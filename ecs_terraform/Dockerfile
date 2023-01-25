FROM Node:12.14.1
WORKDIR /var/www/html
COPY package* ./
RUN npm install 
RUN npm run build 
COPY  . /var/www/html

CMD ["npm","run","dev"]

