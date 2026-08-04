---
title: "Developer Onboarding & Collaboration Guide"
author: "Pooja Chiduruppala"
date: "21 July 2026"
output: html_document
---

# Christchurch Rental Market Analysis

**University of Canterbury**  
**DATA422 – Group Project**

---

# Team

| Name | Role |
|------|------|
| Pooja Chiduruppala | Repository Manager |
| Sahil Mann | Team Member |
| Robbie Jarman | Team Member |
| Prasanthi Sooriyakumar | Team Member |

---

# Table of Contents

1. Introduction
2. Software Requirements
3. Repository Access & Cloning
4. Opening the Project
5. Understanding the RStudio Interface
6. Git Workflow in RStudio
7. Branch Strategy
8. Branch Protection
9. Project Standards & Naming Conventions
10. Repository Structure
11. Pull Request Workflow
12. Merge Conflicts
13. Troubleshooting
14. Frequently Asked Questions
15. Appendix – Useful Git Commands

---

# 1. Introduction

## Purpose

This guide introduces new team members to the project and explains the development workflow.

### Objectives

- Introduce new team members to the project.
- Explain the Git workflow.
- Standardise coding practices.
- Standardise Git practices.
- Reduce merge conflicts.

## Project Technologies

- R
- RStudio
- Git
- GitHub
- Quarto
- renv

---

# 2. Software Requirements

Install the following software before contributing:

- Git
- R
- RStudio Desktop
- Quarto
- GitHub Account

---

# 3. Repository Access & Cloning

## Steps

1. Accept the GitHub invitation.
2. Open the project repository.
3. Click **Code → HTTPS**.
4. Copy the repository URL.
5. Open RStudio.
6. Select **File → New Project → Version Control → Git**.
7. Paste the repository URL.
8. Create the project.

---

# 4. Opening the Project

Always open the project using the `.Rproj` file.

---

## Project Environment (renv)

### What is `renv`?

`renv` is R's project-specific package management system. It ensures that every team member uses the same package versions, improving reproducibility and preventing issues caused by different package installations.

### Benefits

- Consistent package versions.
- Reproducible analyses.
- Easy onboarding.
- Reliable package management.

---

## Initial Setup

### Step 1 – Install `renv`

```r
install.packages("renv")
```

> This only needs to be done once.

---

### Step 2 – Restore the Project Environment

```r
renv::restore()
```

This installs every package listed in `renv.lock`.

---

## Installing New Packages

```r
install.packages("plotly")
```

---

## Updating the Project Environment

```r
renv::snapshot()
```

Always commit the updated `renv.lock`.

```bash
git add renv.lock
git commit -m "Add plotly dependency"
git push
```

---

## After Pulling Changes

If another team member updates dependencies:

```r
renv::restore()
```

---

## Project Files

| File | Purpose |
|------|---------|
| `renv.lock` | Stores package versions |
| `renv/` | Project environment |

> **Do not delete or rename these files.**

---

## Team Responsibilities

Every team member must:

- Open the project using the `.Rproj` file.
- Run `renv::restore()` after cloning.
- Run `renv::restore()` whenever `renv.lock` changes.
- Run `renv::snapshot()` after adding project packages.
- Commit the updated `renv.lock`.
- Never edit `renv.lock` manually.

---

## Common Commands

| Task | Command |
|------|---------|
| Install renv | `install.packages("renv")` |
| Restore packages | `renv::restore()` |
| Save package versions | `renv::snapshot()` |
| Project status | `renv::status()` |

---

## Workflow

```text
Clone Repository
      │
      ▼
Open .Rproj
      │
      ▼
Run renv::restore()
      │
      ▼
Start Development
      │
      ▼
Install Package (if needed)
      │
      ▼
renv::snapshot()
      │
      ▼
Commit renv.lock
      │
      ▼
Push Changes
```

---

# 5. Understanding the RStudio Interface

- Source Editor
- Console
- Terminal
- Environment
- Git Pane
- Files Pane

---

# 6. Git Workflow in RStudio

```text
Pull
 ↓
Switch Branch
 ↓
Develop
 ↓
Review Diff
 ↓
Stage Files
 ↓
Commit
 ↓
Push
```

---

# 7. Branch Strategy

```text
main (Protected)
      ▲
pre-prod (Protected)
      ▲
staging
      ▲
Personal Branches
```

## Responsibilities

| Branch | Purpose |
|---------|---------|
| `main` | Final submission |
| `pre-prod` | Stable reviewed version |
| `staging` | Shared integration |
| Personal branches | Individual development |

---

# 8. Branch Protection

Protected branches:

- `main`
- `pre-prod`

Rules:

- Pull Requests required.
- Repository Manager approval required.
- Direct pushes prohibited.

---

# 9. Project Standards & Naming Conventions

## General

- No spaces in filenames.
- Use descriptive names.
- English only.

### File Naming

| Type | Convention | Example |
|------|------------|---------|
| R Scripts | camelCase | `dataCleaning.R` |
| Quarto | PascalCase | `ExploratoryAnalysis.qmd` |
| R Markdown | PascalCase | `WeeklyReport.Rmd` |
| CSV | snake_case | `cleaned_dataset.csv` |
| Images | snake_case | `price_distribution.png` |

### Variables

Use **camelCase**

Examples:

- `rentalData`
- `averagePrice`

### Functions

Use **camelCase**

```r
loadData()
cleanDataset()
generateSummary()
trainModel()
```

### Constants

```text
RANDOM_SEED
MAX_ITERATIONS
```

### Commit Messages

Good examples:

- Add rental price visualisation
- Fix missing values
- Update documentation

Avoid:

- update
- changes
- test
- final

---

# 10. Repository Structure

```text
ChristchurchRentalMarketAnalysis/

├── Documentation/
├── Data/
│   ├── raw/
│   ├── processed/
│   └── external/
├── Scripts/
├── Reports/
├── Figures/
├── Models/
├── README.md
└── .gitignore
```

---

# 11. Pull Request Workflow

```text
Personal Branch
      │
      ▼
Push
      │
      ▼
Open Pull Request
      │
      ▼
Review
      │
      ▼
Merge into staging
      │
      ▼
Promote to pre-prod
      │
      ▼
Promote to main
```

---

# 12. Merge Conflicts

When conflicts occur:

1. Resolve conflicts locally.
2. Test the code.
3. Commit the resolution.
4. Push the updated branch.

---

# 13. Troubleshooting

Common issues:

- Git tab missing
- Wrong branch
- Push rejected
- Merge conflicts
- Authentication failed
- Nothing to commit

---

# 14. Frequently Asked Questions

| Question | Answer |
|----------|--------|
| Why can't I push? | You can push to your personal branch and `staging` only. |
| Should I pull every day? | Yes. |
| How do I stash changes? | `git stash -m "your message"` |
| Can I merge another member's branch? | No. |

---

# 15. Appendix – Useful Git Commands

```bash
git status
git pull
git add .
git commit -m "Meaningful message"
git push
git switch
git merge
git stash
git log
```