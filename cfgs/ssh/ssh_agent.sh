#!/usr/bin/bash
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa_qq > /dev/null 2>&1

