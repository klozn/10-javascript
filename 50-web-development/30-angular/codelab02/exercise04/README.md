# Codelab02 - ToH Extensions

## Http interceptor

We want to prevent to have to pass some information needed for http requests in every service. Examples of this are **authentication tokens** or the **api url**. These things should be configured in your application **only once**.

- Check the [HttpInterceptor documentation](https://angular.io/guide/http#write-an-interceptor)
- Write a HttpInterceptor to prefix the url of each request with the backend base url (the `http://{ip_address}:3001/api` part)
  > You'll have to clone the request, and set a new url, made from the base url and the request url, don't forget to change the heroesUrl to just `/heroes` (or any other urls in any services you might have by now)
