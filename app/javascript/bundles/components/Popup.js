import React, { Component } from 'react';

export default class Popup extends Component {

  render() {
    return (
      <div className="map-popup" key={this.props.favor.id}>
        <p><strong>Created By: {this.props.favor.user_name}</strong></p>
        <p id="categorypopup"><strong>{this.props.favor.category}</strong></p>
        <p><strong>{this.props.favor.description}</strong></p>
        <p><strong>{this.props.favor.address}</strong></p>
        <a href={`/favors/${this.props.favor.id}/claim?user_id=${this.props.user_id}`}>Claim Favor</a>
      </div >
    )
  }
}