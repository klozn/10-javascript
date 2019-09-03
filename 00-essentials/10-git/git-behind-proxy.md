# Configure GIT to work behind

In larger corporations, internet access is often restricted. Although direct internet access is blocked, application that require access to the internet can configure a proxy. The proxy is a server in the network that takes care of the internet connectivity on your behalf.
To configure GIT to work behind a proxy run the following command:
> `git config --global http.proxy <https://your-proxy>`

To turn the proxy off:
> `git config --global --unset-all http.proxy`

## Optional
The GIT configuration for your computer is always the same, whether you are on your corporate network or not.
Should you need to connect to GIT with your company laptop from home, you need to disable this proxy configuration.
This constant switching is cumbersome, unless you have a way to automate it.

One solution could be to configure a `git alias` in `~/.gitconfig`
```
[alias]
    disableproxy = config --global --unset-all http.proxy
    enableproxy = config --global http.proxy <https://your-proxy>
```

Now you can enable/disable your corporate proxy with a simple command
> `git enableproxy`
>
> `git disableproxy`

ℹ️NOTE: This is not a standard solution, but simply an attempt to make your live easier.