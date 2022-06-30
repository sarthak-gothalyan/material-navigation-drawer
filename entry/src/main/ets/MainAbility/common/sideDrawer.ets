import router from '@system.router'
import { MenuItemType, MenuOption } from './menuOption'
import { Properties, MenuProperties } from './properties'

@Component
struct SideDrawer {
	menu: MenuOption[]
	@BuilderParam header: () => any
	@Link visible: boolean
	@State selected: number = -1
	@State model: SideDrawer.Model = new SideDrawer.Model('0vp', 0)
	@State menuModel: SideDrawer.MenuModel = new SideDrawer.MenuModel('0vp', '0vp', '0vp')

	aboutToAppear() {
		console.log(router.getState().path + router.getState().name)
		if(this.menu == null || this.menu == undefined) this.menu = []
		if(this.model == null || this.model == undefined) this.model = new SideDrawer.Model('0vp', 0)
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
				if(this.header != null && this.header != undefined) this.header()
				List({space: '10vp'}) {
					ForEach(this.menu, (it: MenuOption) => {
						ListItem() {
							if(it.getItemType() == MenuItemType.Divider) Divider()
							else if(it.getItemType() == MenuItemType.Subtitle) Text(it.getValue()).fontSize(this.menuModel.getSubtitleFontSize()).fontColor(this.menuModel.getSubtitleFontColor())
							else this.Item(it)
						}
					}, (it, index) => index.toString())
				}
			}
			.width(this.model.getWidth())
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
		private width: Length = '0vp'

		constructor(width: Length, animationDuration: number) {
			super(animationDuration)
			if(width == null || width == undefined) width = '0vp'
			this.width = width
		}

		setWidth(width: Length): Model {
			if(width == null || width == undefined) width = '0vp'
			this.width = width
			return this
		}

		getWidth(): Length {
			return this.width
		}

		reset(): Model {
			super.reset()
			this.width = '0vp'
			return this
		}
	}

	export class MenuModel extends MenuProperties {
		constructor(height: Length, iconHeight: Length, iconWidth: Length) {
			super(height, iconHeight, iconWidth)
		}
	}
}

export { SideDrawer }