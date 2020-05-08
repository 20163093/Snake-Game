#include <iostream>
#include <ncurses.h>
#include <locale.h>
#include <fstream>
#include <cstdlib>

using namespace std;

int lev = 1;
int mapData[22][22];

void mapRead(int *h, int *w, int *array, int y, int x, int n) { //snakeMap.txt 읽어오는 함수
  ifstream inStream;
  inStream.open("snakeMap.txt"); // snakeMap.txt 열기
  if (inStream.fail()) { // snakeMap.txt를 열지 못하는 경우 아래와 같은 문장을 출력하고 종료
    cerr << "Input file opening failed." << '\n';
    exit(1);
  }
  inStream >> *h >> *w; // 
  for (int i = 0; i < *h; i++) {
    for(int j = 0; j < *w; j++) {
      int n;
      inStream >> n;
      mapData[i][j] = n;
    }
  }
  inStream.close();
  *array = mapData[y][x];
}

void pallete() {
  init_color(COLOR_BLACK, 0, 0, 0);
  init_pair(1, COLOR_GREEN, COLOR_BLACK);
  init_pair(2, COLOR_YELLOW, COLOR_BLACK);
  init_pair(3, COLOR_RED, COLOR_BLACK);
  init_pair(4, COLOR_BLUE, COLOR_BLACK);
  init_pair(5, COLOR_CYAN, COLOR_BLACK);
  init_pair(6, COLOR_WHITE, COLOR_BLACK);
}

void mapDisplay(int n) {
  clear();
  mvprintw(1, 13, "< S N A K E >");
  mvprintw(2, 5, "Move: Arrow, Restart: R, Exit: Q");
  int x = 0, y = 0, h = 1, w = 1, map;
  for (y = 0; y < h; y++) {
    for (x = 0; x < w; x++) {
      mapRead(&h, &w, &map, y, x, n); // map 불러오기
      switch (map) {
        case 0: mvaddch(y + 4, x + 10, ' ' | COLOR_PAIR(4)); break; // 숫자가 0일때 ' '으로 출력 = 빈 공간 표시
        case 1: mvaddch(y + 4, x + 10, '#' | COLOR_PAIR(1)); break; // 숫자가 1일때 '#'으로 출력 = 벽(wall)
        case 2: mvaddch(y + 4, x + 10, '+' | COLOR_PAIR(6)); break; // 숫자가 2일때 '+'으로 출력 = immune wall
        case 3: mvaddch(y + 4, x + 10, '@' | COLOR_PAIR(2)); break; // 숫자가 3일때 '@'으로 출력 = snake head
        case 4: mvaddch(y + 4, x + 10, '*' | COLOR_PAIR(3)); break; // 숫자가 4일때 '*'으로 출력 = snake body
      }
    }
  }
}

void Play(int ch) {

}

int main() {
  int ch;
  initscr();
  keypad(stdscr, TRUE);
  noecho();

  if (!has_colors()) {
    endwin();
    cout << "Error initializing colors.n";
    exit(1);
  }

  start_color();
  pallete();

  mapDisplay(lev);
  if (getch() != 'a') {
    while((ch = getch()) != 'q') {
      Play(ch);
    }
  }

  return 0;
}
