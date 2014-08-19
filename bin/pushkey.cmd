@echo off
plink %1 "mkdir -p .ssh && echo ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAlZoRu7hI/G+NlaSdvKkGJI6UknwWZ/lbtP1ljQxyNJKcDlx4jKw1+fcppw4ci8O/nxsRoMdsGdG809WKMQ/1UJAPnOmIFTz+435pUSnLdODHBscgDr4L17cHDS1wHfHUk4A8UmFiGZBrv2XO/7g33BKOvG7cgLFnIJJ+JIEBbSM= lacmain >> .ssh/authorized_keys"
