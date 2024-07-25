# CodeQL-Queries

This repository contains custom CodeQL queries for our projects, primarily focusing on JavaScript.

## CodeQL Installation

We recommend using the MetaMask Appsec-Playground repository for installing CodeQL CLI.

### Installation Steps:

1. Clone the Appsec-Playground repository
2. Navigate to the cloned directory
3. Run the installation command
4. Accept to add CodeQL to your PATH permanently
5. Source your shell profile file

### Installation Commands:

```shell
git clone git@github.com:MetaMask/Appsec-Playground.git &&
cd Appsec-Playground &&
make download-codeql
```

When prompted with "Do you want to add CodeQL to your PATH permanently? (Y/n)", enter 'Y'.
After installation, source your profile file:

```shell
source ~/.bashrc  # or ~/.zshrc if using Zsh
```

## Repository Structure

* /queries: Contains all custom CodeQL queries, organized by category
  * /Crypto: Queries related to cryptographic checks
  * e.g. /best-practices: Best practices queries
  * e.g./performance: Performance-related queries
* /query-suites: Contains query suite (.qls) files for different combinations of queries
* qlpack.yml: Query pack configuration

qlpack.yml: Query pack configuration
custom-query-suite.qls: Custom query suite definition.

## Updating QLpack

run:
`codeql pack install`
