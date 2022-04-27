# Prérequis

Les sources sont téléchargeables en tant qu'[archive zip](https://github.com/dagoma3d/Marlin-By-Dagoma/archive/refs/heads/master.zip).
Néanmoins, la méthode recommandée pour récupérer les sources est d'utiliser [Git](https://git-scm.com/). Ce faisant, il est beaucoup plus facile d'avoir accès aux derniers développements.

Pour les utilisateurs sous **Linux/MacOS**, git peut s'utiliser facilement en ligne de commande depuis le terminal.
Pour les utilisateurs sous **Windows**, l'installation de Git offre également un émulateur de terminal Unix appelé *Git bash*.

Pour récupérer le dépôt Github, ouvrir un terminal (ou Git bash via le menu contextuel) dans le répertoire de travail puis taper la commande suivante:
```console
username@hostnmane:~$ git clone https://github.com/dagoma3d/Marlin-By-Dagoma.git
Clonage dans 'Marlin-By-Dagoma'...
remote: Enumerating objects: 122, done.
remote: Counting objects: 100% (122/122), done.
remote: Compressing objects: 100% (94/94), done.
remote: Total 31017 (delta 41), reused 86 (delta 23), pack-reused 30895
Réception d'objets: 100% (31017/31017), 28.60 MiB | 2.48 MiB/s, fait.
Résolution des deltas: 100% (19805/19805), fait.
```

Ensuite, il est possible de basculer vers un *tag* représentant une release. Exemple avec le tag *build-1554222799*:
```console
username@hostnmane:~$ cd Marlin-By-Dagoma
username@hostnmane:~/Marlin-By-Dagoma$ git checkout build-1554222799
La branche 'build-1554222799' est paramétrée pour suivre la branche distante 'build-1554222799' depuis 'origin'.
Basculement sur la nouvelle branche 'build-1554222799'
```
A ce stade les sources sont prêtes à être configurées avant d'être compilées.

# Configuration

Avant de compiler le firmware, il est nécessaire de le configurer en fonction de l'imprimante cible et de ses éventuelles options. Pour cela, la commande *apply_configuration* est disponible. Voici quelques exemples d'utilisation:

Pour lister les options d'une imprimante (Ex: Neva):
```console
username@hostnmane:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Neva -l
Available variants for profile Neva:
    version:  magis | v1 | v1Mod
```

Pour appliquer la bonne config en fonction de la machine et des options (Ex: DiscoUltimate avec écran et thermistance blanche):
```console
username@hostnmane:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Ultimate bed:Disabled bicolor:Disabled coldExtrude:No screen:Disabled thermistance:Old_17
Checking out back some known modified files ...
Checking out back done.
Applying base configuration profile: Ultimate
Applying variant: bicolor=Disabled
Applying variant: thermistance=Old_17
Applying variant: coldExtrude=Yes
Applying variant: screen=Disabled
Applying variant: bed=Disabled
```

Pour appliquer la bonne config en fonction de la machine et des options (Ex: Neva modifiée):
```console
username@hostnmane:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Neva version:v1Mod
Checking out back some known modified files ...
Checking out back done.
Applying base profile static files: Neva
Applying base configuration profile: Neva
Applying variant: version=v1Mod
```

Pour restaurer la configuration par défaut:
```console
username@hostnmane:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/restore_default_configuration
```

# Compilation

## PlatformIO Core en ligne de commande

Installer [PlatformIO Core](http://docs.platformio.org/en/stable/installation.html).

Pour générer le hex:
```console
username@hostnmane:~/Marlin-By-Dagoma$ pio run -d Marlin
```

Pour générer le hex et flasher directement sur machine branchée:
```console
username@hostnmane:~/Marlin-By-Dagoma$ pio run -d Marlin -t upload
```

Le fichier hex est par défaut généré dans *./Marlin/.pioenvs/default/...* ou *./.pio/...*

## Visual Studio Code (méthode recommandée)

PlatformIO peut également être utilisé en tant qu'extension de [Visual Studio Code](https://code.visualstudio.com/).
![Extension PlatformIO](/Documentation/vscode/pio.png)

Une fois installé, il suffit d'ouvrir le dossier Marlin-By-Dagoma avec Visual Studio Code. Tous les outils de compilation sont alors disponibles graphiquement.
![Commandes PlatformIO](/Documentation/vscode/compilation.png)

Il est également possible d'appliquer la configuration de la machine via le terminal intégré à Visual Studio Code.
Le script de configuration étant un script *bash*, il est nécessaire de choisir un terminal compatible. Sous **Windows**, il faudra donc utiliser *Git bash* ou encore le terminal fourni avec *PlatformIO*.
![Terminal](/Documentation/vscode/terminal.png)

## Arduino IDE

Après avoir appliqué la configuration correspondant à votre machine, ouvrez le dossier Marlin-By-Dagoma/Marlin dans ArduinoIDE puis compilez/téléversez selon les besoins.
