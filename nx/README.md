- [ ] Create the monorepo by "nx" cli
- [ ] Create the lib by nx cli
- [ ] Define the target of project
    - [ ] Run target on a specific project
    - [ ] Run many targets on many projects
    - [ ] Define the order of target run in pipeline
    - [ ] The target is written in package.json
    - [ ] The target is written in project.json
- [ ] Cache the test result

Create the project
- `npm install --global nx@latest` to install nx in global scope
- `npx create-nx-workspace@latest` or `npm create nx-workspace`
- `npm install -D @nx/node @nx/js`: the package to generate the library
- At the root project folder, run `npm i typescript -D -W` to install typescript globally
- `nx g @nx/node:lib lib2` to generate the lib2 library
- In `packages` folder, add `is-even` project, add "build" script in the **package.json** file
- Run `npx nx build is-even` to build
- To add the build dependency between projects, add config by [link](https://nx.dev/getting-started/package-based-repo-tutorial#task-dependencies)
- Run `npx nx run-many --target=build` to build many projects

Create new package
- `npm i @nrwl/js --install=dev`
- generate library, run `npx nx generate @nrwl/js:library lib1 --publishable --importPath lib1`
- generate app, run `npx nx g @nrwl/node:app products-cli`
**Note**: Not support on Mac, only support on linux