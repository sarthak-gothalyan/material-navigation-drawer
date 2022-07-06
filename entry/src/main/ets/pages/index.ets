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

import { DrawerSize, MenuOption, SideDrawer, Group, ExtraOption } from '@ohos/navigation-drawer'

@Entry
@Component
struct Index {
	@State vis: boolean = false
	menu: (Group | MenuOption | ExtraOption)[] = [
		new MenuOption('1', "Send", 'pages/index', $r('app.media.send')),
		new MenuOption('2', "Delete", 'pages/index', $r('app.media.delete')),
		new Group('3', "Mail", [
			new MenuOption('4', "Inbox", 'pages/index', $r('app.media.inbox')),
			new MenuOption('5', "Favourite", 'pages/index', $r('app.media.favorite'))
		]),
		new ExtraOption('6', "Settings", 'pages/index', $r('app.media.settings')),
		new ExtraOption('7', "Help & Feedback", 'pages/index', $r('app.media.help'))
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
		this.menuModel.setSubtitleFontSize('21vp')
		this.menuModel.setFontSize('18vp')
		this.menuModel.setHeight('56vp')
		this.menuModel.setPadding('5vp')
		this.menuModel.setBorderRadius('20vp')
		this.menuModel.setHeight('60vp')
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
					animateTo({ duration: 500 }, () => {
						this.vis = !this.vis
						console.log(this.vis + '')
					})
				})
			}

			SideDrawer({
				menu: this.menu,
				selected: '2',
				header: this.customDesign(),
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