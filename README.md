[![Contribute](https://www.eclipse.org/che/contribute.svg)](https://workspaces.openshift.com/f?url=https://github.com/kyetter/demo/)

# Overview

TODO

# Setup / Configuration

## Eclipse Che

### GitHub OAuth2

The instructions for configuring OAuth2 for GitHub can be found at the following link:

https://www.eclipse.org/che/docs/stable/administration-guide/configuring-oauth-2-for-github/

Once the secret is in place, restart the main devspaces container. Any workspace created before this step is complete will NOT have access to GitHub OAuth, and will need to be deleted and recreated to get access.

TODO: Investigate the setting for subdomain isolation.

NOTE: You will still need to configured your name/email globally the first time your workspace is accessed (or once for each new workspace, if you choose not to configure globally).

```
git config --global user.name "Homer Simpson"
git config --global user.email homer@springfieldpower.com
```