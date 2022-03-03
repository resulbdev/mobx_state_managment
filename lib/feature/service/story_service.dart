import 'package:mobx_state_managment/feature/model/story_model.dart';
import 'package:vexana/vexana.dart';

abstract class IStoryService {
  final INetworkManager networkManager;

  IStoryService(this.networkManager);

  Future<List<StoryModel>?> storyFetch();
}

class StoryService extends IStoryService {
  StoryService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<StoryModel>?> storyFetch() async {
    final response = await networkManager.send<StoryModel, List<StoryModel>>(
        'posts?userId=1',
        parseModel: StoryModel(),
        method: RequestType.GET);
    return response.data;
  }
}
