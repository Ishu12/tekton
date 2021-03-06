
import React from 'react';
import history from "../history";

import { BadRequest } from "./ui/error/badRequest";
import log from "loglevel";
import { Router, Route, Switch } from 'react-router-dom';

import '../styles/App.css';

import ProtectedRoute from './ui/ProtectedRoute';

import HelpPage from "./common/HelpPage.function.js";
import FooterComponent from "./common/FooterComponent";
import ClusterForm from './routes/admin/ClusterForm.js';
import AccessApproval from './routes/admin/AccessApproval.function.js';
import NewUserApproval from './routes/admin/user.registration.approval.js';

import QuotaDetails from './routes/namespaces/QuotaDetails.js';
import ClusterResourceUsagePrint from './routes/namespaces/ResourceUsagePrintableComponent.js';
import ClusterAccess from './routes/user/ClusterAccess.js';
import Profile from './routes/user/Profile.js';
import UserList from './routes/user/UserList.js';
import ChangePassword from './routes/user/ChangePassword.js';
import Login from "./login/login.function.js";
import SignUp from "./login/signup.function.js";
import Home from './routes/home/home';
import Sidebar from './common/sidebar';



const App = () => {
	log.info('[App]: Rendering App Component')
	const isAuthenticated = JSON.parse(localStorage.getItem('_token'));
	return (
		<div className="App" id="outer-container">
			<Router history={history}>
				
				<div id="page-wrap" >

					{isAuthenticated ?
						<Sidebar  />  : null}

					<Switch>

						<ProtectedRoute path="/home" component={Home} />
						<Route path="/help" component={HelpPage} />
						<Route path={["/", "/login"]} exact component={Login} />
						<Route path="/sign-up" component={SignUp} />
						<ProtectedRoute path="/resources" component={QuotaDetails} />
						<ProtectedRoute path="/resources-export" component={ClusterResourceUsagePrint} />
						<ProtectedRoute path="/access" exact component={ClusterAccess} />
						<ProtectedRoute path="/change/password" exact component={ChangePassword} />
						<ProtectedRoute path="/profile" component={Profile} />
						<ProtectedRoute path="/add-cluster" exact component={ClusterForm} forAdmin="true" />
						<ProtectedRoute path="/access-approve" exact component={AccessApproval} forAdmin="true" />
						<ProtectedRoute path="/user-approve" exact component={NewUserApproval} forAdmin="true" />
						<ProtectedRoute path="/manageusers" exact component={UserList} forAdmin="true" />
						<Route path="*" component={BadRequest} />
					</Switch>

				</div>
				<FooterComponent />
			</Router>
		</div>
	)
}


export default App;