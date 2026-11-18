Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A6606A7CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2BmsAJbD;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nx58/mzf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h8ddsP+SFgCsu/2Whmv76Fu1fsXFcieF5z95Ul9s/Pg=; b=2BmsAJbDHo5GwC
	LRCqF3+YcDbEZuBXlSw3blqIwMA3/w2nS02yrqfzYO3p74MozKMfKIj4vJRFNUHLOlL2OeEnCPdki
	6aO50AebAA8nYLb4fQJVNae7Xrt8mv1zBEH9s2nE9qlvzAet+G4G/0k4eLZXlc5Gsp+DuyyMa412c
	XsFBirtJX9+9YxSMF+7yTot2axNrzRqOkg29itlR40WdxzXYYRj72uQhKXYJuC8FPJGt8qYh1H++M
	GJraTJDpdy2WCxtu+YEG353nrorQ6KBzQhRP6dVsV0QefNYtWaUWQyE3yhpytXboe1g+v3MNLyzgu
	kkzcf8hzyZSYqg5fo5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYr-00000009V14-3jEN;
	Wed, 18 Nov 2026 16:31:05 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXw-00000009UE1-1GET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:11 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso759135f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019405; x=1795624205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8ddsP+SFgCsu/2Whmv76Fu1fsXFcieF5z95Ul9s/Pg=;
        b=nx58/mzfxN/SXmk+z8GHTNjzj5FHR5GjR0T2SJWSuHX0IJG9M9u7oOzA4lcg1ZCJQF
         MEIWKj2MDRcxXXf+tfzWLKHAYNQgVwma+hMYPvFGRJX+XU8txaodEMIBB5wG+df6nd5h
         BTGuaIvfKP6X4vsLL7YoAN+VNwJlFQJi1YML5gOGrgNiK3Fch1g96FrULUfmtrmUj2wG
         9ltpk45WomyZrn39V7HGehH38QZ/ANQmmqrTAQ6J1Urwq5YUI1Yp36fk7EdxBjXQDcxO
         kaSUJyACWiJJukBdKsrguF361oI8l97ivpWt9QBL00HVGF9is0RSLv0B4Q+SUl1rqlCv
         8dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019405; x=1795624205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8ddsP+SFgCsu/2Whmv76Fu1fsXFcieF5z95Ul9s/Pg=;
        b=YpqVwol/0/VlfIVyG4sSH6qEVVj5Bq+K5ABjKqBsoiN0z8C/hDdmhBJGD5rxauxohb
         E+ya/a1jD3hjIvyQVwARgWdOQKMeg7fpsUtSrb5330vxxu+ocvL6UeRBPkl03Zz+UcaQ
         ybBSxpqSlt8X52lxuWIcgafkgM8ZYe3ZBbWPeMTAv9nbXZgeFwKRQIUKffzSE1vD/vR7
         H5Zji9VNGOMChKt0WZ4gopAIJAGVS+MBGd1b+5axsq669FFIcsKTF9NvdBaR8PqIkgEi
         SafPd2wws/egqCOx1xJn4jK5ujgBHVv66NMKS4hF3JPpwWViPNf/lqpAlxwU58EiRY01
         MjRQ==
X-Forwarded-Encrypted: i=1; AL+hErEzi2KPIq0W0kXqYjPlaFaltFNwk8P0/ImsvSQB+C+bQx4SKvgmCQ49ziEJoNtYMhKEt1VryKLEbjNqVVMUQWuN@lists.infradead.org
X-Gm-Message-State: APuU4Z9pZuOncE8aKC8nMrBzXadCwkHYNK2QrRh3/1+udReo2IgrIxQ4
	2GXExKt+vD4nMXLZv8ZerkQYxj5fziL6AjA3Q2j9BxomQvsSvtiuqS8ppWgBgEwl9UY=
X-Gm-Gg: AZFdTZd5kCSx8TDCCshoCQLfST27hrsvWHHds3cikwbGnVS/hxWnBDfteWl5BbInSs9
	YcjESX0pwlKkCGNrIusN7Wrd40nvyV0NQL1/jZZqoq9LM/kuJlCTUmBvowiJmO+EzBUVwPhj30M
	nQWfuDbWO7jl6XDHl9DewcZOnt6PmN31PT6wI1tppaAnooeAEcgxXUpyGNqzn2UOccnADVBDcW3
	ODWzliaCzZxno/T7qls5P3P+EhaNC7o7K7VtqJC6I7w6TVkAirVujE0VQshV6m9vv/2pX6hKYni
	NMLFG88rURu3xMKncRrpgN6b2YSFQphWOxgBrzvEVS1TFBmnEyFkwC0A0k/eKSK43n0OV1h4uid
	tPla6Piq96W7Ly40lt6jj706q7VWt0KRV7yDzrtdRcehGFZV35bPf0WwJ12pawP5MbLXEsZ0a8U
	xF/9AgY40V2meDHHwFicIYwjYM/knxhI+XZdnQ6MaRFD9lgOOTG5W6TBZ0ezZ654Y/tyJrV+4ZB
	IYLg2lJsHhpoTteRv6A4rhAQoMIDfYdW477lNq2wHOeFQN+J0wR3C1wPHk2KswMS3i6cNAUwbF+
	7jPNwzAMrwvUCR51MBW4IxZbHD8H15ZO4gykM/nz7KAUxaVukaVP6A==
X-Received: by 2002:a05:6000:4812:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4a63b9d9635mr6271664f8f.22.1795019405544;
        Wed, 18 Nov 2026 08:30:05 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:05 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:38 +0000
Subject: [PATCH 16/34] perf cs-etm: Don't buffer non-timestamped packets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-16-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083008_459279_6B51B37A 
X-CRM114-Status: GOOD (  24.87  )
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

We're going to use the same decode path for timestamped and not
timestamped, but we don't want to buffer non-timestamped trace
unnecessarily. Buffering is only for searching for a timestamp and doing
it when there are no timestamps only results in not generating samples
in trace order.

Let the backend know if timestamps are expected or not so it can decide
to buffer or not.

Rename pending_timestamp_chan_id because now it just means that a packet
is pending, either due to a timestamp being found or the first packet
decoded.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 50 +++++++++++--------------
 tools/perf/util/cs-etm.c                        | 23 ++++--------
 tools/perf/util/cs-etm.h                        |  4 +-
 3 files changed, 31 insertions(+), 46 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index d260d89453ef..895e85a1f54b 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -259,27 +259,16 @@ cs_etm_decoder__init_def_logger_printing(struct cs_etm_decoder_params *d_params,
 	return 0;
 }
 
-static ocsd_datapath_resp_t
-cs_etm_decoder__do_soft_timestamp(struct cs_etm_queue *etmq,
-				  struct cs_etm_packet_queue *packet_queue,
-				  const uint8_t trace_chan_id)
+static void
+cs_etm_decoder__do_soft_timestamp(struct cs_etm_packet_queue *packet_queue)
 {
 	u64 estimated_ts;
 
-	/* No timestamp packet has been received, nothing to do */
-	if (!packet_queue->next_cs_timestamp)
-		return OCSD_RESP_CONT;
-
 	estimated_ts = packet_queue->cs_timestamp +
 			cs_etm_decoder__dec_instr_count_to_ns(&packet_queue->instr_count);
 
 	/* Estimated TS can never be higher than the next real one in the trace */
 	packet_queue->cs_timestamp = min(packet_queue->next_cs_timestamp, estimated_ts);
-
-	/* Tell the front end which traceid_queue needs attention */
-	cs_etm__etmq_set_traceid_queue_timestamp(etmq, trace_chan_id);
-
-	return OCSD_RESP_WAIT;
 }
 
 static ocsd_datapath_resp_t
@@ -358,7 +347,7 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	packet_queue->instr_count = 0;
 
 	/* Tell the front end which traceid_queue needs attention */
-	cs_etm__etmq_set_traceid_queue_timestamp(etmq, trace_chan_id);
+	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
 
 	/* Halt processing until we are being told to proceed */
 	return OCSD_RESP_WAIT;
@@ -437,10 +426,13 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	packet_queue->packet_buffer[et].el = ocsd_EL_unknown;
 	packet_queue->packet_buffer[et].tid = -1;
 
-	if (packet_queue->packet_count == CS_ETM_PACKET_MAX_BUFFER - 1)
-		return OCSD_RESP_WAIT;
+	/* Keep decoding until a timestamp is hit or queue fills up */
+	if (cs_etm__has_timestamps(etmq) &&
+	    packet_queue->packet_count < CS_ETM_PACKET_MAX_BUFFER - 1)
+		return OCSD_RESP_CONT;
 
-	return OCSD_RESP_CONT;
+	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
+	return OCSD_RESP_WAIT;
 }
 
 static ocsd_datapath_resp_t
@@ -475,19 +467,19 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 
 	packet->last_instr_size = elem->last_instr_sz;
 
-	/*
-	 * The packet queue is full and we haven't seen a timestamp (had we
-	 * seen one the packet queue wouldn't be full).  Let the front end
-	 * deal with it.
-	 */
-	if (ret == OCSD_RESP_WAIT)
-		goto out;
-
 	packet_queue->instr_count += elem->num_instr_range;
-	/* Tell the front end we have a new timestamp to process */
-	ret = cs_etm_decoder__do_soft_timestamp(etmq, packet_queue,
-						trace_chan_id);
-out:
+
+	if (packet_queue->next_cs_timestamp) {
+		/*
+		 * Once a real timestamp has been received, every range can be
+		 * handed to the frontend without queueing using an estimated
+		 * soft timestamp.
+		 */
+		cs_etm_decoder__do_soft_timestamp(packet_queue);
+		cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
+		return OCSD_RESP_WAIT;
+	}
+
 	return ret;
 }
 
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index ca3878a3b74e..b746d1215e0a 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -110,7 +110,7 @@ struct cs_etm_queue {
 	struct cs_etm_decoder *decoder;
 	struct auxtrace_buffer *buffer;
 	unsigned int queue_nr;
-	u8 pending_timestamp_chan_id;
+	u8 ready_chan_id;
 	enum cs_etm_format format;
 	u64 offset;
 	const unsigned char *buf;
@@ -568,17 +568,10 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 	return err;
 }
 
-void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
-					      u8 trace_chan_id)
+void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
+					  u8 trace_chan_id)
 {
-	/*
-	 * When a timestamp packet is encountered the backend code
-	 * is stopped so that the front end has time to process packets
-	 * that were accumulated in the traceID queue.  Since there can
-	 * be more than one channel per cs_etm_queue, we need to specify
-	 * what traceID queue needs servicing.
-	 */
-	etmq->pending_timestamp_chan_id = trace_chan_id;
+	etmq->ready_chan_id = trace_chan_id;
 }
 
 /*
@@ -598,19 +591,19 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 {
 	struct cs_etm_packet_queue *packet_queue;
 
-	if (!etmq->pending_timestamp_chan_id)
+	if (!etmq->ready_chan_id)
 		return 0;
 
 	if (trace_chan_id)
-		*trace_chan_id = etmq->pending_timestamp_chan_id;
+		*trace_chan_id = etmq->ready_chan_id;
 
 	packet_queue = cs_etm__etmq_get_packet_queue(etmq,
-						     etmq->pending_timestamp_chan_id);
+						     etmq->ready_chan_id);
 	if (!packet_queue)
 		return 0;
 
 	/* Acknowledge pending status */
-	etmq->pending_timestamp_chan_id = 0;
+	etmq->ready_chan_id = 0;
 
 	/*
 	 * If there are no timestamps, use the TS from the AUX records to sort
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index 9e842f1be9fc..71b1ef321625 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -270,8 +270,8 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 				       u8 trace_chan_id, ocsd_ex_level el,
 				       pid_t tid);
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
-void cs_etm__etmq_set_traceid_queue_timestamp(struct cs_etm_queue *etmq,
-					      u8 trace_chan_id);
+void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
+					  u8 trace_chan_id);
 struct cs_etm_packet_queue
 *cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id);
 int cs_etm__process_auxtrace_info_full(union perf_event *event __maybe_unused,

-- 
2.43.0


