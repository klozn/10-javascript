import { Component, OnInit } from '@angular/core';

@Component({
	selector: 'app-heroes',
	templateUrl: './heroes.component.html',
	styleUrls: ['./heroes.component.css']
})
export class HeroesComponent implements OnInit {

	constructor() { }

	ngOnInit() { 
		this.namesOfTheChosenOnes$ = this.getHeroes().pipe(
			filter(heroes => heroes.filter(hero => hero.powerLevel > 9000)),
			map(heroes => heroes.map(hero => hero.name)));
	}
	
	private searchTerms = new Subject<string>();
	// Push a search term into the observable stream.
	search(term: string): void {
		this.searchTerms.next(term);
	}
}

