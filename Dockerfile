# quay.io/ansible/creator-ee:v0.18.0
FROM quay.io/ansible/creator-ee@sha256:c89ecbcf47bfa956a2ed3c4939cd29a53298943c8db11eb35d20b9b939ba2a48

ENV HOME=/home/runner

# install kubernetes module required by molecule
RUN pip3 install kubernetes==26.1.0

## kubectl
RUN \
    microdnf install -y which && \
    microdnf clean all && \
    curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin && \
    kubectl version --client 

## helm
RUN \
    TEMP_DIR="$(mktemp -d)" && \
    cd "${TEMP_DIR}" && \
    HELM_VERSION="3.7.0" && \
    HELM_ARCH="linux-amd64" && \
    HELM_TGZ="helm-v${HELM_VERSION}-${HELM_ARCH}.tar.gz" && \
    HELM_TGZ_URL="https://get.helm.sh/${HELM_TGZ}" && \
    curl -sSLO "${HELM_TGZ_URL}" && \
    curl -sSLO "${HELM_TGZ_URL}.sha256sum" && \
    sha256sum -c "${HELM_TGZ}.sha256sum" 2>&1 | grep OK && \
    tar -zxvf "${HELM_TGZ}" && \
    mv "${HELM_ARCH}"/helm /usr/local/bin/helm && \
    cd - && \
    rm -rf "${TEMP_DIR}"

# nodejs 16 + VSCODE_NODEJS_RUNTIME_DIR are required on ubi9 based images
# until we fix https://github.com/eclipse/che/issues/21778
# When fixed, we won't need this Dockerfile anymore.
# c.f. https://github.com/che-incubator/che-code/pull/120
RUN \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
export NVM_DIR="$HOME/.nvm" && \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
nvm install 16.20.0
ENV VSCODE_NODEJS_RUNTIME_DIR="$HOME/.nvm/versions/node/v16.20.0/bin/"

# Set permissions on /etc/passwd and /home to allow arbitrary users to write
RUN chgrp -R 0 /home && chmod -R g=u /etc/passwd /etc/group /home
