# Configuration

Avant de compiler le firmware, il est nécessaire de le configurer en fonction des options de l'imprimante cible et de ses éventuelles options. Pour cela, la commande *apply_configuration* est disponible. Voici quelques exemples d'utilisation:

Pour lister les options d'une imprimante (Ex: Neva):
```console
username@computername:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Neva -l
Available variants for profile Neva:
    version:  magis | v1 | v1Mod
```

Pour appliquer la bonne config en fonction de la machine et des options (Ex: DiscoUltimate avec écran et thermistance blanche):
```console
username@computername:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Ultimate bed:no bicolor:no coldExtrude:no screen:no thermistance:white
Checking out back some known modified files ...
Checking out back done.
Applying base configuration profile: Ultimate
Applying variant: bicolor=no
Applying variant: thermistance=white
Applying variant: coldExtrude=no
Applying variant: screen=no
Applying variant: bed=no
```

Pour appliquer la bonne config en fonction de la machine et des options (Ex: Neva modifiée):
```console
username@computername:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Neva version:v1Mod
Checking out back some known modified files ...
Checking out back done.
Applying base profile static files: Neva
Applying base configuration profile: Neva
Applying variant: version=v1Mod
```

Pour restaurer la configuration par défaut:
```console
username@computername:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/restore_default_configuration
```

# Compilation

## PlatformIO Core en ligne de commande

Installer [PlatformIO Core](http://docs.platformio.org/en/stable/installation.html).

Pour générer le hex:
```console
username@computername:~/Marlin-By-Dagoma$ pio run -d Marlin
```

Pour générer le hex et flasher directement sur machine branchée:
```console
username@computername:~/Marlin-By-Dagoma$ pio run -d Marlin -t upload
```

Le fichier hex est par défaut généré dans *./Marlin/.pioenvs/default/...* ou *./.pio/...*

## Visual Studio Code (méthode recommandée)

PlatformIO peut également être utilisé en tant qu'extension de [Visual Studio Code](https://code.visualstudio.com/).
Une fois installé, il suffit d'ouvrir le dossier Marlin-By-Dagoma avec Visual Studio Code. Tous les outils de compilation sont alors disponibles graphiquement. Il est également possible d'appliquer la configuration de la machine via le terminal intégré à Visual Studio Code.


## Arduino IDE

Après avoir appliqué la configuration correspondant à votre machine, ouvrez le dossier Marlin-By-Dagoma/Marlin dans ArduinoIDE puis compilez/téléversez selon les besoins.
