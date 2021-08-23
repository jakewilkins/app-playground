# App Playground

This is a Codespaces enabled place to play with and debug GitHub Apps.

The goal is to provide a jumpstart to working with a GitHub App. This can be especially useful when testing new ideas or submitting bug reports.

The [apptokit](https://github.com/jakewilkins/apptokit) CLI utility comes installed and there is a `.apptokit.yml` provided which will be setup to work with Codespaces.

## First steps

- Create a repo using this template
- Launch into a codespace
- Configure the permissions your App needs in the `.apptokit.yml` file.
- run [`apptokit manifest setup`](https://docs.github.com/en/developers/apps/building-github-apps/creating-a-github-app-from-a-manifest)
- 🥳

At this point, you have a Codespace setup where you can use a GitHub App to interact with GitHub's API. You can make one-off requests with `apptokit curl`, receive webhooks*, walk through the OAuth flow, whatever you need to do.

The `scripts` folder is yours to add whatever you need, script a reproduction of a bug report or write a demo of a new feature.

### Web Hooks

There should be a process running to receive and log hooks, if this worked correctly there will be a `.hook_receiver.pid` in your project root. If this doesn't exist, don't worry, run `script/hook-receiver` to start it.

Additionally, you'll need to make the webhook port (8077) public in the codespaces port settings.

Hooks received are logged to `logs/hooks.log`.

To execute a command when a hook is received, create a script in the `hook_processors` directory with the event name and action as the file name. The hook receiver will call this command passing the hook
payload to STDIN of your command. Output of these commands is logged to `logs/<command_name>.log`

There is an example processor provided which receives `installation-created` events.

You can follow all these logs by running `tail -f log/*.log` in another terminal to follow along with your processes.
