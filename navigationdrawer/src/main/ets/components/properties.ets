/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export enum DrawerSize {
	Small = '20%',
	Medium = '50%',
	Big = '90%'
}

export class Properties {
	private size: DrawerSize
	private backgroundColor: string | Color

	constructor() {
		this.size = DrawerSize.Small
		this.backgroundColor = Color.White
	}

	setSize(size: DrawerSize): Properties {
		if(size != null && size != undefined) {
			this.size = size
		}
		return this
	}

	getSize(): Length {
		if(this.size == DrawerSize.Small) return DrawerSize.Small
		else if(this.size == DrawerSize.Medium) return DrawerSize.Medium
		return DrawerSize.Big
	}

	getSizeEnum(): DrawerSize {
		return this.size
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
		this.size = DrawerSize.Small
		this.backgroundColor = Color.White
		return this
	}
}

export class MenuProperties {
	private iconHeight: Length
	private iconWidth: Length
	private fontColor: string | Color
	private titleFontSize: Length
	private titleFontColor: string | Color
	private backgroundColor: string | Color
	private activeBackgroundColor: string | Color
	private activeTextColor: string | Color
	private borderRadius: Length
	private padding: Length | Padding


	constructor() {
		this.iconHeight = '24vp'
		this.iconWidth = '24vp'
		this.fontColor = Color.Black
		this.titleFontSize = "21fp"
		this.titleFontColor = Color.Black
		this.backgroundColor = Color.White
		this.activeBackgroundColor = Color.White
		this.activeTextColor = Color.Black
		this.borderRadius = '0vp'
		this.padding = '0vp'
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

	getFontSize(size: DrawerSize): Length {
		if(size == DrawerSize.Small) return "16fp"
		else if(size == DrawerSize.Medium) return "18fp"
		return "20fp"
	}

	setFontColor(fontColor: string | Color): MenuProperties {
		if(fontColor == null || fontColor == undefined) fontColor = Color.Black
		this.fontColor = fontColor
		return this
	}

	getFontColor(): string | Color {
		return this.fontColor
	}

	setTitleFontSize(titleFontSize: Length): MenuProperties {
		if(titleFontSize == null || titleFontSize == undefined) titleFontSize = ""
		this.titleFontSize = titleFontSize
		return this
	}

	getTitleFontSize(): Length {
		return this.titleFontSize
	}

	setTitleFontColor(titleFontColor: string | Color): MenuProperties {
		if(titleFontColor == null || titleFontColor == undefined) titleFontColor = Color.Black
		this.titleFontColor = titleFontColor
		return this
	}

	getTitleFontColor(): string | Color {
		return this.titleFontColor
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
		this.fontColor = Color.Black
		this.titleFontSize = "0fp"
		this.titleFontColor = Color.Black
		this.activeBackgroundColor = Color.White
		this.activeTextColor = Color.Black
		this.padding = {}
		return this
	}
}

export class HeaderProperties {
	private icon: string | Resource
	private name: string
	private mail: string
	private height: Length
	private fontSize: Length
	private iconHeight: Length
	private iconWidth: Length
	private backgroundColor: string | Color
	private borderRadius: Length
	private callback: () => void

	constructor(name: string, mail: string, icon: string | Resource) {
		if(name == null || name == undefined) name = ''
		if(mail == null || mail == undefined) mail = ''
		if(icon == null || icon == undefined) icon = ''
		this.name = name
		this.mail = mail
		this.icon = icon
		this.fontSize = '20fp'
		this.iconHeight = '24vp'
		this.iconWidth = '24vp'
		this.height = '100vp'
		this.backgroundColor = Color.White
		this.borderRadius = 0
		this.callback = null
	}

	setIcon(icon: string | Resource): HeaderProperties {
		if(icon != null && icon != undefined) this.icon = icon
		return this
	}

	getIcon(): string | Resource {
		return this.icon
	}

	setName(name: string): HeaderProperties {
		if(name != null && name != undefined) this.name = name
		return this
	}

	getName(): string {
		return this.name
	}

	setMail(mail: string): HeaderProperties {
		if(mail != null && mail != undefined) this.mail = mail
		return this
	}

	getMail(): string {
		return this.mail
	}

	setFontSize(fontSize: Length): HeaderProperties {
		if(fontSize != null && fontSize != undefined) this.fontSize = fontSize
		return this
	}

	getFontSize(): Length {
		return this.fontSize
	}

	setIconHeight(iconHeight: Length): HeaderProperties {
		if(iconHeight != null && iconHeight != undefined) this.iconHeight = iconHeight
		return this
	}

	getIconHeight(): Length {
		return this.iconHeight
	}

	setIconWidth(iconWidth: Length): HeaderProperties {
		if(iconWidth != null && iconWidth != undefined) this.iconWidth = iconWidth
		return this
	}

	getIconWidth(): Length {
		return this.iconWidth
	}

	setHeight(height: Length): HeaderProperties {
		if(height != null && height != undefined) this.height = height
		return this
	}

	getHeight(): Length {
		return this.height
	}

	setBackgroundColor(backgroundColor: string | Color): HeaderProperties {
		if(backgroundColor != null && backgroundColor != undefined) this.backgroundColor = backgroundColor
		return this
	}

	getBackgroundColor(): string | Color {
		return this.backgroundColor
	}

	setBorderRadius(borderRadius: Length): HeaderProperties {
		if(borderRadius != null && borderRadius != undefined) this.borderRadius = borderRadius
		return this
	}

	getBorderRadius(): Length {
		return this.borderRadius
	}

	setCallback(callback: () => void): HeaderProperties {
		if(callback != null && callback != undefined) this.callback = callback
		return this
	}

	getCallBack(): () => void {
		return this.callback
	}

	reset(): HeaderProperties {
		this.name = ''
		this.mail = ''
		this.icon = ''
		this.fontSize = '0fp'
		this.iconHeight = '0vp'
		this.iconWidth = '0vp'
		this.height = '0vp'
		this.backgroundColor = Color.Black
		this.borderRadius = 0
		this.callback = null
		return this
	}
}