import { Component, Inject, OnDestroy, OnInit } from '@angular/core';
import { NbMediaBreakpointsService, NbMenuService, NbSidebarService, NbThemeService } from '@nebular/theme';
import { TokenStorageService } from './../../../auth/token-storage.service';
import { UserData } from '../../../@core/data/users';
import { LayoutService } from '../../../@core/utils';
import { filter, map, takeUntil } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { Router } from '@angular/router';
import { NbAuthJWTToken, NbAuthService, NbLogoutComponent, NbTokenService, NB_AUTH_OPTIONS } from '@nebular/auth';
import { Admin } from '../../../entities/Admin';
import { AdminService } from '../../../services/admin.service';

@Component({
  selector: 'ngx-header',
  styleUrls: ['./header.component.scss'],
  templateUrl: './header.component.html',
})
export class HeaderComponent extends NbLogoutComponent implements OnInit, OnDestroy {

  private destroy$: Subject<void> = new Subject<void>();
  userPictureOnly: boolean = false;
  user: any;

  themes = [
    {
      value: 'default',
      name: 'Light',
    },
    {
      value: 'dark',
      name: 'Dark',
    },
    {
      value: 'cosmic',
      name: 'Cosmic',
    },
    {
      value: 'corporate',
      name: 'Corporate',
    },
  ];

  currentTheme = 'default';

  userMenu = [{ title: 'Log out' } ];
  tag: string;

  constructor(private sidebarService: NbSidebarService,
              private menuService: NbMenuService,
              private themeService: NbThemeService,
              private userService: UserData,
              private adminService: AdminService,
              protected router:Router,
              private authService: NbAuthService,
              @Inject(NB_AUTH_OPTIONS) protected options = {},
              protected tokenService: NbTokenService,
              private TokenStorageService:TokenStorageService,
              private layoutService: LayoutService,
              private breakpointService: NbMediaBreakpointsService) {
                super(authService, options, router);
  }



  async logout() {
    this.router.navigateByUrl('/auth/login')
      this.tokenService.clear();
      this.TokenStorageService.signOut();
    }

  ngOnInit() {

    this.menuService.onItemClick()
    .pipe(filter(({ tag }) => tag === this.tag))
    .subscribe(bag =>{ console.log(bag.item.title)
              if(bag.item.title == 'Log out'){

                  this.logout();
              }

    });


    this.authService.onTokenChange()
    .subscribe((token: NbAuthJWTToken) => {

      if (token.isValid()) {
        this.user = token.getPayload();
        this.TokenStorageService.saveToken(token.getValue());
        this.TokenStorageService.saveRole(token.getPayload().role);
       // console.log(this.user.storeid);

      //  console.log(token.getValue()) // here we receive a payload from the token and assigns it to our user variable
      }

    });

    this.adminService.getCurrentAdmin().subscribe((user) => {
      this.user = user;
      console.log(this.user);
      
    });


    this.currentTheme = this.themeService.currentTheme;

    this.userService.getUsers()
      .pipe(takeUntil(this.destroy$))
      .subscribe((users: any) => this.user = users.nick);

    const { xl } = this.breakpointService.getBreakpointsMap();
    this.themeService.onMediaQueryChange()
      .pipe(
        map(([, currentBreakpoint]) => currentBreakpoint.width < xl),
        takeUntil(this.destroy$),
      )
      .subscribe((isLessThanXl: boolean) => this.userPictureOnly = isLessThanXl);

    this.themeService.onThemeChange()
      .pipe(
        map(({ name }) => name),
        takeUntil(this.destroy$),
      )
      .subscribe(themeName => this.currentTheme = themeName);
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
  }

  changeTheme(themeName: string) {
    this.themeService.changeTheme(themeName);
  }

  toggleSidebar(): boolean {
    this.sidebarService.toggle(true, 'menu-sidebar');
    this.layoutService.changeLayoutSize();

    return false;
  }

  navigateHome() {
    this.menuService.navigateHome();
    return false;
  }
}
