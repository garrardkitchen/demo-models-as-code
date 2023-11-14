# Contents

| Section | Description
| :- | :- |
| [Prerequisites](#prerequisites) | Docker for Desktop|
| [The challenge](#the-challenge) | What the problem is we're solving |
| [Demo 0](#demo-0) | Basics |
| [Demo 1](#demo-1) | Maps of your code |
| [Demo 2](#demo-2) | Export |
| [Demo 3](#demo-3) | Modularity |
| [Demo 4](#demo-4) | Extend |
| [Demo 5](#demo-5) | Vadlidate model |
| [References](#references) | Links |
| [Presenters mindmap](assets/Models%20as%20Code.png) | Notes |

--- 

# Prerequisites

- Docker for Desktop (linux)
- NodeJS & npm

---

# The challenge

## What are we trying to sovle?

- New to project or codebase
- Unfamiliar domain
- Don't want to make a mistake / upset peers
- No idea what the dependencies are
- Cohesion:
  - Want to ensure to don't violate these rules by adding classes to the wrong place
- DRY
- Race is on to make your first commit!

## A solution

- Models as Code
- The C4 model for visualising software architecture
- Maps of your code
- Context, containers, components, code
  - **Context** - Your software system
  - **Container** - Applications & Data stores
  - **Components** - Grouping of related functionality encapsulated behind a well-defined interface
  - **Code** - UML (Class or ERD)
- Using **[Structurizr](https://structurizr.com/)** DSL to create these models
  - DSL, CLI (Validate workspace), Lite (Docker image), puppeteer (export diagrams + documentation)

## Benefits:

- Powerful onboarding tool
- Reduced cognitive overload 
- Clean declarative language
- One file, contains multiple views
- Use for solution documentation
- Automate export in PR/CI pipelines
- Modular capability (reuse)
- Extend capability

---

# Demos

## Demo-0

Here I shows a high level summary of all software system entities, highlighting these elements:
- Grouping
- External (style)
- Types (softwareSystem, person)
- Relationships

🗣️Show a basic view

```powershell
.\run.ps1
```

---

## Demo-1

Here I show a map of your code and the the diagrams structurizr produces:
- Contexts
- Containers
- Components
- Navigation

🗣️Show in the code how E-Shop is connected to the Basket API 

```powershell
.\run.ps1
```
---

## Demo-2

Here I show how to export the diagrams and documentation.  We show how to add document to the model:
- Export diagrams
- Export documentation

🗣️Remove diagrams and document folders

**Ref**: [Markdown/Asciidoc](https://docs.structurizr.com/dsl/docs)

**Step 1**

```powershell
.\run.ps1
```

ℹ️ wait until running

**Step 2**

Export diagrams:

_📂 diagrams_

```powershell
.\download-diagrams.ps1
```

🗣️Now show the images

**Step 3**

Export documentation:

_📂 documentation_

```powershell
.\download-docs.ps1
```

🗣️Now open these HTML files:

- 📄 Open up EShop.html
- 📄 Open up Shopping-Basket.html

---

## demo-3

Here I show a basic example of modularity:

- people (internal & external)
- style

🗣️ Can also be URIs

```powershell
.\run.ps1
```

---

## demo-4

Here I show a basic example of extends:

- Extending from a parent.dsl. 
- Getting perons entities from parent
- !ref website in child file
- Merges properites - see orange background set in parent and azure icon set in child

🗣️ Can also be URIs

```powershell
.\run.ps1
```

---

## demo-5

Here I show a basic example of validation using the CLI. The rationale for this demo is to show how you can validate your model, for example, when you trigger your PR pipeline.

**Ref**: [Validate CLI](https://docs.structurizr.com/cli/validate)

**Step 1** - Show valid model

```powershell
.\run.ps1
```

**Step 2** - show invalid model

- change a model relationship or insert a rogue char

```powershell
.\run.ps1
```

🗣️ Show other CLI command -> listing all of the entities

---

# Reference

- https://c4model.com/
- https://docs.structurizr.com/lite/quickstart
- https://structurizr.com/help/themes
- https://structurizr.com/help/theme?url=https://static.structurizr.com/themes/microsoft-azure-2023.01.24/theme.json
- https://docs.structurizr.com/cli/validate