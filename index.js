/**
 * @format
 */

import {AppRegistry} from 'react-native';
import {make as App} from './src/App.bs.js';
import appConfig from './app.config.js';

AppRegistry.registerComponent(appConfig.name, () => App);
