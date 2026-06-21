# Swim Success Test Task

Flutter test task with a pace selector screen for a swimmer's fastest 100m freestyle time.

## What The App Does

The screen lets the user pick a pace between `1:10` and `2:00`.

The pace can be changed in three ways:

- minute and second arrow buttons
- slider
- manual input dialog after tapping the time cards

The selected time is converted into a swimmer level: `Elite`, `Advanced`, `Intermediate`, or `Beginner`.

## Project Structure

The code is split into small layers:

- `lib/core` contains shared constants and dependency setup.
- `lib/core/theme` contains the app theme, shared colors, text styles, button style, input style, and slider style.
- `lib/features/domain` contains pace rules, helper logic, entities, and repository contracts.
- `lib/features/data` contains API and repository implementation.
- `lib/features/pace_selector/view` contains the screen, provider, and widgets.

`PaceSelectorProvider` keeps UI state. It does not calculate all pace rules by itself. The provider asks `PaceTimeHelper` for time changes and uses `PaceRepository` to submit the selected pace.

Most visual styling comes from `AppTheme.dark`, so widgets can use `Theme.of(context)` instead of repeating the same colors everywhere.

## Manual Input Rules

Manual input accepts only digits and limits each field to two characters.

Invalid values do not replace the current pace. For example, `0:00` or `2:30` will show an error and keep the previous valid value.

## Run The App

```shell
flutter pub get
flutter run
```

## Checks

```shell
flutter analyze
flutter test
```

## Notes

The submit request currently uses `jsonplaceholder.typicode.com` as a simple test endpoint.
