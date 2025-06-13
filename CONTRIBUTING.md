# Contributing to Adminer

> 🎨 Enhanced web database management tool with beautiful UI and optimized performance

Thank you for your interest in contributing to Adminer! 🎉

This is a production-ready Docker image of Adminer with custom styling, performance optimizations, and cross-platform compatibility.

## How to Contribute

### 🐛 Reporting Bugs

1. **Check existing issues** first to avoid duplicates
2. **Use the issue template** when creating new bug reports
3. **Provide detailed information**: OS, Docker version, steps to reproduce
4. **Include logs** when possible (`make logs`)

### 💡 Suggesting Features

1. **Search existing issues** for similar feature requests
2. **Describe the use case** clearly
3. **Explain the expected behavior**
4. **Consider backward compatibility**

### 🔧 Development Setup

```bash
# Clone or download the project
cd adminer

# Build the image
make build

# Run in development mode (internal access only)
make dev

# Or run with web access for testing
make run -p 8080

# View logs
make logs
```

### 📝 Making Changes

1. **Fork** the repository (if applicable)
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** following our coding standards
4. **Test your changes**: `make test`
5. **Commit** with clear messages: `git commit -m 'Add amazing feature'`
6. **Push** to your fork: `git push origin feature/amazing-feature`
7. **Create a Pull Request**

### 🎨 Coding Standards

- **PHP**: Follow PSR-12 coding standards
- **CSS**: Use consistent indentation and naming for `src/adminer.css`
- **Docker**: Use multi-stage builds when possible
- **Documentation**: Update README.md for significant changes

### 🧪 Testing

```bash
# Build and test the image
make build

# Lint PHP files
make lint

# Test Docker build and functionality
make test

# Manual testing - run with web access
make run -p 8080
# Then test at http://localhost:8080

# Check container status
make status
```

### 📋 Pull Request Guidelines

- **Use descriptive titles** and descriptions
- **Reference related issues** using `#issue-number`
- **Keep changes focused** - one feature per PR
- **Update documentation** if needed
- **Test both internal-only and web-accessible modes**

### 📚 Documentation

- Update `README.md` for user-facing changes
- Add inline comments for complex code
- Update version information if applicable
- Document any new Make targets

### 🏷️ Commit Message Format

Use conventional commits:

```
type(scope): description

feat(ui): add dark mode support
fix(docker): resolve permission issue
docs(readme): update installation steps
refactor(makefile): improve build process
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

### 🐳 Docker Best Practices

- Use multi-stage builds for optimization
- Minimize image layers
- Set proper file permissions
- Use non-root user when possible
- Document environment variables

### 🔧 Makefile Guidelines

When modifying the Makefile:
- Keep commands simple and documented
- Support both internal-only and web-accessible modes
- Include help text for new targets
- Test on multiple platforms (Linux, macOS, Windows)

## 🏃 Quick Testing Workflow

```bash
# Full test cycle
make clean          # Clean up
make build          # Build fresh image
make test           # Run automated tests
make run -p 8080    # Test web interface
make stop           # Clean up
```

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).

## Questions?

Feel free to:
- 💬 Open a discussion in the project
- 📧 Contact the maintainers
- 🐛 Create an issue for bugs
- 💡 Suggest improvements

## Common Tasks

### Adding Database Support
1. Install required PHP extensions in `docker/Dockerfile`
2. Test connectivity in `src/index.php`
3. Update database support table in `README.md`

### Modifying Styling
1. Edit `src/adminer.css`
2. Test changes with `make dev`
3. Document color scheme or layout changes

### Performance Improvements
1. Profile using browser dev tools
2. Optimize PHP configuration
3. Test with sample databases

Thank you for contributing! 🚀 