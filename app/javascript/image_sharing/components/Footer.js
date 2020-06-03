import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';

class Footer extends Component {
  static propTypes = {
    title: PropTypes.string.isRequired
  };

  render() {
    const title = this.props.title;
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <h3 className='text-center' style={{ fontSize: '10px' }}>
              {title}
            </h3>
          </Col>
        </Row>
      </div>
    );
  }
}

export default Footer;
