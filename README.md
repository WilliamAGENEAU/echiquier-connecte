# Échiquier Connecté

L'échiquier connecté a pour but de permettre aux joueurs de suivre en temps réel une partie d'échecs sur une application mobile. 

## Description

L'échiquier connecté est un échiquier créé à la main et équipé de capteurs magnétiques permettant de détecter les pièces équipées d'un aimant sur la planche afin de suivre le déplacement des pièces. L'échiquier est aussi connecté à une application web React qui suivra le déplacement des pièces en fonction des mouvements des utilisateurs.

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

Pour créer l'échiquier nous avons tout d'abord découper la planche de bois aux bonnes dimensions et ensuite peint l'échiquier avec les bombes de peinture pour les différentes cases.

<img width="400" alt="echiquier" src="https://github.com/WilliamAGENEAU/echiquier-connecte/assets/94351884/97c93b2a-82d8-44c1-bbe1-f27b6683cde3">

Nous avons ensuite collé les capteurs magnétiques de l'autre côté de l'échiquier avec de la colle chaude et relié tout ces capteurs à l'aide des cables et des Wagos pour centraliser les cables concernant l'alimentation. Les cables de données des capteurs sont eux directement liés aux 64 PIN de la carte Arduino qui est elle même reliée à un ordinateur qui va lui servir d'alimentation.

<img width="400" alt="cablage" src="https://github.com/WilliamAGENEAU/echiquier-connecte/assets/94351884/71d319ff-f554-4153-91bf-62d81217efe0">

Nous avons aussi nous-même imprimé en 3D les 32 pièces d'échiquiers et inséré les aimants dans les pièces. Pour finir nous avons collés différents autocollants afin d'habiller les contours de l'échiquier et des points de couleur pour mettreen évidence la zone ou est situé le capteur sous chaque case.

<img width="400" alt="pieces echecs" src="https://github.com/WilliamAGENEAU/echiquier-connecte/assets/94351884/4093dec4-abf2-4385-bba0-ef40c6ab217e"> <img width="400" alt="plan 3D piece echec aimants" src="https://github.com/WilliamAGENEAU/echiquier-connecte/assets/94351884/7778dbd7-ebf9-4906-81b1-4b1d88523333">

### Code de l'Arduino

Le code qui s'exécute en continu sur la Arduino va initier deux tableaux représentant l'échiquier dans lesquels la valeur 0 correspond à une case avec un pion posé dessus et 1 pour une case vide. Ensuite l'échiquier est scanné en permanence afin de mettre à jour la valeur de chaque case dans le deuxième tableau qui sera ensuite comparé avec le premier qui contient l'étât précédent du tableau afin de déterminer si une pièce a été déplacée.

Si une pièce est déplacée le programme va vérifier si la case passe de prise à libérée ou l'inverse et le message qu'elle envoie sur le port série sera différent en fonction de son état. L'application va ensuite écrire les déplacements de pièces éffectués sur le port série afin qu'ils soient interprétés par une application codée en Python

### Application Python

L'application python fonnctionne grâce aux librairies serial et firebase_admin. La première va servir à faire fonctionner la première partie de l'application qui va consister en une boucle infinie qui va continuellement lire les données envoyées par l'arduino sur le port série. Cette partie va différencier les deux types de messages (Pion soulevé et pion posé) et lorsqu'un message de chaque type aura été relevé les données représentant le coup seront envoyées.

Ces données seront d'abord converties afin de correspondre au format souhaité par la WebApp. 

Pour envoyer les données la deuxième librairie va être utilisée, elle nous permet de créer un lien avec Firebase( un outil de gestion de base de données gratuit créé par Google que nous utilisons pour faire le lien entre l'application Pyhton et la WebApp). Pour envoyer ces donnéesil faut d'abord lui donner les credentials liés à notre base de données et instancier une session.

Les données seront ensuite envoyée dans une collection games représentant une partie et chaque est composé de 4 données (XDépart, YDépart, XArrivée et Yarrivée) qui sont stockés dans une collection moves comprise dans la collection games. 

### Application React



