FROM node:18

RUN apt-get update && apt-get install -y git nginx

COPY contracts/nginx.conf /etc/nginx/nginx.conf

WORKDIR /account-abstraction

RUN git clone https://github.com/eth-infinitism/account-abstraction.git .

RUN git checkout v0.6.0

RUN yarn install

RUN yarn run compile

COPY contracts/run.sh /run.sh

ENTRYPOINT ["/run.sh"]
