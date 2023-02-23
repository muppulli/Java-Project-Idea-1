import { Component } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import {FormControl} from '@angular/forms';
import {TooltipPosition} from '@angular/material/tooltip';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  positionOptions: TooltipPosition[] = ['below', 'above', 'left', 'right'];
  position = new FormControl(this.positionOptions[0]);
}
function  OnMenuClicked(params: any) {
  console.log(params);
}