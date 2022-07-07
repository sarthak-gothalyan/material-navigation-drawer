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

import { DrawerSize, MenuOption, SideDrawer } from '@ohos/navigation-drawer'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	menu: MenuOption[] = [
		new MenuOption('1', "Send", 'pages/index', $r('app.media.send')),
		new MenuOption('2', "Delete", 'pages/index', $r('app.media.delete')),

	]
	extraOptions: MenuOption[] = [
		new MenuOption('6', "Settings", 'pages/index', $r('app.media.settings')),
		new MenuOption('7', "Help & Feedback", 'pages/index', $r('app.media.help'))
	]
	backgroundColor: string | Color = Color.White
	model: SideDrawer.Model = new SideDrawer.Model()
	menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel()

	aboutToAppear() {
		this.model.setSize(DrawerSize.Small)

		this.menuModel.setHeight('180vp')
		this.menuModel.setIconWidth('24vp')
		this.menuModel.setIconHeight('24vp')

		this.menuModel.setActiveBackgroundColor(Color.White)
		this.menuModel.setActiveTextColor('#A020F0')
		this.menuModel.setIconHeight('24vp')
		this.menuModel.setIconWidth('24vp')
		this.menuModel.setFontSize('18vp')
		this.menuModel.setHeight('56vp')
		this.menuModel.setPadding('5vp')
		this.menuModel.setBorderRadius('20vp')
		this.menuModel.setHeight('60vp')
	}

	build() {
		Stack() {
			Column() {
				Button('Open side Drawer').onClick(() => {
					animateTo({ duration: 500 }, () => {
						this.vis = !this.vis
						console.log(this.vis + '')
					})
				})
			}

			SideDrawer({
				menu: this.menu,
				extraMenu: this.extraOptions,
				selected: '2',
				onSelect: () => {
					console.log("done")
				},
				visible: $vis,
				model: this.model,
				menuModel: this.menuModel
			})
		}
		.width('100%')
		.height('100%')
	}
}