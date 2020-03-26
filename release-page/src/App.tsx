import React from 'react';
import 'normalize.css';
import './App.scss';
import 'jquery/dist/jquery';
import 'popper.js/dist/umd/popper'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/js/bootstrap.bundle';
import NavBar from './Components/NavBar'
import Nav from './Components/nav';

const App = () => {
  const navData = {
    brand: {
      name: "COVID-20 Ticker",
      link: "#"
    },
    links: [{
      name: "Doanload",
      link: "#"
    }, {
      name: "Github",
      link: "https://github.com/EonYang/CoronavirusTicker"
    }, {
      name: "About",
      link: "#about"
    }]
  }

  return (
    <div className="App">
      <div className="bg-image"></div>
      <NavBar navData={navData} />
    </div>
  );
}

export default App;
