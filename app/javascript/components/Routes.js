import React from "react"
import {
  BrowserRouter as Router,
  Switch
} from 'react-router-dom'
import Home from "./Home";
import Login from "./Login";

class Routes extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoggedIn: false,
      user: {}
    };
  };

  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route exact path='/' component={Home} />
            <Route exact path='/login' component={Login} />
            <Route exact path='/signup' component={} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
};

export default Routes;
