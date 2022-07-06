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

import router from '@system.router'
import { MenuItem, MenuItemType, MenuOption, Group, ExtraOption } from './newOption'
//import { MenuItemType, MenuOption } from './menuOption'
import { DrawerSize, Properties, MenuProperties, HeaderProperties } from './properties'

@Component
struct SideDrawer {
	menu: (Group | MenuOption | ExtraOption)[]
	onSelect: (it: MenuOption) => void
	@Link visible: boolean
	@State selected: string | number = undefined
	@State model: SideDrawer.Model = new SideDrawer.Model()
	@State headerModel: SideDrawer.HeaderModel = undefined
	@State menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel()

	aboutToAppear() {
		console.log(router.getState().path + router.getState().name)
		if(this.menu == null || this.menu == undefined) this.menu = []
		if(this.model == null || this.model == undefined) this.model = new SideDrawer.Model()
		if(this.menuModel == null || this.menuModel == undefined) this.menuModel = new SideDrawer.MenuModel()
		this.menu.sort((it1: Group | MenuOption | ExtraOption, it2: Group | MenuOption | ExtraOption) => { return it1.getItemType() - it2.getItemType() })
	}

	@Builder
	SmallItem(page: MenuOption) {
		Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({ bottom: 20 })
			if(this.selected == page.getID()) {
				Text(page.getValue())
					.fontSize(this.menuModel.getFontSize())
					.fontColor(this.selected == page.getID() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
					.flexGrow(1)
					.maxLines(1)
			}
		}
		.height(this.menuModel.getHeight())
		.width('100%')
		.backgroundColor(this.selected == page.getID() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			this.selected = page.getID()
			this.visible = false
			console.log("small item")
		})
	}

	@Builder
	Item(page: MenuOption) {
		Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({ right: 20 })
			Text(page.getValue())
				.fontSize(this.menuModel.getFontSize())
				.fontColor(this.selected == page.getID() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
				.flexGrow(1)
				.maxLines(1)
		}
		.height(this.menuModel.getHeight())
		.width('100%')
		.backgroundColor(this.selected == page.getID() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			this.selected = page.getID()
			this.visible = false
			console.log("item")
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
						console.log("blank area")
					})
					.backgroundColor("#80dbdbdb")

				Column() {
					List({space: '10vp'}) {
						if(this.headerModel != null && this.headerModel != undefined) {
							ListItem() {
								Column() {
									Image(this.headerModel.getIcon()).width(this.headerModel.getIconHeight()).height(this.headerModel.getIconHeight())
									Text(this.headerModel.getName()).fontSize(this.headerModel.getFontSize())
									Text(this.headerModel.getMail()).fontSize(this.headerModel.getFontSize()).opacity(0.5)
								}
								.width('100%')
								.backgroundColor(this.headerModel.getBackgroundColor())
								.borderRadius(this.headerModel.getBorderRadius())
							}
							.height(this.headerModel.getHeight())
							.onClick(() => {
								this.headerModel.getCallBack()()
							})
						}

						ForEach(this.menu, (it: MenuItem) => {
							if(it.getItemType() == MenuItemType.Group) {
								ListItem() {
									Divider().width('100%').height('2vp')
								}
								ListItem() {
									Text(it.getValue())
										.fontSize(this.menuModel.getSubtitleFontSize())
										.fontColor(this.menuModel.getSubtitleFontColor())
										.flexGrow(1)
										.maxLines(1)
								}
								ForEach(it.getMenu(), (it: MenuOption) => {
									ListItem() {
										if (this.model.getSize() == DrawerSize.Small) this.SmallItem(it)
										else this.Item(it)
									}
								})
								ListItem() {
									Divider().width('100%').height('2vp')
								}
							}
							else if(it.getItemType() == MenuItemType.Option) {
								ListItem() {
									if (this.model.getSize() == DrawerSize.Small) this.SmallItem(it)
									else this.Item(it)
								}
							}
						}, it => it.getID())

						if(this.menu[this.menu.length - 1].getItemType() == MenuItemType.ExtraOption) {
							ListItem() {
								Divider().width('100%').height('2vp')
							}
						}
						ForEach(this.menu, (it: MenuItem) => {
							if(it.getItemType() == MenuItemType.ExtraOption) {
								ListItem() {
									if (this.model.getSize() == DrawerSize.Small) this.SmallItem(it)
									else this.Item(it)
								}
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

namespace SideDrawer {
	export class Model extends Properties{
		constructor() {
			super()
		}
	}

	export class MenuModel extends MenuProperties {
		constructor() {
			super()
		}
	}

	export class HeaderModel extends HeaderProperties {
		constructor(name: string, mail: string, icon: string | Resource) {
			super(name, mail, icon)
		}
	}
}

export { SideDrawer }