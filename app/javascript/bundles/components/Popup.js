import React, { Component } from 'react';

export default class Popup extends Component {

  render() {
    return (
      <div className="map-popup" key={this.props.favor.id}>
        <p id="categorypopup"><strong>{this.props.favor.category}</strong></p>
        <p><strong>Name: {this.props.favor.user_name}</strong></p>
        <p><strong>Needs: {this.props.favor.description}</strong></p>
        <p id="popupaddress"><strong>{this.props.favor.address}</strong></p>
        <a class="btn btn-warning" id="claimmapicon" href={`/favors/${this.props.favor.id}/claim?user_id=${this.props.user_id}`}>Claim Favor</a>
      </div >
    )
  }
}
