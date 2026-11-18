Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40803606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5xF9vge;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SjnD1h9h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sxVhElAnpgNRNsgHcnjSLsgUsNEXWfsZYegUDnlKrMw=; b=K5xF9vgeU1Mpoe
	bRemEfVUtJK8AA0EnzlRw9Qvwzxb8eNbdk8ThHXMW3dk9r6R/Bpcrfc5M2exLc5W414jDiNqiFHX3
	F8M1PIyN/IHHwcRqJCzrDRCzHGkfbR1a0wao+qSC9i6U3HEzFNQY/Ba5/DentwV3pEMVZC+dcaSEu
	XaLiTsUgoJFPVK3WLJucEvvyPsgUMtaHMVC42DqLFltSkX/VdFfJVHyvfL5E5shjLI46Cs5bzB+1F
	ga5BXY47Z6mgTjcGVkqBACp/OqVuiMFDlsEJPyfUAhkms+il6H7TjipTWARzuKxEBqfzSQ5hEYlIz
	0uZpjcl1i0YbIRLLF5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYs-00000009V1P-07t6;
	Wed, 18 Nov 2026 16:31:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXu-00000009UDo-3pFf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e09aa5264so691080f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019405; x=1795624205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxVhElAnpgNRNsgHcnjSLsgUsNEXWfsZYegUDnlKrMw=;
        b=SjnD1h9hH2YyK88ovkXIlGj4F/0K0939C9SBSQQNLhLVbWFe/8c1T8H4nrpo0jDysM
         LUI0oYWzPJANvXtOg7Sp9aEn7JlhjmKj5DLV6DdtN0fLuLxiXhhcDhDd6AHKDLIdt3Po
         1HxaBpn9GEoIzSml5qhdKJxAv8qDtMmaOk17qLuIJOzoM+ressDbUwmYCzXUwZGvpEpF
         pGqdvWX3uo9M4APUlMtjbZXPzbZAXOG0XgHczxbAvLHDpQrOPzqBHk7SEz5BHqUqTKzG
         59oe7cYGDaJODCl3XszSHlpiOwKaJTBafpvGy7PO/mMT7jRi/TFUYk9xnkrtAVQNd6w+
         KVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019405; x=1795624205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxVhElAnpgNRNsgHcnjSLsgUsNEXWfsZYegUDnlKrMw=;
        b=tTsYmbe+xYyjpjd1htXQnqb9ZIx0IP43hI9Zr5a+Z6+TEtdLuu6Su/MlhoW32x9H7+
         BDqJn0XkJDB1xTWWQ17yiANobIyFXSfBzf6XEtb49/XoDzJ5sZcHlXVFccQHbv3lo9jw
         9KrdNXa6qwWiJcyI/cSDpu6hK+kjXOLAU3Zh4cK5tc3VfMUV9QCT7v03ypSEKULlvVAB
         GpKCaLq8XATRMFjyBTq7bKJszxGjlG49LK1kzkjZyqXKNoHt+Dt4hTQ81AZp8Dns6wRl
         Lh0RVN0YJVSuv1TwH6ClEDEw/F8YAeDZ0PvMW5EKNJmKjNHCr1YbDtI3QsPWjqACJ7Bh
         y7hA==
X-Forwarded-Encrypted: i=1; AL+hErGxXu5aVZThavSDActUinT+Rp/bo4aX9d8odlM6FobVcEs4joK6W6UlGvA9XoUpqRvO+Z8d92gu4LHvvouQafn3@lists.infradead.org
X-Gm-Message-State: APuU4Z8pdQEeQEmhcnhBYYCFQIhsh2a8tzlNiGtn9pFV+rwKAwHEbp1i
	ffb7BEzXYMYpLuOaJRUvmnMKfVe3Bsmpxm8LZGLnHRCuv3QNnPF7yBDg4u2QFgPEOek=
X-Gm-Gg: AZFdTZf8ZpkwJhNABSTcjX3nf8ZamqrMongLVCEoUBm/GscPoGerpVwCRLozVT31VJG
	18G0fEiDjWMsC/DbZTt7xwHqzVq+FrNOy1ixN2PaBP/3LSgGwOg55FzTIxZAixIztjQ02butPzZ
	iKp1UKyyTJRqwjh5HeUpe0pqqj0RCSaTf1Yqf4WQ9vLkc4AeFcSW55bYov7+4lKniX9XpfB/cC4
	7YN9NnllDc9IDDtNItOiofpVD/nCYwxrOV15uoQzgtcBeE23w1+ldDOxQ6VsJ+6Tk+tHVicve9H
	H0Jui4GRV1keQgFku0wP7eF7idlBtam+Smbl4enIpQxH0kx8QF9L5ph47H2FK8ehDIH1uSOg7gx
	QbdrkLInwl3WL0HKQdT1C31qXu/lOLH9Nq6GUlcGfQbz+6w20m1Pz3gM7dAzn+uQdlmkEkQegmY
	R7EXmIvxda6tli11tHpBG2lUzeb8i9Zw5qeSOtYZVbtdQ1ovzfzD0lj4YTffhj6AJfplbh8iM6A
	biAwvOKahhFObbjrQ+b7wCzlQnkx6T79QJDGIGuxbIsve9w0eSIk3iFEGikGFckpFfBisEzLfs/
	JyVFwjAFdAtXscCtMQT6Lc4XfawMkWgq
X-Received: by 2002:a05:6000:27d2:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-4a63ac6bc12mr4817915f8f.38.1795019404507;
        Wed, 18 Nov 2026 08:30:04 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:03 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:37 +0000
Subject: [PATCH 15/34] perf cs-etm: Use time from Perf samples
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-15-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083007_235899_778AEF09 
X-CRM114-Status: GOOD (  33.66  )
X-Spam-Score: -2.1 (--)
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

The time from the AUX record that's associated with a chunk of data can
be used as a time for the generated samples when there is no virtual
trace timestamp. This replaces 'latest_kernel_timestamp'.

Invert 'timeless_decoding' to 'has_timestamps' so that it's easier to
use and initialize it and 'has_virtual_ts' taking --itrace=Z into
account. That way the same codepaths can treat the trace as if it didn't
have timestamps, even if they exist in the trace.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/auxtrace.h                      |   2 +
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  15 +--
 tools/perf/util/cs-etm.c                        | 162 +++++++++++++-----------
 tools/perf/util/cs-etm.h                        |   2 +-
 4 files changed, 98 insertions(+), 83 deletions(-)

diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 980acb2dc687..c0f971b09b24 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -248,6 +248,7 @@ struct auxtrace {
  * @buffer_nr: used to number each buffer
  * @use_size: implementation actually only uses this number of bytes
  * @use_data: implementation actually only uses data starting at this address
+ * @time: PERF_SAMPLE_TIME associated with the trace
  */
 struct auxtrace_buffer {
 	struct list_head	list;
@@ -266,6 +267,7 @@ struct auxtrace_buffer {
 	u64			buffer_nr;
 	size_t			use_size;
 	void			*use_data;
+	u64			time;
 };
 
 /**
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index f133e11ccc7b..d260d89453ef 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -292,6 +292,10 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	u64 converted_timestamp;
 	u64 estimated_first_ts;
 
+	/* Ignore trace timestamps when unavailable or disabled by --itrace=Z. */
+	if (!cs_etm__has_timestamps(etmq))
+		return OCSD_RESP_CONT;
+
 	/* First get the packet queue for this traceID */
 	packet_queue = cs_etm__etmq_get_packet_queue(etmq, trace_chan_id);
 	if (!packet_queue)
@@ -326,10 +330,9 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 		 * underflow.
 		 */
 		packet_queue->cs_timestamp = 0;
-		if (!cs_etm__etmq_is_timeless(etmq))
-			pr_warning_once("Zero Coresight timestamp found at Idx:%" OCSD_TRC_IDX_STR
-					". Decoding may be improved by prepending 'Z' to your current --itrace arguments.\n",
-					indx);
+		pr_warning_once("Bad Coresight timestamp found at Idx:%" OCSD_TRC_IDX_STR
+				". Decode in order of trace collection by prepending 'Z' to your current --itrace arguments.\n",
+				indx);
 
 	} else if (packet_queue->instr_count / INSTR_PER_NS > converted_timestamp) {
 		/*
@@ -472,10 +475,6 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 
 	packet->last_instr_size = elem->last_instr_sz;
 
-	/* per-thread scenario, no need to generate a timestamp */
-	if (cs_etm__etmq_is_timeless(etmq))
-		goto out;
-
 	/*
 	 * The packet queue is full and we haven't seen a timestamp (had we
 	 * seen one the packet queue wouldn't be full).  Let the front end
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 4252d25c991d..ca3878a3b74e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -49,14 +49,8 @@ struct cs_etm_auxtrace {
 	struct perf_session *session;
 	struct perf_tsc_conversion tc;
 
-	/*
-	 * Timeless has no timestamps in the trace so overlapping mmap lookups
-	 * are less accurate but produces smaller trace data. We use context IDs
-	 * in the trace instead of matching timestamps with fork records so
-	 * they're not really needed in the general case. Overlapping mmaps
-	 * happen in cases like between a fork and an exec.
-	 */
-	bool timeless_decoding;
+	/* Trace timestamps are available and not disabled by --itrace=Z. */
+	bool has_timestamps;
 
 	/*
 	 * Per-thread ignores the trace channel ID and instead assumes that
@@ -66,12 +60,11 @@ struct cs_etm_auxtrace {
 	 */
 	bool per_thread_decoding;
 	bool snapshot_mode;
-	bool has_virtual_ts; /* Virtual/Kernel timestamps in the trace. */
+	bool has_virtual_ts; /* Trace timestamps can be used as kernel time. */
 	bool use_thread_stack;
 	bool use_callchain;
 
 	int num_cpu;
-	u64 latest_kernel_timestamp;
 	u32 auxtrace_type;
 	u32 branches_filter;
 	u64 branches_sample_type;
@@ -588,7 +581,19 @@ void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
 	etmq->pending_timestamp_chan_id = trace_chan_id;
 }
 
-static u64 cs_etm__etmq_get_timestamp(struct cs_etm_queue *etmq,
+/*
+ * Timestamp used to order sample generation between queues.
+ *
+ * This can either be a virtual or non-virtual CoreSight timestamp value, or the
+ * kernel time from the AUX record if there are no timestamps. The only
+ * requirement is that it's the same timebase between queues so comparisons
+ * work, the absolute value isn't important.
+ *
+ * This is not the same as the timestamp assigned to synthesized samples
+ * (cs_etm__resolve_sample_time()) and may be zero before a timestamp is
+ * received, at which point sample generation is still un-ordered.
+ */
+static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 				      u8 *trace_chan_id)
 {
 	struct cs_etm_packet_queue *packet_queue;
@@ -607,6 +612,13 @@ static u64 cs_etm__etmq_get_timestamp(struct cs_etm_queue *etmq,
 	/* Acknowledge pending status */
 	etmq->pending_timestamp_chan_id = 0;
 
+	/*
+	 * If there are no timestamps, use the TS from the AUX records to sort
+	 * in order of trace collection.
+	 */
+	if (!etmq->etm->has_timestamps)
+		return etmq->buffer->time;
+
 	/* See function cs_etm_decoder__do_{hard|soft}_timestamp() */
 	return packet_queue->cs_timestamp;
 }
@@ -961,7 +973,7 @@ static int cs_etm__flush_events(struct perf_session *session,
 	if (!tool->ordered_events)
 		return -EINVAL;
 
-	if (etm->timeless_decoding) {
+	if (!etm->has_timestamps) {
 		/*
 		 * Pass tid = -1 to process all queues. But likely they will have
 		 * already been processed on PERF_RECORD_EXIT anyway.
@@ -1355,7 +1367,7 @@ static int cs_etm__queue_first_cs_timestamp(struct cs_etm_auxtrace *etm,
 		 * Function cs_etm_decoder__do_{hard|soft}_timestamp() does all
 		 * the timestamp calculation for us.
 		 */
-		cs_timestamp = cs_etm__etmq_get_timestamp(etmq, &trace_chan_id);
+		cs_timestamp = cs_etm__etmq_get_sort_timestamp(etmq, &trace_chan_id);
 
 		/* We found a timestamp, no need to continue. */
 		if (cs_timestamp)
@@ -1572,9 +1584,9 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 	return 0;
 }
 
-bool cs_etm__etmq_is_timeless(struct cs_etm_queue *etmq)
+bool cs_etm__has_timestamps(struct cs_etm_queue *etmq)
 {
-	return !!etmq->etm->timeless_decoding;
+	return etmq->etm->has_timestamps;
 }
 
 static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
@@ -1625,10 +1637,14 @@ static inline u64 cs_etm__resolve_sample_time(struct cs_etm_queue *etmq,
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	struct cs_etm_packet_queue *packet_queue = &tidq->packet_queue;
 
-	if (!etm->timeless_decoding && etm->has_virtual_ts)
+	if (etm->has_virtual_ts)
 		return packet_queue->cs_timestamp;
-	else
-		return etm->latest_kernel_timestamp;
+
+	/*
+	 * Timestamps were disabled or no virtual TS. All samples are assigned
+	 * the kernel time from when the trace block was emitted.
+	 */
+	return etmq->buffer->time;
 }
 
 static bool cs_etm__packet_has_branch(struct cs_etm_packet *packet)
@@ -1897,10 +1913,7 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
 	attr.sample_type = evsel->core.attr.sample_type & PERF_SAMPLE_MASK;
 	attr.sample_type |= PERF_SAMPLE_IP | PERF_SAMPLE_TID |
 			    PERF_SAMPLE_PERIOD;
-	if (etm->timeless_decoding)
-		attr.sample_type &= ~(u64)PERF_SAMPLE_TIME;
-	else
-		attr.sample_type |= PERF_SAMPLE_TIME;
+	attr.sample_type |= PERF_SAMPLE_TIME;
 
 	attr.exclude_user = evsel->core.attr.exclude_user;
 	attr.exclude_kernel = evsel->core.attr.exclude_kernel;
@@ -2935,7 +2948,7 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 		if (ret)
 			goto out;
 
-		cs_timestamp = cs_etm__etmq_get_timestamp(etmq, &trace_chan_id);
+		cs_timestamp = cs_etm__etmq_get_sort_timestamp(etmq, &trace_chan_id);
 
 		if (!cs_timestamp) {
 			/*
@@ -3062,7 +3075,7 @@ static int cs_etm__process_event(struct perf_session *session,
 		 * for flush so that events from different threads are interleaved
 		 * properly.
 		 */
-		if (etm->per_thread_decoding && etm->timeless_decoding)
+		if (etm->per_thread_decoding && !etm->has_timestamps)
 			return cs_etm__process_timeless_queues(etm,
 							       event->fork.tid);
 		break;
@@ -3076,15 +3089,6 @@ static int cs_etm__process_event(struct perf_session *session,
 	case PERF_RECORD_SWITCH:
 		return cs_etm__process_switch(etm, sample);
 
-	case PERF_RECORD_AUX:
-		/*
-		 * Record the latest kernel timestamp available in the header
-		 * for samples so that synthesised samples occur from this point
-		 * onwards.
-		 */
-		if (sample->time && (sample->time != (u64)-1))
-			etm->latest_kernel_timestamp = sample->time;
-		break;
 
 	default:
 		break;
@@ -3122,23 +3126,6 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 	return 0;
 }
 
-static void cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm)
-{
-	/* Take first ETM as all options will be the same for all ETMs */
-	u64 *metadata = etm->metadata[0];
-
-	/* Override timeless mode with user input from --itrace=Z */
-	if (etm->synth_opts.timeless_decoding) {
-		etm->timeless_decoding = true;
-		return;
-	}
-
-	if (metadata[CS_ETM_MAGIC] == __perf_cs_etmv3_magic)
-		etm->timeless_decoding = !(metadata[CS_ETM_ETMCR] & ETMCR_TIMESTAMP_EN);
-	else
-		etm->timeless_decoding = !(metadata[CS_ETMV4_TRCCONFIGR] & TRCCONFIGR_TS);
-}
-
 /*
  * Read a single cpu parameter block from the auxtrace_info priv block.
  *
@@ -3287,6 +3274,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		/* Old per-thread files have no CPU (before v6.4) */
 		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
 		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
+		struct auxtrace_buffer *buffer;
 
 		if (!etmq)
 			return -EINVAL;
@@ -3306,10 +3294,12 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
 			  " tid: %d cpu: %d\n", frag_size, frag_start, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
-						 file_offset, NULL);
+						 file_offset, &buffer);
 		if (err)
 			return err;
 
+		buffer->time = sample->time;
+
 		format = (aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW) ?
 				UNFORMATTED : FORMATTED;
 		if (etmq->format != UNSET && format != etmq->format) {
@@ -3568,6 +3558,51 @@ static int cs_etm__create_decoders(struct cs_etm_auxtrace *etm)
 	return 0;
 }
 
+static void cs_etm__timestamp_opts_init(struct cs_etm_auxtrace *etm)
+{
+	/*
+	 * Take first ETM for has_timestamps because record options are the same
+	 * for all ETMs.
+	 */
+	u64 *metadata = etm->metadata[0];
+
+	/* Leave both timestamp flags clear with --trace=Z */
+	if (etm->synth_opts.timeless_decoding)
+		return;
+
+	if (metadata[CS_ETM_MAGIC] == __perf_cs_etmv3_magic)
+		etm->has_timestamps = metadata[CS_ETM_ETMCR] & ETMCR_TIMESTAMP_EN;
+	else
+		etm->has_timestamps = metadata[CS_ETMV4_TRCCONFIGR] & TRCCONFIGR_TS;
+
+	if (!etm->has_timestamps)
+		return;
+
+	if (etm->synth_opts.use_timestamp) {
+		/*
+		 * Prior to Armv8.4, Arm CPUs don't support FEAT_TRF feature,
+		 * therefore the decoder cannot know if the timestamp trace is
+		 * same with the kernel time.
+		 *
+		 * If a user has knowledge for the working platform they can
+		 * specify itrace option 'T' to force the decoder to use the
+		 * traced timestamp as the kernel time.
+		 */
+		etm->has_virtual_ts = true;
+	} else {
+		/* Use virtual timestamps if all ETMs report ts_source = 1 */
+		etm->has_virtual_ts = cs_etm__has_virtual_ts(etm->metadata, etm->num_cpu);
+		if (!etm->has_virtual_ts) {
+			ui__warning(
+				"Virtual timestamps are not enabled, or not supported by the traced system.\n"
+				"The time field of the samples will not be set accurately.\n"
+				"For Arm CPUs prior to Armv8.4 or without support FEAT_TRF,\n"
+				"you can specify the itrace option 'T' for timestamp decoding\n"
+				"if the Coresight timestamp on the platform is same with the kernel time.\n\n");
+		}
+	}
+}
+
 int cs_etm__process_auxtrace_info_full(union perf_event *event,
 				       struct perf_session *session)
 {
@@ -3733,29 +3768,8 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	etm->metadata = metadata;
 	etm->auxtrace_type = auxtrace_info->type;
 
-	if (etm->synth_opts.use_timestamp)
-		/*
-		 * Prior to Armv8.4, Arm CPUs don't support FEAT_TRF feature,
-		 * therefore the decoder cannot know if the timestamp trace is
-		 * same with the kernel time.
-		 *
-		 * If a user has knowledge for the working platform and can
-		 * specify itrace option 'T' to tell decoder to forcely use the
-		 * traced timestamp as the kernel time.
-		 */
-		etm->has_virtual_ts = true;
-	else
-		/* Use virtual timestamps if all ETMs report ts_source = 1 */
-		etm->has_virtual_ts = cs_etm__has_virtual_ts(metadata, num_cpu);
-
-	if (!etm->has_virtual_ts)
-		ui__warning("Virtual timestamps are not enabled, or not supported by the traced system.\n"
-			    "The time field of the samples will not be set accurately.\n"
-			    "For Arm CPUs prior to Armv8.4 or without support FEAT_TRF,\n"
-			    "you can specify the itrace option 'T' for timestamp decoding\n"
-			    "if the Coresight timestamp on the platform is same with the kernel time.\n\n");
-
-	cs_etm__setup_timeless_decoding(etm);
+	/* Set etm->has_timestamps and etm->has_virtual_ts */
+	cs_etm__timestamp_opts_init(etm);
 
 	etm->tc.time_shift = tc->time_shift;
 	etm->tc.time_mult = tc->time_mult;
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index bf0e0f5a9711..9e842f1be9fc 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -269,7 +269,7 @@ enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq);
 int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 				       u8 trace_chan_id, ocsd_ex_level el,
 				       pid_t tid);
-bool cs_etm__etmq_is_timeless(struct cs_etm_queue *etmq);
+bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
 void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
 					      u8 trace_chan_id);
 struct cs_etm_packet_queue

-- 
2.43.0


