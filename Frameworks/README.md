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

