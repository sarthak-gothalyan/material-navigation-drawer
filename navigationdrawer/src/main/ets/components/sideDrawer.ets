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
import { DrawerSize, Properties, MenuProperties, HeaderProperties } from './properties'

@Component
struct SideDrawer {
	menu: MenuOption[]
	extraMenu: MenuOption[]
	onSelect: (it: MenuOption) => void
	@Link visible: boolean
	@State selected: string | number = undefined
	@State model: SideDrawer.Model = new SideDrawer.Model()
	@State headerModel: SideDrawer.HeaderModel = undefined
	@State menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel()

	aboutToAppear() {
		if(this.menu == null || this.menu == undefined) this.menu = []
		if(this.extraMenu == null || this.extraMenu == undefined) this.extraMenu = []
		if(this.model == null || this.model == undefined) this.model = new SideDrawer.Model()
		if(this.menuModel == null || this.menuModel == undefined) this.menuModel = new SideDrawer.MenuModel()
	}

	@Builder
	SmallItem(page: MenuOption) {
		Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
			if(this.selected == page.getID()) {
				Text(page.getValue())
					.fontSize(this.menuModel.getFontSize(this.model.getSizeEnum()))
					.fontColor(this.selected == page.getID() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
					.maxLines(2)
					.textOverflow({overflow: TextOverflow.Ellipsis})
					.margin({top: "10vp"})
			}
		}
		.width('100%')
		.backgroundColor(this.selected == page.getID() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			this.selected = page.getID()
			this.visible = false
		})
	}

	@Builder
	Item(page: MenuOption) {
		Row() {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({ right: 20 })
			Flex() {
				Text(page.getValue())
					.fontSize(this.menuModel.getFontSize(this.model.getSizeEnum()))
					.fontColor(this.selected == page.getID() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
					.maxLines(2)
					.textOverflow({overflow: TextOverflow.Ellipsis})
			}.flexGrow(1).flexShrink(1)
		}
		.width('100%')
		.backgroundColor(this.selected == page.getID() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			this.selected = page.getID()
			this.visible = false
		})
	}

	@Builder
	SmallItemExtra(page: MenuOption) {
		Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
		}
		.width('100%')
		.backgroundColor(this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
			this.visible = false
		})
	}

	@Builder
	ItemExtra(page: MenuOption) {
		Row() {
			Image(page.getIcon())
				.objectFit(ImageFit.Contain)
				.width(this.menuModel.getIconWidth())
				.height(this.menuModel.getIconHeight())
				.margin({ right: 20 })
			Flex() {
				Text(page.getValue())
					.fontSize(this.menuModel.getFontSize(this.model.getSizeEnum()))
					.fontColor(this.menuModel.getFontColor())
					.maxLines(2)
					.textOverflow({overflow: TextOverflow.Ellipsis})
			}.flexGrow(1).flexShrink(1)
		}
		.width('100%')
		.backgroundColor(this.menuModel.getBackgroundColor())
		.borderRadius(this.menuModel.getBorderRadius())
		.padding(this.menuModel.getPadding())
		.onClick(() => {
			if(this.onSelect != null && this.onSelect != undefined) this.onSelect(page)
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

						ForEach(this.menu, (it: MenuOption) => {
							ListItem() {
								if (this.model.getSize() == DrawerSize.Small) this.SmallItem(it)
								else this.Item(it)
							}
						}, it => it.getID())

						if(this.extraMenu.length > 0) {
							ListItem() {
								Divider().width('100%').height('2vp').color(Color.Black).strokeWidth('1vp')
							}
						}
						ForEach(this.extraMenu, (it: MenuOption) => {
							ListItem() {
								if (this.model.getSize() == DrawerSize.Small) this.SmallItemExtra(it)
								else this.ItemExtra(it)
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