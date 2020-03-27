import React from 'react';
import discription1 from '../images/discription-1@3x.jpg';
import discription2 from '../images/discription-2@3x.jpg';


const FeatureSection = () => (
    <>
        <div className="detail-section">
            <div className="container">
                <section className="sec-1">

                    <img src={discription1} />
                    <p>
                        Don’t Google for new reports, it’s right in your status bar.
                </p>
                </section>

                <section className="sec-2">
                    <img src={discription2} />
                    <p>
                        Fully customizable, choose your the region you care.
                </p>
                </section>
            </div>
        </div>
    </>
)
export default FeatureSection;