## Frameworks

### Virtual dom
a copy of the actual dom in memory

### React vs Angular (one way vs two way binding)
Two way data binding - waiting for changes to occur in the DOM and update the data model or vice versa

One way - entire virtual dom is rendered when anything changes. Difference is calculated. Real dom is then updated with what has changed.

### React

#### React production mode

1. Build the project with production flag

#### Keys
Keys are used to identify which elements have changed added or removed. Best practice is not to use index.

#### Class vs functional

Use functional components if it is a presentational component (stateless) and without lifecycles.

#### componentDidMount vs componentWillMount

ComponentWillMount render twice. It is not good to put fetch into componentWillMount as componentWillMount will render once before the data is fetch. ComponentDidMount gets called after the initial rendering of the component without data.

Use ComponentDidMount to do a fetch call.

#### lifecycle
1. ComponentWillMount gets sits between render and constructor.
2. componentDidmount is available after the component has mounted - api call, set timers, event listerners, draw


Updating methods
1. componentWillReceiveProps - gets called to do a state comparison, 1 argument
2. 2 arguments - nextProps and nextState. Returns true if props or state is different and false if there is nothing to update
3. ComponenentWillUpdate - Used to perform re-rendering preparation before rendering occurs. Good for anything needed outside of react architecture.
4. Called after any rendered html has finished loading. 2 arguments, prop and state previously.
5. ComponentWillunmount - called right before a component is removed from the dom. - perform cleanups.





