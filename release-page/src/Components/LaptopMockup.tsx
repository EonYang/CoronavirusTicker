import React from 'react';

const LaotopMockup = () => (
    <div id="laptop-bg" className="w-100 mx-auto">
        <img id="laptop" src={process.env.PUBLIC_URL + "/images/laptop.png"} alt="a laptop" />
        <div id="download-btn" >
            <h1 id="large-title" className="text-center w-100">COVID-19 Ticker</h1>
            <div className="text-center w-100">
            <a  href="https://github.com/EonYang/CoronavirusTicker/releases/download/v1.02-lw/CoronavirusTicker.app.1.02.zip" className="btn btn-large btn-light  align-middle"> Download for Mac</a>
        </div>
        </div>
    </div>
)
export default LaotopMockup;


