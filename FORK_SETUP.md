# Setting up the Forked Repository

This repository is a fork of [adaptive_platform_ui](https://github.com/berkaycatak/adaptive_platform_ui) with custom patches for the SkinDetector project.

## Changes Made

Currently synced with upstream `v0.1.111`. These are the fork-local patches — they must be
re-applied by hand whenever an upstream merge conflicts with them:

1. **Fixed remounting issue**: Removed `selectedIndex` from `IOS26Scaffold` key in `lib/src/widgets/adaptive_scaffold.dart` to prevent unnecessary widget remounts.
2. **`extendBody: true`** on the Material tabbed scaffold in `lib/src/widgets/adaptive_scaffold.dart`, letting the body extend under the navigation bar for the blur effect.
3. **Navigation bar type safety**: `_wrapAsObstructing` + `lib/src/widgets/obstructing_preferred_size_wrapper.dart` always wrap a custom `cupertinoNavigationBar` rather than casting it, avoiding a type-cast crash on `CupertinoPageScaffold`.
4. **`onEditingComplete`** callback on `AdaptiveTextField` in `lib/src/widgets/adaptive_text_field.dart`.

## Setting up the Repository in SkinDetector Organization

### Option 1: Using the Setup Script

1. Create a new private repository in your SkinDetector organization on GitHub:
   - Go to https://github.com/organizations/SkinDetector/repositories/new
   - Name it `adaptive_platform_ui` (or your preferred name)
   - Set it to **Private**
   - **Do NOT** initialize with README, .gitignore, or license

2. Run the setup script:
   ```bash
   ./setup_skin_detector_repo.sh
   ```

3. Follow the prompts to push your changes.

### Option 2: Manual Setup

1. Create a new private repository in your SkinDetector organization on GitHub (same as above).

2. Update the remote:
   ```bash
   git remote remove origin
   git remote add origin https://github.com/SkinDetector/adaptive_platform_ui.git
   ```

3. Push your changes:
   ```bash
   git push -u origin main
   ```

## Using the Forked Package in Your Flutter App

After pushing to your private repository, update your `pubspec.yaml`:

```yaml
dependencies:
  adaptive_platform_ui:
    git:
      url: https://github.com/SkinDetector/adaptive_platform_ui.git
      ref: main
```

Or if you need authentication:

```yaml
dependencies:
  adaptive_platform_ui:
    git:
      url: git@github.com:SkinDetector/adaptive_platform_ui.git
      ref: main
```

Then run:
```bash
flutter pub get
```

## Keeping the Fork Updated

To sync with the original repository:

```bash
# Add the original repository as upstream
git remote add upstream https://github.com/berkaycatak/adaptive_platform_ui.git

# Fetch updates
git fetch upstream

# Merge updates into your fork
git merge upstream/main

# Push to your fork
git push origin main
```

