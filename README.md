[![Contribute](https://www.eclipse.org/che/contribute.svg)](https://workspaces.openshift.com/f?url=https://github.com/devspaces-samples/ansible-devspaces-demo)

# Ansible Development on OpenShift DevSpaces

This repository provides a development environment for Ansible playbook creation, testing with Molecule, and ansible-lint checks using OpenShift DevSpaces.

## Summary

This repository contains a `devfile.yaml` file, which defines the development environment for Ansible. The DevSpace created using this `devfile` provides the necessary tools and dependencies for Ansible playbook development, testing with Molecule, and linting with ansible-lint. This is designed to be used in environments where developers do not have easy access to linux systems from which to develop ansible automation content, but do have OpenShift.

The `devfile.yaml` includes configurations for:

- Ansible
- Molecule (testing framework for Ansible roles)
- Ansible Lint (tool for checking best practices and potential issues in Ansible code)

You can use the provided DevSpace to start working on your Ansible projects immediately, without worrying about setting up the development environment manually.

## Setting up OpenShift DevSpaces

To get started with OpenShift DevSpaces, refer to the [OpenShift DevSpaces documentation](https://access.redhat.com/documentation/en-us/red_hat_openshift_dev_spaces/3.5/html/administration_guide/index) for detailed instructions on setting up your development environment and creating your DevSpaces.

## Base Image Of Devfile

Ultimately we intend to use the [ansible creator image](https://github.com/ansible/creator-ee) as the base image, however there are currently some [technical blockers](https://github.com/eclipse/che/issues/21778) to doing that. The `Dockerfile` in this repo is that of the image we are currently pulling down for reference.

### GitHub OAuth2

The instructions for configuring OAuth2 for GitHub can be found at the following link:

https://access.redhat.com/documentation/en-us/red_hat_openshift_dev_spaces/3.5/html/administration_guide/configuring-devspaces#configuring-oauth-2-for-github

Once the secret is in place, restart the main devspaces container. Any workspace created before this step is complete will NOT have access to GitHub OAuth, and will need to be deleted and recreated to get access.

NOTE: You will still need to configured your name/email globally the first time your workspace is accessed (or once for each new workspace, if you choose not to configure globally).

```
git config --global user.name "Homer Simpson"
git config --global user.email homer@springfieldpower.com
```
## Contributing

Contributions to this repository are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request. You can ask any questions in the [Ansible-ZipShip-WG gchat channel](https://chat.google.com/room/AAAA8cZvmmw?cls=7)

## Code of Conduct
We ask all of our community members and contributors to adhere to the [Ansible code of conduct](http://docs.ansible.com/ansible/latest/community/code_of_conduct.html). If you have questions or need assistance, please reach out to our community team at [codeofconduct@ansible.com](mailto:codeofconduct@ansible.com)   
