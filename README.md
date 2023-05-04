# tf-gcp-challenge-barros-ruben

## Convention de nommage

- Les noms des ressources doivent être en minuscule
- Les noms des ressources doivent être séparés par des tirets du bas
- Les noms des variables doivent être en minuscule
- Les noms des variables doivent être séparés par des tirets du bas
- Dans un module, le nom des variables doit être explicite au module
- En dehors d\'un module, le nom des variables doit faire référence au module auquel elles sont liées (ex: `storage_name` pour la variable `name` de storage)

## Explication de l\'architecture

Dans le dossier `modules`, on retrouve tous les modules pour notre instance terraform.
Dans le dossier `src`, on retrouve le code de notre fonction qu\'on va déployer sur GCP. On a zip le code avec le package.json pour pouvoir l\'installer sur GCP.

## Comment créer l\'architecture

Attention, il faut avoir un compte GCP et avoir créé un projet. De plus, vous devez avoir les droits pour créer des ressources dans ce projet.

Ne pas oublier d'activer les API suivantes:
  - Cloud Functions API
  - Cloud Run API
  - Cloud Build API

Il faudra mettre à la racine un fichier credentials.json avec les credentials de votre compte GCP.
Il faudra aussi mettre le bonne nom de projet dans les fichiers `provider.tf`.

Vous pouvez modifier les valeurs dans le `var.tfvars` pour changer les valeurs par défaut.

### Créer le backend

```bash
cd modules/remote
terraform init
TF_VAR_name="backend-gcp-terraform-ruben" TF_VAR_location="US" terraform apply
```

Attention si vous changez le nom du bucket, il faut aussi changer le nom du bucket dans le fichier `provider.tf`.

### Créer l\'architecture

Retournons à la racine du projet

```bash
terraform init
terraform apply -var-file="var.tfvars"
```

## Comment détruire l\'architecture

```bash
terraform destroy -var-file="var.tfvars"
```

## Comment détruire le backend

```bash
cd modules/remote
TF_VAR_name="backend-gcp-terraform-ruben" TF_VAR_location="US" terraform destroy
```