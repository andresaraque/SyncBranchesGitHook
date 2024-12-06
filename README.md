# Auto Sync Branches PrePush Git Hook

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## Description

GitBranchSyncHook is a powerful and automated tool designed to ensure seamless synchronization between your Git branches before any push operation. This pre-push hook script automates the process of merging changes from specified branches (e.g., develop, stage, and master) into the current working branch, ensuring that your branch is always up-to-date with the latest changes. This helps to maintain consistency and reduce the chances of conflicts during the integration process.

## Features

- **Branch Synchronization:** Automates synchronization between `develop`, `stage`, and `master` branches.
- **Pre-push Hook:** Ensures that you cannot push until the branches are synchronized.
- **Automated Commit Messages:** Generates detailed and standardized commit messages.

## Requirements

- **Git:** Version Control System.
- **Bash:** Shell scripting environment.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/andresaraque/SyncBranchesGitHook.git
    ```
2. Navigate to the project directory:
    ```bash
    cd SyncBranchesGitHook
    ```
3. Set script permissions:
    ```bash
    chmod +x .git/hooks/pre-push
    ```

## Usage

To use the pre-push hook:
1. Copy the `pre-push` script to the `.git/hooks` directory:
    ```bash
    cp syncBranches.sh .git/hooks/pre-push
    ```
2. Ensure the script has execution permissions:
    ```bash
    chmod +x .git/hooks/pre-push
    ```

## Contributing

1. Fork the project.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your changes (`git push origin feature/new-feature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License. Open source see the [LICENSE](LICENSE) file for details.
