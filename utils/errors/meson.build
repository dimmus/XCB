inc_xcb += include_directories('.')

dep_int_errors = xcb

src = files(
  'xcb_errors.c',
  'extensions.c', # generated by extensions.py
)

# src/extensions.c: src/extensions.py
# 	$(AM_V_GEN)$(PYTHON) $(srcdir)/src/extensions.py $@.tmp ${XCBPROTO_XCBINCLUDEDIR}/*.xml && \
# 	mv $@.tmp $@

# Run command: python3 extensions.py extensions.c ../../proto/src/*.xml

# src_exten = custom_target('extensions',
#   output: 'tmp', # no need
#   command: [
#     python, 
#     dir_source / 'utils' / 'errors' / 'extensions.py', 
#     'extensions.c', 
#     dir_source / 'proto' / 'src' / '*.xml'
#   ],
# )

lib = library('xcb-util-errors', src,
  include_directories: inc_xcb,
  dependencies: dep_int_errors,
  version: '6.3.0',
  install: true,
)

errors = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: 'XCB errors library',
  description: 'XCB errors utility library',
  version: '1.0.1',
  requires: 'xcb',
)