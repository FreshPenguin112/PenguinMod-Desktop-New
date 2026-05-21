#!/usr/bin/env sh
# This is used on linux to take ownership of the installed folder that has the app, self updating doesn't work when root owns whats in /opt, you can obviously run files in there, 
# but not modify(write) since root owns the folder

# Resolve absolute path in case installed app is a symlink(highly likely with stuff like update-alternatives being common)
INSTALL_DIR=$(readlink -f $(which penguinmod-desktop))

# Detect the installing user, just pray that whatever they installed using doesn't use a custom user
USER_NAME=${SUDO_USER:-$USER} # SUDO_USER is set to the user that called the sudo command by sudo itself

# Change ownership and make files writable
chown -R "$USER_NAME":"$USER_NAME" "$INSTALL_DIR"
chmod -R u+rw "$INSTALL_DIR"
