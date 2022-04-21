DELETE FROM practicas_alap.communitytype 
WHERE typename IS NOT NULL;
INSERT INTO practicas_alap.communitytype (typename) VALUES ('books'), ('movies'), ('gaming'), ('scifi'), ('thriller'), ('drama');