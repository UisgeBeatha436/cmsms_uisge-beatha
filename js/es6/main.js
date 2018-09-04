import '@babel/polyfill';

import './import/jquery-version';

const main = async () => {
  console.log(window.location.pathname);
};

console.time('main');
main();
console.timeEnd('main');

//
// EOF
//
