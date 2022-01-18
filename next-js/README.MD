## Next.js Notes

Main features are:

* hybrid static generation and server side rendering
* page based routing system
* api routs to build endpoints with serverless functions

### Page routing

A page is a component exported from a file in the `pages` directory. They are associated with a route base on their file name. eg:

* pages/index.js == `/`
* pages/posts/first-post.js === `/posts/first-post`

Link the page by using the `Link` component:

```
<Link href="/posts/first-post">
  <a>blah</a>
</Link>
```

The `Link` wrapper enables client side navigation (done by javascript) instead of the default browser based navigation (reloads the full page).

### Assets, metadata and css

Static assets can be hosted in the `public` directory. Use the `Image` component to optimize image display

```
  <Image
    src="/images/profile.jpg" // Route of the image file
    height={144} // Desired size with correct aspect ratio
    width={144} // Desired size with correct aspect ratio
    alt="Your Name"
  />
``` 

Use the `Head` tag to modify the metadata of a page, example, the <title>

```
<Head>
  <title>Create Next App</title>
  <link rel="icon" href="/favicon.ico" />
</Head>
```

Use the `Script` tag to optimize when additional scripts are fetched and executed:

```
      <Script
        src="https://connect.facebook.net/en_US/sdk.js"
        strategy="lazyOnload"
        onLoad={() =>
          console.log(`script loaded correctly, window.FB has been populated`)
        }
      />
```

To use css modules, the css file name must end with `.module.css`

1. Import the css file into the component
2. On the tag, do something like `className={styles.container}`

Global css can only be used in `pages/_app.js`

### Pre-rendering and data-fetching

pre-rendering is generating html with minimal javascript required for that page to load without using browser javascript.

* static generation is pre-rendering that generates html at build time, which is then re-used
* server side rendering is pre-rendering method that generates the html on each request

Use static generation if you can pre-render this page ahead of user's request. If data is required to be updated frequently then use server side rendering.

To do static generation with data, use `getStaticProps` api.

```
export async funtion getStaticProps() { return {props: {...data}} }

export default function Home({...props}) {...}

```

In production, `getStaticProps` run at build time, hence won't be able to use data that's only available during request time such as query parameters. It is only allowed to be exported from a page.

If need to fetch data at request time, use `getServerSideProps(context)`.

### Dynamic routing

1. Need to create a file with file `[id].js`.
2. implement `getStaticPaths()`, return `{paths: [{params:{id: '...'}}], fallback: false}`
3. `getStaticProps` can access id from `params.id`

### Api Routes

Can create an api endpoint inside by creating a function inside the `pages/api` directory with the following format:

```
export default function funcName(req, res) { ... }
```

Should never fetch an api route from `getStaticProps` or `getStaticPaths` as they are server side and won't be included in the js bundle for the browser, therefore can't use it at request time.

```
