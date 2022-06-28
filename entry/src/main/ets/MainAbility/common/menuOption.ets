export class MenuOption {
	private name: string
	private path: string
	private icon?: string | Resource

	constructor(name: string, path: string, icon?: string | Resource) {
		if(name == null || name == undefined) name = ''
		if(path == null || path == undefined) path = ''
		if(icon == null || icon == undefined) icon = ''
		this.name = name
		this.path = path
		this.icon = icon
	}

	setName(name: string): MenuOption {
		if(name == null || name == undefined) name = ''
		this.name = name
		return this
	}

	getName(): string {
		return this.name
	}

	setPath(path: string): MenuOption {
		if(path == null || path == undefined) path = ''
		this.path = path
		return this
	}

	getPath(): string {
		return this.path
	}

	setIcon(icon: string | Resource): MenuOption {
		if(icon == null || icon == undefined) icon = ''
		this.icon = icon
		return this
	}

	getIcon(): string | Resource {
		return this.icon
	}
}