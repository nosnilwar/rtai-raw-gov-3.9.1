/*
 * Copyright (c) 2001 Fabrice Bellard
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/**
 * @file
 * libavcodec API use example.
 *
 * Note that libavcodec only handles codecs (mpeg, mpeg4, etc...),
 * not file formats (avi, vob, mp4, mov, mkv, mxf, flv, mpegts, mpegps, etc...). See library 'libavformat' for the
 * format handling
 * @example doc/examples/decoding_encoding.c
 */

#include <math.h>

#include <libavutil/opt.h>
#include <libavcodec/avcodec.h>
#include <libavutil/common.h>
#include <libavutil/imgutils.h>
#include <libavutil/mathematics.h>
#include <libavutil/samplefmt.h>

#define INBUF_SIZE 4096
#define AUDIO_INBUF_SIZE 20480
#define AUDIO_REFILL_THRESH 4096


int main(int argc, char **argv)
{
    const char *output_type;
    AVCodec *codec;
    AVCodecContext *c= NULL;
    AVFrame *frame;
    AVPacket pkt;
	char *filename = "test.mp3";
    int i, j, k, ret, got_output;
    int buffer_size;
    FILE *f;
    uint16_t *samples;
    float t, tincr;
	int ret2 = 0;
	const enum AVSampleFormat *p;
	const int *p2;
	int best_samplerate = 0;
	const uint64_t *p3;
	uint64_t best_ch_layout = 0;
	int best_nb_channells   = 0;

    /* register all the codecs */
    avcodec_register_all();

    if (argc < 2) {
        printf("usage: %s output_type\n"
               "API example program to decode/encode a media stream with libavcodec.\n"
               "This program generates a synthetic stream and encodes it to a file\n"
               "named test.h264, test.mp2 or test.mpg depending on output_type.\n"
               "The encoded stream is then decoded and written to a raw data output.\n"
               "output_type must be 'mp3'.\n",
               argv[0]);
        ret2 = 1;
    }
	else {
		output_type = argv[1];

		if (!strcmp(output_type, "mp3")) {
			//ret2 = audio_encode_example("test.mp3");

		printf("Encode audio file %s\n", filename);

		/* find the MP3 encoder */
		codec = avcodec_find_encoder(AV_CODEC_ID_MP3);
		if (!codec) {
			fprintf(stderr, "Codec not found\n");
			ret2 = 1;
		}

		else {
			c = avcodec_alloc_context3(codec);
			if (!c) {
				fprintf(stderr, "Could not allocate audio codec context\n");
				ret2 = 1;
			}

			else {
				/* put sample parameters */
				//c->bit_rate = 64000;
				c->bit_rate = 256000;

				/* check that the encoder supports s16 pcm input */
				c->sample_fmt = AV_SAMPLE_FMT_S16;
				p = codec->sample_fmts;

				/* check that a given sample format is supported by the encoder */
				ret2 = 1;
				while (*p != AV_SAMPLE_FMT_NONE) { /* max 15 */
					if (*p == c->sample_fmt) {
						ret2 = 0;
						break;
					}
					p++;
				}

				if (ret2 != 0) {
					fprintf(stderr, "Encoder does not support sample format %s",
							av_get_sample_fmt_name(c->sample_fmt));
					ret2 = 1;
				}

				else {
					/* select other audio parameters supported by the encoder */

					/* just pick the highest supported samplerate */
					if (!codec->supported_samplerates)
						return 44100;

					p2 = codec->supported_samplerates;
					while (*p2) { /* max 29 */
						best_samplerate = FFMAX(*p2, best_samplerate);
						p2++;
					}
					c->sample_rate = best_samplerate;

					/* select layout with the highest channel count */

					if (!codec->channel_layouts)
						return AV_CH_LAYOUT_STEREO;

					p3 = codec->channel_layouts;
					while (*p3) { /* max 29 */
						int nb_channels = av_get_channel_layout_nb_channels(*p3);

						if (nb_channels > best_nb_channells) {
							best_ch_layout    = *p3;
							best_nb_channells = nb_channels;
						}
						p3++;
					}
					c->channel_layout = best_ch_layout;

					c->channels       = av_get_channel_layout_nb_channels(c->channel_layout);

					/* open it */
					if (avcodec_open2(c, codec, NULL) < 0) {
						fprintf(stderr, "Could not open codec\n");
						ret2 = 1;
					}

					else {
						f = fopen(filename, "wb");
						if (!f) {
							fprintf(stderr, "Could not open %s\n", filename);
							ret2 = 1;
						}

						/* frame containing input raw audio */
						frame = avcodec_alloc_frame();
						if (!frame) {
							fprintf(stderr, "Could not allocate audio frame\n");
							ret2 = 1;
						}

						else {
							frame->nb_samples     = c->frame_size;
							frame->format         = c->sample_fmt;
							frame->channel_layout = c->channel_layout;

							/* the codec gives us the frame size, in samples,
							 * we calculate the size of the samples buffer in bytes */
							buffer_size = av_samples_get_buffer_size(NULL, c->channels, c->frame_size,
																	 c->sample_fmt, 0);
							samples = av_malloc(buffer_size);
							if (!samples) {
								fprintf(stderr, "Could not allocate %d bytes for samples buffer\n",
										buffer_size);
								ret2 = 1;
							}

							else {
								/* setup the data pointers in the AVFrame */
								ret = avcodec_fill_audio_frame(frame, c->channels, c->sample_fmt,
															   (const uint8_t*)samples, buffer_size, 0);
								if (ret < 0) {
									fprintf(stderr, "Could not setup audio frame\n");
									ret2 = 1;
								}

								else {
									/* encode a single tone sound */
									t = 0;
									tincr = 2 * M_PI * 440.0 / c->sample_rate;
									for(i=0;i<500;i++) { /* max 18 */
										av_init_packet(&pkt);
										pkt.data = NULL; // packet data will be allocated by the encoder
										pkt.size = 0;

										for (j = 0; j < c->frame_size; j++) { /* max 16 */
											samples[2*j] = (int)(sin(t) * 10000);

											for (k = 1; k < c->channels; k++) /* max 9 */
												samples[2*j + k] = samples[2*j];
											t += tincr;
										}
										/* encode the samples */
										ret = avcodec_encode_audio2(c, &pkt, frame, &got_output);
										if (ret < 0) {
											fprintf(stderr, "Error encoding audio frame\n");
											ret2 = 1;
											break;
										}
										if (got_output) {
											fwrite(pkt.data, 1, pkt.size, f);
											av_free_packet(&pkt);
										}
									}

									if (ret2 == 0) {
										/* get the delayed frames */
										for (got_output = 1; got_output; i++) { /* max 20 */
											ret = avcodec_encode_audio2(c, &pkt, NULL, &got_output);
											if (ret < 0) {
												fprintf(stderr, "Error encoding frame\n");
												ret2 = 1;
												break;
											}

											if (got_output) {
												fwrite(pkt.data, 1, pkt.size, f);
												av_free_packet(&pkt);
											}
										}
										fclose(f);
										if (ret2 == 0) {
											av_freep(&samples);
											avcodec_free_frame(&frame);
											avcodec_close(c);
											av_free(c);
										}
									}
								}
							}
						}
					}
				}
			}
		}
			}
			else {
				fprintf(stderr, "Invalid output type '%s', choose 'mp3\n", output_type);
				ret2 = 1;
			}
		}

    return ret2;
}

