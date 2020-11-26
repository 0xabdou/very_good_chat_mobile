import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_chat/domain/friends/friend.dart';
import 'package:very_good_chat/domain/friends/friend_request.dart';
import 'package:very_good_chat/domain/friends/i_friend_repository.dart';

part 'friend_cubit.freezed.dart';
part 'friend_state.dart';

/// State management for friends feature
class FriendCubit extends Cubit<FriendState> {
  /// Constructor
  FriendCubit({
    IFriendRepository friendRepository,
  })  : _repository = friendRepository,
        super(FriendState.initial());

  final IFriendRepository _repository;
}
