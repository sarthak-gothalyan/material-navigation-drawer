import { MenuOption } from './menuOption'
import { Properties, MenuProperties } from './properties'


@Component
struct BottomDrawer {
	menu: MenuOption[]
	@Link visible: boolean
	@State model: BottomDrawer.Model = new BottomDrawer.Model('0vp', 0)
	@State menuModel: BottomDrawer.MenuModel = new BottomDrawer.MenuModel('0vp', '0vp', '0vp')

	aboutToAppear() {
		if(this.menu == null || this.menu == undefined) this.menu = []
		if(this.model == null || this.model == undefined) this.model = new BottomDrawer.Model('0vp', 0)
		if(this.menuModel == null || this.menuModel == undefined) this.menuModel = new BottomDrawer.MenuModel('0vp', '0vp', '0vp')
	}

	@Builder
	Item(page: MenuOption) {
		Navigator({target: page.getPath(), type: NavigationType.Push}) {
			Flex({ justifyContent: FlexAlign.Start, alignContent: FlexAlign.Center }) {
				Image(page.getIcon())
					.objectFit(ImageFit.Cover)
					.width(this.menuModel.getIconWidth())
					.height(this.menuModel.getIconWidth())
					.margin({ right: 20 })
				Text(page.getName())
					.fontSize(this.menuModel.getFontSize())
					.fontColor(this.menuModel.getFontColor())
					.flexGrow(1)
					.maxLines(1)
			}
			.padding(this.menuModel.getPadding())
		}
		.onClick(() => {
			animateTo({ duration: this.model.getAnimationDuration() }, () => {
				this.visible = false
			})
		})
		.params({ text: page.getName() })
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
					ForEach(this.menu, (it: MenuOption) => {
						ListItem() {
							this.Item(it)
						}
					}, (it, index) => index.toString())
				}
			}
			.width('100%')
			.height(this.model.getHeight())
			.markAnchor({ y: '100%' })
			.position({ y: '100%' })
			.justifyContent(FlexAlign.Start)
			.alignItems(HorizontalAlign.Start)
			.transition({ type: TransitionType.Insert, scale: { y: 0.0, centerY: '100%' } })
			.transition({ type: TransitionType.Delete, scale: { y: 0.0, centerY: '100%' } })
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

namespace BottomDrawer {
	export class Model extends Properties{
		private height: Length = '0vp'

		constructor(height: Length, animationDuration: number) {
			super(animationDuration)
			if(height == null || height == undefined) height = '0vp'
			this.height = height
		}

		setHeight(height: Length): Model {
			if(height == null || height == undefined) height = '0vp'
			this.height = height
			return this
		}

		getHeight(): Length {
			return this.height
		}

		reset(): Model {
			super.reset()
			this.height = '0vp'
			return this
		}
	}

	export class MenuModel extends MenuProperties {
		constructor(height: Length, iconHeight: Length, iconWidth: Length) {
			super(height, iconHeight, iconWidth)
		}
	}
}

export { BottomDrawer }