Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F4F606B542
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WMSciih;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RCTrpyPi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AStLUcHUmI1uFLWNZAiB9nK6L8yHvacrhqAtKjdrA+4=; b=2WMSciih/c8IIl
	gFmUgC6SnNj3xhbiU6YntFWbEHJQKFuRWliW8iaZqq0cKaUucxAZ/BRF7UYZzhAbHQsHHU28qlY1a
	lMLFFi3OO6YO3NVniIopJxmRzGPI2V7fICy8z8vOJlp2h5PH7oFVu970tyF/1sOP1AwUqzobKclXn
	aWhw5Q6+WAlDl7xgMysEcTNJ+fJQvxzOW84kUJFg2v/I7kv/Cw/nA8bU7eYrJJRioBISTDI05dGrI
	J0c4h805cT6bkyfWpbv5X82y1sdY+UFm7NWV0CdVBwGkQ1DPfLl9Oz8S7MDzGiZkNu4GjDGJSffok
	hOXkGeEV0oHb9uPn0/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZB-00000009VKu-1eeI;
	Wed, 18 Nov 2026 16:31:25 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY1-00000009UMd-403s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:15 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492f563d1c6so456193f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019411; x=1795624211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AStLUcHUmI1uFLWNZAiB9nK6L8yHvacrhqAtKjdrA+4=;
        b=RCTrpyPiafxj/2pIwvsE5U/RegNvzqu/nwJH79dwVVRPdU//TY170QWvKdLd1IDpDH
         oXvb5QvQCDCxblglizzzvI8WyoIgfaAYo0vL5o5c68WQLPFqueUamH+7nKlQvbXXMLKm
         OcCb2IOWWzpORicLF/Yi4I1XGqp0lE92jZxiSohNIVJX0JdzHwQB6M/nJB7YsYS/0usy
         EvR9elm84ueWrQj6SCuAVwxxYicZhqMm9z+9aBi9URs8KF4bCDCejisoiG03BdgtfV3A
         rDOfmWJMVJEWX0A0GKbfmHQSoAcZRqGjB+ABnqYdAHswuMkTNr9mLn+ufSnIBYn428AU
         +ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019411; x=1795624211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AStLUcHUmI1uFLWNZAiB9nK6L8yHvacrhqAtKjdrA+4=;
        b=SOxo1bTIn+ZLNR+6ycRhkWWYd0TCAHwMouFEcVszpCrNRwqT3ZK29b6hG7phjRGX2J
         5DR8xPot5KvYuV9YFCRkviaovMpe3pfL8DtHs3m/13acuTFQbSvGPbrpZiCN7gn1BIGd
         hvrbTA6iClC/WqbhhPkzNc33EOF2EsqK73tDntB7COmdhNQGUE2veD1Xd9cEIMqYTpx7
         N2npLTsOT6sMWAMRgi1kgMobVyaCXo8QYbr28Qtuc27bROzpwSI2cBdulWe7AYdhy454
         GkdmHR7yM2Ggc8ppqm5liolcAXAwZ17tM/B4PaGPwnh2rAN5Wo96mGdClh6We6jI94LX
         3b+A==
X-Forwarded-Encrypted: i=1; AL+hErGwI0AEVtDmRgMBPBYIzV4pCTPHVq23JVsYMUS3z3tOXpxRVBz9PmUy03cuyAyIFlaB+jckXJzM9NwZtEXLsAUk@lists.infradead.org
X-Gm-Message-State: APuU4Z+yNJvbRdogpd9rG+BIotIX0G5F2DOQDwZ6NGCt4sLjVFfPf0sG
	5P7AuKvpP7Nc2L0CyECT8ruHa47YyGodvcvYwi9vMOS+97kURyiu5j0RMgY66EtH+ac=
X-Gm-Gg: AZFdTZduyDkhx+a0y4vLC1Um5njaJI98eqNouaTmo4FfzWvajLb2b/6i0wWMhawNS5Q
	iv/mgNPRSjD5vHkhwROImBg4094QGvQ0C1V6oPeudwTcihgQvsPveObOib7+Yta6ViG+6ZNjw/j
	knmDiNG4OuZhQMsX3+SRcPO1ThZxqCcgQnRsPyAZsh9hDPNzZT/zV4L2PogTeHFo9CE3GYx57Mk
	IFtPCCxqdd4Sp2e/2Pa4UDfJ2jqvKWI4x9ssPMZDyb4BcgJWQVCftW9QhaHDyN+7AUsxd/9XZQ3
	bObEVwO4v/cKMfHZaKYjGbCpqOnH3CNPY4lCp+oypjpBJOxQ/WJ6c7MOxrdXlnGelV5xESV6SWM
	SRH79il3zUhgOThEJbJr8q5CpLtVOykxeTzU/U7KlKU1tcnYla7MeRoe5M7q1boqTyArVn8ib1D
	RlVsjywgYnpTyTJQRuiFItaYZDsg3ttstHtJe0iqhs887KOSKwWTFRlXt2ZuZannDEsMCiDP4kc
	U+VQITHrYRh8aObJsi36Bug5ill+qe9k6PQXFDWVhAPEwY7Od6xJZnKlEvHKpckuCJdLEnqA/yG
	T1rdvsjOzLx9qDYEPLk3/GG1eDnQmO9CAA==
X-Received: by 2002:adf:e00f:0:10b0:48d:f730:bda8 with SMTP id ffacd0b85a97d-4a63d2cf89cmr5015394f8f.50.1795019410865;
        Wed, 18 Nov 2026 08:30:10 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:10 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:43 +0000
Subject: [PATCH 21/34] perf cs-etm: Fold packet state into the trace ID
 queue
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-21-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083014_079428_C9A63B84 
X-CRM114-Status: GOOD (  21.21  )
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

The packet queue no longer owns a packet buffer. The remaining timestamp
and packet_count state belongs to the surrounding trace ID queue.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 34 +++++-----
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  4 +-
 tools/perf/util/cs-etm.c                        | 86 ++++++-------------------
 tools/perf/util/cs-etm.h                        | 39 ++++++++---
 4 files changed, 67 insertions(+), 96 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index e2eb606f2feb..4c47bcf3e2e2 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -87,7 +87,7 @@ int cs_etm_decoder__reset(struct cs_etm_decoder *decoder)
 	return 0;
 }
 
-int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
+int cs_etm_decoder__get_packet(struct cs_etm_traceid_queue *packet_queue,
 			       struct cs_etm_packet *packet)
 {
 	if (!packet_queue || !packet)
@@ -228,15 +228,15 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 				  const uint8_t trace_chan_id,
 				  const ocsd_trc_index_t indx)
 {
-	struct cs_etm_packet_queue *packet_queue;
+	struct cs_etm_traceid_queue *packet_queue;
 	u64 converted_timestamp;
 
 	/* Ignore trace timestamps when unavailable or disabled by --itrace=Z. */
 	if (!cs_etm__has_timestamps(etmq))
 		return OCSD_RESP_CONT;
 
-	/* First get the packet queue for this traceID */
-	packet_queue = cs_etm__etmq_get_packet_queue(etmq, trace_chan_id);
+	/* First get the decode context for this traceID */
+	packet_queue = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
 	if (!packet_queue)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
@@ -256,7 +256,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 
 	packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, converted_timestamp);
 
-	/* Tell the front end which traceid_queue needs attention */
+	/* Tell the front end which decode context needs attention */
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
 
 	/* Halt processing until we are being told to proceed */
@@ -293,7 +293,7 @@ cs_etm_decoder__get_isa(const ocsd_generic_trace_elem *elem)
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
-			      struct cs_etm_packet_queue *packet_queue,
+			      struct cs_etm_traceid_queue *packet_queue,
 			      const ocsd_generic_trace_elem *elem,
 			      const u8 trace_chan_id,
 			      enum cs_etm_sample_type sample_type)
@@ -307,7 +307,7 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	if (cs_etm__get_cpu(etmq, trace_chan_id, &cpu) < 0)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
+	packet = packet_queue->packet;
 	if (!packet)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
@@ -335,7 +335,7 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
-			     struct cs_etm_packet_queue *packet_queue,
+			     struct cs_etm_traceid_queue *packet_queue,
 			     const ocsd_generic_trace_elem *elem,
 			     const uint8_t trace_chan_id)
 {
@@ -347,7 +347,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
+	packet = packet_queue->packet;
 
 	packet->start_addr = elem->st_addr;
 	packet->end_addr = elem->en_addr;
@@ -370,7 +370,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
-				     struct cs_etm_packet_queue *queue,
+				     struct cs_etm_traceid_queue *queue,
 				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
@@ -380,7 +380,7 @@ cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
-				 struct cs_etm_packet_queue *queue,
+				 struct cs_etm_traceid_queue *queue,
 				 const ocsd_generic_trace_elem *elem,
 				 const uint8_t trace_chan_id)
 {
@@ -393,7 +393,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
+	packet = queue->packet;
 	packet->exception_number = elem->exception_number;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
@@ -431,7 +431,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_exception_ret(struct cs_etm_queue *etmq,
-				     struct cs_etm_packet_queue *queue,
+				     struct cs_etm_traceid_queue *queue,
 				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
@@ -441,7 +441,7 @@ cs_etm_decoder__buffer_exception_ret(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
-			struct cs_etm_packet_queue *packet_queue,
+			struct cs_etm_traceid_queue *packet_queue,
 			const ocsd_generic_trace_elem *elem,
 			const uint8_t trace_chan_id)
 {
@@ -477,7 +477,7 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
+	packet = packet_queue->packet;
 	packet->tid = tid;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
@@ -495,10 +495,10 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	ocsd_gen_trc_elem_t type;
 	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
 	struct cs_etm_queue *etmq = decoder->data;
-	struct cs_etm_packet_queue *packet_queue;
+	struct cs_etm_traceid_queue *packet_queue;
 
 	/* First get the packet queue for this traceID */
-	packet_queue = cs_etm__etmq_get_packet_queue(etmq, trace_chan_id);
+	packet_queue = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
 	if (!packet_queue)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 2a8214f17958..4420daaf159d 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -16,7 +16,7 @@
 
 struct cs_etm_decoder;
 struct cs_etm_packet;
-struct cs_etm_packet_queue;
+struct cs_etm_traceid_queue;
 
 struct cs_etm_queue;
 
@@ -102,7 +102,7 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
-int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
+int cs_etm_decoder__get_packet(struct cs_etm_traceid_queue *packet_queue,
 			       struct cs_etm_packet *packet);
 
 int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 0175b2facaac..3f5865ed2724 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -70,28 +70,6 @@ struct cs_etm_auxtrace {
 	enum cs_etm_pid_fmt pid_fmt;
 };
 
-struct cs_etm_traceid_queue {
-	u8 trace_chan_id;
-	u64 period_instructions;
-	u64 kernel_start;
-	union perf_event *event_buf;
-	unsigned int br_stack_sz;
-	struct branch_stack *last_branch;
-	struct ip_callchain *callchain;
-	struct cs_etm_packet *prev_packet;
-	struct cs_etm_packet *packet;
-	struct cs_etm_packet_queue packet_queue;
-
-	struct thread *decode_thread;
-	ocsd_ex_level decode_el;
-
-	/*
-	 * Samples use the EL saved in their source packet. A branch sample
-	 * cannot change thread, so the thread is kept in the frontend context.
-	 */
-	struct thread *frontend_thread;
-};
-
 enum cs_etm_format {
 	UNSET,
 	FORMATTED,
@@ -589,7 +567,7 @@ void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 				      u8 *trace_chan_id)
 {
-	struct cs_etm_packet_queue *packet_queue;
+	struct cs_etm_traceid_queue *tidq;
 
 	if (!etmq->ready_chan_id)
 		return 0;
@@ -597,8 +575,8 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (trace_chan_id)
 		*trace_chan_id = etmq->ready_chan_id;
 
-	packet_queue = cs_etm__etmq_get_packet_queue(etmq, etmq->ready_chan_id);
-	if (!packet_queue)
+	tidq = cs_etm__etmq_get_traceid_queue(etmq, etmq->ready_chan_id);
+	if (!tidq)
 		return 0;
 
 	/* Acknowledge pending status */
@@ -612,7 +590,7 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 		return etmq->buffer->time;
 
 	/* Use the last trace timestamp, or zero if none has been found yet. */
-	return packet_queue->cs_timestamp;
+	return tidq->cs_timestamp;
 }
 
 static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
@@ -679,7 +657,7 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	return rc;
 }
 
-static struct cs_etm_traceid_queue
+struct cs_etm_traceid_queue
 *cs_etm__etmq_get_traceid_queue(struct cs_etm_queue *etmq, u8 trace_chan_id)
 {
 	int idx;
@@ -688,8 +666,8 @@ static struct cs_etm_traceid_queue
 	struct cs_etm_traceid_queue *tidq, **traceid_queues;
 
 	/*
-	 * Check if the traceid_queue exist for this traceID by looking
-	 * in the queue list.
+	 * Check if a decode context exists for this traceID by looking
+	 * in the context list.
 	 */
 	inode = intlist__find(traceid_queues_list, trace_chan_id);
 	if (inode) {
@@ -697,16 +675,16 @@ static struct cs_etm_traceid_queue
 		return etmq->traceid_queues[idx];
 	}
 
-	/* We couldn't find a traceid_queue for this traceID, allocate one */
+	/* We couldn't find a decode context for this traceID, allocate one */
 	tidq = malloc(sizeof(*tidq));
 	if (!tidq)
 		return NULL;
 
 	memset(tidq, 0, sizeof(*tidq));
 
-	/* Get a valid index for the new traceid_queue */
+	/* Get a valid index for the new decode context */
 	idx = intlist__nr_entries(traceid_queues_list);
-	/* Memory for the inode is free'ed in cs_etm_free_traceid_queues () */
+	/* Memory for the inode is freed in cs_etm__free_traceid_queues() */
 	inode = intlist__findnew(traceid_queues_list, trace_chan_id);
 	if (!inode)
 		goto out_free;
@@ -746,27 +724,6 @@ static struct cs_etm_traceid_queue
 	return NULL;
 }
 
-struct cs_etm_packet *cs_etm__etmq_get_packet(struct cs_etm_queue *etmq,
-					      u8 trace_chan_id)
-{
-	struct cs_etm_traceid_queue *tidq;
-
-	tidq = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
-	return tidq ? tidq->packet : NULL;
-}
-
-struct cs_etm_packet_queue
-*cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id)
-{
-	struct cs_etm_traceid_queue *tidq;
-
-	tidq = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
-	if (tidq)
-		return &tidq->packet_queue;
-
-	return NULL;
-}
-
 static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
 				struct cs_etm_traceid_queue *tidq)
 {
@@ -949,7 +906,7 @@ static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
 		priv = (uintptr_t)inode->priv;
 		idx = priv;
 
-		/* Free this traceid_queue from the array */
+		/* Free this decode context from the array */
 		tidq = etmq->traceid_queues[idx];
 		thread__zput(tidq->frontend_thread);
 		thread__zput(tidq->decode_thread);
@@ -1590,10 +1547,9 @@ static inline u64 cs_etm__resolve_sample_time(struct cs_etm_queue *etmq,
 					       struct cs_etm_traceid_queue *tidq)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
-	struct cs_etm_packet_queue *packet_queue = &tidq->packet_queue;
 
 	if (etm->has_virtual_ts)
-		return packet_queue->cs_timestamp;
+		return tidq->cs_timestamp;
 
 	/*
 	 * Timestamps were disabled or no virtual TS. All samples are assigned
@@ -2619,14 +2575,10 @@ static int cs_etm__process_traceid_queue(struct cs_etm_queue *etmq,
 					 struct cs_etm_traceid_queue *tidq)
 {
 	int ret;
-	struct cs_etm_packet_queue *packet_queue;
-
-	packet_queue = &tidq->packet_queue;
 
 	/* Process each packet in this chunk */
 	while (1) {
-		ret = cs_etm_decoder__get_packet(packet_queue,
-						 tidq->packet);
+		ret = cs_etm_decoder__get_packet(tidq, tidq->packet);
 		if (ret <= 0)
 			/*
 			 * Stop processing this chunk on
@@ -2706,6 +2658,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 	struct auxtrace_queue *queue;
 	struct cs_etm_queue *etmq;
 	struct cs_etm_traceid_queue *tidq;
+	u64 queue_time;
 
 	while (1) {
 		if (!etm->heap.heap_cnt)
@@ -2719,13 +2672,10 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 		etmq = queue->priv;
 
 		/* Don't go further than the trace timestamp or collection time */
-		if (etm->has_virtual_ts) {
-			if (etm->heap.heap_array[0].ordinal >= timestamp)
-				break;
-		} else {
-			if (etmq->buffer->time >= timestamp)
-				break;
-		}
+		queue_time = etm->has_virtual_ts ? etm->heap.heap_array[0].ordinal :
+						   etmq->buffer->time;
+		if (queue_time >= timestamp)
+			break;
 
 		/*
 		 * Remove the top entry from the heap since we are about
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index c757a1fb465d..1cbc8bc0aa06 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -193,11 +193,6 @@ struct cs_etm_packet {
 	pid_t tid;
 };
 
-struct cs_etm_packet_queue {
-	u32 packet_count;
-	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
-};
-
 #define KiB(x) ((x) * 1024)
 #define MiB(x) ((x) * 1024 * 1024)
 
@@ -247,6 +242,34 @@ enum cs_etm_pid_fmt {
 
 #ifdef HAVE_CSTRACE_SUPPORT
 #include <opencsd/ocsd_if_types.h>
+
+/*
+ * Decode context for a single trace ID stream. In a decode tree there is one
+ * of these for each stream.
+ */
+struct cs_etm_traceid_queue {
+	u8 trace_chan_id;
+	u64 period_instructions;
+	u64 kernel_start;
+	union perf_event *event_buf;
+	unsigned int br_stack_sz;
+	struct branch_stack *last_branch;
+	struct ip_callchain *callchain;
+	struct cs_etm_packet *prev_packet;
+	struct cs_etm_packet *packet;
+	u32 packet_count;
+	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
+
+	struct thread *decode_thread;
+	ocsd_ex_level decode_el;
+
+	/*
+	 * Samples use the EL saved in their source packet. A branch sample
+	 * cannot change thread, so the thread is kept in the frontend context.
+	 */
+	struct thread *frontend_thread;
+};
+
 int cs_etm__get_cpu(struct cs_etm_queue *etmq, u8 trace_chan_id, int *cpu);
 enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq);
 int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
@@ -255,10 +278,8 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
 void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id);
-struct cs_etm_packet *cs_etm__etmq_get_packet(struct cs_etm_queue *etmq,
-					      u8 trace_chan_id);
-struct cs_etm_packet_queue
-*cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id);
+struct cs_etm_traceid_queue
+*cs_etm__etmq_get_traceid_queue(struct cs_etm_queue *etmq, u8 trace_chan_id);
 int cs_etm__process_auxtrace_info_full(union perf_event *event __maybe_unused,
 				       struct perf_session *session __maybe_unused);
 u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timestamp);

-- 
2.43.0


