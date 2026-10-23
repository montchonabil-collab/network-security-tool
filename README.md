
Author: Atys MONTCHO & Aziz OUATTARA

# Network Security Tool - TP 3 DevSecOps Docker & Trivy

## Présentation

Ce projet a été réalisé dans le cadre du TP 3 « Audit de sécurité Docker avec Trivy ».

L'objectif est d'appliquer les principes DevSecOps à une application Python simple permettant de vérifier l'état d'un port TCP local, puis d'intégrer des contrôles de sécurité automatisés dans un pipeline CI/CD GitHub Actions.

---

## Fonctionnalités

- Vérification de l'ouverture d'un port TCP.
- Validation des numéros de ports saisis.
- Exécution dans un conteneur Docker.
- Analyse de sécurité des images Docker avec Trivy.
- Intégration d'un contrôle de sécurité automatisé dans GitHub Actions.

---

## Structure du projet

```text
network-security-tool/
│
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── security-scan.yml
│
├── tests/
│
├── Dockerfile
├── compose.yaml
├── network_check.py
├── requirements-dev.txt
└── README.md
```

---

## Technologies utilisées

- Python 3.12
- Docker
- Docker Compose
- Trivy
- GitHub Actions
- Pytest
- Bandit

---

## Exécution locale

### Cloner le dépôt

```bash
git clone <url-du-depot>
cd network-security-tool
```

### Construire l'image Docker

```bash
docker compose build
```

### Démarrer le conteneur

```bash
docker compose up -d
```

### Vérifier le statut

```bash
docker compose ps
```

---

## Audit de sécurité avec Trivy

### Scan de l'image Docker

```bash
trivy image --severity HIGH,CRITICAL network-security-tool-network-security-tool:latest

```

---

## Mesures de durcissement appliquées

Les améliorations suivantes ont été mises en œuvre :

- Utilisation d'une image légère `python:3.12-slim`.
- Création d'un utilisateur dédié non privilégié.
- Exécution du conteneur sans privilèges root.
- Système de fichiers en lecture seule.
- Suppression des capacités Linux inutiles (`cap_drop: ALL`).
- Activation de `no-new-privileges`.
- Aucun port publié inutilement vers l'hôte.

---

## Pipeline GitHub Actions

Le workflow de sécurité :

1. Récupère le code source.
2. Construit l'image Docker.
3. Lance une analyse de sécurité Trivy.
4. Retourne une erreur si des vulnérabilités HIGH ou CRITICAL sont détectées.

Le workflow est exécuté automatiquement lors de chaque :

- Push
- Pull Request

---

## Exemple d'utilisation

```bash
$ python network_check.py

Enter a local port: 80
Open
```

---

## Objectifs pédagogiques

Ce projet permet de mettre en pratique :

- La conteneurisation d'une application Python.
- L'analyse des vulnérabilités des images Docker.
- Le durcissement d'un conteneur.
- Les principes DevSecOps.
- L'automatisation de contrôles de sécurité dans une chaîne CI/CD.
        --