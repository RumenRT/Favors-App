import React, { Component } from 'react';

export default class Popup extends Component {

  render() {
    return (
      <div className="map-popup" key={this.props.favor.id}>
        <p id="categorypopup"><strong>{this.props.favor.category}</strong></p>
        <p><strong>{this.props.favor.description}</strong></p>
        <p><strong>{this.props.favor.address}</strong></p>
        <a href={`/favors/${this.props.favor.id}`}>Claim Favor</a>
      </div >
    )
  }
}