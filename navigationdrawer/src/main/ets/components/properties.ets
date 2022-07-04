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
	Small,
	Medium,
	Big
}

export class Properties {
	private animationDuration: number
	private size: DrawerSize
	private backgroundColor: string | Color

	constructor(animationDuration: number, size: DrawerSize) {
		if(animationDuration == null || animationDuration == undefined) animationDuration = 0
		if(size == null || size == undefined) size = DrawerSize.Small
		this.animationDuration = animationDuration
		this.size = size
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

	setSize(size: DrawerSize): Properties {
		if(size != null && size != undefined) {
			this.size = size
		}
		return this
	}

	getSize(): Length {
		if(this.size == DrawerSize.Small) return '33%'
		else if(this.size == DrawerSize.Medium) return '50%'
		return '100%'
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
		this.size = DrawerSize.Small
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
	private hasHeader: boolean
	private headerIcon: string | Resource
	private headerName: string
	private headerMail: string
	private headerFontSize: Length
	private headerIconHeight: Length
	private headerIconWidth: Length
	private headerHeight: Length

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
		this.hasHeader = false
		this.headerIcon = ''
		this.headerName = ''
		this.headerMail = ''
		this.headerFontSize = '20vp'
		this.headerIconHeight = '24vp'
		this.headerIconWidth = '24vp'
		this.headerHeight = '100vp'
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

	setHasHeader(hasHeader: boolean): MenuProperties {
		if(hasHeader != null && hasHeader != undefined) this.hasHeader = hasHeader
		return this
	}

	getHasHeader(): boolean {
		return this.hasHeader
	}

	setHeaderIcon(headerIcon: string | Resource): MenuProperties {
		if(headerIcon != null && headerIcon != undefined) this.headerIcon = headerIcon
		return this
	}

	getHeaderIcon(): string | Resource {
		return this.headerIcon
	}

	setHeaderName(headerName: string): MenuProperties {
		if(headerName != null && headerName != undefined) this.headerName = headerName
		return this
	}

	getHeaderName(): string {
		return this.headerName
	}

	setHeaderMail(headerMail: string): MenuProperties {
		if(headerMail != null && headerMail != undefined) this.headerMail = headerMail
		return this
	}

	getHeaderMail(): string {
		return this.headerMail
	}

	setHeaderFontSize(headerFontSize: Length): MenuProperties {
		if(headerFontSize != null && headerFontSize != undefined) this.headerFontSize = headerFontSize
		return this
	}

	getHeaderFontSize(): Length {
		return this.headerFontSize
	}

	setHeaderIconHeight(headerIconHeight: Length): MenuProperties {
		if(headerIconHeight != null && headerIconHeight != undefined) this.headerIconHeight = headerIconHeight
		return this
	}

	getHeaderIconHeight(): Length {
		return this.headerIconHeight
	}

	setHeaderIconWidth(headerIconWidth: Length): MenuProperties {
		if(headerIconWidth != null && headerIconWidth != undefined) this.headerIconWidth = headerIconWidth
		return this
	}

	getHeaderIconWidth(): Length {
		return this.headerIconWidth
	}

	setHeaderHeight(headerHeight: Length): MenuProperties {
		if(headerHeight != null && headerHeight != undefined) this.headerHeight = headerHeight
		return this
	}

	getHeaderHeight(): Length {
		return this.headerHeight
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
		this.hasHeader = false
		this.headerIcon = ''
		this.headerName = ''
		this.headerMail = ''
		this.headerFontSize = '20vp'
		this.headerIconHeight = '24vp'
		this.headerIconWidth = '24vp'
		this.headerHeight = '100vp'
		return this
	}
}