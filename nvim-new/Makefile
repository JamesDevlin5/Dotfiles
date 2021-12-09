
fmt:
	fd -E plugin -e lua --search-path ${PWD} -X stylua --config-path ~/.config/stylua/config.toml

update:
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: fmt


