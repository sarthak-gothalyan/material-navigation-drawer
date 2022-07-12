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

export class MenuOption {
	private id: string | number
	private value: string
	private icon?: string | Resource

	constructor(id: string | number, value: string, icon?: string | Resource) {
		if(id == null || id == undefined) id = ''
		if(value == null || value == undefined) value = ''
		if(icon == null || icon == undefined) icon = ''
		this.value = value
		this.id = id
		this.icon = icon
	}

	setID(id: string | number): MenuOption {
		if(id != null && id != undefined) this.id = id
		return this
	}

	getID(): string | number {
		return this.id
	}

	setValue(value: string): MenuOption {
		if(value == null || value == undefined) value = ''
		this.value = value
		return this
	}

	getValue(): string {
		return this.value
	}

	setIcon(icon: string | Resource): MenuOption {
		if(icon == null || icon == undefined) icon = ''
		this.icon = icon
		return this
	}

	getIcon(): string | Resource {
		return this.icon
	}
}