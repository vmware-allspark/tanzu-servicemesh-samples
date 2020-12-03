FROM bitnami/kubectl:1.17

USER root

RUN echo "Installing Libraries" \
  && install_packages coreutils git findutils jq ncurses-bin

WORKDIR /usr/local/bin/

ENV HELM_VERSION=v3.4.1
RUN echo "Installing Helm" \
  && curl -sSL -o helm-linux-amd64.tar.gz https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -xzf helm-linux-amd64.tar.gz \
  && mv linux-amd64/helm ./helm \
  && rm -r linux-amd64 && rm helm-linux-amd64.tar.gz \
  && ./helm version

ENV KUBECTX_VERSION=v0.9.1
RUN echo "Installing Kubectx and Kubens" \
  && curl -sSL -o kubectx https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_VERSION}/kubectx \
  && curl -sSL -o kubens https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_VERSION}/kubens \
  && curl -sSL -o /etc/bash_completion.d/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/${KUBECTX_VERSION}/completion/kubectx.bash \
  && curl -sSL -o /etc/bash_completion.d/kubens https://raw.githubusercontent.com/ahmetb/kubectx/${KUBECTX_VERSION}/completion/kubens.bash \
  && chmod +x kubectx kubens

ENV ARGO_VERSION=v1.7.10
RUN echo "Installing ArgoCD" \
 && curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/${ARGO_VERSION}/argocd-linux-amd64 \
 && chmod +x /usr/local/bin/argocd

RUN echo "export LS_OPTIONS='--color=auto'" >> /etc/bash.bashrc \
&& echo "alias ls='ls \$LS_OPTIONS'" >> /etc/bash.bashrc

WORKDIR /samples
RUN groupadd -r user && \
    useradd -r -u 1001 -g user user && \
    chown user /samples && chgrp user /samples

# Copy Over the deployment folder
USER 1001
ENV HOME=/samples

COPY --chown=user:user . .
ENTRYPOINT [ "/bin/bash" ]
