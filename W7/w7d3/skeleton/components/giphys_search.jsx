import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    // debugger
    super(props);
    this.state = {
      searchBox: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e){
    this.setState({searchBox: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const searchTerm = this.state.searchBox;
    this.props.fetchSearchGiphys(searchTerm);

  }

  render() {

    return (
      <div>
        <input value={this.state.searchBox} onChange={this.handleChange}></input>
        <button onClick={this.handleSubmit}>Search Giphys
        </button>
        <GiphysIndex giphys={this.props.giphys} />

      </div>
    );
  }
}

export default GiphysSearch;
