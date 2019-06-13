## 5/26/2019
- Got guest writable share "shared" working.
- Had to make sure that
  - directory is owned by speedysan:users
  - "everybody" has r/w/x permissions (can't get it to work without the x. I may not understand what it really means).
  - This is what it looks like now…
    ```bash
    ls -ld /smb-shares/media/shared/
    drwxrwxrwx 2 speedysan users 4 May 26 10:03 /smb-shares/media/shared/
    ```

## 5/27/2019
- Got all guest writable shares working.
- root:users works for ownership.
- Managed to get authed users working after copying adduser + smbpasswd (and the bash script to get users and passwords from docker-compose.yml) from another image.
