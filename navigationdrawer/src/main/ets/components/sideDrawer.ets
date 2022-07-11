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

import { MenuOption } from './menuOption'
import { DrawerSize, Properties, MenuProperties } from './properties'

@Component
struct Drawer {
	onSelect: (it: MenuOption) => void
	@Link visible: boolean
	@State selected: string | number = undefined
	@State model: Drawer.Model = new Drawer.Model()
	@State menuModel: Drawer.MenuModel = new Drawer.MenuModel()

	aboutToAppear() {
		if(this.model == null || this.model == undefined) this.model = new Drawer.Model()
		if(this.menuModel == null || this.menuModel == undefined) this.menuModel = new Drawer.MenuModel()
	}

	@Builder
	SmallItem(page: MenuOption, extra: boolean) {
		Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
			if(!extra) {
				if (this.selected == page.getID()) {
					Flex({justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}) {
						Text(page.getValue())
							.fontSize(this.menuModel.getFontSize(this.model.getSizeEnum()))
							.fontColor(this.selected != null && this.selected != undefined && this.selected == page.getID() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
							.maxLines(2)
							.textOverflow({ overflow: TextOverflow.Ellipsis })
							.margin({ top: "10vp" })
					}.flexGrow(1).flexShrink(1)
				}
			}
		}
		.width('100%')
		.backgroundColor(!extra && this.selected != null && this.selected != undefined && this.selected != null && this.selected != undefined && this.selected == page.getID() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if (this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			if(!extra) this.selected = page.getID()
			this.visible = false
		})
	}

	@Builder
	Item(page: MenuOption, extra) {
		Row() {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({ right: 20 })
			Flex() {
				Text(page.getValue())
					.fontSize(this.menuModel.getFontSize(this.model.getSizeEnum()))
					.fontColor(!extra && this.selected != null && this.selected != undefined && this.selected == page.getID() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
					.maxLines(2)
					.textOverflow({ overflow: TextOverflow.Ellipsis })
			}.flexGrow(1).flexShrink(1)
		}
		.width('100%')
		.backgroundColor(!extra && this.selected != null && this.selected != undefined && this.selected == page.getID() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			if(!extra) this.selected = page.getID()
			this.visible = false
		})
	}

	build() {
		if (this.visible) {
			Stack() {
				Column()
					.width('100%')
					.height('100%')
					.onClick(() => {
						this.visible = false
					})
					.backgroundColor(this.model.getShadowColor())
					.opacity(this.model.getShadowOpacity())

				Column() {
					List({space: '10vp'}) {
						if(this.model.getTitle() != "") {
							ListItem() {
								Text(this.model.getTitle()).fontWeight(FontWeight.Bold).fontSize(this.model.getTitleFontSize()).fontColor(this.model.getTitleFontColor()).margin("7vp")
							}
						}
						ForEach(this.model.getMenu(), (it: MenuOption) => {
							ListItem() {
								if (this.model.getSize() == DrawerSize.Small) this.SmallItem(it, false)
								else this.Item(it, false)
							}
						}, it => it.getID())

						if(this.model.getExtraMenu().length > 0) {
							ListItem() {
								Divider().width('100%').height('2vp').color(Color.Black).strokeWidth('1vp')
							}
						}
						ForEach(this.model.getExtraMenu(), (it: MenuOption) => {
							ListItem() {
								if (this.model.getSize() == DrawerSize.Small) this.SmallItem(it, true)
								else this.Item(it, true)
							}
						}, it => it.getID())
					}
				}
				.width(this.model.getSize())
				.height('100%')
				.position({ x: 0, y: 0 })
				.transition({ type: TransitionType.Insert, scale: { x: 0.0, centerX: 0.0 } })
				.transition({ type: TransitionType.Delete, scale: { x: 0.0, centerX: 0.0 } })
				.backgroundColor(this.model.getBackgroundColor())
				.padding('7vp')
			}
			.width('100%')
			.height('100%')
		}
	}
}

namespace Drawer {
	export class Model extends Properties{
		private menu: MenuOption[]
		private extraMenu: MenuOption[]

		constructor() {
			super()
			this.menu = []
			this.extraMenu = []
		}

		setMenu(menu: MenuOption[]): Model {
			if(menu == null || menu == undefined) menu = []
			this.menu = menu
			return this
		}

		addToMenu(option: MenuOption[] | MenuOption): Model {
			if(option != null && option != undefined) {
				if(option instanceof MenuOption) {
					this.menu.push(option)
				}
				else {
					option.forEach(o => this.menu.push(o))
				}
			}
			return this
		}

		getMenu(): MenuOption[] {
			return this.menu
		}

		setExtraMenu(extraMenu: MenuOption[]): Model {
			if(extraMenu == null || extraMenu == undefined) extraMenu = []
			this.extraMenu = extraMenu
			return this
		}

		addToExtraMenu(option: MenuOption[] | MenuOption): Model {
			if(option != null && option != undefined) {
				if(option instanceof MenuOption) {
					this.extraMenu.push(option)
				}
				else {
					option.forEach(o => this.extraMenu.push(o))
				}
			}
			return this
		}

		getExtraMenu(): MenuOption[] {
			return this.extraMenu
		}

		reset(): Model {
			super.reset()
			this.menu = []
			this.extraMenu = []
			return this
		}
	}

	export class MenuModel extends MenuProperties {
		constructor() {
			super()
		}
	}
}

export { Drawer }