#!/bin/sh

##
# USER ACCOUNTS
##
echo "$(env | grep '^ACCOUNT_')" | while IFS= read -r I_ACCOUNT ; do
  echo "FOR > $I_ACCOUNT"
  ACCOUNT_NAME=$(echo "$I_ACCOUNT" | cut -d'=' -f1 | sed 's/ACCOUNT_//g' | tr '[:upper:]' '[:lower:]')
  ACCOUNT_PASSWORD=$(echo "$I_ACCOUNT" | sed 's/^[^=]*=//g')
  echo "Name is $ACCOUNT_NAME"
  echo "Pass is $ACCOUNT_PASSWORD"

  echo ">> ACCOUNT: adding account: $ACCOUNT_NAME"
  adduser -H -D "$ACCOUNT_NAME"
  echo "Setting password for $ACCOUNT_NAME"
  echo "$ACCOUNT_PASSWORD\n$ACCOUNT_PASSWORD" | passwd "$ACCOUNT_NAME"
  echo "setting smbpass for $ACCOUNT_NAME"
  (echo "$ACCOUNT_PASSWORD"; echo "$ACCOUNT_PASSWORD") | smbpasswd -a "$ACCOUNT_NAME"
  smbpasswd -e "$ACCOUNT_NAME"
  # (echo "$ACCOUNT_PASSWORD"; echo "$ACCOUNT_PASSWORD") | smbpasswd -ae "$ACCOUNT_NAME"
  echo "Done Adding $ACCOUNT_NAME"

  unset $(echo "$I_ACCOUNT" | cut -d'=' -f1)
done

smbd --foreground --log-stdout --no-process-group
