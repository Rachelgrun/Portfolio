import React, { Component } from 'react';
import { Route, Switch } from 'react-router';
import { Layout } from './components/Layout';
import Home from './components/Home';
import './custom.css';


import './custom.css'
import DevSection from './components/DevSection';

export default class App extends Component {
    static displayName = App.name;

    render() {
        return (
            <Layout>
                <Switch>
                    <Route path='/devsection/:id/:sub' component={DevSection} />
                    <Route path='/devsection/:id' component={DevSection} />
                    <Route exact path='/' component={Home} />
                </Switch>
            </Layout>
        );
    }
}


