# 🖨️ PRET-Docker

**Dockerized PRET (Printer Exploitation Toolkit)**

This repository provides a Dockerized version of [PRET](https://github.com/RUB-NDS/PRET), enabling users to exploit and test printer security with ease. By containerizing PRET, you can run it without worrying about system dependencies or Python 2 compatibility issues.

---

## 📦 Features

- Runs PRET in a lightweight Docker container.
- Ensures compatibility with Python 2.7.
- Includes necessary dependencies: `colorama`, `pysnmp`, `libusb`, `imagemagick`, and `ghostscript`.
- Optimized for size and efficiency.
- Supports Linux, macOS, and Windows hosts.

---

## 🚀 Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/engine/install) installed on your system.

### Build the Docker Image

Clone the repository and build the Docker image:

```bash
git clone https://github.com/avegap23/PRET-Docker-fix.git
cd PRET-Docker-fix
sudo docker build -t pret .
```

### Run PRET

To run PRET with default settings:

```bash
docker run -it --rm pret
```

To pass specific arguments to PRET:

```bash
docker run -it --rm pret -h
```

Replace `-h` with your desired PRET arguments.

---

## 🛠️ Usage Examples

### Targeting a Network Printer

```bash
docker run -it --rm pret <target> <language>
docker run -it --rm pret 192.168.1.100 ps    #Ex Postscript Printer
docker run -it --rm pret 192.168.1.100 pjl   #Ex PJL Printer 
docker run -it --rm pret 192.168.1.100 pcl   #Ex PCL Printer
```

### Targeting a USB Printer (Linux)

```bash
docker run -it --rm --device=/dev/usb/lp0 pret /dev/usb/lp0 pjl #Ex PJL Printer
```

### Listing Options and Help

```bash
docker run -it --rm pret -h
```

### Saving Session Logs

```bash
docker run -it --rm -v $(pwd)/logs:/app/logs pret 192.168.1.100
```

This command mounts a local `logs` directory to the container's `/app/logs` directory, allowing you to save session logs persistently.

---

## ⚙️ Configuration

- **Base Image**: `python:2.7-slim`
- **Installed Packages**:
  - System: `git`, `libusb-1.0-0`, `libusb-1.0-0-dev`, `imagemagick`, `ghostscript`
  - Python: `colorama`, `pysnmp`, `requests`

---

## 📁 .dockerignore

To optimize the Docker build context, the following files and directories are excluded via `.dockerignore`:

```dockerignore
__pycache__/
*.pyc
*.pyo
*.pyd
*.swp
*.swo
*.egg-info/
*.eggs/
dist/
build/
.git/
.gitignore
Dockerfile
README.md
```

---

## 🤝 Acknowledgements

- [RUB-NDS/PRET](https://github.com/RUB-NDS/PRET) for the original Printer Exploitation Toolkit.
- [SlothDotEXE/PRET-Docker](https://github.com/SlothDotEXE/PRET-Docker) for the original Dockerized solution.