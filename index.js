import { NativeModules, Platform } from 'react-native';

const { BackgroundTask } = NativeModules;

export default {
    startBackgroundTask: async () => {
        if (Platform.OS === 'ios') {
            return await BackgroundTask.startBackgroundTask();
        }
        return null;
    },

    endBackgroundTask: async (taskId) => {
        if (Platform.OS === 'ios' && taskId) {
            return await BackgroundTask.endBackgroundTask(taskId);
        }
        return null;
    }
};
