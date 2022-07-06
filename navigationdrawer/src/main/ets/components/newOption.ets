export enum MenuItemType {
	Group = 2,
	Option = 1,
	ExtraOption = 3
}

class Base {
	private id: string | number
	private value: string
	protected itemType: MenuItemType

	constructor(id: string | number, value: string) {
		if(id == null || id == undefined) id = ''
		if(value == null || value == undefined) value = ''
		this.value = value
		this.id = id
	}

	setID(id: string | number): Base {
		if(id != null && id != undefined) this.id = id
		return this
	}

	getID(): string | number {
		return this.id
	}

	setValue(value: string): Base {
		if(value == null || value == undefined) value = ''
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
	}

	getItemType(): MenuItemType {
		return this.itemType
	}
}

export class MenuOption extends Base {
	private path: string
	private icon?: string | Resource

	constructor(id: string | number, value: string, path?: string, icon?: string | Resource) {
		if(id == null || id == undefined) id = ''
		if(value == null || value == undefined) value = ''
		if(path == null || path == undefined) path = ''
		if(icon == null || icon == undefined) icon = ''
		super(id, value)
		this.itemType = MenuItemType.Option
		this.path = path
		this.icon = icon
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

export class ExtraOption extends MenuOption {
	constructor(id: string | number, value: string, path?: string, icon?: string | Resource) {
		if(id == null || id == undefined) id = ''
		if(value == null || value == undefined) value = ''
		if(path == null || path == undefined) path = ''
		if(icon == null || icon == undefined) icon = ''
		super(id, value, path, icon)
		this.itemType = MenuItemType.ExtraOption
	}
}

export class Group extends ExtraOption {
	private menu: MenuOption[]

	constructor(id: string | number, value: string, menu?: MenuOption[]) {
		super(id, value)
		this.itemType = MenuItemType.Group
		if(menu == null || menu == undefined) menu = []
		this.menu = menu
	}

	setMenu(menu: MenuOption[]): Group {
		if(menu != null && menu != undefined) this.menu = menu
		return this
	}

	addToMenu(option: MenuOption): Group {
		if(option != null && option != undefined) this.menu.push(option)
		return this
	}

	getMenu(): MenuOption[] {
		return this.menu
	}
}

export class MenuItem extends Group {}