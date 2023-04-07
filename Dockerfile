FROM quay.io/ansible/creator-ee
RUN \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
export NVM_DIR="/root/.nvm" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
nvm install 16.20.0

ENV VSCODE_NODEJS_RUNTIME_DIR="/root/.nvm/versions/node/v16.20.0/bin/"
