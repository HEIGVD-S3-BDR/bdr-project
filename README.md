# BDR Project

## Usage

To run the application, change directory into `app` and run docker compose:

```bash
docker-compose up --build
```

This will start up the database, seed it, and run the webserver on `http://localhost:8000`.

## Development

In order to install the dependencies locally, first create a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Then, install the dependencies:

```bash
pip install -r requirements.txt
```

## Technologie Stack

- Python
- FastApi