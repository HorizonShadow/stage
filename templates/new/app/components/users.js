import React from 'react';

class Users extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            loading: true
        }
    }

    componentWillMount() {
        fetch('/api/users')
            .then((r) => r.json())
            .then((users) => {
                this.setState({
                    users: users,
                    loading: false
                });
            });
    }

    render() {
        if(this.state.loading) return 'Loading...';
        return (
            <ul>
            {
                this.state.users.map((user) => {
                    return <li>{user.id} - {user.name}</li>
                })

            }
            </ul>
        )
    }
}

export default Users;