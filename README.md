To get started, simply click the button below...

[![Contribute](https://www.eclipse.org/che/contribute.svg)](https://workspaces.openshift.com/f?url=https://github.com/devspaces-samples/ansible-devspaces-demo)


# Ansible Development on OpenShift Dev Spaces

This repository provides a development environment for Ansible playbook creation, testing with Molecule, and ansible-lint checks using OpenShift Dev Spaces.

## Summary

This repository contains a `devfile.yaml` file, which defines the development environment for Ansible. The DevSpace created using this `devfile` provides the necessary tools and dependencies for Ansible playbook development, testing with Molecule, and linting with ansible-lint. This is designed to be used in environments where developers do not have easy access to linux systems from which to develop ansible automation content, but do have OpenShift.

The `devfile.yaml` includes configurations for:

- Ansible
- Molecule (testing framework for Ansible roles)
- Ansible Lint (tool for checking best practices and potential issues in Ansible code)

You can use the provided DevSpace to start working on your Ansible projects immediately, without worrying about setting up the development environment manually.

## Setting up OpenShift DevSpaces

To get started with OpenShift Dev Spaces, refer to the [OpenShift Dev Spaces documentation](https://access.redhat.com/documentation/en-us/red_hat_openshift_dev_spaces/3.5/html/administration_guide/index) for detailed instructions on setting up your development environment and creating your DevSpaces.

## Base Image Of Devfile

Ultimately we intend to use the [ansible creator image](https://github.com/ansible/creator-ee) as the base image, however there are currently some [technical blockers](https://github.com/eclipse/che/issues/21778) to doing that. The `Dockerfile` in this repo is that of the image we are currently pulling down for reference.

### GitHub OAuth2

The instructions for configuring OAuth2 for GitHub can be found at the following link:

https://access.redhat.com/documentation/en-us/red_hat_openshift_dev_spaces/3.5/html/administration_guide/configuring-devspaces#configuring-oauth-2-for-github

Once the secret is in place, restart the main Dev Space container. Any workspace created before this step is complete will NOT have access to GitHub OAuth, and will need to be deleted and recreated to get access.

NOTE: You will still need to configured your name/email globally the first time your workspace is accessed (or once for each new workspace, if you choose not to configure globally).

```
git config --global user.name "Homer Simpson"
git config --global user.email homer@springfieldpower.com
```

## Sample Molecule Testing Role

A sample role has been provided in the collections/example/collection/roles/backup_file directory to experiment with Test Driven Development using Molecule and OpenShift DevSpaces. A molecule verifier has been configured to test that the role functions as expected.

### Automation requirements
1. Make a backup of a file identified using the backup_file_source variable
2. The backup should be stored in the directory identified by the backup_file_dest_folder variable
3. If the backup directory doesn't exist, it should be created and writable
4. The backup file should have a suffix appended such as '.bak' which is identified by the backup_file_dest_suffix variable

### To begin development against the backup_file role
1. Click the three horizontal bar icon in the top left of the window and select 'Terminal' -> 'New Terminal'
2. Click into the terminal window
3. Change directory into backup file role `cd collections/example/collection/roles/backup_file`
4. Run `molecule create`. This will start a test pod for the automation to run against (defined in roles/backup_file/molecule/default/molecule.yml).
5. Run `oc get pods` to view the test instance that was created
6. Run `molecule verify` to run the verification against the test pod and see the failures to help guide the tasks necessary in the role.
7. Run `molecule converge` to run the base tasks/main.yml against the pod. This will create a backup of a file in the backup destination folder with a suffix appended.
8. Run `molecule converge` to execute the role against the test instance, and `molecule verify` to see if any tests are still failing. Repeat this until all tests pass.

To reset your test pod back to a fresh instance you can run `molecule destroy` and then `molecule create` to recreate it. To run the full molecule test without stepping through each stage, run `molecule test`.

## Contributing

Contributions to this repository are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue with Red Hat.

## Code of Conduct
We ask all of our community members and contributors to adhere to the [Ansible code of conduct](http://docs.ansible.com/ansible/latest/community/code_of_conduct.html). If you have questions or need assistance, please reach out to our community team at [codeofconduct@ansible.com](mailto:codeofconduct@ansible.com)
