import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import * as ApiUtil from './util/api_util';
import { receiveSearchGiphys, fetchSearchGiphys } from './actions/giphy_actions';






// window.fetchSearchGiphys = ApiUtil.fetchSearchGiphys;
document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  window.fetchSearchGiphys = ApiUtil.fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
  window.fetchSearchGiphys = fetchSearchGiphys;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
