import React from 'react';
import P5Logo from './P5Logo';

interface link {
        name: string;
        link: string
}

interface navData {
    brand: link;
    links: Array<link>
}

const NavBar = (props: { navData: navData }) => {

    return (
        <>
            <nav className="navbar bg-none navbar-dark navbar-expand-sm fixed-top" id="header">
                <div className="container-fluid">
                    <a className="navbar-brand d-flex" style={{ height: '80px' }} href={props.navData.brand.link}>
                        <P5Logo />
                        <div className="d-inline-flex align-items-center" style={{ height: '80px' }}>{props.navData.brand.name}</div>
                    </a>
                    <button className="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#myToggleNav"
                        aria-controls="myToggleNav" aria-label="Navigation Toggler">
                        <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="myToggleNav">
                        <div className="navbar-nav ml-auto  ">
                            {props.navData.links.map((item, index) => (
                                <a href={item.link} key={index} className="nav-item nav-link ml-auto active" >{item.name}</a>
                            ))}
                        </div>
                    </div>
                </div>
            </nav>
        </>
    )
}

export default NavBar;
