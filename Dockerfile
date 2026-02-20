# Image Python 3.14 officielle
FROM python:3.14

# Empêche Python de buffer les logs
ENV PYTHONUNBUFFERED=1

# Dossier de travail dans le container
WORKDIR /app

# Copier requirements
COPY requirements.txt .

# Installer dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le projet Django
COPY . .

# Exposer le port Django
EXPOSE 8000

# Lancer Django
CMD ["gunicorn", "todo.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]