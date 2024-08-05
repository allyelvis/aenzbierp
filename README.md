#!/bin/bash

# Define updated project and directories
PROJECT_NAME="aenzbiflutter"
BASE_DIR="$HOME/projects/$PROJECT_NAME"
FLUTTER_DIR="$HOME/flutter"
WEB_DIR="$BASE_DIR/web"
ANDROID_DIR="$BASE_DIR/android"
IOS_DIR="$BASE_DIR/ios"
DESKTOP_DIR="$BASE_DIR/desktop"
LIB_DIR="$BASE_DIR/lib"
CONFIG_DIR="$BASE_DIR/config"
DOCS_DIR="$BASE_DIR/docs"
BUILD_DIR="$BASE_DIR/build"

# Function to create directories
create_directories() {
    echo "Creating directories..."

    mkdir -p $BASE_DIR
    mkdir -p $WEB_DIR
    mkdir -p $ANDROID_DIR
    mkdir -p $IOS_DIR
    mkdir -p $DESKTOP_DIR
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
Aenzbi Flutter is a comprehensive enterprise resource planning system designed to streamline various business processes, including inventory management, invoicing, sales, and more.

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
   mkdir -p $WEB_HOSTING_DIR
   cp -r build/web/* $WEB_HOSTING_DIR
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
    mkdir -p $BASE_DIR/lib
    cat <<EOL > $LIB_DIR/main.dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aenzbi ERP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aenzbi ERP Home'),
      ),
      body: Center(
        child: Text('Welcome to Aenzbi ERP!'),
      ),
    );
  }
}
EOL

    # Create Flutter build files
    cat <<EOL > $BASE_DIR/flutter_project/ios/Podfile
platform :ios, '10.0'

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  # Flutter Pods
  flutter_install_all_ios_pods File.dirname(__FILE__)
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
  end
end
EOL

    echo "Essential files created successfully!"
}

# Function to set up basic Flutter project structure
setup_flutter_project() {
    echo "Setting up Flutter project..."

    # Create a new Flutter project
    if [ ! -d "$BASE_DIR/flutter_project" ]; then
        cd $BASE_DIR
        flutter create flutter_project
    else
        echo "Flutter project already exists."
    fi

    # Set up directories for the Flutter project
    cd flutter_project
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

    cd $BASE_DIR/flutter_project

    # Install Flutter dependencies
    flutter pub get

    echo "Dependencies installed successfully!"
}

# Function to build the project
build_project() {
    echo "Building the project..."

    cd $BASE_DIR/flutter_project

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