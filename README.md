# Change Hostname (Debian-based Operating Systems)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/606d03a4dcaf493ebf21a30245c87d83)](https://www.codacy.com/app/marshki/change_hostname_ubuntu?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/change_hostname_ubuntu&amp;utm_campaign=Badge_Grade)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Open Source Love png3](https://badges.frapsoft.com/os/v3/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badges/)

Bash script allows you to interactively change the hostname of a machine running Debian-based OSs. 

`change_hostname.sh` &rarr; command-line interface

`change_hostname_tui.sh` &rarr; text-based user interface via Whiptail. 

## Requirements

`change_hostname_tui.sh` requires [Whiptail](https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail). 
You may install the package via Apt with: `sudo apt-get install --yes whiptail`. 

## Usage 

As ROOT, call the script with: `bash change_hostname.sh` or `bash change_hostname_tui.sh`, then follow on screen prompts, e.g.: 

![alt text](https://github.com/marshki/change_hostname_ubuntu/blob/master/docs/change_hostname_tui.png)

## History

v.0.1 12-DEC-2015

## License 
[LICENSE](https://github.com/marshki/change_hostname_ubuntu/blob/master/LICENSE). 
