# my_scriptbox

**Basic setup script for windows computers**

What the script does:

- Installs scoop (https://scoop.sh/). The following apps are installed along with (and using) scoop:
  - [git](https://github.com/git/git)
  - [yq](https://github.com/mikefarah/yq)
- Adds a new custom profile for the **current user** (CurrentUserCurrentHost)

## Usage instructions

- Download this repository as a zip file or clone it using git if already installed: <code>git clone https://github.com/PSDas-2000/my_scriptbox.git</code>
- Navigate to local directory for the repository in powershell
- Make a copy of $PSScriptRoot\config\configTemplate.yaml and name it _config.yaml_ in the same directory (.\config) [[Details]](#customizable-configuration )
- Fill out the configurations in the yaml file
- run <code>.\Init.ps1</code> as an administrator

## Customizable Configuration

Configurations which can help to set up your computer more specifically. The specification of the config is specified below and can also be derived from [here](./config/configTemplate.yaml)

| Property                                | Description                                                                                | Default                           |
| --------------------------------------- | ------------------------------------------------------------------------------------------ | --------------------------------- |
| .git.user.email                         | Sets the global git user.email                                                             | -                                 |
| .git.user.name                          | Sets the global git user.name                                                              | -                                 |
| .user.name                              | Sets a user name which is used in the user profile                                         | `User`                            |
| .user.workingDirectory                  | Sets the default working directory with which the terminal starts                          | Default windows working directory |
| .user.enablePowerShellPrediction: false | Enable/disable powershell prediction                                                       | `false`                           |
| .scoop.appList                          | List of apps that will be installed using scoop if ".scoop.installFromConfig" is `true`    | -                                 |
| .scoop.bucketList                       | List of buckets that will be added to scoop if ".scoop.installFromConfig" is `true`        | -                                 |
| .scoop.installFromConfig                | Can be used to enable installation of more apps and buckets from scoop                     | `false`                           |
| .scoop.setStartUpJob                    | Can be used to set up a startup job which updates scoop and all apps installed using scoop | `false`                           |
