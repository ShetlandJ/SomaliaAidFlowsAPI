import json


valid_place_names = ["FGS", "Benadir", "Galmudug", "Hiirshabelle", "Jubaland", "Puntland", "South West", "Somaliland",
                     "Unattributed"]


class YearData:
    def _init_(self):
        self.total = 0
        self.greater_than_0_count = 0

    def add_cost(self, cost):
        self.total += cost
        if cost == 0:
            self.greater_than_0_count += 1

    def _repr_(self):
        return "Total = {}, Count = {}".format(self.total, self.greater_than_0_count)


def decode_key(key):
    split_key = key.split(" - ")
    year = split_key[0]
    place = split_key[1]

    return place, year


def extract_project_data(project):
    project_data = {}

    for key, value in project.items():  # returns both the key and the value when you iterate over it
        # key is "2016 - FSG", value is 0 for example as in first project in JSON
        # Check if any of the valid place names appear in the key
        if any(place_name for place_name in valid_place_names if place_name in key):
            # decode the key into the place and year
            place, year = decode_key(key)

            if place not in project_data:
                project_data[place] = {}

            cost = int(value)
            project_data[place][year] = cost

    return project_data


def run():
    all_place_data = {}

    for place_name in valid_place_names:
        all_place_data[place_name] = {}

    f = open("json_shit.json", 'rb')
    list_of_projects = json.load(f)

    for project in list_of_projects:
        # project data is a dict of place names to a PlaceData class containing year and count
        project_data = extract_project_data(project)

        for place in project_data:
            for year, cost in project_data[place].items():
                place_year_data = all_place_data[place]

                if year not in place_year_data:
                    place_year_data[year] = YearData()

                place_year_data[year].add_cost(cost)

    for place, data in all_place_data.items():
        print("{}: {}".format(place, data))


run()
