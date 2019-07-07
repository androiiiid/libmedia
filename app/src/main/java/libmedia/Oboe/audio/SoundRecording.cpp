/*
 * Copyright 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "SoundRecording.h"
#include "../../waveform/AudioTools.h"
#include <src/common/OboeDebug.h>
#include <cmath>
#include <native.h>

extern AudioTime GlobalTime;

void SoundRecording::renderAudio(int16_t *targetData, int64_t totalFrames, SoundRecording *Audio){
    SoundRecordingAudioData * AudioData = Audio->AudioData;
    if (mIsPlaying) {

        // Check whether we're about to reach the end of the recording
        if (!mIsLooping && mReadFrameIndex + totalFrames >= mTotalFrames) {
            totalFrames = mTotalFrames - mReadFrameIndex;
            mIsPlaying = false;
        }

//        LOGW("SoundRecording::renderAudio: rendering %d frames with data", totalFrames);

        if (mReadFrameIndex == 0) {
            GlobalTime.StartOfFile = true;
            GlobalTime.update(mReadFrameIndex, AudioData);
//            LOGW("SoundRecording::renderAudio: AudioTime in milliseconds = %lld", GlobalTime.milliseconds.count());
        }
        for (int i = 0; i < totalFrames; ++i) {
            for (int j = 0; j < AudioData->channelCount; ++j) {
                targetData[(i * AudioData->channelCount) + j] = Audio->Audio[(mReadFrameIndex * AudioData->channelCount) + j];
            }
            // Increment and handle wraparound
            if (++mReadFrameIndex >= mTotalFrames) {
                GlobalTime.EndOfFile = true;
                GlobalTime.update(mReadFrameIndex, AudioData);
                mReadFrameIndex = 0;
            } else {
                GlobalTime.update(mReadFrameIndex, AudioData);
            }
//            LOGW("SoundRecording::renderAudio: mReadFrameIndex = %d", mReadFrameIndex);
//            LOGW("SoundRecording::renderAudio: AudioTime in milliseconds = %lld", GlobalTime.milliseconds.count());
        }
    } else {
//        LOGW("SoundRecording::renderAudio: rendering %d frames with zero", totalFrames);
        // fill with zeros to output silence
        for (int i = 0; i < totalFrames * AudioData->channelCount; ++i) {
            targetData[i] = 0;
        }
    }
}

extern const int16_t *WAVEFORMAUDIODATA;
extern uint64_t WAVEFORMAUDIODATATOTALFRAMES;
std::string TEMPDIR;

NATIVE(void, Oboe, SetTempDir)(JNIEnv *env, jobject type, jstring dir) {
    jboolean val;
    TEMPDIR = std::string(env->GetStringUTFChars(dir, &val));
}

SoundRecording * SoundRecording::loadFromAssets(AAssetManager *assetManager, const char *filename, int SampleRate, int mChannelCount) {

    // Load the backing track
    AAsset* asset = AAssetManager_open(assetManager, filename, AASSET_MODE_BUFFER);

    if (asset == nullptr){
        LOGE("Failed to open track, filename %s", filename);
        return nullptr;
    }

    // Get the length of the track (we assume it is stereo 48kHz)
    uint64_t trackSize = static_cast<uint64_t>(AAsset_getLength(asset));

    // Load it into memory
    const int16_t *audioBuffer = static_cast<const int16_t*>(AAsset_getBuffer(asset));
    if (audioBuffer == nullptr){
        LOGE("Could not get buffer for track");
        return nullptr;
    }
    const int actualSampleRate = 44100;
    const int actualChannelCount = 2;
    // There are 4 bytes per frame because
    // each sample is 2 bytes and
    // it's a stereo recording which has 2 samples per frame.
    const uint64_t totalFrames = trackSize / (2 * actualChannelCount);
    WAVEFORMAUDIODATATOTALFRAMES = totalFrames;
    // format is 16 bit int, but resampler appears to take floating point...
    // resample here
    /*
Matthew Good, [07.07.19 03:25]
so just to be clear, resampling libs offer LITTLE quality improvements over user implemented resampling algorithms right?

Ivansuper, [07.07.19 03:26]
Yeah, kind of

Ivansuper, [07.07.19 03:27]
You see, there is a human factor. When you bump up 8kHz to 92kHz, you will hear the algos "extra enhancers"

Ivansuper, [07.07.19 03:27]
Because someone may implement some kind of a "hi frequency reconstruction" algorithm

Ivansuper, [07.07.19 03:28]
And these kinds of tiny small extra features do make a certain library special

Ivansuper, [07.07.19 03:29]
But if you upsample 44100 to 88200, you won't hear any difference (I am confident 95%)

Ivansuper, [07.07.19 03:30]
Pure upsampling does not make it sound any better
     */
    // $resampler_path -i -r 48000 --noPeakChunk --doubleprecision --minphase --mt
    extern int main(int argc, char * argv[]);
    const int argc = 12;
    const char *argv[argc];
    argv[0] = "ReSampler";
    argv[1] = "-i";
    argv[2] = "/sdcard/ReSampler/00001313.wav";
    argv[3] = "-o";
    argv[4] = static_cast<std::string>(TEMPDIR + "/00001313_48000.wav").c_str();
    argv[5] = "-r";
    argv[6] = "48000";
    argv[7] = "-b";
    argv[8] = "16";
    argv[9] = "--showStages";
//    argv[10] = "--singleStage";
    argv[10] = "--multiStage";
    argv[11] = "--noTempFile";
    double s = now_ms();
    LOGE("Started conversion at %G milliseconds", s);
    main(argc, const_cast<char **>(argv));
    double e = now_ms();
    LOGE("Ended conversion at %G milliseconds", e);
    LOGE("TIME took %G milliseconds", e - s);
    WAVEFORMAUDIODATA = audioBuffer;

    SoundRecordingAudioData * AudioData = new SoundRecordingAudioData(totalFrames, mChannelCount, SampleRate);
    AudioTime * allFrames = new AudioTime();
    allFrames->update(totalFrames, AudioData);
    LOGD("Opened backing track");
    LOGD("length in human time:                              %s", allFrames->format(true).c_str());
    LOGD("length in nanoseconds:                             %G", allFrames->nanosecondsTotal);
    LOGD("length in microseconds:                            %G", allFrames->microsecondsTotal);
    LOGD("length in milliseconds:                            %G", allFrames->millisecondsTotal);
    LOGD("length in seconds:                                 %G", allFrames->secondsTotal);
    LOGD("length in minutes:                                 %G", allFrames->minutesTotal);
    LOGD("length in hours:                                   %G", allFrames->hoursTotal);
    LOGD("bytes:                                             %ld", trackSize);
    LOGD("frames:                                            %ld", totalFrames);
    LOGD("sample rate:                                       %d", SampleRate);
    LOGD("length of 1 frame at %d sample rate:", SampleRate);
    LOGD("Human Time:                                        %s", AudioData->TimeTruncated);
    LOGD("Nanoseconds:                                       %G", AudioData->nanosecondsPerFrame);
    LOGD("Microseconds:                                      %G", AudioData->microsecondsPerFrame);
    LOGD("Milliseconds:                                      %G", AudioData->millisecondsPerFrame);
    LOGD("Seconds:                                           %G", AudioData->secondsPerFrame);
    LOGD("Minutes:                                           %G", AudioData->minutesPerFrame);
    LOGD("Hours:                                             %G", AudioData->hoursPerFrame);

//    for(int i=0; i<totalFrames; i++) {
//        float xpos=((float)i)*bitmapwidth/totalFrames;
//        float ypos=bitmapheight*(0.5f + audioBuffer[i]/maxValue);
//        bitmap[ypos*bitmapwidth + xpos] = 0xffffffff;
//    }
    return new SoundRecording(const_cast<int16_t *>(audioBuffer), AudioData);
}
