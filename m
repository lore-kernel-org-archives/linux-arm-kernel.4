Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A992606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGwmpukb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hFTUQ0vM;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gBvoMsFI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=; b=YGwmpukbs56KVY
	426/3CVu9l4VR/LkF6T9pktjcIVoCZ5AmBmfuPNDLMoLG6Q3egUgxRjtTr2hU24TXk4BOgE64k+8c
	f2DJogySnZ1zWvP1a85sc6qn7njYBPQN9AzfQ+KF8PEw7fBXQdS/x7x2Fp73OtJ4hNn/KMVyiygxD
	sFREnBq3NFjPOlrzsy/46JNqm5gUTiF9XsocIFczDUiz8UMK8r48+1TRSWlMkX3LnDHmvAhQXzAtL
	fCZsdhx0F/a0c1CALmWxuFVygGApxIGjLmfMMvmd/CnXzRbk+GPCbwERC8UyDQTZPa8YNt3IrSrxf
	Mj/ufbRHpnWlxn5Q7AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZB-00000009VLY-3LEK;
	Wed, 18 Nov 2026 16:31:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY4-00000009UR9-2xe6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=; b=hFTUQ0vMRlMufHKY6rQXr2G5A0
	iTYzpRff9C6sGG0E91jUSHli+m+M9x6KckwbTTxwh5OFK5m0/pK8sG/kHiFj3Lw1KQHfgOm0qPKAj
	pno0oIIek8lozr8ML5NmvCPS8BxQ/NrWFj/KEiG8foK7TZPfD9/hhKuTmnmp8BJmG39qIhPxGtdpV
	Ux6e7q2U9Ztnkc6wHi/VOX4RqHob32FQfsHqcWTnAMoS5kahfRQIksva5VnRtxABOa0n5c+CeExX3
	dra6YAPKSrag68pfsXS+Kn7dsd4i9fOaLlbUtS4DDuz0K3uooKnAVc41OBlpz10RpvdWrFS5alF9n
	4siTmzzg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXz-0000000GGfz-1yQR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4a5506f09f5so766011f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019409; x=1795624209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=;
        b=gBvoMsFI5IKsMiHI6QB5MUxEtFWL7RPegegQpbWrcVJY9mVeyiCosrXI3qY7E6atgk
         Vhpy3tHbYDMAGbvHUdRgNkJHdYkvp77SKCEeS3uvAiwSylWuVU6OktJccMC8ZOEF95oj
         nxkXOiKTtNxkbM9cyv8UcslrUJ1YrWNVkVDvXdxMAC71BXBGwn7hKP72L2O66sgdEQaJ
         MBAWJhEAXG7d4RJWQMYzhbxOSO/ZxPmJ+mk53GD2T3AQWVg0/CTS2YzmxIwu8gR4C6k7
         4dBckDKmD75rZD4/+c14Y+ZuNYda2R7n4Uly89OwNzhle4R4edBm3M44r0cqRIt1QfQv
         o/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019409; x=1795624209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=;
        b=EVweOt0dmwo5w5lP7SRouEhK8vaDJKeQZM+6Y8qz/xkbo45M1WH/5AynG2qiXZy1UQ
         NeI0PUTphFb5rlTA75E3uO1F61vKC5evXhWyMckNPHp6MZlV29JSrOQJ3GlMOl1Pcedx
         lMeC4pHiZWFNDpls7mF9CwFA1M/1g+y9pxnmXLIgpSpDWboz0fSMz3KOlHpxq/O8VveO
         OpD+IT8svC8mUDRLLU7v3bNvPHk7ODsykPsby1B6lK63HbtCkLH4I3kvhFtifpcq7tC9
         WRjje5jL0+4ks6Kv2zDByyciOQtyrQfGb1MTMJgW7kmmj0tQZ+DubbQJN+g3N9YDNSeK
         69kA==
X-Forwarded-Encrypted: i=1; AL+hErGWvIue9MHBPTANYSEf04rYSP6krQa1qWZkzTR1a66zGBcvhM92umt/VSUqQVQ/ADl2HwzqODlHFGVuJSIJ49q1@lists.infradead.org
X-Gm-Message-State: APuU4Z8U4nGKnfITXpO+n4YETz3G93WQnU/PtVY2bGbOC0VMDBmqxRFw
	lheYKhAhSUJ2IckyPvMCGnpH4qvn3c7zM9MnSC0zNIvA8ac5aisKADhIofpHIZEShXo=
X-Gm-Gg: AZFdTZcmYJkH+6h43RDdjpU3VX7hYYPbKqbG5PP+YC16yl1M/G23acNY8KS4TJ/AkFX
	DozGnF93rn1gnhW1AXhkH+Sqj7q4W1SAN9A5TJ2SSGq1kNEkaDdK+eUO+H3mzdjWzEVg/uNe4jm
	LnQzd46dsleYCv1TAIxgngSGChoX6gDzI9SFLnZHh9d0aUVYO4kjQ8qaKXlVdicp3gbyjis2w6t
	lRwQW+vIvhpT6bI3s0aTkk/n633r3GKbr0WXC1BT9ChF2YazUYh8hBz7vm3hWtnd8SNQC8RVs48
	XZ9HNa9jMdIPoDoWTDFyTJ8/wKUvnPUOvkYFmgDnlaYsWlF+1ndsVLC3iMuy3CLwG5dpN7fobI7
	N3SPIyfdFntPgkWtdXmBC7vhLoMXG24eicADrT0M5U3Kl91oBeA8WN8FscEMJcgodtIdI6N946r
	Y1Fu+9C2DWELtwBeT7NZFjdkL8ISwXn6r6BjDzBsqAGrdSeaJK6bTV6/s4640YX+oebQqUl2lO0
	8kfN9RK+JzJHZEtJS7lK+4mO3I8C8OZ/SmOaO2WF18HajibdkluhJ64ha3nQ3hjSMFvWIRh9wVL
	3mEYLF4MUB6djsyfjlJfqB2iw0pJwOu/0JnQ67qJbsgTymjkQh3Fkw==
X-Received: by 2002:a05:6000:4312:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-4a63a2d5b8amr7126622f8f.38.1795019408782;
        Wed, 18 Nov 2026 08:30:08 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:08 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:41 +0000
Subject: [PATCH 19/34] perf cs-etm: Decode one packet at a time and don't
 estimate timestamps
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-19-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_163013_399663_056D3064 
X-CRM114-Status: GOOD (  28.51  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Stop decoding after each packet instead of buffering packets until a
timestamp is reached. Give each range the last known timestamp instead
of estimating time using instruction counts. This makes the interleaving
of ranges between sinks less frequent, but that can be increased by
increasing the timestamp frequency. Timestamp estimation only added
complexity and was probably more misleading than useful.

Until the first trace timestamp is found, sort using zero. Only use the
AUX record time when trace timestamps are disabled.

packet_buffer[] now only ever has one packet in it, but keep it for a
later more mechanical removal in a later commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 124 +-----------------------
 tools/perf/util/cs-etm.c                        |  10 +-
 tools/perf/util/cs-etm.h                        |   4 +-
 3 files changed, 9 insertions(+), 129 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 895e85a1f54b..d7b596aeaa41 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -33,15 +33,6 @@
 #define CS_PKT_MON	0
 #endif
 
-/*
- * Assume a maximum of 0.1ns elapsed per instruction. This would be the
- * case with a theoretical 10GHz core executing 1 instruction per cycle.
- * Used to estimate the sample time for synthesized instructions because
- * Coresight only emits a timestamp for a range of instructions rather
- * than per instruction.
- */
-const u32 INSTR_PER_NS = 10;
-
 struct cs_etm_decoder {
 	void *data;
 	void (*packet_printer)(const char *msg, void *data);
@@ -124,20 +115,6 @@ int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
 	return 1;
 }
 
-/*
- * Calculate the number of nanoseconds elapsed.
- *
- * instr_count is updated in place with the remainder of the instructions
- * which didn't make up a whole nanosecond.
- */
-static u32 cs_etm_decoder__dec_instr_count_to_ns(u32 *instr_count)
-{
-	const u32 instr_copy = *instr_count;
-
-	*instr_count %= INSTR_PER_NS;
-	return instr_copy / INSTR_PER_NS;
-}
-
 static int cs_etm_decoder__gen_etmv3_config(struct cs_etm_trace_params *params,
 					    ocsd_etmv3_cfg *config)
 {
@@ -259,18 +236,6 @@ cs_etm_decoder__init_def_logger_printing(struct cs_etm_decoder_params *d_params,
 	return 0;
 }
 
-static void
-cs_etm_decoder__do_soft_timestamp(struct cs_etm_packet_queue *packet_queue)
-{
-	u64 estimated_ts;
-
-	estimated_ts = packet_queue->cs_timestamp +
-			cs_etm_decoder__dec_instr_count_to_ns(&packet_queue->instr_count);
-
-	/* Estimated TS can never be higher than the next real one in the trace */
-	packet_queue->cs_timestamp = min(packet_queue->next_cs_timestamp, estimated_ts);
-}
-
 static ocsd_datapath_resp_t
 cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 				  const ocsd_generic_trace_elem *elem,
@@ -279,7 +244,6 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 {
 	struct cs_etm_packet_queue *packet_queue;
 	u64 converted_timestamp;
-	u64 estimated_first_ts;
 
 	/* Ignore trace timestamps when unavailable or disabled by --itrace=Z. */
 	if (!cs_etm__has_timestamps(etmq))
@@ -297,54 +261,14 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	converted_timestamp = elem->timestamp ?
 				cs_etm__convert_sample_time(etmq, elem->timestamp) : 0;
 
-	/*
-	 * We've seen a timestamp packet before - simply record the new value.
-	 * Function do_soft_timestamp() will report the value to the front end,
-	 * hence asking the decoder to keep decoding rather than stopping.
-	 */
-	if (packet_queue->next_cs_timestamp) {
-		/*
-		 * What was next is now where new ranges start from, overwriting
-		 * any previous estimate in cs_timestamp
-		 */
-		packet_queue->cs_timestamp = packet_queue->next_cs_timestamp;
-		packet_queue->next_cs_timestamp = converted_timestamp;
-		return OCSD_RESP_CONT;
-	}
-
 	if (!converted_timestamp) {
-		/*
-		 * Zero timestamps can be seen due to misconfiguration or hardware bugs.
-		 * Warn once, and don't try to subtract instr_count as it would result in an
-		 * underflow.
-		 */
-		packet_queue->cs_timestamp = 0;
 		pr_warning_once("Bad Coresight timestamp found at Idx:%" OCSD_TRC_IDX_STR
 				". Decode in order of trace collection by prepending 'Z' to your current --itrace arguments.\n",
 				indx);
-
-	} else if (packet_queue->instr_count / INSTR_PER_NS > converted_timestamp) {
-		/*
-		 * Sanity check that the elem->timestamp - packet_queue->instr_count would not
-		 * result in an underflow. Warn and clamp at 0 if it would.
-		 */
-		packet_queue->cs_timestamp = 0;
-		pr_err("Timestamp calculation underflow at Idx:%" OCSD_TRC_IDX_STR "\n", indx);
-	} else {
-		/*
-		 * This is the first timestamp we've seen since the beginning of traces
-		 * or a discontinuity.  Since timestamps packets are generated *after*
-		 * range packets have been generated, we need to estimate the time at
-		 * which instructions started by subtracting the number of instructions
-		 * executed to the timestamp. Don't estimate earlier than the last used
-		 * timestamp though.
-		 */
-		estimated_first_ts = converted_timestamp -
-					(packet_queue->instr_count / INSTR_PER_NS);
-		packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, estimated_first_ts);
+		return OCSD_RESP_CONT;
 	}
-	packet_queue->next_cs_timestamp = converted_timestamp;
-	packet_queue->instr_count = 0;
+
+	packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, converted_timestamp);
 
 	/* Tell the front end which traceid_queue needs attention */
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
@@ -353,13 +277,6 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	return OCSD_RESP_WAIT;
 }
 
-static void
-cs_etm_decoder__reset_timestamp(struct cs_etm_packet_queue *packet_queue)
-{
-	packet_queue->next_cs_timestamp = 0;
-	packet_queue->instr_count = 0;
-}
-
 static enum cs_etm_isa
 cs_etm_decoder__get_isa(const ocsd_generic_trace_elem *elem)
 {
@@ -426,11 +343,6 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	packet_queue->packet_buffer[et].el = ocsd_EL_unknown;
 	packet_queue->packet_buffer[et].tid = -1;
 
-	/* Keep decoding until a timestamp is hit or queue fills up */
-	if (cs_etm__has_timestamps(etmq) &&
-	    packet_queue->packet_count < CS_ETM_PACKET_MAX_BUFFER - 1)
-		return OCSD_RESP_CONT;
-
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
 	return OCSD_RESP_WAIT;
 }
@@ -467,19 +379,6 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 
 	packet->last_instr_size = elem->last_instr_sz;
 
-	packet_queue->instr_count += elem->num_instr_range;
-
-	if (packet_queue->next_cs_timestamp) {
-		/*
-		 * Once a real timestamp has been received, every range can be
-		 * handed to the frontend without queueing using an estimated
-		 * soft timestamp.
-		 */
-		cs_etm_decoder__do_soft_timestamp(packet_queue);
-		cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
-		return OCSD_RESP_WAIT;
-	}
-
 	return ret;
 }
 
@@ -489,11 +388,6 @@ cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
 				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
-	/*
-	 * Something happened and who knows when we'll get new traces so
-	 * reset time statistics.
-	 */
-	cs_etm_decoder__reset_timestamp(queue);
 	return cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
 					     CS_ETM_DISCONTINUITY);
 }
@@ -602,12 +496,6 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
 
-	/*
-	 * A timestamp is generated after a PE_CONTEXT element so make sure
-	 * to rely on that coming one.
-	 */
-	cs_etm_decoder__reset_timestamp(packet_queue);
-
 	return ret;
 }
 
@@ -815,11 +703,7 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 			break;
 		}
 
-		/*
-		 * Return to the input code if the packet buffer is full.
-		 * Flushing will get done once the packet buffer has been
-		 * processed.
-		 */
+		/* Return to the input code if processing was paused. */
 		if (OCSD_DATA_RESP_IS_WAIT(cur))
 			break;
 
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index accd4ffc19aa..f33e410e85bf 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -570,6 +570,7 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id)
 {
+	/* Tell the frontend which queue the last processed packet is in. */
 	etmq->ready_chan_id = trace_chan_id;
 }
 
@@ -596,8 +597,7 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (trace_chan_id)
 		*trace_chan_id = etmq->ready_chan_id;
 
-	packet_queue = cs_etm__etmq_get_packet_queue(etmq,
-						     etmq->ready_chan_id);
+	packet_queue = cs_etm__etmq_get_packet_queue(etmq, etmq->ready_chan_id);
 	if (!packet_queue)
 		return 0;
 
@@ -611,7 +611,7 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (!etmq->etm->has_timestamps)
 		return etmq->buffer->time;
 
-	/* See function cs_etm_decoder__do_{hard|soft}_timestamp() */
+	/* Use the last trace timestamp, or zero if none has been found yet. */
 	return packet_queue->cs_timestamp;
 }
 
@@ -2614,9 +2614,7 @@ static int cs_etm__decode_data_block(struct cs_etm_queue *etmq)
 	/*
 	 * Packets are decoded and added to the decoder's packet queue
 	 * until the decoder packet processing callback has requested that
-	 * processing stops or there is nothing left in the buffer.  Normal
-	 * operations that stop processing are a timestamp packet or a full
-	 * decoder buffer queue.
+	 * processing stops or there is nothing left in the buffer.
 	 */
 	ret = cs_etm_decoder__process_data_block(etmq->decoder,
 						 etmq->offset,
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index ffe3a33885a7..e404753820dc 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -199,9 +199,7 @@ struct cs_etm_packet_queue {
 	u32 packet_count;
 	u32 head;
 	u32 tail;
-	u32 instr_count;
-	u64 cs_timestamp; /* Timestamp from trace data, converted to ns if possible */
-	u64 next_cs_timestamp;
+	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
 	struct cs_etm_packet packet_buffer[CS_ETM_PACKET_MAX_BUFFER];
 };
 

-- 
2.43.0


