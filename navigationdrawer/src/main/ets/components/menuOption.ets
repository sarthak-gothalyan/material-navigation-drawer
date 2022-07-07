export class MenuOption {
	private id: string | number
	private value: string
	private path: string
	private icon?: string | Resource

	constructor(id: string | number, value: string, path?: string, icon?: string | Resource) {
		if(id == null || id == undefined) id = ''
		if(value == null || value == undefined) value = ''
		if(path == null || path == undefined) path = ''
		if(icon == null || icon == undefined) icon = ''
		this.value = value
		this.id = id
		this.path = path
		this.icon = icon
	}

	setID(id: string | number): MenuOption {
		if(id != null && id != undefined) this.id = id
		return this
	}

	getID(): string | number {
		return this.id
	}

	setValue(value: string): MenuOption {
		if(value == null || value == undefined) value = ''
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
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