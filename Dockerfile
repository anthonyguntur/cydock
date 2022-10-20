# use Cypress provided image with all dependencies included
FROM cypress/base:latest
WORKDIR /home/node/app 
# copy our application
COPY package.json package-lock.json ./
COPY app ./app
COPY serve.json ./
# copy Cypress tests
COPY cypress.config.js cypress ./
COPY cypress ./cypress

# avoid many lines of progress bars during install
ENV CI=1

# install NPM dependencies and Cypress binary
RUN npm ci
# check if the binary was installed successfully
RUN $(npm bin)/cypress verify