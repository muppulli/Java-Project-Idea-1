import { Component } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import {FormControl} from '@angular/forms';
import {TooltipPosition} from '@angular/material/tooltip';
import {MatDialog} from '@angular/material/dialog';
import { SignInComponent } from './sign-in/sign-in.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(public dialog: MatDialog) {}
  positionOptions: TooltipPosition[] = ['below', 'above', 'left', 'right'];
  position = new FormControl(this.positionOptions[0]);
  showFiller = false;

  onLogin() {
    const dialogRef = this.dialog.open(SignInComponent, {
      height: '50%',
      width: '800px'});

    dialogRef.afterClosed().subscribe(result => {
      console.log(`Dialog result: ${result}`);
    });
  }
}

function  OnMenuClicked(params: any) {
  console.log(params);
}