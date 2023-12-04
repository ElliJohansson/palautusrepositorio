class TennisGame:
    def __init__(self, player1_name, player2_name):
        self.player1_name = player1_name
        self.player2_name = player2_name
        self.m_score1 = 0
        self.m_score2 = 0

    def won_point(self, player_name):
        if player_name == "player1":
            self.m_score1 = self.m_score1 + 1
        else:
            self.m_score2 = self.m_score2 + 1

    def draw_points(self):
        if self.m_score1 == 0:
            return "Love-All"
        if self.m_score1 == 1:
            return "Fifteen-All"
        if self.m_score1 == 2:
            return "Thirty-All"
        return "Deuce"

    def tiebreaker(self):
        minus_result = self.m_score1 - self. m_score2
        if minus_result == 1:
            return "Advantage player1"
        elif minus_result == -1:
            return "Advantage player2"
        elif minus_result >= 2:
            return "Win for player1"
        else:
            return "Win for player2"

    def assign_score(self, player_score):
        if player_score == 0:
            return "Love"
        if player_score == 1:
            return "Fifteen"
        if player_score == 2:
            return "Thirty"
        if player_score == 3:
            return "Forty"

    def current_score(self):
        p1_score = self.assign_score(self.m_score1)
        p2_score = self.assign_score(self.m_score2)
        return f"{p1_score}-{p2_score}"

    def get_score(self):
        if self.m_score1 == self.m_score2:
            score = self.draw_points()

        elif self.m_score1 >= 4 or self.m_score2 >= 4:
            score = self.tiebreaker()
        else:
            score = self.current_score()

        return score