# Environment Setup - Robot Framework and Appium

This guide will help you set up your environment for test automation using **Robot Framework** and **Appium**. The goal is to ensure that all necessary tools and configurations are installed and functioning properly.

## Prerequisites

### 1. Install Python
1. Download the installer: Go to the official Python website ([python.org](https://www.python.org/downloads/)) and download the stable version for your operating system.
2. Run the installer: During the installation, check the "Add Python to PATH" option.
3. Verify the installation: Open the terminal (PowerShell) and run:

    ```bash
    python --version
    ```

### 2. Install Visual Studio Code
1. Download and install [Visual Studio Code](https://code.visualstudio.com/).
2. In the sidebar, under Extensions, install the **"Robot Framework Language Server"** extension from Robocorp

    ![img](assets/Screenshot%202024-11-04_09h16_41.png)

### 3. Install Node.js
1. Download and install the stable version of [Node.js](https://nodejs.org/en/download/prebuilt-installer).
2. Verify that the installation was successful by running in PowerShell as an administrator:

    ```bash
    node --version
    ```

    The terminal should display the installed version, such as `v16.x.x`.

3. Enable additional Node.js features by running:

    ```bash
    corepack enable
    ```

4. Check if **yarn** is installed:

    ```bash
    yarn --version
    ```

### 4. Install JDK (Java Development Kit)
1. Download and install the the stable version of [JDK](https://www.oracle.com/java/technologies/downloads/).
2. Verify that the installation was successful by running:

    ```bash
    java --version
    ```
3. Após a instalação, realizar a configuração da variável de ambiente:
o	JAVA_HOME: C:\Program Files\Java\jdk-23


### 5. Install Android Studio
1. Download and install [Android Studio](https://developer.android.com/studio).  
   **Tip**: Ensure that the Android SDK is installed along with Android Studio.

## Install Appium
1. In the terminal, install Appium globally by running:

    ```bash
    npm install -g appium
    ```

2. Verify the Appium installation by running:

    ```bash
    appium -v
    ```

## Operating System Diagnostic
1. Run the command below in PowerShell to check if your system is ready to work with Appium and Android:

    ```bash
    npx appium-doctor --android
    ```

    If everything is correct, you will see an output similar to the image below, indicating that the main components are configured properly:  
    ![img](assets/Screenshot%202024-10-02%20180300.png)

    If you are missing any components shown in the image above, you will need to follow the steps below.

## Configure Environment Variables

### Windows
For the JDK and Android SDK to function correctly, configure the environment variables as outlined below:

1. **Locate the installation path** for **JDK** and **Android SDK** on your system.
2. In **Windows**, open the **Start Menu**, type **Environment Variables**, and click on **Edit the system environment variables**.
3. In the window that opens, click on **Environment Variables**.
4. Add two new **system variables**:
   - `ANDROID_HOME`: Path to the Android SDK installation.
        - windows default: `C:\Users\<Your_Username>\AppData\Local\Android\Sdk`
   - `JAVA_HOME`: Path to the JDK installation.
5. Edit the `Path` variable and add the following values:
   - `%ANDROID_HOME%\platform-tools`
   - `%ANDROID_HOME%\tools`
   - `%ANDROID_HOME%\tools\bin`
   - `%ANDROID_HOME%\tools\lib`
   - `%JAVA_HOME%\bin`

Close and reopen PowerShell, then run:

```bash
    npx appium-doctor --android
```

## Appium Inspector

**Definition**: Inspects the elements of a given application.

1. Access the Appium Inspector repository on [GitHub](https://github.com/appium/appium-inspector).
2. Navigate to [Releases](https://github.com/appium/appium-inspector/releases).
3. Scroll down to **Assets** and download the appropriate executable:  
    ![img](assets/Screenshot%202024-10-03%20120234.png) 

4. link: (https://github.com/appium/appium-inspector/releases/tag/v2024.9.1)

## Robot framework

1. In PowerShell, install Robot Framework by running:

    ```bash
    pip install robotframework
    ```

2. Install the Appium library for Robot Framework:

    ```bash
    pip install --upgrade robotframework-appiumlibrary
    pip install robotframework-browser
    python -m Browser.entry init
    ```

## Cloning the repository

### Cloning via Git

1. On your computer, **go to the directory** where you want to clone the repository
2. Right-click on an empty space and select:
    - **`Open Git Bash here`** or **`Open in Terminal`**
3. Clone the repository by running:

    ```bash
    git clone 
    ```

## Execution
Command options for execution:
1. To specify the evidence folder and file (example):
    ```bash
    robot -d .\logs\login .\tests\login.robot
    ```

2. Execution by tag (example name: 'regressivo'):
    ```bash
    robot -d results -i regressivo tests
    ```

