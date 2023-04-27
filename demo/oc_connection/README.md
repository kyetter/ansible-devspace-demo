oc_connection
=========

Role to test leveraging the community.okd.oc connection plugin for Ansible testing within OpenShift. 

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Download the 'oc' binary from the downloads route local to the cluster and add to path

```
mkdir $HOME/bin
curl -o $HOME/bin/oc http://downloads.openshift-console.svc.cluster.local/amd64/linux/oc
chmod u+x $HOME/bin/oc
export PATH=$PATH:$HOME/bin
```

OpenShift Token is automatically injected. You can verify this by running the following commands:

```
oc whoami
oc get pods
```

Install the required collections:

```
ansible-galaxy collection install -r demo/oc_connection/requirements.yml
```

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
