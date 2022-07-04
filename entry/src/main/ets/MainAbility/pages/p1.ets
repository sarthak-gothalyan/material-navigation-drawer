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

import { MenuItemType, MenuOption, SideDrawer } from '@ohos/navigationdrawer'

@Entry
@Component
struct P1 {
	@State vis: boolean = false
	menu: MenuOption[] = [
		new MenuOption(MenuItemType.Subtitle, 'Pages'),
		new MenuOption(MenuItemType.Divider),
		new MenuOption(MenuItemType.Page, "Page 1", 'pages/p1', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Page 2", 'pages/p2', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Page 3", 'pages/p3', $r('app.media.icon')),
		new MenuOption(MenuItemType.Page, "Index 1", 'pages/index1', $r('app.media.icon'))
	]
	backgroundColor: string | Color = Color.White
	model: SideDrawer.Model = new SideDrawer.Model(100, 0)
	menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel('180vp', '24vp', '24vp')

	aboutToAppear() {
		this.menuModel.setActiveBackgroundColor(Color.Green)
		this.menuModel.setActiveTextColor(Color.Blue)
	}

	build() {
		Stack() {
			Column() {
				Text('Page 1').fontSize('20vp')

				Button('Open Drawer').onClick(() => {
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