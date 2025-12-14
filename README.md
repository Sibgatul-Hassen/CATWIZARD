# 🧙‍♂️ CatWizard

A fun Linux command-line utility, similar to `cowsay`, that displays a message using custom ASCII art of a **Chonky Cat Wizard**!

## 📸 Demo

```bash
catwizard "I foresee many naps and tuna fish in your future."

Prerequisite: You must have cowsay installed (sudo apt install cowsay).

![CatWizard Demo] (CatWizard.jpg)

Install it using the command below :
safe method:

1.Download First:
curl -s -O https://raw.githubusercontent.com/Sibgatul-Hassen/catwizard/main/install.sh

2.Run with explicit bash path:
sudo /usr/bin/bash install.sh

3.Check installation:
which catwizard
catwizard "hi"

To Delete:

Step 1: Remove the installed executable
sudo rm -f /usr/local/bin/catwizard

Step 2: Remove the installation directory
sudo rm -rf /usr/local/share/catwizard

Step 3: Remove any leftover config or cache (if exists)
rm -rf ~/.catwizard

Step 4: Verify removal
which catwizard
->It should return nothing.
->Running catwizard should now give:
    =>catwizard: command not found

```
