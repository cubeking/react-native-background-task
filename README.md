# react-native-background-task

React Native background task module for iOS that allows network requests to finish when app is in background.

## Installation

```bash
npm install @cubeking/react-native-background-task --save
# or
yarn add @cubeking/react-native-background-task
```

## iOS Setup

1. Add the following to your Podfile:
```ruby
pod 'RNBackgroundTask', :path => '../node_modules/react-native-background-task'
```

2. Run pod install:
```bash
cd ios && pod install
```

3. Add background modes to your Info.plist:
```xml
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>processing</string>
</array>
```

## Usage Example

```javascript
import BackgroundTask from 'react-native-background-task';

// Start a background task
const taskId = await BackgroundTask.startBackgroundTask();

try {
  // Do your background work here
  // For example: network requests, file uploads, etc.
  await someBackgroundWork();
} finally {
  // Always end the background task when done
  if (taskId) {
    await BackgroundTask.endBackgroundTask(taskId);
  }
}
```

## API Reference

### Methods

#### `startBackgroundTask()`
- Returns: `Promise<number>` - Task ID for the background task
- Throws: Error if background task cannot be started

#### `endBackgroundTask(taskId: number)`
- Parameters:
  - `taskId`: The task ID returned from `startBackgroundTask()`
- Returns: `Promise<boolean>` - True if task was successfully ended
- Throws: Error if task ID is invalid

## Notes

- Background execution time is limited to approximately 30 seconds on iOS
- Always ensure background tasks are ended to avoid battery drain
- Handle task expiration gracefully
- Check Platform.OS before calling iOS-specific methods
- Clean up tasks in component unmount

## License

MIT
