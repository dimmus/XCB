<h1 align="center">The X protocol C-language Binding (XCB)</h1>

<img src="doc/neko.png" width=120 align="right"/>

The XCB is a replacement for Xlib featuring a small footprint, latency hiding, direct access to the protocol, improved threading support, and extensibility.

Xlib has been the standard C binding for the X Window System protocol for many years now. It is an excellent piece of work, but there are applications for which it is not ideal, for example

 - Small platforms: Xlib is a large piece of code, and it is difficult to make it smaller.
 - Latency hiding: Xlib requests requiring a reply are effectively synchronous: they block until the reply appears, whether the result is needed immediately or not.
 - Direct access to the protocol: Xlib does quite a bit of caching, layering, and similar optimizations. While this is normally a feature, it makes it difficult to simply emit specified X protocol requests and process specific responses.
 - Threaded applications: While Xlib does attempt to support multithreading, the API makes this difficult and error-prone.
 - New extensions: The Xlib infrastructure provides limited support for the creation of X extension client side code.

For these reasons, among others, we are working on XCB, an X protocol C Binding which is designed to solve the above problems and thus provide a base for
 - Toolkit implementation.
 - Direct protocol-level programming.
 - Lightweight emulation of commonly used portions of the Xlib API (see the XCB "utils" library for a start on this).

XCB is built atop an XML description of the core X protocol and the protocol of most of the extensions in common use today. This allows much of the XCB code to be auto-generated, eases generation of XCB-like and/or XCB-aware bindings to programming languages other than C, and enables the rapid development of other protocol-level tools by leveraging the protocol description.

Of course, it is difficult to switch a toolkit or application from Xlib to XCB at one go. To ease the burden, and to be able to more easily support Xlib, we have developed Xlib/XCB. Xlib/XCB is a version of Xlib that uses XCB as its transport, and permits Xlib and XCB calls to be mixed freely. This permits a gradual transition from Xlib to XCB. Xlib/XCB is scheduled to soon become the default version of Xlib shipped with X.org/freedesktop.org.

The XCB implementation and API are by now fairly mature. XCB has exhibited most of the properties we hoped for, and has had few of the drawbacks we feared. We believe, along with a growing number of freedesktop.org folks, that XCB is the future bottom layer of choice for client side X.

## For the Impatient Explorer

For those of you who will try to build the distribution without reading the entire release notes first, here is a quick summary of what to do.

```sh
meson setup . build
meson compile -C build
meson install -C build
```