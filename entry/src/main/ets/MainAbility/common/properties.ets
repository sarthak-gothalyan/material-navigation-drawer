export class Properties {
	private animationDuration: number = 0
	private backgroundColor: string | Color = Color.White

	constructor(animationDuration: number) {
		if(animationDuration == null || animationDuration == undefined) animationDuration = 0
		this.animationDuration = animationDuration
	}

	setAnimationDuration(animationDuration: number): Properties {
		if(animationDuration == null || animationDuration == undefined) animationDuration = 0
		this.animationDuration = animationDuration
		return this
	}

	getAnimationDuration(): number {
		return this.animationDuration
	}

	setBackgroundColor(backgroundColor: string | Color): Properties {
		if(backgroundColor == null || backgroundColor == undefined) backgroundColor = ''
		this.backgroundColor = backgroundColor
		return this
	}

	getBackgroundColor(): string | Color {
		return this.backgroundColor
	}

	reset(): Properties {
		this.animationDuration = 0
		this.backgroundColor = Color.White
		return this
	}
}

export class MenuProperties {
	private height: Length
	private iconHeight: Length
	private iconWidth: Length
	private fontSize: Length
	private fontColor: string | Color
	private padding: Length | Padding

	constructor(height: Length, iconHeight: Length, iconWidth: Length) {
		if(height == null || height == undefined) height = '0vp'
		if(iconHeight == null || iconHeight == undefined) iconHeight = '0vp'
		if(iconWidth == null || iconWidth == undefined) iconWidth = '0vp'
		this.height = height
		this.iconHeight = iconHeight
		this.iconWidth = iconWidth
		this.fontSize = '20vp'
		this.fontColor = Color.Black
		this.padding = '0vp'
	}

	setHeight(height: Length): MenuProperties {
		if(height == null || height == undefined) height = '0vp'
		this.height = height
		return this
	}

	getHeight(): Length {
		return this.height
	}

	setIconHeight(iconHeight: Length): MenuProperties {
		if(iconHeight == null || iconHeight == undefined) iconHeight = '0vp'
		this.iconHeight = iconHeight
		return this
	}

	getIconHeight(): Length {
		return this.iconHeight
	}

	setIconWidth(iconWidth: Length): MenuProperties {
		if(iconWidth == null || iconWidth == undefined) iconWidth = '0vp'
		this.iconWidth = iconWidth
		return this
	}

	getIconWidth(): Length {
		return this.iconWidth
	}

	setFontSize(fontSize: Length): MenuProperties {
		if(fontSize == null || fontSize == undefined) fontSize = '0vp'
		this.fontSize = fontSize
		return this
	}

	getFontSize(): Length {
		return this.fontSize
	}

	setFontColor(fontColor: string | Color): MenuProperties {
		if(fontColor == null || fontColor == undefined) fontColor = '0vp'
		this.fontSize = fontColor
		return this
	}

	getFontColor(): Length {
		return this.fontColor
	}

	setPadding(padding: Length | Padding): MenuProperties {
		if(padding == null || padding == undefined) padding = '0vp'
		this.padding = padding
		return this
	}

	getPadding(): Length | Padding {
		return this.padding
	}

	reset(): MenuProperties {
		this.padding = {}
		this.iconHeight = '0vp'
		this.iconWidth = '0vp'
		return this
	}
}