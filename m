Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FDE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vp2UiEje;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fnSGMhQ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vdM6Q4YNocjVgblKZjtGxqVXhtvY7RSHi8S7pxRdWys=; b=Vp2UiEjeCrFTsV
	qh9LhTzt1N9m1bAN4k0at6qw/vg/EnfnmYrZzZ9jOdCq7lUPNDDJRusAsJdXUFmIYAKiwYGGbKH7w
	CfgO6QEEmX0aDQnQ90yKU9sBDCzXQSZWoujkS9je5a6bk9BKc4Qk0u6JUrA1cAnUnARtpAa2ReDBn
	3jm/tM45NgxUtAtaOsnwWVI6j/CPZ76F/YA58R8v6uDYqL8O+hlDTEonCH84tm8DuQ6OLcjYyNq1V
	Tim9BWg6u2ToHfhsmFBNGVaMOX9NzVjgB+4Bncbk8hL12GvWmwI7qUjEPLVyfXTi/JcpnxyyKaqAz
	P6yi4c0gC0gedhDgZNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZB-00000009VLG-2KZv;
	Wed, 18 Nov 2026 16:31:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY2-00000009UNO-1qEJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48b001cd92bso728964f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019412; x=1795624212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdM6Q4YNocjVgblKZjtGxqVXhtvY7RSHi8S7pxRdWys=;
        b=fnSGMhQ5OGfy19lxbc/L2Tolxw0XlZsWz4XtVVsM/MmhtG+6qI+cJA0of726Zgy9UL
         1r9sur6Qnvqx0ZfKTlYSm7m/26wfMrmSR78fHWKKE5yRcW9AHGBLaH5RP2RFp394HPWL
         5ke8RJaYN2dJnr0vas3oBeDiR4EnE6lfZpvuAhXUSCYKaRCWjRLQ1GRENZGGoPTgW9Lf
         o8DZ+su81vfRwzfdBhtfwfJCp0iBZ1eTT5rrmplHrRA6f/2AaKVx14Uiz/oOXK8enS1q
         ighIPTUqjrjIkPTX3nLmoJAMY39XAjS62bYL5H6AIbLZ1aoNwvnpLri56uD4cWgv6fDO
         l+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019412; x=1795624212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdM6Q4YNocjVgblKZjtGxqVXhtvY7RSHi8S7pxRdWys=;
        b=TDkmbNwTIczgRewBmjP1d0dXCcNfeACU+QLy1rIOPs6/ZOwrfZ5LNF0LH9hamNEqlk
         2VBWije5ZVCOLh3tQGRQYxaHV0MyUcFwYS18w9CNarBqhjL6QiinW2x13LTbes7sjaIo
         Z/D5bRekW4kSmlZEJ8TRCEUBHy9aTwi7NV87f22RGqfji+ndaStUgKIxe3tWaoJERt5k
         FgxWV6g6mvWVeIBa+KIINPwSmh0fDpw40rxHEpQJH9pYHUXqSfZHHx8WEtfy8cdTRmPM
         NA4utAxCOFP+0Z76y+9UGZx/UGJsDvndrEuUmien6TxR9ok709CJaJhg4DpcEhs/oeQh
         HRAg==
X-Forwarded-Encrypted: i=1; AL+hErHgIt2nE3Ym1pjzzafGOSSsgbgYxWOLcSVpvpqqsg1ZmTag+5cANGblWEcTOx9F5r65ViwAQGRem+Q01+LJfDTD@lists.infradead.org
X-Gm-Message-State: APuU4Z/Ts5yBUmK4TSx1BVUV3GNHtJZpG2SabngBEaa9V7TCYdcErcXs
	pBjY2wlOPv7ijLEoTqR8REzggEaDuynjNIVgyi6Otal3NnRYAuncZuS9lcMD4KeQrac=
X-Gm-Gg: AZFdTZfceOIUZfjk1/S0pg8D0Fw8sz9hcQEsWKXfwNI5+Cgz5RVFeAPYPZ1rB/6G0Q1
	nYbk3ivlcNHoeFG2LK+sW746jqrk82o4NZ3P2H8DhsT5PSBCNVK0zaY88JzBjZWuWnMitM2WO8y
	jvCJSOg5O8yq1rS1o4rZkrpqu5OmkGHHBVAYOZo/0npP1x0165TcK/9cdc92vL/lN9qSp5vVIZ1
	f/f2yAx9X2mITnbszwbXjLeQdTiUYPZDJvHfE636Fx8SmU3sUm9VTnfM9gvutbjVoFV4K9dX863
	rOhUIC/v+jGf1T0tzbhtk1zP0Ib8eR4wGVqJ9tm4nRmWXpFLfBqI0EO8Jc9qA+SkgHGnkjwMAhY
	FjU5aV10PoO+d87KmMP2+WwkrPVsEsXJe4v+SJTeNz8VH74cuG6+Qe7/9JyVlav5g6ULiRwhVJa
	mqWmtBqJkpZ0DfIzLblJ7nmDpuWyxBJo6q9JSGwpMhhHllrp+owRn9xveCHGdzNiSFo/e4tlz7f
	9pqWZKQzxNQGVRJqWR5Y5OOCGHLgd86ztTzEcHL1t21LNZuUtT9zxHwKZ4nb6unc5MjACrusZGI
	tGK4AjJ2OgB2AVewY7CDloK+xVEVfK2y
X-Received: by 2002:a05:6000:40c6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-4a6385221d2mr6573956f8f.20.1795019411938;
        Wed, 18 Nov 2026 08:30:11 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:44 +0000
Subject: [PATCH 22/34] perf cs-etm: Rename trace ID queues to trace ID
 contexts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-22-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083014_785405_D96AB111 
X-CRM114-Status: GOOD (  23.28  )
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

Now cs_etm_traceid_queue is a single decode context rather than a queue
of packets. Rename the struct and related functions to match. Keep tidq
variable names for a later cleanup.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  27 ++--
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   4 +-
 tools/perf/util/cs-etm.c                        | 156 ++++++++++++------------
 tools/perf/util/cs-etm.h                        |   8 +-
 4 files changed, 97 insertions(+), 98 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 4c47bcf3e2e2..3e3ec30bc7b3 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -87,7 +87,7 @@ int cs_etm_decoder__reset(struct cs_etm_decoder *decoder)
 	return 0;
 }
 
-int cs_etm_decoder__get_packet(struct cs_etm_traceid_queue *packet_queue,
+int cs_etm_decoder__get_packet(struct cs_etm_traceid_ctxt *packet_queue,
 			       struct cs_etm_packet *packet)
 {
 	if (!packet_queue || !packet)
@@ -228,7 +228,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 				  const uint8_t trace_chan_id,
 				  const ocsd_trc_index_t indx)
 {
-	struct cs_etm_traceid_queue *packet_queue;
+	struct cs_etm_traceid_ctxt *packet_queue;
 	u64 converted_timestamp;
 
 	/* Ignore trace timestamps when unavailable or disabled by --itrace=Z. */
@@ -236,7 +236,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 		return OCSD_RESP_CONT;
 
 	/* First get the decode context for this traceID */
-	packet_queue = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+	packet_queue = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
 	if (!packet_queue)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
@@ -257,7 +257,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, converted_timestamp);
 
 	/* Tell the front end which decode context needs attention */
-	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
+	cs_etm__etmq_set_traceid_ctxt_ready(etmq, trace_chan_id);
 
 	/* Halt processing until we are being told to proceed */
 	return OCSD_RESP_WAIT;
@@ -293,7 +293,7 @@ cs_etm_decoder__get_isa(const ocsd_generic_trace_elem *elem)
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
-			      struct cs_etm_traceid_queue *packet_queue,
+			      struct cs_etm_traceid_ctxt *packet_queue,
 			      const ocsd_generic_trace_elem *elem,
 			      const u8 trace_chan_id,
 			      enum cs_etm_sample_type sample_type)
@@ -329,13 +329,13 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	packet->el = ocsd_EL_unknown;
 	packet->tid = -1;
 
-	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
+	cs_etm__etmq_set_traceid_ctxt_ready(etmq, trace_chan_id);
 	return OCSD_RESP_WAIT;
 }
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
-			     struct cs_etm_traceid_queue *packet_queue,
+			     struct cs_etm_traceid_ctxt *packet_queue,
 			     const ocsd_generic_trace_elem *elem,
 			     const uint8_t trace_chan_id)
 {
@@ -370,7 +370,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
-				     struct cs_etm_traceid_queue *queue,
+				     struct cs_etm_traceid_ctxt *queue,
 				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
@@ -380,7 +380,7 @@ cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
-				 struct cs_etm_traceid_queue *queue,
+				 struct cs_etm_traceid_ctxt *queue,
 				 const ocsd_generic_trace_elem *elem,
 				 const uint8_t trace_chan_id)
 {
@@ -431,7 +431,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_exception_ret(struct cs_etm_queue *etmq,
-				     struct cs_etm_traceid_queue *queue,
+				     struct cs_etm_traceid_ctxt *queue,
 				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
@@ -441,7 +441,7 @@ cs_etm_decoder__buffer_exception_ret(struct cs_etm_queue *etmq,
 
 static ocsd_datapath_resp_t
 cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
-			struct cs_etm_traceid_queue *packet_queue,
+			struct cs_etm_traceid_ctxt *packet_queue,
 			const ocsd_generic_trace_elem *elem,
 			const uint8_t trace_chan_id)
 {
@@ -495,10 +495,9 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	ocsd_gen_trc_elem_t type;
 	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
 	struct cs_etm_queue *etmq = decoder->data;
-	struct cs_etm_traceid_queue *packet_queue;
+	struct cs_etm_traceid_ctxt *packet_queue;
 
-	/* First get the packet queue for this traceID */
-	packet_queue = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+	packet_queue = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
 	if (!packet_queue)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 4420daaf159d..8624f48d696f 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -16,7 +16,7 @@
 
 struct cs_etm_decoder;
 struct cs_etm_packet;
-struct cs_etm_traceid_queue;
+struct cs_etm_traceid_ctxt;
 
 struct cs_etm_queue;
 
@@ -102,7 +102,7 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
-int cs_etm_decoder__get_packet(struct cs_etm_traceid_queue *packet_queue,
+int cs_etm_decoder__get_packet(struct cs_etm_traceid_ctxt *packet_queue,
 			       struct cs_etm_packet *packet);
 
 int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3f5865ed2724..b49bf606ffeb 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -86,9 +86,9 @@ struct cs_etm_queue {
 	u64 offset;
 	const unsigned char *buf;
 	size_t buf_len, buf_used;
-	/* Conversion between traceID and index in traceid_queues array */
-	struct intlist *traceid_queues_list;
-	struct cs_etm_traceid_queue **traceid_queues;
+	/* Conversion between traceID and index in traceid_ctxts array */
+	struct intlist *traceid_ctxts_list;
+	struct cs_etm_traceid_ctxt **traceid_ctxts;
 	/* Conversion between traceID and metadata pointers */
 	struct intlist *traceid_list;
 	/*
@@ -545,7 +545,7 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 	return err;
 }
 
-void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
+void cs_etm__etmq_set_traceid_ctxt_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id)
 {
 	/* Tell the frontend which queue the last processed packet is in. */
@@ -567,7 +567,7 @@ void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 				      u8 *trace_chan_id)
 {
-	struct cs_etm_traceid_queue *tidq;
+	struct cs_etm_traceid_ctxt *tidq;
 
 	if (!etmq->ready_chan_id)
 		return 0;
@@ -575,7 +575,7 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (trace_chan_id)
 		*trace_chan_id = etmq->ready_chan_id;
 
-	tidq = cs_etm__etmq_get_traceid_queue(etmq, etmq->ready_chan_id);
+	tidq = cs_etm__etmq_get_traceid_ctxt(etmq, etmq->ready_chan_id);
 	if (!tidq)
 		return 0;
 
@@ -593,8 +593,8 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	return tidq->cs_timestamp;
 }
 
-static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
-				      struct cs_etm_traceid_queue *tidq,
+static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
+				      struct cs_etm_traceid_ctxt *tidq,
 				      u8 trace_chan_id)
 {
 	int rc = -ENOMEM;
@@ -657,22 +657,22 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	return rc;
 }
 
-struct cs_etm_traceid_queue
-*cs_etm__etmq_get_traceid_queue(struct cs_etm_queue *etmq, u8 trace_chan_id)
+struct cs_etm_traceid_ctxt
+*cs_etm__etmq_get_traceid_ctxt(struct cs_etm_queue *etmq, u8 trace_chan_id)
 {
 	int idx;
 	struct int_node *inode;
-	struct intlist *traceid_queues_list = etmq->traceid_queues_list;
-	struct cs_etm_traceid_queue *tidq, **traceid_queues;
+	struct intlist *traceid_ctxts_list = etmq->traceid_ctxts_list;
+	struct cs_etm_traceid_ctxt *tidq, **traceid_ctxts;
 
 	/*
 	 * Check if a decode context exists for this traceID by looking
 	 * in the context list.
 	 */
-	inode = intlist__find(traceid_queues_list, trace_chan_id);
+	inode = intlist__find(traceid_ctxts_list, trace_chan_id);
 	if (inode) {
 		idx = (int)(intptr_t)inode->priv;
-		return etmq->traceid_queues[idx];
+		return etmq->traceid_ctxts[idx];
 	}
 
 	/* We couldn't find a decode context for this traceID, allocate one */
@@ -683,49 +683,49 @@ struct cs_etm_traceid_queue
 	memset(tidq, 0, sizeof(*tidq));
 
 	/* Get a valid index for the new decode context */
-	idx = intlist__nr_entries(traceid_queues_list);
-	/* Memory for the inode is freed in cs_etm__free_traceid_queues() */
-	inode = intlist__findnew(traceid_queues_list, trace_chan_id);
+	idx = intlist__nr_entries(traceid_ctxts_list);
+	/* Memory for the inode is freed in cs_etm__free_traceid_ctxts() */
+	inode = intlist__findnew(traceid_ctxts_list, trace_chan_id);
 	if (!inode)
 		goto out_free;
 
 	/* Associate this traceID with this index */
 	inode->priv = (void *)(intptr_t)idx;
 
-	if (cs_etm__init_traceid_queue(etmq, tidq, trace_chan_id))
+	if (cs_etm__init_traceid_ctxt(etmq, tidq, trace_chan_id))
 		goto out_free;
 
-	/* Grow the traceid_queues array by one unit */
-	traceid_queues = etmq->traceid_queues;
-	traceid_queues = reallocarray(traceid_queues,
+	/* Grow the traceid_ctxts array by one unit */
+	traceid_ctxts = etmq->traceid_ctxts;
+	traceid_ctxts = reallocarray(traceid_ctxts,
 				      idx + 1,
-				      sizeof(*traceid_queues));
+				      sizeof(*traceid_ctxts));
 
 	/*
 	 * On failure reallocarray() returns NULL and the original block of
 	 * memory is left untouched.
 	 */
-	if (!traceid_queues)
+	if (!traceid_ctxts)
 		goto out_free;
 
-	traceid_queues[idx] = tidq;
-	etmq->traceid_queues = traceid_queues;
+	traceid_ctxts[idx] = tidq;
+	etmq->traceid_ctxts = traceid_ctxts;
 
-	return etmq->traceid_queues[idx];
+	return etmq->traceid_ctxts[idx];
 
 out_free:
 	/*
 	 * Function intlist__remove() removes the inode from the list
 	 * and delete the memory associated to it.
 	 */
-	intlist__remove(traceid_queues_list, inode);
+	intlist__remove(traceid_ctxts_list, inode);
 	free(tidq);
 
 	return NULL;
 }
 
 static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
-				struct cs_etm_traceid_queue *tidq)
+				struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_packet *tmp;
 
@@ -894,20 +894,20 @@ static int cs_etm__flush_events(struct perf_session *session,
 	return cs_etm__flush_queues(etm);
 }
 
-static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
+static void cs_etm__free_traceid_ctxts(struct cs_etm_queue *etmq)
 {
 	int idx;
 	uintptr_t priv;
 	struct int_node *inode, *tmp;
-	struct cs_etm_traceid_queue *tidq;
-	struct intlist *traceid_queues_list = etmq->traceid_queues_list;
+	struct cs_etm_traceid_ctxt *tidq;
+	struct intlist *traceid_ctxts_list = etmq->traceid_ctxts_list;
 
-	intlist__for_each_entry_safe(inode, tmp, traceid_queues_list) {
+	intlist__for_each_entry_safe(inode, tmp, traceid_ctxts_list) {
 		priv = (uintptr_t)inode->priv;
 		idx = priv;
 
 		/* Free this decode context from the array */
-		tidq = etmq->traceid_queues[idx];
+		tidq = etmq->traceid_ctxts[idx];
 		thread__zput(tidq->frontend_thread);
 		thread__zput(tidq->decode_thread);
 		zfree(&tidq->event_buf);
@@ -921,15 +921,15 @@ static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
 		 * Function intlist__remove() removes the inode from the list
 		 * and delete the memory associated to it.
 		 */
-		intlist__remove(traceid_queues_list, inode);
+		intlist__remove(traceid_ctxts_list, inode);
 	}
 
 	/* Then the RB tree itself */
-	intlist__delete(traceid_queues_list);
-	etmq->traceid_queues_list = NULL;
+	intlist__delete(traceid_ctxts_list);
+	etmq->traceid_ctxts_list = NULL;
 
-	/* finally free the traceid_queues array */
-	zfree(&etmq->traceid_queues);
+	/* finally free the traceid_ctxts array */
+	zfree(&etmq->traceid_ctxts);
 }
 
 static void cs_etm__free_queue(void *priv)
@@ -941,7 +941,7 @@ static void cs_etm__free_queue(void *priv)
 		return;
 
 	cs_etm_decoder__zfree(&etmq->decoder);
-	cs_etm__free_traceid_queues(etmq);
+	cs_etm__free_traceid_ctxts(etmq);
 
 	if (etmq->own_traceid_list) {
 		/* First remove all traceID/metadata nodes for the RB tree */
@@ -1163,7 +1163,7 @@ static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
 }
 
 static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
-				       struct cs_etm_traceid_queue *tidq,
+				       struct cs_etm_traceid_ctxt *tidq,
 				       struct cs_etm_packet *packet,
 				       u64 address, size_t size, u8 *buffer)
 {
@@ -1175,9 +1175,9 @@ static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_i
 				      u64 address, size_t size, u8 *buffer,
 				      const ocsd_mem_space_acc_t mem_space)
 {
-	struct cs_etm_traceid_queue *tidq;
+	struct cs_etm_traceid_ctxt *tidq;
 
-	tidq = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+	tidq = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
 	if (!tidq)
 		return 0;
 
@@ -1192,8 +1192,8 @@ static struct cs_etm_queue *cs_etm__alloc_queue(void)
 	if (!etmq)
 		return NULL;
 
-	etmq->traceid_queues_list = intlist__new(NULL);
-	if (!etmq->traceid_queues_list)
+	etmq->traceid_ctxts_list = intlist__new(NULL);
+	if (!etmq->traceid_ctxts_list)
 		goto out_free;
 
 	/*
@@ -1208,7 +1208,7 @@ static struct cs_etm_queue *cs_etm__alloc_queue(void)
 	return etmq;
 
 out_free:
-	intlist__delete(etmq->traceid_queues_list);
+	intlist__delete(etmq->traceid_ctxts_list);
 	free(etmq);
 
 	return NULL;
@@ -1312,7 +1312,7 @@ static int cs_etm__push_heap_all(struct cs_etm_auxtrace *etm)
 }
 
 static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
-					 struct cs_etm_traceid_queue *tidq,
+					 struct cs_etm_traceid_ctxt *tidq,
 					 struct cs_etm_packet *packet, u64 addr)
 {
 	u8 instrBytes[2];
@@ -1328,7 +1328,7 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
 }
 
 static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
-				     struct cs_etm_traceid_queue *tidq,
+				     struct cs_etm_traceid_ctxt *tidq,
 				     struct cs_etm_packet *packet,
 				     u64 addr)
 {
@@ -1364,7 +1364,7 @@ u64 cs_etm__last_executed_instr(const struct cs_etm_packet *packet)
 }
 
 static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
-				     struct cs_etm_traceid_queue *tidq,
+				     struct cs_etm_traceid_ctxt *tidq,
 				     struct cs_etm_packet *packet,
 				     u64 offset)
 {
@@ -1480,10 +1480,10 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 				       u8 trace_chan_id,
 				       ocsd_ex_level el, pid_t tid)
 {
-	struct cs_etm_traceid_queue *tidq;
+	struct cs_etm_traceid_ctxt *tidq;
 	int ret;
 
-	tidq = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+	tidq = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
 	if (!tidq)
 		return -EINVAL;
 
@@ -1502,7 +1502,7 @@ bool cs_etm__has_timestamps(struct cs_etm_queue *etmq)
 }
 
 static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
-			      struct cs_etm_traceid_queue *tidq,
+			      struct cs_etm_traceid_ctxt *tidq,
 			      struct cs_etm_packet *packet,
 			      struct perf_sample *sample)
 {
@@ -1544,7 +1544,7 @@ u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timestamp)
 }
 
 static inline u64 cs_etm__resolve_sample_time(struct cs_etm_queue *etmq,
-					       struct cs_etm_traceid_queue *tidq)
+					       struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 
@@ -1571,7 +1571,7 @@ static bool cs_etm__packet_has_branch(struct cs_etm_packet *packet)
 }
 
 static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
-				    struct cs_etm_traceid_queue *tidq)
+				    struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	u64 from, to;
@@ -1603,7 +1603,7 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
 }
 
 static void cs_etm__sample_branch_stack(struct cs_etm_auxtrace *etm,
-					struct cs_etm_traceid_queue *tidq,
+					struct cs_etm_traceid_ctxt *tidq,
 					struct perf_sample *sample)
 {
 	if (etm->synth_opts.last_branch) {
@@ -1634,7 +1634,7 @@ static void cs_etm__sample_branch_stack(struct cs_etm_auxtrace *etm,
 }
 
 static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
-					    struct cs_etm_traceid_queue *tidq,
+					    struct cs_etm_traceid_ctxt *tidq,
 					    struct cs_etm_packet *packet,
 					    u64 addr, u64 period)
 {
@@ -1683,7 +1683,7 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__synth_last_instruction_sample(struct cs_etm_queue *etmq,
-						 struct cs_etm_traceid_queue *tidq)
+						 struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_packet *packet = tidq->prev_packet;
 	int ret;
@@ -1710,7 +1710,7 @@ static int cs_etm__synth_last_instruction_sample(struct cs_etm_queue *etmq,
  * and the next taken branch. Generate sample accordingly.
  */
 static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
-				       struct cs_etm_traceid_queue *tidq)
+				       struct cs_etm_traceid_ctxt *tidq)
 {
 	int ret = 0;
 	struct cs_etm_auxtrace *etm = etmq->etm;
@@ -1879,7 +1879,7 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
 }
 
 static int cs_etm__sample(struct cs_etm_queue *etmq,
-			  struct cs_etm_traceid_queue *tidq)
+			  struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_auxtrace *etm = etmq->etm;
 	int ret;
@@ -1981,7 +1981,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__context(struct cs_etm_queue *etmq,
-			   struct cs_etm_traceid_queue *tidq)
+			   struct cs_etm_traceid_ctxt *tidq)
 {
 	ocsd_ex_level el = tidq->packet->el;
 	struct machine *machine;
@@ -2009,7 +2009,7 @@ static int cs_etm__context(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__exception(struct cs_etm_queue *etmq,
-			     struct cs_etm_traceid_queue *tidq)
+			     struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_packet *packet = tidq->packet;
 
@@ -2030,7 +2030,7 @@ static int cs_etm__exception(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__flush(struct cs_etm_queue *etmq,
-			 struct cs_etm_traceid_queue *tidq)
+			 struct cs_etm_traceid_ctxt *tidq)
 {
 	int err = 0;
 	struct cs_etm_auxtrace *etm = etmq->etm;
@@ -2058,7 +2058,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__end_block(struct cs_etm_queue *etmq,
-			     struct cs_etm_traceid_queue *tidq)
+			     struct cs_etm_traceid_ctxt *tidq)
 {
 	/*
 	 * It has no new packet coming and 'etmq->packet' contains the stale
@@ -2159,9 +2159,9 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 		struct int_node *inode;
 
 		intlist__for_each_entry(inode, etmq->traceid_list) {
-			struct cs_etm_traceid_queue *tidq;
+			struct cs_etm_traceid_ctxt *tidq;
 
-			tidq = cs_etm__etmq_get_traceid_queue(etmq, inode->i);
+			tidq = cs_etm__etmq_get_traceid_ctxt(etmq, inode->i);
 			if (!tidq)
 				return -ENOMEM;
 			if (thread__tid(tidq->decode_thread) == etmq->buffer->tid)
@@ -2183,7 +2183,7 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 
 /* Check whether the instruction before ret_addr is an SVC. */
 static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
-				 struct cs_etm_traceid_queue *tidq,
+				 struct cs_etm_traceid_ctxt *tidq,
 				 struct cs_etm_packet *packet, u64 ret_addr)
 {
 	/* Initialise to keep compiler happy */
@@ -2254,7 +2254,7 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 }
 
 static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
-			       struct cs_etm_traceid_queue *tidq, u64 magic)
+			       struct cs_etm_traceid_ctxt *tidq, u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
 
@@ -2277,7 +2277,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
 	return false;
 }
 
-static bool cs_etm__is_async_exception(struct cs_etm_traceid_queue *tidq,
+static bool cs_etm__is_async_exception(struct cs_etm_traceid_ctxt *tidq,
 				       u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
@@ -2304,7 +2304,7 @@ static bool cs_etm__is_async_exception(struct cs_etm_traceid_queue *tidq,
 }
 
 static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
-				      struct cs_etm_traceid_queue *tidq,
+				      struct cs_etm_traceid_ctxt *tidq,
 				      u64 magic)
 {
 	struct cs_etm_packet *packet = tidq->packet;
@@ -2351,7 +2351,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
 }
 
 static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
-				    struct cs_etm_traceid_queue *tidq)
+				    struct cs_etm_traceid_ctxt *tidq)
 {
 	struct cs_etm_packet *packet = tidq->packet;
 	struct cs_etm_packet *prev_packet = tidq->prev_packet;
@@ -2571,8 +2571,8 @@ static int cs_etm__decode_data_block(struct cs_etm_queue *etmq)
 	return ret;
 }
 
-static int cs_etm__process_traceid_queue(struct cs_etm_queue *etmq,
-					 struct cs_etm_traceid_queue *tidq)
+static int cs_etm__process_traceid_ctxt(struct cs_etm_queue *etmq,
+					 struct cs_etm_traceid_ctxt *tidq)
 {
 	int ret;
 
@@ -2657,7 +2657,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 	u8 trace_chan_id;
 	struct auxtrace_queue *queue;
 	struct cs_etm_queue *etmq;
-	struct cs_etm_traceid_queue *tidq;
+	struct cs_etm_traceid_ctxt *tidq;
 	u64 queue_time;
 
 	while (1) {
@@ -2684,7 +2684,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 		auxtrace_heap__pop(&etm->heap);
 		etmq->on_heap = false;
 
-		tidq  = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+		tidq  = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
 		if (!tidq) {
 			/*
 			 * No traceID queue has been allocated for this traceID,
@@ -2699,7 +2699,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 		 * Packets associated with this timestamp, if any, are already in
 		 * the etmq's traceID queue, so process them.
 		 */
-		ret = cs_etm__process_traceid_queue(etmq, tidq);
+		ret = cs_etm__process_traceid_ctxt(etmq, tidq);
 		if (ret < 0)
 			goto out;
 
@@ -2723,7 +2723,7 @@ static int cs_etm__pop_heap(struct cs_etm_auxtrace *etm, u64 timestamp)
 		/*
 		 * Add the next timestamp or decoded packets to the min heap.
 		 * Packets will be processed and synthesized during the next call
-		 * to cs_etm__process_traceid_queue() for this queue/traceID.
+		 * to cs_etm__process_traceid_ctxt() for this queue/traceID.
 		 */
 		ret = cs_etm__add_to_heap(etmq);
 		if (ret)
@@ -2741,7 +2741,7 @@ static int cs_etm__flush_queues(struct cs_etm_auxtrace *etm)
 	int ret = 0;
 	unsigned int i;
 	struct cs_etm_queue *etmq;
-	struct cs_etm_traceid_queue *tidq;
+	struct cs_etm_traceid_ctxt *tidq;
 
 	for (i = 0; i < etm->queues.nr_queues; i++) {
 		struct int_node *inode;
@@ -2750,11 +2750,11 @@ static int cs_etm__flush_queues(struct cs_etm_auxtrace *etm)
 		if (!etmq)
 			continue;
 
-		intlist__for_each_entry(inode, etmq->traceid_queues_list) {
+		intlist__for_each_entry(inode, etmq->traceid_ctxts_list) {
 			int idx = (int)(intptr_t)inode->priv;
 
 			/* Flush any remaining branch stack entries */
-			tidq = etmq->traceid_queues[idx];
+			tidq = etmq->traceid_ctxts[idx];
 			ret = cs_etm__end_block(etmq, tidq);
 			if (ret)
 				return ret;
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index 1cbc8bc0aa06..115def9c6abb 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -247,7 +247,7 @@ enum cs_etm_pid_fmt {
  * Decode context for a single trace ID stream. In a decode tree there is one
  * of these for each stream.
  */
-struct cs_etm_traceid_queue {
+struct cs_etm_traceid_ctxt {
 	u8 trace_chan_id;
 	u64 period_instructions;
 	u64 kernel_start;
@@ -276,10 +276,10 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 				       u8 trace_chan_id, ocsd_ex_level el,
 				       pid_t tid);
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
-void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
+void cs_etm__etmq_set_traceid_ctxt_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id);
-struct cs_etm_traceid_queue
-*cs_etm__etmq_get_traceid_queue(struct cs_etm_queue *etmq, u8 trace_chan_id);
+struct cs_etm_traceid_ctxt
+*cs_etm__etmq_get_traceid_ctxt(struct cs_etm_queue *etmq, u8 trace_chan_id);
 int cs_etm__process_auxtrace_info_full(union perf_event *event __maybe_unused,
 				       struct perf_session *session __maybe_unused);
 u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timestamp);

-- 
2.43.0


