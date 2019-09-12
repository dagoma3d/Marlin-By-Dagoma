# Prérequis

Les sources sont téléchargeables en tant qu'[archive zip](https://github.com/dagoma3d/Marlin-By-Dagoma/archive/dev-09-2019.zip).
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

Ensuite, il est nécessaire de basculer vers la branche de développement:
```console
username@hostnmane:~$ cd Marlin-By-Dagoma
username@hostnmane:~/Marlin-By-Dagoma$ git checkout dev-09-2019
La branche 'dev-09-2019' est paramétrée pour suivre la branche distante 'dev-09-2019' depuis 'origin'.
Basculement sur la nouvelle branche 'dev-09-2019'
```
A ce stade les sources sont prêtes à être configurées avant d'être compilées.

# Configuration

Avant de compiler le firmware, il est nécessaire de le configurer en fonction des options de l'imprimante cible et de ses éventuelles options. Pour cela, la commande *apply_configuration* est disponible. Voici quelques exemples d'utilisation:

Pour lister les options d'une imprimante (Ex: Neva):
```console
username@hostnmane:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Neva -l
Available variants for profile Neva:
    version:  magis | v1 | v1Mod
```

Pour appliquer la bonne config en fonction de la machine et des options (Ex: DiscoUltimate avec écran et thermistance blanche):
```console
username@hostnmane:~/Marlin-By-Dagoma$ ./LinuxAddons/Dagoma/bin/apply_configuration -gcof Ultimate bed:no bicolor:no coldExtrude:no screen:no thermistance:white
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
![Terminal](/Documentation/vscode/terminal.png)

## Arduino IDE

Après avoir appliqué la configuration correspondant à votre machine, ouvrez le dossier Marlin-By-Dagoma/Marlin dans ArduinoIDE puis compilez/téléversez selon les besoins.
