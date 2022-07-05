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

import { DrawerSize, MenuItemType, MenuOption, SideDrawer } from '@ohos/navigationdrawer'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	menu: MenuOption[] = [
		new MenuOption(MenuItemType.Subtitle, 'Mail'),
		new MenuOption(MenuItemType.Page, "Inbox", 'pages/index1', $r('app.media.inbox')),
		new MenuOption(MenuItemType.Page, "Outbox", 'pages/p1', $r('app.media.send')),
		new MenuOption(MenuItemType.Page, "Favourites", 'pages/p2', $r('app.media.favorite')),
		new MenuOption(MenuItemType.Page, "Delete", 'pages/p3', $r('app.media.delete')),
		new MenuOption(MenuItemType.Divider),
		new MenuOption(MenuItemType.Page, "Settings", 'pages/p1', $r('app.media.settings')),
		new MenuOption(MenuItemType.Page, "Help & Feedback", 'pages/p2', $r('app.media.help')),
	]
	backgroundColor: string | Color = Color.White
	model: SideDrawer.Model = new SideDrawer.Model(100, DrawerSize.Small)
	menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel('180vp', '24vp', '24vp')

	aboutToAppear() {
		this.model.setSize(DrawerSize.Medium)

		this.menuModel.setActiveBackgroundColor('#A020F0')
		this.menuModel.setActiveTextColor(Color.Black)
		this.menuModel.setIconHeight('24vp')
		this.menuModel.setIconWidth('24vp')
		this.menuModel.setSubtitleFontSize('21vp')
		this.menuModel.setFontSize('18vp')
		this.menuModel.setHeight('56vp')
		this.menuModel.setPadding('16vp')
		this.menuModel.setBorderRadius('20vp')
	}

	@Builder
	customDesign(): any {
		Column() {
			Image($r('app.media.icon')).width('24vp').height('24vp')
			Text('name').fontSize('20vp')
			Text('details').fontSize('20vp').opacity(0.5)
		}
		.width('100%')
	}

	build() {
		Stack() {
			Column() {
				Button('Open side Drawer').onClick(() => {
					animateTo({ duration: 1000 }, () => {
						this.vis = !this.vis
						console.log(this.vis + '')
					})
				})
			}

			if (this.vis) {
				SideDrawer({
					menu: this.menu,
					visible: $vis,
					model: this.model,
					menuModel: this.menuModel
				})
			}
		}
		.width('100%')
		.height('100%')
	}
}