Pour lister les options d'une imprimante (Ex: Delta):
>  LinuxAddons/Dagoma/bin/apply_configuration -gcof Delta -l

Pour appliquer la bonne config en fonction de la machine et des options (Ex: DiscoEasy avec filrunout et sans écran):
>  LinuxAddons/Dagoma/bin/apply_configuration -gcof E200 filamentRunout:Enabled screen:Disabled

Pour appliquer la bonne config en fonction de la machine et des options (Ex: NEVA):
> LinuxAddons/Dagoma/bin/apply_configuration -gcof Delta endstops:NO screen:None

Pour restaurer:
> LinuxAddons/Dagoma/bin/restore_default_configuration

Installer platformio core: http://docs.platformio.org/en/stable/installation.html

Pour générer le hex:
> pio run -d Marlin

Pour générer le hex et flasher directement sur machine branchée:
> pio run -d Marlin -t upload

Le fichier hex est par défaut généré dans Marlin/.pioenvs/default/...

Vérifier que le user courant appartient bien aux groupe dialout et plugdev.

Pour démarrer la console dans pio (sur mac):
> pio device monitor -p /dev/cu.usbserial-AL00DUGA -b 250000 --echo

TODO:
- 1ère phase de retract trop lente? Jouer sur la température lors de la première phase de retract? Faire autrement?
- Si pas de fil au début, ne détecte rien par la suite (fil ajouté, plus de fil,...)
- Désactiver la détection de filament avant que l'impression démarre (donc pendant le palpage et la chauffe)
