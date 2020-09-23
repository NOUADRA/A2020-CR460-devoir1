# Devoir 1
## Énoncé

À partir de GitHub, vous copierez le [repository](https://github.com/matbilodeau/A2020-CR460-devoir1)
et y appliquerez les modifications nécessaires afin de déployer l'infrastructure
demandée sur GCP via Terraform.  
Vous fournirez des captures d'écran du résultat: output terraform + site web avec IP + dashboard instances GCP.
Vous sauvegarderez vos modifications (commit) et publierez le code sur votre propre version du repo.
Votre code devra être accessible de manière privée, ajoutez Riad (RiadMan), Steve (cyborgqc) et Moi seulement.


### L'infrastructure à déployer

Via Terraform :

#### Instances
* une instance nommée "canard"
de type "f1-micro"
debian-9
avec une adresse ip publique
dans le sous-réseau "prod-dmz"
avec un serveur apache2 à jour
  * _le serveur doit être accessible publiquement_

* une instance nommée "mouton"*
de type "f1-micro"
CoreOs
cible "interne"
dans le sous-réseau "prod-interne"
  * _cette instance doit être accessible publiquement par ssh_
  * cette instance doit pouvoir recevoir du  trafic TCP sur les ports "2846", "5462", seulement à partir du sous-réseau "TRAITEMENT"

* une instance nommée "cheval"
de type "f1-micro"
CoreOs
cible "traitement"
dans le sous-réseau "prod-traitement"

* une instance nommée "fermier"
de type "f1-micro"
Ubuntu 20.04
cible "fermier"
dans le réseau par défaut de votre projet

#### Réseau
* Le réseau principal nommé "devoir1"
* un sous-réseau "prod-interne" "10.0.3.0/24"
* un sous-réseau "prod-dmz" "172.16.3.0/24"
* un sous-réseau "prod-traitement" "10.0.2.0/24"

* Une règle de pare-feu pour autoriser le trafic web sur les instances ciblées "public-web"
* Une règle de pare-feu pour autoriser le trafic  vers les instances ciblées "traitement" sur les ports TCP "2846", "5462" , seulement à partir des instances sur le sous-réseau "prod-interne"
* Une règle de pare-feu pour autoriser la connexion ssh de l'internet vers les instances internes (ex. "mouton")

### Remise
La remise du devoir se fera en 2 parties soit une sur moodle et l'autre sur GitHub.  
*Aucune autre forme ou format ne seront acceptés.*

#### Moodle
Sur Moodle, vous remettrez un fichier *PDF* nommé "matricule-Nom_Prénom.PDF"
Le fichier contiendra:

* un lien vers votre repository Github (Collaborateurs ?)
* les captures d'écran demandées.

#### GitHub
Les fichiers Terraform doivent être séparés en modules selon les ressources.
Vous devez utiliser:
* des variables pour identifier le projet et la zone de traitement
* un fichier data data pour calculer le réseau par défaut et le projet par défaut, ce dernier via une variable
* un output pour obtenir directement l'adresse ip du serveur web.

# Vous pouvez détruire votre infrastructure une fois les captures d'écran obtenues
SOLUTION 
