.DEFAULT_GOAL := all

magit_ver=2.90.1
wget_opts=--no-check-certificate

## Packages
lisp_dir = lisp
$(lisp_dir):
	mkdir -p $@

## Language modes
lang_modes  = # nothing yet
lang_modes += google-c-style
lang_modes += markdown-mode
lang_modes += cuda-mode
lang_modes += cmake-mode
lang_modes += lua-mode

google-c-style: $(lisp_dir)/google-c-style.el
$(lisp_dir)/google-c-style.el:
	wget https://raw.githubusercontent.com/google/styleguide/gh-pages/google-c-style.el $(wget_opts) -O $@

markdown-mode: $(lisp_dir)/markdown-mode.el
$(lisp_dir)/markdown-mode.el:
	wget https://raw.githubusercontent.com/jrblevin/markdown-mode/master/markdown-mode.el $(wget_opts) -O $@

cuda-mode: $(lisp_dir)/cuda-mode.el
$(lisp_dir)/cuda-mode.el:
	wget https://raw.githubusercontent.com/chachi/cuda-mode/master/cuda-mode.el $(wget_opts) -O $@

cmake-mode: $(lisp_dir)/cmake-mode.el
$(lisp_dir)/cmake-mode.el:
	wget https://raw.githubusercontent.com/Kitware/CMake/master/Auxiliary/cmake-mode.el $(wget_opts) -O $@

lua-mode: $(lisp_dir)/lua-mode.el
$(lisp_dir)/lua-mode.el:
	wget https://raw.githubusercontent.com/immerrr/lua-mode/v20151025/lua-mode.el $(wget_opts) -O $@
	# wget https://raw.githubusercontent.com/immerrr/lua-mode/master/lua-mode.el $(wget_opts) -O $@

## Highlight
highlight_pkgs  = # nothing yet
highlight_pkgs += highlight-symbol
highlight_pkgs += breadcrumb
highlight_pkgs += symbol-overlay
highlight_pkgs += highlight-indent-guides
highlight_pkgs += auto-highlight-symbol
highlight_pkgs += volatile-highlights
highlight_pkgs += bm

highlight-symbol: $(lisp_dir)/highlight-symbol.el
$(lisp_dir)/highlight-symbol.el:
	wget https://raw.githubusercontent.com/nschum/highlight-symbol.el/master/highlight-symbol.el $(wget_opts) -O $@

breadcrumb: $(lisp_dir)/breadcrumb.el
$(lisp_dir)/breadcrumb.el:
	wget https://raw.githubusercontent.com/pheaver/breadcrumb/master/breadcrumb.el $(wget_opts) -O $@

symbol-overlay: $(lisp_dir)/symbol-overlay.el
$(lisp_dir)/symbol-overlay.el:
	wget https://raw.githubusercontent.com/wolray/symbol-overlay/master/symbol-overlay.el $(wget_opts) -O $@

highlight-indent-guides: $(lisp_dir)/highlight-indent-guides.el
$(lisp_dir)/highlight-indent-guides.el:
	wget https://raw.githubusercontent.com/DarthFennec/highlight-indent-guides/master/highlight-indent-guides.el $(wget_opts) -O $@

auto-highlight-symbol: $(lisp_dir)/auto-highlight-symbol.el
$(lisp_dir)/auto-highlight-symbol.el:
	wget https://raw.githubusercontent.com/mhayashi1120/auto-highlight-symbol-mode/master/auto-highlight-symbol.el $(wget_opts) -O $@
	wget https://raw.githubusercontent.com/mhayashi1120/auto-highlight-symbol-mode/master/auto-highlight-symbol-config.el $(wget_opts) -c -P $(dir $@)

volatile-highlights: $(lisp_dir)/volatile-highlights.el
$(lisp_dir)/volatile-highlights.el:
	wget https://raw.githubusercontent.com/k-talo/volatile-highlights.el/master/volatile-highlights.el $(wget_opts) -O $@

bm: $(lisp_dir)/bm/bm.el
$(lisp_dir)/bm/bm.el:
	git submodule update --init $(dir $@)

## Completion
completion_pkgs  = # nothing yet
completion_pkgs += company-mode
completion_pkgs += auto-complete

company-mode: $(lisp_dir)/company-mode/company.el
$(lisp_dir)/company-mode/company.el:
	git submodule update --init $(dir $@)

auto-complete: $(lisp_dir)/auto-complete/auto-complete.el popup
$(lisp_dir)/auto-complete/auto-complete.el:
	git submodule update --init $(dir $@)

popup: $(lisp_dir)/popup.el
$(lisp_dir)/popup.el:
	wget https://raw.githubusercontent.com/auto-complete/popup-el/master/popup.el $(wget_opts) -O $@

## Magit
magit  = # nothing yet
magit += dash
magit += with-editor
magit += ghub
magit += graphql
magit += treepy
### for repository instance
# magit += libegit2
# magit += transient
# magit += $(lisp_dir)/magit/lisp/magit.el
### for package instance
magit += magit-popup
magit += $(lisp_dir)/magit-$(magit_ver)/lisp/magit.el

$(lisp_dir)/magit/lisp/magit.el:
	git submodule update --init $(lisp_dir)/magit
	echo "LOAD_PATH  = -L $(PWD)/$(lisp_dir)/magit/lisp" > $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)" >> $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/dash" >> $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/with-editor" >> $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/ghub" >> $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/graphql" >> $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/treepy" >> $(lisp_dir)/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/libegit2" >> $(lisp_dir)/magit/config.mk
	cd $(lisp_dir)/magit; make

$(lisp_dir)/magit-$(magit_ver)/lisp/magit.el:
	wget https://github.com/magit/magit/releases/download/v$(magit_ver)/magit-$(magit_ver).tar.gz
	tar xzvf magit-$(magit_ver).tar.gz
	cp -r magit-$(magit_ver) $(lisp_dir)/
	rm -rf magit-$(magit_ver).tar.gz magit-$(magit_ver)
	echo "LOAD_PATH  = -L $(PWD)/$(lisp_dir)/magit-$(magit_ver)/lisp" > $(lisp_dir)/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)" >> $(lisp_dir)/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/dash" >> $(lisp_dir)/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/with-editor" >> $(lisp_dir)/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/ghub" >> $(lisp_dir)/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/graphql" >> $(lisp_dir)/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/$(lisp_dir)/treepy" >> $(lisp_dir)/magit-$(magit_ver)/config.mk
	cd $(lisp_dir)/magit-$(magit_ver); make

dash: $(lisp_dir)/dash/dash.el
$(lisp_dir)/dash/dash.el:
	git submodule update --init $(dir $@)

with-editor: $(lisp_dir)/with-editor/with-editor.el
$(lisp_dir)/with-editor/with-editor.el:
	git submodule update --init $(dir $@)

ghub: $(lisp_dir)/ghub/ghub.el
$(lisp_dir)/ghub/ghub.el:
	git submodule update --init $(dir $@)

graphql: $(lisp_dir)/graphql/graphql.el
$(lisp_dir)/graphql/graphql.el:
	git submodule update --init $(dir $@)

treepy: $(lisp_dir)/treepy/treepy.el
$(lisp_dir)/treepy/treepy.el:
	git submodule update --init $(dir $@)

libegit2: $(lisp_dir)/libegit2/libgit.el
$(lisp_dir)/libegit2/libgit.el:
	git submodule update --init $(dir $@)
	cd $(dir $@); git submodule update --init
	mkdir -p $(dir $@)/build
	cd $(dir $@)/build; cmake ..; make

transient: $(lisp_dir)/transient.el
$(lisp_dir)/transient.el:
	wget https://raw.githubusercontent.com/magit/transient/master/lisp/transient.el $(wget_opts) -O $@

magit-popup: $(lisp_dir)/magit-popup.el
$(lisp_dir)/magit-popup.el:
	wget https://raw.githubusercontent.com/magit/magit-popup/master/magit-popup.el $(wget_opts) -O $@

## Helm
helm  = # nothing yet
helm += async
helm += $(lisp_dir)/helm/helm.el
helm += helm-swoop
helm += helm-gtags

async: $(lisp_dir)/async/async.el
$(lisp_dir)/async/async.el:
	git submodule update --init $(dir $@)

$(lisp_dir)/helm/helm.el:
	git submodule update --init $(dir $@)
	cd $(dir $@); EMACSLOADPATH="$(PWD)/$(lisp_dir)/async:" make

helm-swoop: $(lisp_dir)/helm-swoop.el
$(lisp_dir)/helm-swoop.el:
	wget https://raw.githubusercontent.com/emacsorphanage/helm-swoop/master/helm-swoop.el $(wget_opts) -O $@

helm-gtags: $(lisp_dir)/helm-gtags.el
$(lisp_dir)/helm-gtags.el:
	wget https://raw.githubusercontent.com/syohex/emacs-helm-gtags/master/helm-gtags.el $(wget_opts) -O $@

## Utility pkgs
utility_pkgs += # nothing yet
utility_pkgs += thing-edit
utility_pkgs += quickrun
utility_pkgs += popwin
utility_pkgs += flycheck
utility_pkgs += undo-tree
utility_pkgs += irony
utility_pkgs += company-irony
utility_pkgs += flycheck-irony

thing-edit: $(lisp_dir)/thing-edit.el
$(lisp_dir)/thing-edit.el:
	wget https://raw.githubusercontent.com/emacsmirror/emacswiki.org/master/thing-edit.el $(wget_opts) -O $@

quickrun: $(lisp_dir)/quickrun.el
$(lisp_dir)/quickrun.el:
	wget https://raw.githubusercontent.com/syohex/emacs-quickrun/master/quickrun.el $(wget_opts) -O $@

popwin: $(lisp_dir)/popwin.el
$(lisp_dir)/popwin.el:
	wget https://raw.githubusercontent.com/m2ym/popwin-el/master/popwin.el $(wget_opts) -O $@

flycheck: $(lisp_dir)/flycheck/flycheck.el
$(lisp_dir)/flycheck/flycheck.el:
	git submodule update --init $(dir $@)

undo-tree: $(lisp_dir)/undo-tree.el
$(lisp_dir)/undo-tree.el:
	wget https://raw.githubusercontent.com/apchamberlain/undo-tree.el/help-in-visualizer-frame/undo-tree.el $(wget_opts) -O $@

irony: $(lisp_dir)/irony-mode/irony.el
$(lisp_dir)/irony-mode/irony.el:
	git submodule update --init $(dir $@)

company-irony: $(lisp_dir)/company-irony.el
$(lisp_dir)/company-irony.el:
	wget https://raw.githubusercontent.com/Sarcasm/company-irony/master/company-irony.el $(wget_opts) -O $@

flycheck-irony: $(lisp_dir)/flycheck-irony.el
$(lisp_dir)/flycheck-irony.el:
	wget https://raw.githubusercontent.com/Sarcasm/flycheck-irony/master/flycheck-irony.el $(wget_opts) -O $@

## all
all: $(lisp_dir) $(lang_modes) $(highlight_pkgs) $(completion_pkgs) $(magit) $(helm) $(utility_pkgs)
