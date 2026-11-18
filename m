Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B149606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjY/H654;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F+kgg9jU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=09YtNyur5coEm4SG9fX74YCl3EjC51M4HRFNtRC5ark=; b=bjY/H654KnD6et
	0fh2P6Tp0Syw+9KUpTkz5wQYXAZeYBHzUuGOV/GVU3c2qdeuoCNkikT96Xrgk3FToTCYpYSU5+sIc
	vouH7yHLFxs8jQl6bRWMumdeHGkjsu5Z6gjIxJIQyelZEdZGwsnQvV+Q0y9VPSNeDhYBXWW/N4zse
	bZ/nfgD5+zWWpB3pn6QOhoYgwrDBUr+/vgr+XRQXd+CcNKgjLokG5SSOjt1xnsm6CodtjO6kMV6WE
	DjPu65FCP2h4gtn6HGNdqTFASSe4+V1TS+/jj75LyWs5O0d+fUiAspJzsJYieOt0+DtTkx1E6nhX/
	eTFmv449WecjphpT5Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZB-00000009VME-47yW;
	Wed, 18 Nov 2026 16:31:25 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY3-00000009UP9-3irz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1080065f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019413; x=1795624213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09YtNyur5coEm4SG9fX74YCl3EjC51M4HRFNtRC5ark=;
        b=F+kgg9jUsxeYESl13J9RzDh+N3U2BwCqh2WajOZ7rcpYX2ss4NyjhBuS/7VDGasUmy
         +DFo/Rq/X2Z0dsrdFVjNgHUH8iZ5YQHdoPxhvJZNKJYj6Zld3QJmGgavnYBf2qioOa7T
         zDdMzabOoOAWzJ5jhThfXdO5Mwh4vNtLoOeR9QdhWAcHacebfQpv1aIm96kS2DhI5gnU
         rKCal6S/kF+PBwubM25Zsqd1zJY8mvO9+UgC4bpOPXdT5/WcVWeVPtqJ4DHlEz3273gJ
         c5uA1rwMQkWwHRquw6V9NcPJ9CvYqxKv0HUnVH3WJ+lx91Uw95oLv+V+YYiKx5Sl3yRb
         CyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019413; x=1795624213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09YtNyur5coEm4SG9fX74YCl3EjC51M4HRFNtRC5ark=;
        b=dz2AU35ImkkRCHvmKxpv9TDUEMkuwFmU1saHbfwiJ5Zv89L1lSuzW1Hle2uUmy8iPt
         IkG5hWSAXA63LHYaG12B/pytf1KtcjRFm4n088rxDKTj3mRB9tmpddY+TedV27a++qYE
         SS0iJJS0Y/I5xI8LYbKHep8J67RwHkU6IV4YaOKPfKkPg4oXxakRyh9xck5IznK6Lpr8
         qEf4v5ixzbf6q6UUIaOagNHau6L8TDrVRotl7V9YE5daxKUsA7/oB88BbLFM6gkAW+HH
         ihMy3d+oB8yt32rHHwPf31Ik9otJbJJV5iAio0wOYRAK+WDoS6P2IOnSPUZevx8Hj9qj
         tqBw==
X-Forwarded-Encrypted: i=1; AL+hErEwNBMML8fNIZfyvQa9N6wkX0LohrGQNuTvYqSPF3w5mWI/2w1DI3DjqIDRPeBcDH1Yu4i8siB6eeXXMpYYyyGk@lists.infradead.org
X-Gm-Message-State: APuU4Z9uD0rD1e1wQVdG5D1oZjAzYDabkNGBqe4d3QqAH8rXH36invZN
	o9t8gt/lQ7S7CEOAsnukytA4dPCn0mB7amh7qQ2jHJ3SJ0b59qvIJJFbWuiBYtQ/uvY=
X-Gm-Gg: AZFdTZf/vhQ6tRxBJaMq2xEuPHepY4zQP2+8g9tO9ymOmbQ5CHm365pfflG23Ol2jB+
	QOcwkGhfKZHa4aV9X2apLHcUSiLw4pCXTW7lYgpbbDVNUeVlkuZ6TyQc23UjdmEc7ZwN570AT0f
	whWLDyuJx0lGfJhPThQJmu165eu6uGov8Ws0MgZh8bOIfR+/TWacRVpfOajzfR9ASSPU7lcuiJP
	KTAbiflDv5mWMTd7qTrYMcay7tQyhDql8aC6SIqywd9crfsTqKOBfaizTcvg2bmGuLe+4W7Sucy
	6qgYNpp1Fc0hWTA5tV7ZamIMo2RdiCKGaFpWLMg1ee49f7VQBLkAByu1DbZpFyUSk3pEn/370eI
	0HJyO6uxHqKoVlw8Vdml04kzn4DI/hKalWlAU9wcKM6wwDOBvCQDbZoPz9kejfjfQ8qsp21r97p
	v7qDvlAKUl2KBS3NCyAFJRQL78u5f3lXOSkQo06v9EMdBERCk/ZpcDMF+wtDUOK0VHganv/mXU/
	HL8vCPcZiEC4lOjneidyQiQdjRmPOtYb+bJDWlbzB+AGRCmH/MPsNUlcmZNUeyJLoSGt9a6jmqO
	fnSs1GJiZMXFRNkypJN1YKYli676ECcw
X-Received: by 2002:a05:6000:4812:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-4a63ca2abe5mr6511705f8f.45.1795019413199;
        Wed, 18 Nov 2026 08:30:13 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:12 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:45 +0000
Subject: [PATCH 23/34] perf cs-etm: Rename tidq variables to tidc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-23-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083016_494188_4B1A3A30 
X-CRM114-Status: GOOD (  19.63  )
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

Use tidc for variables that point at the new trace ID context struct.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  52 +--
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
 tools/perf/util/cs-etm.c                        | 402 ++++++++++++------------
 3 files changed, 228 insertions(+), 228 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3e3ec30bc7b3..7a1d50ca5949 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -87,17 +87,17 @@ int cs_etm_decoder__reset(struct cs_etm_decoder *decoder)
 	return 0;
 }
 
-int cs_etm_decoder__get_packet(struct cs_etm_traceid_ctxt *packet_queue,
+int cs_etm_decoder__get_packet(struct cs_etm_traceid_ctxt *tidc,
 			       struct cs_etm_packet *packet)
 {
-	if (!packet_queue || !packet)
+	if (!tidc || !packet)
 		return -EINVAL;
 
 	/* Nothing to do, might as well just return */
-	if (packet_queue->packet_count == 0)
+	if (tidc->packet_count == 0)
 		return 0;
 
-	packet_queue->packet_count--;
+	tidc->packet_count--;
 	return 1;
 }
 
@@ -228,7 +228,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 				  const uint8_t trace_chan_id,
 				  const ocsd_trc_index_t indx)
 {
-	struct cs_etm_traceid_ctxt *packet_queue;
+	struct cs_etm_traceid_ctxt *tidc;
 	u64 converted_timestamp;
 
 	/* Ignore trace timestamps when unavailable or disabled by --itrace=Z. */
@@ -236,8 +236,8 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 		return OCSD_RESP_CONT;
 
 	/* First get the decode context for this traceID */
-	packet_queue = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-	if (!packet_queue)
+	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
+	if (!tidc)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
 	/*
@@ -254,7 +254,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 		return OCSD_RESP_CONT;
 	}
 
-	packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, converted_timestamp);
+	tidc->cs_timestamp = max(tidc->cs_timestamp, converted_timestamp);
 
 	/* Tell the front end which decode context needs attention */
 	cs_etm__etmq_set_traceid_ctxt_ready(etmq, trace_chan_id);
@@ -293,7 +293,7 @@ cs_etm_decoder__get_isa(const ocsd_generic_trace_elem *elem)
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
-			      struct cs_etm_traceid_ctxt *packet_queue,
+			      struct cs_etm_traceid_ctxt *tidc,
 			      const ocsd_generic_trace_elem *elem,
 			      const u8 trace_chan_id,
 			      enum cs_etm_sample_type sample_type)
@@ -301,17 +301,17 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	struct cs_etm_packet *packet;
 	int cpu;
 
-	if (packet_queue->packet_count)
+	if (tidc->packet_count)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
 	if (cs_etm__get_cpu(etmq, trace_chan_id, &cpu) < 0)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	packet = packet_queue->packet;
+	packet = tidc->packet;
 	if (!packet)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	packet_queue->packet_count++;
+	tidc->packet_count++;
 	packet->sample_type = sample_type;
 	packet->isa = cs_etm_decoder__get_isa(elem);
 	packet->cpu = cpu;
@@ -335,19 +335,19 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
-			     struct cs_etm_traceid_ctxt *packet_queue,
+			     struct cs_etm_traceid_ctxt *tidc,
 			     const ocsd_generic_trace_elem *elem,
 			     const uint8_t trace_chan_id)
 {
 	int ret = 0;
 	struct cs_etm_packet *packet;
 
-	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, elem,
+	ret = cs_etm_decoder__buffer_packet(etmq, tidc, elem,
 					    trace_chan_id, CS_ETM_RANGE);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = packet_queue->packet;
+	packet = tidc->packet;
 
 	packet->start_addr = elem->st_addr;
 	packet->end_addr = elem->en_addr;
@@ -441,7 +441,7 @@ cs_etm_decoder__buffer_exception_ret(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
-			struct cs_etm_traceid_ctxt *packet_queue,
+			struct cs_etm_traceid_ctxt *tidc,
 			const ocsd_generic_trace_elem *elem,
 			const uint8_t trace_chan_id)
 {
@@ -472,12 +472,12 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 				elem->context.exception_level, tid))
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, elem,
+	ret = cs_etm_decoder__buffer_packet(etmq, tidc, elem,
 					    trace_chan_id, CS_ETM_CONTEXT);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = packet_queue->packet;
+	packet = tidc->packet;
 	packet->tid = tid;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
@@ -495,10 +495,10 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	ocsd_gen_trc_elem_t type;
 	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
 	struct cs_etm_queue *etmq = decoder->data;
-	struct cs_etm_traceid_ctxt *packet_queue;
+	struct cs_etm_traceid_ctxt *tidc;
 
-	packet_queue = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-	if (!packet_queue)
+	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
+	if (!tidc)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
 	type = elem->elem_type;
@@ -507,23 +507,23 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	    type == OCSD_GEN_TRC_ELEM_NO_SYNC ||
 	    type == OCSD_GEN_TRC_ELEM_TRACE_ON ||
 	    type == OCSD_GEN_TRC_ELEM_ADDR_NACC)
-		resp = cs_etm_decoder__buffer_discontinuity(etmq, packet_queue,
+		resp = cs_etm_decoder__buffer_discontinuity(etmq, tidc,
 							    elem, trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_INSTR_RANGE)
-		resp = cs_etm_decoder__buffer_range(etmq, packet_queue, elem,
+		resp = cs_etm_decoder__buffer_range(etmq, tidc, elem,
 						    trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION)
-		resp = cs_etm_decoder__buffer_exception(etmq, packet_queue, elem,
+		resp = cs_etm_decoder__buffer_exception(etmq, tidc, elem,
 							trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION_RET)
-		resp = cs_etm_decoder__buffer_exception_ret(etmq, packet_queue,
+		resp = cs_etm_decoder__buffer_exception_ret(etmq, tidc,
 							    elem, trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_TIMESTAMP)
 		resp = cs_etm_decoder__do_hard_timestamp(etmq, elem,
 							 trace_chan_id,
 							 indx);
 	else if (type == OCSD_GEN_TRC_ELEM_PE_CONTEXT)
-		resp = cs_etm_decoder__set_tid(etmq, packet_queue,
+		resp = cs_etm_decoder__set_tid(etmq, tidc,
 					       elem, trace_chan_id);
 
 	return resp;
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 8624f48d696f..f29f286f1d8b 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -102,7 +102,7 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
-int cs_etm_decoder__get_packet(struct cs_etm_traceid_ctxt *packet_queue,
+int cs_etm_decoder__get_packet(struct cs_etm_traceid_ctxt *tidc,
 			       struct cs_etm_packet *packet);
 
 int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index b49bf606ffeb..e2e84561c0c9 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -567,7 +567,7 @@ void cs_etm__etmq_set_traceid_ctxt_ready(struct cs_etm_queue *etmq,
 static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 				      u8 *trace_chan_id)
 {
-	struct cs_etm_traceid_ctxt *tidq;
+	struct cs_etm_traceid_ctxt *tidc;
 
 	if (!etmq->ready_chan_id)
 		return 0;
@@ -575,8 +575,8 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (trace_chan_id)
 		*trace_chan_id = etmq->ready_chan_id;
 
-	tidq = cs_etm__etmq_get_traceid_ctxt(etmq, etmq->ready_chan_id);
-	if (!tidq)
+	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, etmq->ready_chan_id);
+	if (!tidc)
 		return 0;
 
 	/* Acknowledge pending status */
@@ -590,11 +590,11 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 		return etmq->buffer->time;
 
 	/* Use the last trace timestamp, or zero if none has been found yet. */
-	return tidq->cs_timestamp;
+	return tidc->cs_timestamp;
 }
 
 static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
-				      struct cs_etm_traceid_ctxt *tidq,
+				      struct cs_etm_traceid_ctxt *tidc,
 				      u8 trace_chan_id)
 {
 	int rc = -ENOMEM;
@@ -602,21 +602,21 @@ static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
 	struct cs_etm_auxtrace *etm = etmq->etm;
 
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
-	tidq->trace_chan_id = trace_chan_id;
-	tidq->decode_el = ocsd_EL_unknown;
-	tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host, -1,
+	tidc->trace_chan_id = trace_chan_id;
+	tidc->decode_el = ocsd_EL_unknown;
+	tidc->frontend_thread = machine__findnew_thread(&etm->session->machines.host, -1,
 					       queue->tid);
-	tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
+	tidc->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
 					       queue->tid);
-	if (!tidq->frontend_thread || !tidq->decode_thread)
+	if (!tidc->frontend_thread || !tidc->decode_thread)
 		goto out;
 
-	tidq->packet = zalloc(sizeof(struct cs_etm_packet));
-	if (!tidq->packet)
+	tidc->packet = zalloc(sizeof(struct cs_etm_packet));
+	if (!tidc->packet)
 		goto out;
 
-	tidq->prev_packet = zalloc(sizeof(struct cs_etm_packet));
-	if (!tidq->prev_packet)
+	tidc->prev_packet = zalloc(sizeof(struct cs_etm_packet));
+	if (!tidc->prev_packet)
 		goto out_free;
 
 	if (etm->use_thread_stack) {
@@ -624,36 +624,36 @@ static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
 
 		sz += etm->synth_opts.last_branch_sz *
 		      sizeof(struct branch_entry);
-		tidq->last_branch = zalloc(sz);
-		if (!tidq->last_branch)
+		tidc->last_branch = zalloc(sz);
+		if (!tidc->last_branch)
 			goto out_free;
 
-		tidq->br_stack_sz = etm->synth_opts.last_branch_sz;
+		tidc->br_stack_sz = etm->synth_opts.last_branch_sz;
 	}
 
 	if (etm->synth_opts.callchain) {
 		/* Add 1 to callchain_sz for callchain context */
-		tidq->callchain =
-			zalloc(struct_size(tidq->callchain, ips,
+		tidc->callchain =
+			zalloc(struct_size(tidc->callchain, ips,
 					   etm->synth_opts.callchain_sz + 1));
-		if (!tidq->callchain)
+		if (!tidc->callchain)
 			goto out_free;
 	}
 
-	tidq->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
-	if (!tidq->event_buf)
+	tidc->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
+	if (!tidc->event_buf)
 		goto out_free;
 
 	return 0;
 
 out_free:
-	zfree(&tidq->callchain);
-	zfree(&tidq->last_branch);
-	zfree(&tidq->prev_packet);
-	zfree(&tidq->packet);
+	zfree(&tidc->callchain);
+	zfree(&tidc->last_branch);
+	zfree(&tidc->prev_packet);
+	zfree(&tidc->packet);
 out:
-	thread__zput(tidq->frontend_thread);
-	thread__zput(tidq->decode_thread);
+	thread__zput(tidc->frontend_thread);
+	thread__zput(tidc->decode_thread);
 	return rc;
 }
 
@@ -663,7 +663,7 @@ struct cs_etm_traceid_ctxt
 	int idx;
 	struct int_node *inode;
 	struct intlist *traceid_ctxts_list = etmq->traceid_ctxts_list;
-	struct cs_etm_traceid_ctxt *tidq, **traceid_ctxts;
+	struct cs_etm_traceid_ctxt *tidc, **traceid_ctxts;
 
 	/*
 	 * Check if a decode context exists for this traceID by looking
@@ -676,11 +676,11 @@ struct cs_etm_traceid_ctxt
 	}
 
 	/* We couldn't find a decode context for this traceID, allocate one */
-	tidq = malloc(sizeof(*tidq));
-	if (!tidq)
+	tidc = malloc(sizeof(*tidc));
+	if (!tidc)
 		return NULL;
 
-	memset(tidq, 0, sizeof(*tidq));
+	memset(tidc, 0, sizeof(*tidc));
 
 	/* Get a valid index for the new decode context */
 	idx = intlist__nr_entries(traceid_ctxts_list);
@@ -692,7 +692,7 @@ struct cs_etm_traceid_ctxt
 	/* Associate this traceID with this index */
 	inode->priv = (void *)(intptr_t)idx;
 
-	if (cs_etm__init_traceid_ctxt(etmq, tidq, trace_chan_id))
+	if (cs_etm__init_traceid_ctxt(etmq, tidc, trace_chan_id))
 		goto out_free;
 
 	/* Grow the traceid_ctxts array by one unit */
@@ -708,7 +708,7 @@ struct cs_etm_traceid_ctxt
 	if (!traceid_ctxts)
 		goto out_free;
 
-	traceid_ctxts[idx] = tidq;
+	traceid_ctxts[idx] = tidc;
 	etmq->traceid_ctxts = traceid_ctxts;
 
 	return etmq->traceid_ctxts[idx];
@@ -719,13 +719,13 @@ struct cs_etm_traceid_ctxt
 	 * and delete the memory associated to it.
 	 */
 	intlist__remove(traceid_ctxts_list, inode);
-	free(tidq);
+	free(tidc);
 
 	return NULL;
 }
 
 static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
-				struct cs_etm_traceid_ctxt *tidq)
+				struct cs_etm_traceid_ctxt *tidc)
 {
 	struct cs_etm_packet *tmp;
 
@@ -735,9 +735,9 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
 		 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
 		 * the next incoming packet.
 		 */
-		tmp = tidq->packet;
-		tidq->packet = tidq->prev_packet;
-		tidq->prev_packet = tmp;
+		tmp = tidc->packet;
+		tidc->packet = tidc->prev_packet;
+		tidc->prev_packet = tmp;
 	}
 }
 
@@ -899,7 +899,7 @@ static void cs_etm__free_traceid_ctxts(struct cs_etm_queue *etmq)
 	int idx;
 	uintptr_t priv;
 	struct int_node *inode, *tmp;
-	struct cs_etm_traceid_ctxt *tidq;
+	struct cs_etm_traceid_ctxt *tidc;
 	struct intlist *traceid_ctxts_list = etmq->traceid_ctxts_list;
 
 	intlist__for_each_entry_safe(inode, tmp, traceid_ctxts_list) {
@@ -907,15 +907,15 @@ static void cs_etm__free_traceid_ctxts(struct cs_etm_queue *etmq)
 		idx = priv;
 
 		/* Free this decode context from the array */
-		tidq = etmq->traceid_ctxts[idx];
-		thread__zput(tidq->frontend_thread);
-		thread__zput(tidq->decode_thread);
-		zfree(&tidq->event_buf);
-		zfree(&tidq->callchain);
-		zfree(&tidq->last_branch);
-		zfree(&tidq->prev_packet);
-		zfree(&tidq->packet);
-		zfree(&tidq);
+		tidc = etmq->traceid_ctxts[idx];
+		thread__zput(tidc->frontend_thread);
+		thread__zput(tidc->decode_thread);
+		zfree(&tidc->event_buf);
+		zfree(&tidc->callchain);
+		zfree(&tidc->last_branch);
+		zfree(&tidc->prev_packet);
+		zfree(&tidc->packet);
+		zfree(&tidc);
 
 		/*
 		 * Function intlist__remove() removes the inode from the list
@@ -1163,27 +1163,27 @@ static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
 }
 
 static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
-				       struct cs_etm_traceid_ctxt *tidq,
+				       struct cs_etm_traceid_ctxt *tidc,
 				       struct cs_etm_packet *packet,
 				       u64 address, size_t size, u8 *buffer)
 {
 	return __cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
-				    tidq->frontend_thread);
+				    tidc->frontend_thread);
 }
 
 static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
 				      u64 address, size_t size, u8 *buffer,
 				      const ocsd_mem_space_acc_t mem_space)
 {
-	struct cs_etm_traceid_ctxt *tidq;
+	struct cs_etm_traceid_ctxt *tidc;
 
-	tidq = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-	if (!tidq)
+	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
+	if (!tidc)
 		return 0;
 
 	return __cs_etm__mem_access(etmq, address, size, buffer,
-				    mem_space, tidq->decode_el,
-				    tidq->decode_thread);
+				    mem_space, tidc->decode_el,
+				    tidc->decode_thread);
 }
 
 static struct cs_etm_queue *cs_etm__alloc_queue(void)
@@ -1312,12 +1312,12 @@ static int cs_etm__push_heap_all(struct cs_etm_auxtrace *etm)
 }
 
 static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
-					 struct cs_etm_traceid_ctxt *tidq,
+					 struct cs_etm_traceid_ctxt *tidc,
 					 struct cs_etm_packet *packet, u64 addr)
 {
 	u8 instrBytes[2];
 
-	cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+	cs_etm__frontend_mem_access(etmq, tidc, packet, addr,
 				    ARRAY_SIZE(instrBytes), instrBytes);
 	/*
 	 * T32 instruction size is indicated by bits[15:11] of the first
@@ -1328,12 +1328,12 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
 }
 
 static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
-				     struct cs_etm_traceid_ctxt *tidq,
+				     struct cs_etm_traceid_ctxt *tidc,
 				     struct cs_etm_packet *packet,
 				     u64 addr)
 {
 	if (packet->isa == CS_ETM_ISA_T32)
-		return cs_etm__t32_instr_size(etmq, tidq, packet, addr);
+		return cs_etm__t32_instr_size(etmq, tidc, packet, addr);
 
 	return packet->last_instr_size;
 }
@@ -1364,7 +1364,7 @@ u64 cs_etm__last_executed_instr(const struct cs_etm_packet *packet)
 }
 
 static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
-				     struct cs_etm_traceid_ctxt *tidq,
+				     struct cs_etm_traceid_ctxt *tidc,
 				     struct cs_etm_packet *packet,
 				     u64 offset)
 {
@@ -1375,7 +1375,7 @@ static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
 		return addr + offset * 4;
 
 	while (offset) {
-		addr += cs_etm__instr_size(etmq, tidq, packet, addr);
+		addr += cs_etm__instr_size(etmq, tidc, packet, addr);
 		offset--;
 	}
 	return addr;
@@ -1480,19 +1480,19 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 				       u8 trace_chan_id,
 				       ocsd_ex_level el, pid_t tid)
 {
-	struct cs_etm_traceid_ctxt *tidq;
+	struct cs_etm_traceid_ctxt *tidc;
 	int ret;
 
-	tidq = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-	if (!tidq)
+	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
+	if (!tidc)
 		return -EINVAL;
 
 	ret = cs_etm__etmq_update_thread(etmq, el, tid,
-					 &tidq->decode_thread);
+					 &tidc->decode_thread);
 	if (ret)
 		return ret;
 
-	tidq->decode_el = el;
+	tidc->decode_el = el;
 	return 0;
 }
 
@@ -1502,7 +1502,7 @@ bool cs_etm__has_timestamps(struct cs_etm_queue *etmq)
 }
 
 static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
-			      struct cs_etm_traceid_ctxt *tidq,
+			      struct cs_etm_traceid_ctxt *tidc,
 			      struct cs_etm_packet *packet,
 			      struct perf_sample *sample)
 {
@@ -1515,7 +1515,7 @@ static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
 		return;
 	}
 
-	sample->insn_len = cs_etm__instr_size(etmq, tidq, packet, sample->ip);
+	sample->insn_len = cs_etm__instr_size(etmq, tidc, packet, sample->ip);
 
 	/*
 	 * The instruction length should always fit within sample->insn,
@@ -1529,7 +1529,7 @@ static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
 	if (packet->sample_type == CS_ETM_EXCEPTION && !sample->insn_len)
 		return;
 
-	cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
+	cs_etm__frontend_mem_access(etmq, tidc, packet, sample->ip,
 				    sample->insn_len, (void *)sample->insn);
 }
 
@@ -1544,12 +1544,12 @@ u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timestamp)
 }
 
 static inline u64 cs_etm__resolve_sample_time(struct cs_etm_queue *etmq,
-					       struct cs_etm_traceid_ctxt *tidq)
+					       struct cs_etm_traceid_ctxt *tidc)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 
 	if (etm->has_virtual_ts)
-		return tidq->cs_timestamp;
+		return tidc->cs_timestamp;
 
 	/*
 	 * Timestamps were disabled or no virtual TS. All samples are assigned
@@ -1571,7 +1571,7 @@ static bool cs_etm__packet_has_branch(struct cs_etm_packet *packet)
 }
 
 static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
-				    struct cs_etm_traceid_ctxt *tidq)
+				    struct cs_etm_traceid_ctxt *tidc)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	u64 from, to;
@@ -1580,67 +1580,67 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
 	if (!etm->synth_opts.branches && !etm->synth_opts.instructions)
 		return;
 
-	if (!cs_etm__packet_has_branch(tidq->prev_packet))
+	if (!cs_etm__packet_has_branch(tidc->prev_packet))
 		return;
 
 	if (etmq->etm->use_thread_stack) {
-		from = cs_etm__last_executed_instr(tidq->prev_packet);
-		to = cs_etm__first_executed_instr(tidq->packet);
+		from = cs_etm__last_executed_instr(tidc->prev_packet);
+		to = cs_etm__first_executed_instr(tidc->packet);
 
-		size = cs_etm__instr_size(etmq, tidq, tidq->prev_packet, from);
+		size = cs_etm__instr_size(etmq, tidc, tidc->prev_packet, from);
 
 		/* Enable callchain so thread stack entry can be allocated */
-		thread_stack__event(tidq->frontend_thread, tidq->prev_packet->cpu,
-				    tidq->prev_packet->flags, from, to, size,
+		thread_stack__event(tidc->frontend_thread, tidc->prev_packet->cpu,
+				    tidc->prev_packet->flags, from, to, size,
 				    etmq->buffer->buffer_nr + 1,
 				    etmq->etm->use_callchain,
-				    tidq->br_stack_sz, 0);
+				    tidc->br_stack_sz, 0);
 	} else {
-		thread_stack__set_trace_nr(tidq->frontend_thread,
-					   tidq->prev_packet->cpu,
+		thread_stack__set_trace_nr(tidc->frontend_thread,
+					   tidc->prev_packet->cpu,
 					   etmq->buffer->buffer_nr + 1);
 	}
 }
 
 static void cs_etm__sample_branch_stack(struct cs_etm_auxtrace *etm,
-					struct cs_etm_traceid_ctxt *tidq,
+					struct cs_etm_traceid_ctxt *tidc,
 					struct perf_sample *sample)
 {
 	if (etm->synth_opts.last_branch) {
-		thread_stack__br_sample(tidq->frontend_thread, tidq->packet->cpu,
-					tidq->last_branch, tidq->br_stack_sz);
-		sample->branch_stack = tidq->last_branch;
+		thread_stack__br_sample(tidc->frontend_thread, tidc->packet->cpu,
+					tidc->last_branch, tidc->br_stack_sz);
+		sample->branch_stack = tidc->last_branch;
 	}
 
 	if (etm->synth_opts.callchain) {
-		if (tidq->kernel_start)
-			thread_stack__sample(tidq->frontend_thread,
-					     tidq->packet->cpu,
-					     tidq->callchain,
+		if (tidc->kernel_start)
+			thread_stack__sample(tidc->frontend_thread,
+					     tidc->packet->cpu,
+					     tidc->callchain,
 					     etm->synth_opts.callchain_sz + 1,
-					     sample->ip, tidq->kernel_start);
+					     sample->ip, tidc->kernel_start);
 		else
 			/*
 			 * Clear the callchain when the kernel start address is
 			 * not available yet. The empty callchain can then be
 			 * consumed by cs_etm__inject_event().
 			 */
-			memset(tidq->callchain, 0,
-			       struct_size(tidq->callchain, ips,
+			memset(tidc->callchain, 0,
+			       struct_size(tidc->callchain, ips,
 					   etm->synth_opts.callchain_sz + 1));
 
-		sample->callchain = tidq->callchain;
+		sample->callchain = tidc->callchain;
 	}
 }
 
 static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
-					    struct cs_etm_traceid_ctxt *tidq,
+					    struct cs_etm_traceid_ctxt *tidc,
 					    struct cs_etm_packet *packet,
 					    u64 addr, u64 period)
 {
 	int ret = 0;
 	struct cs_etm_auxtrace *etm = etmq->etm;
-	union perf_event *event = tidq->event_buf;
+	union perf_event *event = tidc->event_buf;
 	struct perf_sample sample;
 
 	perf_sample__init(&sample, /*all=*/true);
@@ -1649,20 +1649,20 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 	event->sample.header.size = sizeof(struct perf_event_header);
 
 	/* Set time field based on etm auxtrace config. */
-	sample.time = cs_etm__resolve_sample_time(etmq, tidq);
+	sample.time = cs_etm__resolve_sample_time(etmq, tidc);
 
 	sample.ip = addr;
-	sample.pid = thread__pid(tidq->frontend_thread);
-	sample.tid = thread__tid(tidq->frontend_thread);
+	sample.pid = thread__pid(tidc->frontend_thread);
+	sample.tid = thread__tid(tidc->frontend_thread);
 	sample.id = etmq->etm->instructions_id;
 	sample.stream_id = etmq->etm->instructions_id;
 	sample.period = period;
 	sample.cpu = packet->cpu;
-	sample.flags = tidq->prev_packet->flags;
+	sample.flags = tidc->prev_packet->flags;
 	sample.cpumode = event->sample.header.misc;
 
-	cs_etm__copy_insn(etmq, tidq, packet, &sample);
-	cs_etm__sample_branch_stack(etm, tidq, &sample);
+	cs_etm__copy_insn(etmq, tidc, packet, &sample);
+	cs_etm__sample_branch_stack(etm, tidc, &sample);
 
 	if (etm->synth_opts.inject) {
 		ret = cs_etm__inject_event(etm, event, &sample,
@@ -1683,9 +1683,9 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__synth_last_instruction_sample(struct cs_etm_queue *etmq,
-						 struct cs_etm_traceid_ctxt *tidq)
+						 struct cs_etm_traceid_ctxt *tidc)
 {
-	struct cs_etm_packet *packet = tidq->prev_packet;
+	struct cs_etm_packet *packet = tidc->prev_packet;
 	int ret;
 
 	if (!etmq->etm->synth_opts.last_branch ||
@@ -1696,11 +1696,11 @@ static int cs_etm__synth_last_instruction_sample(struct cs_etm_queue *etmq,
 	if (packet->sample_type != CS_ETM_RANGE || !packet->instr_count)
 		return 0;
 
-	ret = cs_etm__synth_instruction_sample(etmq, tidq, packet,
+	ret = cs_etm__synth_instruction_sample(etmq, tidc, packet,
 					       cs_etm__last_executed_instr(packet),
-					       tidq->period_instructions);
+					       tidc->period_instructions);
 	if (!ret)
-		tidq->period_instructions = 0;
+		tidc->period_instructions = 0;
 
 	return ret;
 }
@@ -1710,12 +1710,12 @@ static int cs_etm__synth_last_instruction_sample(struct cs_etm_queue *etmq,
  * and the next taken branch. Generate sample accordingly.
  */
 static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
-				       struct cs_etm_traceid_ctxt *tidq)
+				       struct cs_etm_traceid_ctxt *tidc)
 {
 	int ret = 0;
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	struct perf_sample sample;
-	union perf_event *event = tidq->event_buf;
+	union perf_event *event = tidc->event_buf;
 
 	struct dummy_branch_stack {
 		u64			nr;
@@ -1727,41 +1727,41 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
 	if (!etm->synth_opts.branches)
 		return 0;
 
-	if (!cs_etm__packet_has_branch(tidq->prev_packet) &&
-	    !(tidq->prev_packet->flags & (PERF_IP_FLAG_TRACE_BEGIN |
+	if (!cs_etm__packet_has_branch(tidc->prev_packet) &&
+	    !(tidc->prev_packet->flags & (PERF_IP_FLAG_TRACE_BEGIN |
 					  PERF_IP_FLAG_TRACE_END)))
 		return 0;
 
 	if (etm->branches_filter &&
-		!(etm->branches_filter & tidq->prev_packet->flags))
+		!(etm->branches_filter & tidc->prev_packet->flags))
 		return 0;
 
 	perf_sample__init(&sample, /*all=*/true);
-	ip = cs_etm__last_executed_instr(tidq->prev_packet);
+	ip = cs_etm__last_executed_instr(tidc->prev_packet);
 
 	event->sample.header.type = PERF_RECORD_SAMPLE;
 	event->sample.header.misc = cs_etm__cpu_mode(etmq, ip,
-						     tidq->prev_packet->el);
+						     tidc->prev_packet->el);
 	event->sample.header.size = sizeof(struct perf_event_header);
 
 	/* Set time field based on etm auxtrace config. */
-	sample.time = cs_etm__resolve_sample_time(etmq, tidq);
+	sample.time = cs_etm__resolve_sample_time(etmq, tidc);
 
 	sample.ip = ip;
-	sample.pid = thread__pid(tidq->frontend_thread);
-	sample.tid = thread__tid(tidq->frontend_thread);
-	sample.addr = cs_etm__first_executed_instr(tidq->packet);
+	sample.pid = thread__pid(tidc->frontend_thread);
+	sample.tid = thread__tid(tidc->frontend_thread);
+	sample.addr = cs_etm__first_executed_instr(tidc->packet);
 	sample.id = etmq->etm->branches_id;
 	sample.stream_id = etmq->etm->branches_id;
 	sample.period = 1;
-	sample.cpu = tidq->packet->cpu;
-	sample.flags = tidq->prev_packet->flags;
+	sample.cpu = tidc->packet->cpu;
+	sample.flags = tidc->prev_packet->flags;
 	sample.cpumode = event->sample.header.misc;
 
-	if (tidq->prev_packet->sample_type == CS_ETM_EXCEPTION)
-		sample.ret_addr = tidq->prev_packet->pref_ret_addr;
+	if (tidc->prev_packet->sample_type == CS_ETM_EXCEPTION)
+		sample.ret_addr = tidc->prev_packet->pref_ret_addr;
 
-	cs_etm__copy_insn(etmq, tidq, tidq->prev_packet, &sample);
+	cs_etm__copy_insn(etmq, tidc, tidc->prev_packet, &sample);
 
 	/*
 	 * perf report cannot handle events without a branch stack
@@ -1879,21 +1879,21 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
 }
 
 static int cs_etm__sample(struct cs_etm_queue *etmq,
-			  struct cs_etm_traceid_ctxt *tidq)
+			  struct cs_etm_traceid_ctxt *tidc)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
 	u64 instrs_prev;
 
 	/* Get instructions remainder from previous packet */
-	instrs_prev = tidq->period_instructions;
+	instrs_prev = tidc->period_instructions;
 
-	tidq->period_instructions += tidq->packet->instr_count;
+	tidc->period_instructions += tidc->packet->instr_count;
 
-	cs_etm__add_stack_event(etmq, tidq);
+	cs_etm__add_stack_event(etmq, tidc);
 
 	if (etm->synth_opts.instructions &&
-	    tidq->period_instructions >= etm->instructions_sample_period) {
+	    tidc->period_instructions >= etm->instructions_sample_period) {
 		/*
 		 * Emit instruction sample periodically
 		 * TODO: allow period to be defined in cycles and clock time
@@ -1916,7 +1916,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 		 *            |                                  |
 		 *            \---------------- -----------------/
 		 *                             V
-		 *                 tidq->packet->instr_count
+		 *                 tidc->packet->instr_count
 		 *
 		 * Instrs Sample(n...) are the synthesised samples occurring
 		 * every etm->instructions_sample_period instructions - as
@@ -1924,7 +1924,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 		 * last sample before the current etm packet, n+1 to n+3
 		 * samples are generated from the current etm packet.
 		 *
-		 * tidq->packet->instr_count represents the number of
+		 * tidc->packet->instr_count represents the number of
 		 * instructions in the current etm packet.
 		 *
 		 * Period instructions (Pi) contains the number of
@@ -1938,7 +1938,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 		 * sample(n+1); sample(n+2) and sample(n+3) consume the
 		 * instructions with sample period.  After sample(n+3), the rest
 		 * instructions will be used by later packet and it is assigned
-		 * to tidq->period_instructions for next round calculation.
+		 * to tidc->period_instructions for next round calculation.
 		 */
 
 		/*
@@ -1949,7 +1949,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 		u64 offset = etm->instructions_sample_period - instrs_prev;
 		u64 addr;
 
-		while (tidq->period_instructions >=
+		while (tidc->period_instructions >=
 				etm->instructions_sample_period) {
 			/*
 			 * Calculate the address of the sampled instruction (-1
@@ -1957,33 +1957,33 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 			 * been executed, but PC has not advanced to next
 			 * instruction)
 			 */
-			addr = cs_etm__instr_addr(etmq, tidq, tidq->packet,
+			addr = cs_etm__instr_addr(etmq, tidc, tidc->packet,
 						  offset - 1);
 			ret = cs_etm__synth_instruction_sample(
-				etmq, tidq, tidq->packet, addr,
+				etmq, tidc, tidc->packet, addr,
 				etm->instructions_sample_period);
 			if (ret)
 				return ret;
 
 			offset += etm->instructions_sample_period;
-			tidq->period_instructions -=
+			tidc->period_instructions -=
 				etm->instructions_sample_period;
 		}
 	}
 
-	ret = cs_etm__synth_branch_sample(etmq, tidq);
+	ret = cs_etm__synth_branch_sample(etmq, tidc);
 	if (ret)
 		return ret;
 
-	cs_etm__packet_swap(etm, tidq);
+	cs_etm__packet_swap(etm, tidc);
 
 	return 0;
 }
 
 static int cs_etm__context(struct cs_etm_queue *etmq,
-			   struct cs_etm_traceid_ctxt *tidq)
+			   struct cs_etm_traceid_ctxt *tidc)
 {
-	ocsd_ex_level el = tidq->packet->el;
+	ocsd_ex_level el = tidc->packet->el;
 	struct machine *machine;
 	int ret;
 
@@ -1993,72 +1993,72 @@ static int cs_etm__context(struct cs_etm_queue *etmq,
 		goto err;
 	}
 
-	tidq->kernel_start = machine__kernel_start(machine);
+	tidc->kernel_start = machine__kernel_start(machine);
 
-	ret = cs_etm__etmq_update_thread(etmq, el, tidq->packet->tid,
-					 &tidq->frontend_thread);
+	ret = cs_etm__etmq_update_thread(etmq, el, tidc->packet->tid,
+					 &tidc->frontend_thread);
 	if (ret)
 		goto err;
 
 	return 0;
 
 err:
-	thread__zput(tidq->frontend_thread);
-	tidq->kernel_start = 0;
+	thread__zput(tidc->frontend_thread);
+	tidc->kernel_start = 0;
 	return ret;
 }
 
 static int cs_etm__exception(struct cs_etm_queue *etmq,
-			     struct cs_etm_traceid_ctxt *tidq)
+			     struct cs_etm_traceid_ctxt *tidc)
 {
-	struct cs_etm_packet *packet = tidq->packet;
+	struct cs_etm_packet *packet = tidc->packet;
 
 	/*
 	 * Resolve the preceding branch without adding instructions, then keep
 	 * this exception as prev_packet until its destination is known.
 	 */
 	if (packet->start_addr != CS_ETM_INVAL_ADDR)
-		return cs_etm__sample(etmq, tidq);
+		return cs_etm__sample(etmq, tidc);
 
 	/* Fall back to attributing the exception to the preceding range. */
-	if (tidq->prev_packet->sample_type == CS_ETM_RANGE) {
-		tidq->prev_packet->flags = packet->flags;
-		tidq->prev_packet->last_instr_taken_branch = true;
+	if (tidc->prev_packet->sample_type == CS_ETM_RANGE) {
+		tidc->prev_packet->flags = packet->flags;
+		tidc->prev_packet->last_instr_taken_branch = true;
 	}
 
 	return 0;
 }
 
 static int cs_etm__flush(struct cs_etm_queue *etmq,
-			 struct cs_etm_traceid_ctxt *tidq)
+			 struct cs_etm_traceid_ctxt *tidc)
 {
 	int err = 0;
 	struct cs_etm_auxtrace *etm = etmq->etm;
 
 	/* Handle start tracing packet */
-	if (tidq->prev_packet->sample_type == CS_ETM_EMPTY)
+	if (tidc->prev_packet->sample_type == CS_ETM_EMPTY)
 		goto swap_packet;
 
-	err = cs_etm__synth_last_instruction_sample(etmq, tidq);
+	err = cs_etm__synth_last_instruction_sample(etmq, tidc);
 	if (err)
 		return err;
 
-	err = cs_etm__synth_branch_sample(etmq, tidq);
+	err = cs_etm__synth_branch_sample(etmq, tidc);
 	if (err)
 		return err;
 
 swap_packet:
-	cs_etm__packet_swap(etm, tidq);
+	cs_etm__packet_swap(etm, tidc);
 
 	/* Reset last branches after flush the trace */
 	if (etm->use_thread_stack)
-		thread_stack__flush(tidq->frontend_thread);
+		thread_stack__flush(tidc->frontend_thread);
 
 	return err;
 }
 
 static int cs_etm__end_block(struct cs_etm_queue *etmq,
-			     struct cs_etm_traceid_ctxt *tidq)
+			     struct cs_etm_traceid_ctxt *tidc)
 {
 	/*
 	 * It has no new packet coming and 'etmq->packet' contains the stale
@@ -2069,7 +2069,7 @@ static int cs_etm__end_block(struct cs_etm_queue *etmq,
 	 * event for the branches left in the circular buffer at the end of
 	 * the trace.
 	 */
-	return cs_etm__synth_last_instruction_sample(etmq, tidq);
+	return cs_etm__synth_last_instruction_sample(etmq, tidc);
 }
 
 static int cs_etm__flush_stack_cb(struct thread *thread,
@@ -2159,20 +2159,20 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 		struct int_node *inode;
 
 		intlist__for_each_entry(inode, etmq->traceid_list) {
-			struct cs_etm_traceid_ctxt *tidq;
+			struct cs_etm_traceid_ctxt *tidc;
 
-			tidq = cs_etm__etmq_get_traceid_ctxt(etmq, inode->i);
-			if (!tidq)
+			tidc = cs_etm__etmq_get_traceid_ctxt(etmq, inode->i);
+			if (!tidc)
 				return -ENOMEM;
-			if (thread__tid(tidq->decode_thread) == etmq->buffer->tid)
+			if (thread__tid(tidc->decode_thread) == etmq->buffer->tid)
 				continue;
 
-			thread__zput(tidq->frontend_thread);
-			thread__zput(tidq->decode_thread);
-			tidq->frontend_thread = machine__findnew_thread(
+			thread__zput(tidc->frontend_thread);
+			thread__zput(tidc->decode_thread);
+			tidc->frontend_thread = machine__findnew_thread(
 				&etm->session->machines.host, -1,
 				etmq->buffer->tid);
-			tidq->decode_thread = machine__findnew_thread(
+			tidc->decode_thread = machine__findnew_thread(
 				&etm->session->machines.host, -1,
 				etmq->buffer->tid);
 		}
@@ -2183,7 +2183,7 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 
 /* Check whether the instruction before ret_addr is an SVC. */
 static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
-				 struct cs_etm_traceid_ctxt *tidq,
+				 struct cs_etm_traceid_ctxt *tidc,
 				 struct cs_etm_packet *packet, u64 ret_addr)
 {
 	/* Initialise to keep compiler happy */
@@ -2206,7 +2206,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * so below only read 2 bytes as instruction size for T32.
 		 */
 		addr = ret_addr - 2;
-		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+		cs_etm__frontend_mem_access(etmq, tidc, packet, addr,
 					    sizeof(instr16), (u8 *)&instr16);
 		if ((instr16 & 0xFF00) == 0xDF00)
 			return true;
@@ -2222,7 +2222,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * +---------+---------+-------------------------+
 		 */
 		addr = ret_addr - 4;
-		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+		cs_etm__frontend_mem_access(etmq, tidc, packet, addr,
 					    sizeof(instr32), (u8 *)&instr32);
 		if ((instr32 & 0x0F000000) == 0x0F000000 &&
 		    (instr32 & 0xF0000000) != 0xF0000000)
@@ -2239,7 +2239,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * +-----------------------+---------+-----------+
 		 */
 		addr = ret_addr - 4;
-		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+		cs_etm__frontend_mem_access(etmq, tidc, packet, addr,
 					    sizeof(instr32), (u8 *)&instr32);
 		if ((instr32 & 0xFFE0001F) == 0xd4000001)
 			return true;
@@ -2254,9 +2254,9 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 }
 
 static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
-			       struct cs_etm_traceid_ctxt *tidq, u64 magic)
+			       struct cs_etm_traceid_ctxt *tidc, u64 magic)
 {
-	struct cs_etm_packet *packet = tidq->packet;
+	struct cs_etm_packet *packet = tidc->packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_SVC)
@@ -2269,7 +2269,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 	 */
 	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
-		    cs_etm__is_svc_instr(etmq, tidq, packet,
+		    cs_etm__is_svc_instr(etmq, tidc, packet,
 					 packet->pref_ret_addr))
 			return true;
 	}
@@ -2277,10 +2277,10 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 	return false;
 }
 
-static bool cs_etm__is_async_exception(struct cs_etm_traceid_ctxt *tidq,
+static bool cs_etm__is_async_exception(struct cs_etm_traceid_ctxt *tidc,
 				       u64 magic)
 {
-	struct cs_etm_packet *packet = tidq->packet;
+	struct cs_etm_packet *packet = tidc->packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_DEBUG_HALT ||
@@ -2304,10 +2304,10 @@ static bool cs_etm__is_async_exception(struct cs_etm_traceid_ctxt *tidq,
 }
 
 static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
-				      struct cs_etm_traceid_ctxt *tidq,
+				      struct cs_etm_traceid_ctxt *tidc,
 				      u64 magic)
 {
-	struct cs_etm_packet *packet = tidq->packet;
+	struct cs_etm_packet *packet = tidc->packet;
 
 	if (magic == __perf_cs_etmv3_magic)
 		if (packet->exception_number == CS_ETMV3_EXC_SMC ||
@@ -2331,7 +2331,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 		 * (SMC, HVC) are taken as sync exceptions.
 		 */
 		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
-		    !cs_etm__is_svc_instr(etmq, tidq, packet,
+		    !cs_etm__is_svc_instr(etmq, tidc, packet,
 					  packet->pref_ret_addr))
 			return true;
 
@@ -2351,10 +2351,10 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
-				    struct cs_etm_traceid_ctxt *tidq)
+				    struct cs_etm_traceid_ctxt *tidc)
 {
-	struct cs_etm_packet *packet = tidq->packet;
-	struct cs_etm_packet *prev_packet = tidq->prev_packet;
+	struct cs_etm_packet *packet = tidc->packet;
+	struct cs_etm_packet *prev_packet = tidc->prev_packet;
 	u64 magic;
 	int ret;
 
@@ -2440,7 +2440,7 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 		if (prev_packet->flags == (PERF_IP_FLAG_BRANCH |
 					   PERF_IP_FLAG_RETURN |
 					   PERF_IP_FLAG_INTERRUPT) &&
-		    cs_etm__is_svc_instr(etmq, tidq, packet, packet->start_addr)) {
+		    cs_etm__is_svc_instr(etmq, tidc, packet, packet->start_addr)) {
 			prev_packet->flags = PERF_IP_FLAG_BRANCH |
 					     PERF_IP_FLAG_RETURN |
 					     PERF_IP_FLAG_SYSCALLRET;
@@ -2463,7 +2463,7 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 			return ret;
 
 		/* The exception is for system call. */
-		if (cs_etm__is_syscall(etmq, tidq, magic))
+		if (cs_etm__is_syscall(etmq, tidc, magic))
 			packet->flags = PERF_IP_FLAG_BRANCH |
 					PERF_IP_FLAG_CALL |
 					PERF_IP_FLAG_SYSCALLRET;
@@ -2471,7 +2471,7 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 		 * The exceptions are triggered by external signals from bus,
 		 * interrupt controller, debug module, PE reset or halt.
 		 */
-		else if (cs_etm__is_async_exception(tidq, magic))
+		else if (cs_etm__is_async_exception(tidc, magic))
 			packet->flags = PERF_IP_FLAG_BRANCH |
 					PERF_IP_FLAG_CALL |
 					PERF_IP_FLAG_ASYNC |
@@ -2480,7 +2480,7 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 		 * Otherwise, exception is caused by trap, instruction &
 		 * data fault, or alignment errors.
 		 */
-		else if (cs_etm__is_sync_exception(etmq, tidq, magic))
+		else if (cs_etm__is_sync_exception(etmq, tidc, magic))
 			packet->flags = PERF_IP_FLAG_BRANCH |
 					PERF_IP_FLAG_CALL |
 					PERF_IP_FLAG_INTERRUPT;
@@ -2496,7 +2496,7 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 		if (prev_packet->flags == (PERF_IP_FLAG_BRANCH |
 					   PERF_IP_FLAG_RETURN |
 					   PERF_IP_FLAG_INTERRUPT) &&
-		    cs_etm__is_svc_instr(etmq, tidq, packet,
+		    cs_etm__is_svc_instr(etmq, tidc, packet,
 					 packet->start_addr)) {
 			prev_packet->flags = PERF_IP_FLAG_BRANCH |
 					     PERF_IP_FLAG_RETURN |
@@ -2572,13 +2572,13 @@ static int cs_etm__decode_data_block(struct cs_etm_queue *etmq)
 }
 
 static int cs_etm__process_traceid_ctxt(struct cs_etm_queue *etmq,
-					 struct cs_etm_traceid_ctxt *tidq)
+					 struct cs_etm_traceid_ctxt *tidc)
 {
 	int ret;
 
 	/* Process each packet in this chunk */
 	while (1) {
-		ret = cs_etm_decoder__get_packet(tidq, tidq->packet);
+		ret = cs_etm_decoder__get_packet(tidc, tidc->packet);
 		if (ret <= 0)
 			/*
 			 * Stop processing this chunk on
@@ -2593,18 +2593,18 @@ static int cs_etm__process_traceid_ctxt(struct cs_etm_queue *etmq,
 		 * prior to switch() statement to use address
 		 * information before packets swapping.
 		 */
-		ret = cs_etm__set_sample_flags(etmq, tidq);
+		ret = cs_etm__set_sample_flags(etmq, tidc);
 		if (ret < 0)
 			break;
 
-		switch (tidq->packet->sample_type) {
+		switch (tidc->packet->sample_type) {
 		case CS_ETM_RANGE:
 			/*
 			 * If the packet contains an instruction
 			 * range, generate instruction sequence
 			 * events.
 			 */
-			ret = cs_etm__sample(etmq, tidq);
+			ret = cs_etm__sample(etmq, tidc);
 			if (ret)
 				goto out;
 			break;
@@ -2615,12 +2615,12 @@ static int cs_etm__process_traceid_ctxt(struct cs_etm_queue *etmq,
 			 * tracing the kernel the context packet will be emitted
 			 * between two ranges.
 			 */
-			ret = cs_etm__context(etmq, tidq);
+			ret = cs_etm__context(etmq, tidc);
 			if (ret)
 				goto out;
 			break;
 		case CS_ETM_EXCEPTION:
-			ret = cs_etm__exception(etmq, tidq);
+			ret = cs_etm__exception(etmq, tidc);
 			if (ret)
 				goto out;
 			break;
@@ -2632,7 +2632,7 @@ static int cs_etm__process_traceid_ctxt(struct cs_etm_queue *etmq,
 			 * Discontinuity in trace, flush
 			 * previous branch stack
 			 */
-			cs_etm__flush(etmq, tidq);
+			cs_etm__flush(etmq, tidc);
 			break;
 		case CS_ETM_EMPTY:
 			/*
@@ -2657,7 +2657,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 	u8 trace_chan_id;
 	struct auxtrace_queue *queue;
 	struct cs_etm_queue *etmq;
-	struct cs_etm_traceid_ctxt *tidq;
+	struct cs_etm_traceid_ctxt *tidc;
 	u64 queue_time;
 
 	while (1) {
@@ -2684,8 +2684,8 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 		auxtrace_heap__pop(&etm->heap);
 		etmq->on_heap = false;
 
-		tidq  = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-		if (!tidq) {
+		tidc  = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
+		if (!tidc) {
 			/*
 			 * No traceID queue has been allocated for this traceID,
 			 * which means something somewhere went very wrong.  No
@@ -2699,7 +2699,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 		 * Packets associated with this timestamp, if any, are already in
 		 * the etmq's traceID queue, so process them.
 		 */
-		ret = cs_etm__process_traceid_ctxt(etmq, tidq);
+		ret = cs_etm__process_traceid_ctxt(etmq, tidc);
 		if (ret < 0)
 			goto out;
 
@@ -2741,7 +2741,7 @@ static int cs_etm__flush_queues(struct cs_etm_auxtrace *etm)
 	int ret = 0;
 	unsigned int i;
 	struct cs_etm_queue *etmq;
-	struct cs_etm_traceid_ctxt *tidq;
+	struct cs_etm_traceid_ctxt *tidc;
 
 	for (i = 0; i < etm->queues.nr_queues; i++) {
 		struct int_node *inode;
@@ -2754,8 +2754,8 @@ static int cs_etm__flush_queues(struct cs_etm_auxtrace *etm)
 			int idx = (int)(intptr_t)inode->priv;
 
 			/* Flush any remaining branch stack entries */
-			tidq = etmq->traceid_ctxts[idx];
-			ret = cs_etm__end_block(etmq, tidq);
+			tidc = etmq->traceid_ctxts[idx];
+			ret = cs_etm__end_block(etmq, tidc);
 			if (ret)
 				return ret;
 		}

-- 
2.43.0


