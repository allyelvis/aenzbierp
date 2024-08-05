#!/bin/bash

# Define variables
PROJECT_NAME="aenzbiflutter"
BASE_DIR="$HOME/projects/$PROJECT_NAME"
FLUTTER_PROJECT_DIR="$BASE_DIR/flutter_project"
LIB_DIR="$FLUTTER_PROJECT_DIR/lib"
CONFIG_DIR="$BASE_DIR/config"
DOCS_DIR="$BASE_DIR/docs"
BUILD_DIR="$BASE_DIR/build"

# Function to create directories
create_directories() {
    echo "Creating directories..."

    mkdir -p $BASE_DIR
    mkdir -p $FLUTTER_PROJECT_DIR
    mkdir -p $LIB_DIR
    mkdir -p $CONFIG_DIR
    mkdir -p $DOCS_DIR
    mkdir -p $BUILD_DIR

    echo "Directories created successfully!"
}

# Function to create essential files
create_files() {
    echo "Creating essential files..."

    # Create README.md
    cat <<EOL > $BASE_DIR/README.md
# $PROJECT_NAME

## Description
Aenzbi ERP is a comprehensive enterprise resource planning system designed to streamline various business processes, including inventory management, invoicing, sales, and more.

## Installation

### Prerequisites
- Flutter
- Android Studio
- Node.js (if using npm packages)
- A web server for hosting the web build

### Setup
1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/allyelvis/aenzbiflutter.git
   cd aenzbiflutter
   \`\`\`

2. Install Flutter dependencies:
   \`\`\`bash
   flutter pub get
   \`\`\`

3. Build the project for different platforms:
   - Android:
     \`\`\`bash
     flutter build apk --release
     \`\`\`
   - iOS (macOS only):
     \`\`\`bash
     flutter build ios --release
     \`\`\`
   - Web:
     \`\`\`bash
     flutter build web
     \`\`\`
   - Desktop:
     \`\`\`bash
     flutter build linux
     flutter build windows
     flutter build macos
     \`\`\`

4. Deploy the web build:
   \`\`\`bash
   mkdir -p $WEB_DIR
   cp -r build/web/* $WEB_DIR
   \`\`\`

## Usage
- Use the generated APK for Android devices.
- Deploy the web build to your preferred web server.
- Use the iOS build for iOS devices (macOS only).
- Use the desktop builds for Linux, Windows, and macOS.

## Contributing
Feel free to contribute by creating pull requests or opening issues on GitHub.

## License
This project is licensed under the MIT License.
EOL

    # Create .gitignore
    cat <<EOL > $BASE_DIR/.gitignore
# Flutter/Dart
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
build/
ios/Flutter/Flutter.framework/
ios/Flutter/Flutter.dSYM/
ios/Flutter/Flutter.podspec
ios/.symlinks/
EOL

    # Create basic config files
    echo "{}" > $CONFIG_DIR/config.json
    echo "{}" > $CONFIG_DIR/.env

    # Create basic Dart files
    cat <<EOL > $LIB_DIR/main.dart
import 'package:flutter/material.dart';

void main() => runApp(AenzbiERPApp());

class AenzbiERPApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aenzbi ERP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/inventory': (context) => InventoryScreen(),
        '/sales': (context) => SalesScreen(),
        '/reports': (context) => ReportsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aenzbi ERP Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Aenzbi ERP!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inventory');
              },
              child: Text('Go to Inventory'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sales');
              },
              child: Text('Go to Sales'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reports');
              },
              child: Text('Go to Reports'),
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: Center(
        child: Text('Inventory Screen'),
      ),
    );
  }
}

class SalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales'),
      ),
      body: Center(
        child: Text('Sales Screen'),
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Center(
        child: Text('Reports Screen'),
      ),
    );
  }
}
EOL

    echo "Essential files created successfully!"
}

# Function to set up basic Flutter project structure
setup_flutter_project() {
    echo "Setting up Flutter project..."

    # Create a new Flutter project
    if [ ! -d "$FLUTTER_PROJECT_DIR" ]; then
        cd $BASE_DIR
        flutter create flutter_project
    else
        echo "Flutter project already exists."
    fi

    # Set up directories for the Flutter project
    cd $FLUTTER_PROJECT_DIR
    mkdir -p lib/models
    mkdir -p lib/screens
    mkdir -p lib/widgets
    mkdir -p lib/services
    mkdir -p lib/utils

    echo "Flutter project structure set up successfully!"
}

# Function to initialize Git repository
initialize_git() {
    echo "Initializing Git repository..."

    cd $BASE_DIR
    git init
    git add .
    git commit -m "Initial commit for $PROJECT_NAME"

    echo "Git repository initialized and initial commit made!"
}

# Function to install project dependencies
install_dependencies() {
    echo "Installing project dependencies..."

    cd $FLUTTER_PROJECT_DIR

    # Install Flutter dependencies
    flutter pub get

    echo "Dependencies installed successfully!"
}

# Function to build the project
build_project() {
    echo "Building the project..."

    cd $FLUTTER_PROJECT_DIR

    # Build for different platforms
    flutter build apk --release
    flutter build ios --release
    flutter build web
    flutter build linux
    flutter build windows
    flutter build macos

    echo "Project built successfully for all platforms!"
}

# Main script execution
echo "Starting project setup..."

# Create directories and files
create_directories
create_files

# Set up Flutter project structure
setup_flutter_project

# Initialize Git repository
initialize_git

# Install project dependencies
install_dependencies

# Build the project
build_project

echo "Project setup completed successfully!"