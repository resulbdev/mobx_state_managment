import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_state_managment/core/base_view_model.dart';
import 'package:mobx_state_managment/feature/model/story_model.dart';
import 'package:mobx_state_managment/feature/service/story_service.dart';
part 'story_view_model.g.dart';

class StoryViewModel = _StoryViewModelBase with _$StoryViewModel;

abstract class _StoryViewModelBase with Store, BaseViewModel {
  late IStoryService storyService;

  @observable
  List<StoryModel>? storyModel;
  @observable
  bool isLoading = true;

  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchStory() async {
    changeLoading();
    storyModel = await storyService.storyFetch();
    changeLoading();
  }

  @override
  void setContext(BuildContext context) {}
  @override
  void init() {
    storyService = StoryService(networkManager);
    fetchStory();
  }
}
