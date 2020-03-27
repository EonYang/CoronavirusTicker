import React from 'react';
import laptopMockup from '../images/laptop.png';

const LaotopMockup = () => (
    <div id="laptop-bg" className="w-100 mx-auto">
        <img id="laptop" src={laptopMockup} alt="a laptop" />
        <div id="download-btn" >
            <h1 id="large-title" className="text-center w-100">COVID-19 Ticker</h1>
            <div className="text-center w-100">
            <a  href="https://github.com/EonYang/CoronavirusTicker/releases/download/v1.03-lw/CoronavirusTicker.app.1.03-notarized.zip" className="btn btn-large btn-light  align-middle"> Download for Mac</a>
        </div>
        </div>
    </div>
)
export default LaotopMockup;


