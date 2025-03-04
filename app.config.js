const APP_VARIANT = process.env.APP_VARIANT;
const RUNTIME_VERSION = process.env.RUNTIME_VERSION;

const getEnvironmentConfig = () => {
  switch (APP_VARIANT) {
    case 'development':
      return {
        android: {
          package: 'com.MyApp',
        },
        ios: {
          bundleIdentifier: 'com.MyApp',
        },
      };
    case 'staging':
      return {
        android: {
          package: 'com.MyApp',
        },
        ios: {
          bundleIdentifier: 'com.MyApp',
        },
      };
    case 'production':
      return {
        android: {
          package: 'com.MyApp',
        },
        ios: {
          bundleIdentifier: 'com.MyApp',
        },
      };
    default:
      return {
        android: {
          package: 'com.MyApp',
        },
        ios: {
          bundleIdentifier: 'com.MyApp',
        },
      };
  }
};

export default {
  ...getEnvironmentConfig(),
  name: 'eastest',
  slug: 'eastest',
  displayName: 'eastest',
  ios: {
    bundleIdentifier: 'com.MyApp',
  },
  android: {
    package: 'com.MyApp',
  },
  runtimeVersion: RUNTIME_VERSION || '1.0.0',
  extra: {
    eas: {
      projectId: '56bcef23-25d1-420e-b420-94ff9216011e',
    },
  },
  updates: {
    url: 'https://u.expo.dev/56bcef23-25d1-420e-b420-94ff9216011e',
    assetPatternsToBeBundled: ['./src/assets/*.png'],
  },
};
