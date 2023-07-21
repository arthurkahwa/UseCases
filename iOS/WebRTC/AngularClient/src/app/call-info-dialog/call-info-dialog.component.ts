import { Component } from '@angular/core';

@Component({
  selector: 'app-call-info-dialog',
  templateUrl: './call-info-dialog.component.html',
  styleUrls: ['./call-info-dialog.component.css']
})

export class CallInfoDialogComponent {
  constructor(
    public dialogRef: MatDialogRef<CallInfoDialogComponents>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private _snackBar: MatSnackBar
  ) { }

  public showCopiedSnackBar() {
    this._snackBar.open('Peer ID Copied!', 'Hurrah', {
      duration: 1000,
      horizontalPosition: 'center',
      verticalPosition: 'top'
    });
  }
}

export interface DialogData {
  peerId?: string;
  joinCall: boolean
}
