## What is JSX

It is like xml for javascript and allows html to be mix with javascript. It is syntatic sugar for `React.createElement(component, props, ...children)`.

eg:

```
<div className="blah">child</div>
```

compiles to:

```
React.createElement('div', {className: "blah"}, "child")
```

For it to compile, React library must always be in scope.

## Props

Props are arguments passed into react components. They are like HTML attributes when passed through a tag and like arguments when accessed through the class/functional components.

Props are read only.

## How does react compile

It is compiled using babel. Babel is used to convert code written in ES6 to backwards compatible Javascript.

## Hooks and lifecycle methods

`componentDidMount` - useEffect(callback, [])<br />
`componentDidUpdate` - useEffect(callback, [dep1 ...])<br />
`componentWillUnmount` - useEffect(() => return () => { //some function})

### Classes

`Constructor` - called before anything else. Used to set up the initial state and other initial values<br />
`render` - method that outputs html to DOM<br />
`componentDidMount` - called after the component is rendered. This is where you put statements that requires the component that is already in placed in the DOM.<br />
`componentDidUpdate` - called after the component is updated in the DOM<br />
`componentWillUnMount - called when component is about to be removed from the DOM<br />


`useEffect` - used for side effects, when the DOM is in placed.<br />
`useContext` - used to share data that can be considered global for a tree of react components. Somewhat like redux.<br />
`useMemo` - to prevent execessive computation of an expensive value.

## Virtual DOM and ReactDom

When a state on a virtual dom is changed, a new virtual dom tree is created. The tree is then compared, with the previous virtual dom tree. Virtual dom then calculates the best possible method to make these changes to the real dom. Once react knows which virtual DOM objects have changed, it updates only those objects in the real DOM. Thus, it prevents directly manipulating the real dom and makes it faster.

Updates to the read dom are also sent in batches.

## State vs Props

State is mutable while props are not.

State is internal and controlled by the component while props are external and controlled by whatever renders the component.

## Webpack

Webpack creates a bundle, which is a new package that consist of the bare minimum files that can be plugged in to the html file easily. This bundle is build using a dependency graph.

eg:

```
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  //This property defines where the application starts
  entry:'./src/index.js',
    
  //This property defines the file path and the file name which will be used for deploying the bundled file
  output:{
    path: path.join(__dirname, '/dist'),
    filename: 'bundle.js'
  },
    
  //Setup loaders
  module: {
    rules: [
      {
        test: /\.js$/, 
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      }
    ]
  },
    
  // Setup plugin to use a HTML file for serving bundled js files
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html'
    })
  ]
}
```
