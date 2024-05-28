# Echiquier Connecté

L'échiquier connecté a pour but de permettre aux joueurs de suivre en temps réel une partie d'échecs sur une application mobile. 

## Description

L'échiquier connecté est un échiquier créé à la main et équipé de capteurs magnétiques permettant de détecter les pièces équipées d'un aimant sur la planche afin de suivre le déplacement des pièces. L'échiquier est aussi connecté à une application mobile Flutter qui suivra le déplacement des pièces en fonction des mouvements des utilisateurs.

## Fonctionnalités

- Interface utilisateur conviviale pour visualiser une partie d'échecs.
- Détection des pièces en temps réel sur la planche.
- Affcihage en temps réel des coups joués sur l'application.

## Matériel utilisé

x1 Carte Arduino 2560 Méga
x32 Pièces d'échecs imprimées en 3D
x32 Aimants incrustés dans les pièces
x64 Capteurs magnétiques (1 par case de l'échiquier)
x250 Câbles pour relier les capteurs à l'Arduino
x42 Wago à 5 entrées pour centraliser les câbles pour l'alimentation
x1 Planche de bois
x2 Bombes de peinture pour peindre les cases de l'échiquier
x1 Rouleau d'adhésif blanc pour les contours de l'échiquier

## Réalisation 

### Création de l'échiquier

Pour créer l'échiquier nous avons tout d'abord découper la planche de bois aux bonnes dimensions et ensuite peint l'échiquier avec les bombes de peinture pour les différentes cases. Nous avons ensuite collé les capteurs magnétiques de l'autre côté de l'échiquier avec de la colle chaude et relié tout ces capteurs à l'aide des cables et des Wagos pour centraliser les cables concernant l'alimentation. Les cables de données des capteurs sont eux directement liés aux 64 PIN de la carte Arduino qui est elle même reliée à un ordinateur qui va lui servir d'alimentation. Nous avons aussi nous-même imprimé en 3D les 32 pièces d'échiquiers et inséré les aimants dans les pièces. Pour finir nous avons collés différents autocollants afin d'habiller les contours de l'échiquier et des points de couleur pour mettreen évidence la zone ou est situé le capteur sous chaque case.

### Code de l'Arduino

### Application Python

### Application Flutter



