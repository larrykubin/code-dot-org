/* global $ */
var Radium = require('radium');

/**
 * Simple boot-strapped style alert.
 */
var Alert = React.createClass({
  propTypes: {
    body: React.PropTypes.oneOfType([
      React.PropTypes.string,
      React.PropTypes.element
    ]).isRequired,
    className: React.PropTypes.string,
    style: React.PropTypes.object,
    onClose: React.PropTypes.func.isRequired
  },

  render: function () {
    var styles = {
      root: {
        position: 'absolute',
        zIndex: 1000
      },
      closeButton: {
        margin: 0,
        ':hover': {
          backgroundColor: 'blue'
        }
      }
    };

    return (
      <div style={[styles.root, this.props.style]}>
        <div className={"alert fade in " + (this.props.className || '')}>
          <button type="button"
              className="alert-button close"
              style={styles.closeButton}>
            <span onClick={this.props.onClose}>&times;</span>
          </button>
          {this.props.body}
        </div>
      </div>
    );
  }
});
module.exports = Radium(Alert);
