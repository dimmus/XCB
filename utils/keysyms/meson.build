inc_xcb += include_directories('.')

f_check += []
h_check += []

dep_int_keysyms = [xcb]

src = files(
)

lib = library('xcb-keysyms', src,
  include_directories: inc_xcb,
  dependencies: dep_int_keysyms,
  version: '0.0.0',
  install: true,
)

keysyms = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: '',
  description: '',
  version: '',
  requires: 'xcb',
)