extends MapLogicTemplate

func get_spawn_point_position_for_team(teamNumber):
	if teamNumber == 1:
		$Props/Team1SpawnPoints.get_children().pick_random()
		var spawnPoint =  $Props/Team1SpawnPoints.get_children().pick_random()
		return spawnPoint.global_position
	elif teamNumber == 2:
		var spawnPoint = $Props/Team2SpawnPoints.get_children().pick_random()
		return spawnPoint.global_position
	else:
		return Vector3.ZERO

func assign_player(id):
	if multiplayer.is_server():
		if team1.size() > team2.size():
			team2[id] = 1 #it's value doesn't matter, we just care that it 
			characterInstances[id].team = 2
			characterInstances[id].set_pos(get_spawn_point_position_for_team(2))
		else:
			team1[id] = 1 #it's value doesn't matter, we just care that it 
			characterInstances[id].team = 1
			characterInstances[id].set_pos(get_spawn_point_position_for_team(1))

