var Photo = React.createClass({

  render: function() {
    return (
      <div className="col-md-3">
        <p>{this.props.title}</p>
        <a href={this.props.image_url} data-title={this.props.title} data-lightbox="otters" ><img src={this.props.image_url} /></a>
      </div>
      );
  }
});
