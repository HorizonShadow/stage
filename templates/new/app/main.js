import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import 'bulma/css/bulma.css';

import Home from './components/home';
import About from './components/about';
import Users from './components/users';

ReactDOM.render(
    <Router>
        <div>
            <ul>
                <li><Link to={'/'}>Home</Link></li>
                <li><Link to={'/about'}>About</Link></li>
                <li><Link to={'/users'}>Users</Link></li>
            </ul>

            <hr/>

            <Route exact path='/' component={Home}/>
            <Route path='/about' component={About} />
            <Route path='/users' component={Users} />
        </div>
    </Router>
, document.getElementById('root'));