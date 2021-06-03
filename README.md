# concur-benchmark

## Description

The purpose of this simple application is to compare the performance of Concur vs
a vanilla React.js application.

The current configuration of Concur points to the `integrate-streaming-poc` branch in this repo. This branch does away with Free and uses callbacks instead, *preserving the same Concur API*. As an interesting aside, if you wanted to compare the callbacks Concur with Free Concur, you could remove the overrides in `packages.dhall`, currently the last 4 lines.

This simple concur appliction displays a variable number of `<input/>` elements on
the page. Each input has `onChange` hooked to update a component local state. This is a very simple application, there is nothing in the code specifically to compare performance. Rather, you may open your browser's performance console, record and compare frame rates of each application, using this as a test harness.

For comparison the React.js version is located here https://github.com/ajbarber/react-benchmark.git.

### Build

`npm run build`

### Run locally

`npm run serve`
