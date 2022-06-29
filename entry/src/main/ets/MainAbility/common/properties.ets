export class Properties {
	private animationDuration: number
	private backgroundColor: string | Color

	constructor(animationDuration: number) {
		if(animationDuration == null || animationDuration == undefined) animationDuration = 0
		this.animationDuration = animationDuration
		this.backgroundColor = Color.White
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
	private subtitleFontSize: Length
	private subtitleFontColor: string | Color
	private backgroundColor: string | Color
	private activeBackgroundColor: string | Color
	private activeTextColor: string | Color
	private borderRadius: Length
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
		this.subtitleFontSize = '20vp'
		this.subtitleFontColor = Color.Black
		this.backgroundColor = Color.White
		this.activeBackgroundColor = Color.White
		this.activeTextColor = Color.Black
		this.borderRadius = '0vp'
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
		if(fontColor == null || fontColor == undefined) fontColor = Color.Black
		this.fontColor = fontColor
		return this
	}

	getFontColor(): Length {
		return this.fontColor
	}

	setSubtitleFontSize(subtitleFontSize: Length): MenuProperties {
		if(subtitleFontSize == null || subtitleFontSize == undefined) subtitleFontSize = '0vp'
		this.subtitleFontSize = subtitleFontSize
		return this
	}

	getSubtitleFontSize(): Length {
		return this.subtitleFontSize
	}

	setSubtitleFontColor(subtitleFontColor: string | Color): MenuProperties {
		if(subtitleFontColor == null || subtitleFontColor == undefined) subtitleFontColor = Color.Black
		this.subtitleFontColor = subtitleFontColor
		return this
	}

	getSubtitleFontColor(): string | Color {
		return this.subtitleFontColor
	}

	setBackgroundColor(backgroundColor: string | Color): MenuProperties {
		if(backgroundColor == null || backgroundColor == undefined) backgroundColor = Color.White
		this.backgroundColor = backgroundColor
		return this
	}

	getBackgroundColor(): string | Color {
		return this.backgroundColor
	}

	setActiveBackgroundColor(activeBackgroundColor: string | Color): MenuProperties {
		if(activeBackgroundColor == null || activeBackgroundColor == undefined) activeBackgroundColor = Color.White
		this.activeBackgroundColor = activeBackgroundColor
		return this
	}

	getActiveBackgroundColor(): string | Color {
		return this.activeBackgroundColor
	}

	setActiveTextColor(activeTextColor: string | Color): MenuProperties {
		if(activeTextColor == null || activeTextColor == undefined) activeTextColor = Color.Black
		this.activeTextColor = activeTextColor
		return this
	}

	getActiveTextColor(): string | Color {
		return this.activeTextColor
	}

	setBorderRadius(borderRadius: Length): MenuProperties {
		if(borderRadius == null || borderRadius == undefined) borderRadius = '0vp'
		this.borderRadius = borderRadius
		return this
	}

	getBorderRadius(): Length {
		return this.borderRadius
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
		this.iconHeight = '0vp'
		this.iconWidth = '0vp'
		this.fontSize = '0vp'
		this.fontColor = Color.Black
		this.subtitleFontSize = '0vp'
		this.subtitleFontColor = Color.Black
		this.activeBackgroundColor = Color.White
		this.activeTextColor = Color.Black
		this.padding = {}
		return this
	}
}