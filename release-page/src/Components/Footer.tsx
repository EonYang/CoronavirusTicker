import React from 'react';
import { FaGithub, FaLinkedin, FaBriefcase } from 'react-icons/fa';




const Footer = () => (
    <div id="footer">
        <h3>Created by</h3>
        <h1>Yang Yang</h1>
        <ul className="nav navbar-dark justify-content-center">
            <li className="nav-item">
                <a className="nav-link"
                    href="https://github.com/EonYang" >
                    <FaGithub size={32} color="white" />
                </a>
            </li>
            <li className="nav-item">
                <a className="nav-link"
                    href="https://www.linkedin.com/in/yang-yang-992a9a61/">
                    <FaLinkedin size={32} color="white" />
                </a>
            </li>
            <li className="nav-item">
                <a className="nav-link"
                    href="http://yangyang.blog/">
                    <FaBriefcase size={32} color="white" />
                </a>
            </li>
        </ul>
        <br />
        <br />
        <br />
        <h3>Data source</h3>
        <h1>CSSEGISandData</h1>
        <a className="nav-link"
            href="https://github.com/CSSEGISandData/COVID-19" >
            <FaGithub size={32} color="white" />
        </a>



    </div>
)
export default Footer;