Create the project
- `npx create-nx-workspace@latest`
- At the root project folder, run `npm i typescript -D -W` to install typescript globally
- In `packages` folder, add `is-even` project, add "build" script in the **package.json** file
- Run `npx nx build is-even` to build
- To add the build dependency between projects, add config by [link](https://nx.dev/getting-started/package-based-repo-tutorial#task-dependencies)
- Run `npx nx run-many --target=build` to build many projects

Create new package
- `npm i @nrwl/js --install=dev`
- generate library, run `npx nx generate @nrwl/js:library lib1 --publishable --importPath lib1`
- generate app, run `npx nx g @nrwl/node:app products-cli`
**Note**: Not support on Mac, only support on linux