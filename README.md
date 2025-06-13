# Adminer

[![GitHub](https://img.shields.io/badge/github-jigexiansen%2Fadminer-blue.svg)](https://github.com/jigexiansen/adminer)
[![Docker](https://img.shields.io/badge/docker-ready-blue.svg)](https://www.docker.com/)
[![PHP](https://img.shields.io/badge/PHP-7.4-777BB4.svg)](https://php.net/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20windows%20%7C%20macos-lightgrey.svg)]()

> 🎨 Enhanced web database management tool with beautiful UI and optimized performance

A production-ready Docker image of Adminer with custom styling, performance optimizations, and cross-platform compatibility.

## ✨ Features

- 🎨 **Enhanced UI** - Custom CSS styling for better user experience
- 🚀 **Optimized Performance** - Pre-configured PHP 7.4 + Apache environment
- 🗄️ **Multi-Database Support** - MySQL, PostgreSQL, SQLite, MongoDB, and more
- 🔧 **Production Ready** - Proper file permissions and security configurations
- 📦 **Easy Deployment** - Docker Compose and Makefile for quick setup
- 🌐 **Cross-Platform** - Supports Linux, Windows, and macOS

## 📁 Project Structure

```
adminer/
├── .github/workflows/    # GitHub Actions CI/CD
├── dist/                 # Release artifacts
├── docker/              # Docker configuration
├── src/                 # Source code
│   ├── adminer.css      # Custom styling
│   ├── composer.json    # PHP dependencies
│   └── index.php        # Entry point
├── docker-compose.yml   # Docker Compose configuration
├── Makefile            # Build automation
└── README.md           # This file
```

## 🚀 Quick Start

### Option 1: Using Make (Recommended)

```bash
# Build and run (internal access only)
make build
make run

# Run with web access (default port 8080)
make run -p

# Run with custom port
make run -p 3000

# Development mode (internal access only)
make dev

# View logs
make logs

# Stop container
make stop
```

### Option 2: Using Docker Compose

```bash
# Start Adminer (internal access only)
docker-compose up -d

# Stop services
docker-compose down
```

### Option 3: Manual Docker Commands

```bash
# Build image
docker build -t adminer:latest -f docker/Dockerfile .

# Run container (internal access only)
docker run -d --name adminer adminer:latest

# Run container with port mapping (default port 8080)
docker run -d --name adminer -p 8080:80 adminer:latest

# Run container with custom port
docker run -d --name adminer -p 3000:80 adminer:latest
```

## 🌐 Access

### Default (Internal Access Only)
By default, Adminer runs without port mapping for security:
- **From other containers** in the same Docker network
- **Via Docker exec**: `make shell` then access internally

### With Web Access (`make run -p`)
When running with web access, access Adminer at:
- **Local**: http://localhost:8080 (or your custom port)
- **Network**: http://your-ip:8080 (or your custom port)

## 🗄️ Database Support

| Database | Supported | Notes |
|----------|-----------|-------|
| MySQL    | ✅ | Full support (mysqli, pdo_mysql) |
| MariaDB  | ✅ | Compatible with MySQL drivers |
| PostgreSQL | ✅ | Full support (pdo_pgsql) |
| SQLite   | ✅ | File-based database (pdo_sqlite) |
| MongoDB  | ✅ | NoSQL support (mongodb extension) |
| MS SQL   | ❌ | Requires pdo_dblib extension (complex setup) |
| Oracle   | ❌ | Requires pdo_oci extension (not included) |

> **Note**: This Docker image includes support for the most commonly used databases. MS SQL and Oracle support are not included due to complexity and licensing considerations.

## 🔧 Configuration

### Custom Styling

Edit `src/adminer.css` to customize the appearance:

```css
/* Example: Change primary color */
body {
    --primary-color: #2196F3;
}
```

## 📦 Deployment

### Using Pre-built Image

```bash
# Load from release
docker load -i dist/adminer-image.tar

# Or build from source
make release
```

### Production Deployment

```yaml
# docker-compose.prod.yml
version: '3.8'
services:
  adminer:
    image: adminer:latest
    ports:
      - "80:80"
    environment:
      - ADMINER_DESIGN=nette
    restart: unless-stopped
```

## 🛠️ Development

### Prerequisites

- Docker 20.10+
- Docker Compose 2.0+
- Make (optional)

### Setup

```bash
# Clone repository
git clone https://github.com/jigexiansen/adminer.git
cd adminer

# Start development environment
make dev

# Run tests
make test

# Lint code
make lint
```

### Available Commands

```bash
make help              # Show all available commands
make build             # Build Docker image
make run               # Run container (internal access only)
make dev               # Development mode (internal access only)
make restart           # Restart container (internal access only)
make stop              # Stop container
make clean             # Remove container and image
make logs              # View container logs
make shell             # Access container shell
make test              # Run tests
make lint              # Lint PHP files
make release           # Build and save release image

# Examples with web access:
make run -p            # Run with web access (port 8080)
make run -p 3000       # Run with custom port 3000
make restart -p        # Restart with web access
make restart -p 9000   # Restart with custom port 9000
```

## 🔒 Security

- Runs as non-root user
- Proper file permissions
- Security headers configured
- Regular security updates

## 🐛 Troubleshooting

### Common Issues

**Container won't start:**
```bash
# Check logs
make logs

# Verify image
docker images | grep adminer
```

**Port conflicts:**
```bash
# Use different port
make run -p 9000
```

**Permission issues:**
```bash
# Rebuild with proper permissions
make clean && make build
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 📞 Support

For issues and questions, please check the documentation or create an issue in the [GitHub repository](https://github.com/jigexiansen/adminer).

---

<div align="center">

**[⬆ Back to Top](#adminer)** | **[GitHub Repository](https://github.com/jigexiansen/adminer)**

Made with ❤️ by the community

</div>