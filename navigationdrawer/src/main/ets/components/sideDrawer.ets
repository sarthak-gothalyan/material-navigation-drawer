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
import { MenuItemType, MenuOption } from './menuOption'
import { DrawerSize, Properties, MenuProperties, HeaderProperties } from './properties'

@Component
struct SideDrawer {
	menu: MenuOption[]
	//@BuilderParam header: () => any
	@Link visible: boolean
	@State selected: number = -1
	@State model: SideDrawer.Model = new SideDrawer.Model(0, DrawerSize.Small)
	@State headerModel: SideDrawer.HeaderModel = undefined
	@State menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel('0vp', '0vp', '0vp')

	aboutToAppear() {
		console.log(router.getState().path + router.getState().name)
		if(this.menu == null || this.menu == undefined) this.menu = []
		if(this.model == null || this.model == undefined) this.model = new SideDrawer.Model(0, DrawerSize.Small)
		if(this.menuModel == null || this.menuModel == undefined) this.menuModel = new SideDrawer.MenuModel('0vp', '0vp', '0vp')
	}

	@Builder
	Item(page: MenuOption) {
		Navigator({target: page.getPath(), type: NavigationType.Push}) {
			Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
				Image(page.getIcon())
					.objectFit(ImageFit.Cover)
					.width(this.menuModel.getIconWidth())
					.height(this.menuModel.getIconHeight())
					.margin({ right: 20 })
				Text(page.getValue())
					.fontSize(this.menuModel.getFontSize())
					.fontColor(router.getState().path + router.getState().name == page.getPath() ? this.menuModel.getActiveTextColor() : this.menuModel.getFontColor())
					.flexGrow(1)
					.maxLines(1)
			}
			.backgroundColor(router.getState().path + router.getState().name == page.getPath() ? this.menuModel.getActiveBackgroundColor() : this.menuModel.getBackgroundColor())
			.borderRadius(this.menuModel.getBorderRadius())
			.padding(this.menuModel.getPadding())
		}
		.params({ text: page.getValue() })
	}

	build() {
		Stack() {
			Column()
				.width('100%')
				.height('100%')
				.onClick(() => {
					animateTo({ duration: this.model.getAnimationDuration() }, () => {
						this.visible = false
					})
				})
				.backgroundColor("#80dbdbdb")

			Column() {
				List({space: '10vp'}) {
//					if(this.header != null && this.header != undefined) {
//						ListItem() {
//							this.header()
//						}
//						.height('100vp')
//					}

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
					}

					ForEach(this.menu, (it: MenuOption) => {
						ListItem() {
							if(it.getItemType() == MenuItemType.Divider) Divider()
							else if(it.getItemType() == MenuItemType.Subtitle) Text(it.getValue()).fontSize(this.menuModel.getSubtitleFontSize()).fontColor(this.menuModel.getSubtitleFontColor())
							else this.Item(it)
						}
					}, (it, index) => index.toString())
				}
			}
			.width(this.model.getSize())
			.height('100%')
			.justifyContent(FlexAlign.Start)
			.position({ x: 0, y: 0 })
			.transition({ type: TransitionType.Insert, scale: { x: 0.0, centerX: 0.0 } })
			.transition({ type: TransitionType.Delete, scale: { x: 0.0, centerX: 0.0 } })
			.backgroundColor(this.model.getBackgroundColor())
			.padding('7vp')
		}
		.width('100%')
		.height('100%')
	}

	pageTransition() {
		PageTransitionExit({ duration: 1, curve: Curve.Linear })
		.onExit(() => {
			this.visible = false
		})
	}
}

namespace SideDrawer {
	export class Model extends Properties{
		constructor(animationDuration: number, size: DrawerSize) {
			super(animationDuration, size)
		}
	}

	export class MenuModel extends MenuProperties {
		constructor(height: Length, iconHeight: Length, iconWidth: Length) {
			super(height, iconHeight, iconWidth)
		}
	}

	export class HeaderModel extends HeaderProperties {
		constructor(name: string, mail: string, icon: string | Resource) {
			super(name, mail, icon)
		}
	}
}

export { SideDrawer }