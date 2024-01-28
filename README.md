# my_scriptbox
**Basic setup script for windows computers**

What the script does:
  * Installs scoop (https://scoop.sh/). The following apps are installed along with (and using) scoop:
    - [git](https://github.com/git/git)
    - [yq](https://github.com/mikefarah/yq)
  * Adds a new custom profile for the **current user** (CurrentUserCurrentHost)

## Usage instructions
* Download this repository as a zip file or clone it using git if already installed: <code>git clone https://github.com/PSDas-2000/my_scriptbox.git</code>
* Navigate to local directory for the repository in powershell
* Make a copy of .\config\configTemplate.yaml and name it as config.yaml [[Details]](#customizable-configuration )
* Fill out the configurations in the yaml file
* run <code>.\Init.ps1</code> as an administrator

## Customizable Configuration

Configurations which can help to set up your computer more specifically

| Property | Description | Default |
| --- | --- | --- |
| .git.user.email | Sets the global git user.email | - |
| .git.user.name | Sets the global git user.name | - |
| .user.name | Sets a user name which is used in the user profile | User |
