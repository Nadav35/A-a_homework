import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLoggingToDispatch = store => next => action => {
//   // debugger
//   // let storeDitch = store.dispatch;
//   // return action => {
//   //   console.log(store.getState());
//   //   console.log(action);
//   //   storeDitch(action);
//   //   console.log(store.getState());
//   // };
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
//
// };

// const applyMiddlewares = (store, ...middleWares) => {
//   let dispatch = store.dispatch;
//   middleWares.forEach( ( middleWare) => {
//     dispatch = middleWare(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
