Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60A606A7DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W2dUu1Lk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=M86BY3i7;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xF1cBubf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=; b=W2dUu1LkuUX9fN
	kjL7jCOKejDcYvzbQ7OqYJXQ0LROTUPjveLzs6LHzfAgG/Jh4sIJu5Nke2+sKPagEcvAJofV/dOoG
	u2haDjKtuyEWQcgoPVuMI1yzwmJJlHmF222/8yZrrrUjtVycZHewMuwWJakqi95rbQMRqYQrue8JP
	Ay81Xntlha5w/T9abNB7YMmHBZ89HaJ8wEayZ7E3MbbIT+B+uGrFDCNQHT8JhKc7Sftu44UQMSfQk
	yqF0OPf6DgaMyaj6kOYOcz48BYgsOwI6DlsbdRHUIliaogHELioqNSM4JWG0F3JVheUPx6XAh3MQ2
	/fi0/kCvD8zLzzg5e2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZC-00000009VNG-1PFB;
	Wed, 18 Nov 2026 16:31:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY6-00000009UTW-09x9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=; b=M86BY3i7SIZQ2dazeIg4FpVSyT
	TiyHvo71kIK6BtWV+fg88FqQxAV33vGH+kEDcbd1knPJjiscvdIwf9D7Yx0A2iWwPXIDz2Cv31n31
	5lhrTxMEJX0eRIKg+4A2ChsMb0XEufyQTvwnJvSW/DVWFCGesqq5/ebBICF/HGjHx4ASTHOGK0HF3
	i5W3Wd7pr54Wj5OhgUkjJtuNZTXXMWrpBTxyR4UZHpPQN/0caOsFxvi8aexPK+0pB9pmldS9qA1TS
	nQqjJ0Qu9CZFEvsqzZcDBc65k0rJuhr3k1CxQs89munnt+XTlGril9PEO29gunMuZ7wauh0C4DJTC
	6z4YSxBA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY1-0000000GGgL-2DBq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so9246235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019410; x=1795624210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=;
        b=xF1cBubfuDXn1IrAZLy55rdETfQ1r0zt4FWIOIRhHoePH2WoIkNydBE2WEz6s41FC4
         yrRFKhJcUlAtr0+C5CMREZONSygyXAYmEewZ1TwriQ5PQ9zfCZq9FB3lUx8Jw09X5hd9
         oR82AQtq1lz0GPbeAh4e9M1XBWDbmzXnc21vSPZBo9jW+DAiIYY7Ukyl+B0nxRUAHDCC
         g21HQvbHVPNtUctfNvj8bJ6O4yTMe7dYEbqEUTgwKSzKKZc8jYBpzw6MpLacDu+BEhQK
         mptsX4LxrDFq0s+kfRehdc1Isd3xd3yMj/E7HxlY4vJJs+FJHBWYtNHhBobm8/o347q8
         Bccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019410; x=1795624210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=;
        b=x9WSHr69KpmmzunzCd/jMV+sKNh2ScqYhyg9dFledYZmJetXUN514/eKnct/AMq14l
         /wuM8VHWLB8eR+61TrpvKXYCfqM5UufT3ILC/i+HmfinB5q/uWHGuIg+2jl25zT1y9YQ
         9rqDmpHsSeyo3MuGc/nx4KmCWpMEKdDW+yWhCcTtJy9xrlE5Had7gJ2S6VoW6GTdFpgK
         l4ANITWNxwFpbpe4hJQMC/KaOi6FxPRuJ3eta2lTMvvn0YvHGhNR/IB4A9/M2j6W70Q/
         tZJRLpITm+FbGnhyOtVBNv2PSPhhZ7IulL+ZQPKpXzYuVm2jsYf1AcOCUpBbinSKrfVj
         u3dQ==
X-Forwarded-Encrypted: i=1; AL+hErGEh0w42ghekFdNxBoGoe54Ml1VN/SJ43cAuNMi+TF9Znn/r8zzPuV8+tRTDul3EEgIxkuhw4148VBxuuk/ZcGI@lists.infradead.org
X-Gm-Message-State: APuU4Z+ynfOu/pDXepoEKOOPPVjKWlz9NHsCnhnRj3h0o+jp8gAJqujn
	UeeAI68hh4e/i5UvXWzbruTbTeNjvZK7bBbLlda94L9qm9UF+VGdBeYuZtL+nLYd9do+nRBpXeZ
	7sFOyOAA=
X-Gm-Gg: AYBFou0yGT5D7PLtzm5pKGLAvu79NOH3rSruOZdqbMgK7VpUmG0N9+FGHtl0R84hCDW
	Tv/GB6LIZ7tHSVd+sJhfed56Ouhi2D5hZgYioblCl+X9Rqv4MOREL4+sEMBqk9y7cBHVfj/HUCO
	K9jvUqFW1/3UYoySJNFic/xMx1Dd0hWHck6P9FHV8W1+PknBXsaw8LVIvTkJTawRTDGYjdSVJev
	XL2QbxeeGEjKPDsiQTptHz+EnumEsuj71RBtaqVPDO7Rk5i+S+FVaj+2xOl4NBu6CZF8maftZdI
	u+8Pekfb96gaIj/5v0p8IjazAe2q75zgDZkBQfZK+t8ZV1paD7IDwl0WCfL/fl+eSLLKa/SLF0p
	CSFrs6wLdd6nc1JkWCU1jxE0rTDemBKA1P6ZrXeg3V2+ijP2yAg76MaOFFnGU80tTyCJqLWe62F
	H5Rf1sFLs0c3cTYgiaf0Hjngydjnyj7hKfGtnuvm7qC9BnTr4EvUtI7k/djpBwylo4+/E8nEEMm
	55gQJa0h0occQzf8ncMXUsxOnEve4RWD049dBp5Wt0ZQxAbaVhDawmgEneenS/Gb3wMYV1mbOYi
	BJs+GlkKQ0qcEdLkjTnx58Q1dxdWBToW
X-Received: by 2002:a05:600d:82c5:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb7da127e1mr70127165e9.6.1795019409839;
        Wed, 18 Nov 2026 08:30:09 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:09 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:42 +0000
Subject: [PATCH 20/34] perf cs-etm: Remove the decoded packet ring buffer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-20-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_163014_169411_BF343A88 
X-CRM114-Status: GOOD (  18.72  )
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

Full decoding now stops after every output packet, so the frontend
drains the packet ring before the decoder can produce another packet.

Write directly into the frontend's current packet instead. Remove the
ring storage but retain the packet count as the pending-packet
indicator, which will be removed later.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 64 ++++++++++---------------
 tools/perf/util/cs-etm.c                        | 35 ++++----------
 tools/perf/util/cs-etm.h                        |  7 +--
 3 files changed, 36 insertions(+), 70 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index d7b596aeaa41..e2eb606f2feb 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -96,22 +96,8 @@ int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
 	/* Nothing to do, might as well just return */
 	if (packet_queue->packet_count == 0)
 		return 0;
-	/*
-	 * The queueing process in function cs_etm_decoder__buffer_packet()
-	 * increments the tail *before* using it.  This is somewhat counter
-	 * intuitive but it has the advantage of centralizing tail management
-	 * at a single location.  Because of that we need to follow the same
-	 * heuristic with the head, i.e we increment it before using its
-	 * value.  Otherwise the first element of the packet queue is not
-	 * used.
-	 */
-	packet_queue->head = (packet_queue->head + 1) &
-			     (CS_ETM_PACKET_MAX_BUFFER - 1);
-
-	*packet = packet_queue->packet_buffer[packet_queue->head];
 
 	packet_queue->packet_count--;
-
 	return 1;
 }
 
@@ -312,36 +298,36 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 			      const u8 trace_chan_id,
 			      enum cs_etm_sample_type sample_type)
 {
-	u32 et = 0;
+	struct cs_etm_packet *packet;
 	int cpu;
 
-	if (packet_queue->packet_count >= CS_ETM_PACKET_MAX_BUFFER - 1)
+	if (packet_queue->packet_count)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
 	if (cs_etm__get_cpu(etmq, trace_chan_id, &cpu) < 0)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	et = packet_queue->tail;
-	et = (et + 1) & (CS_ETM_PACKET_MAX_BUFFER - 1);
-	packet_queue->tail = et;
-	packet_queue->packet_count++;
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
+	if (!packet)
+		return OCSD_RESP_FATAL_SYS_ERR;
 
-	packet_queue->packet_buffer[et].sample_type = sample_type;
-	packet_queue->packet_buffer[et].isa = cs_etm_decoder__get_isa(elem);
-	packet_queue->packet_buffer[et].cpu = cpu;
-	packet_queue->packet_buffer[et].start_addr = CS_ETM_INVAL_ADDR;
-	packet_queue->packet_buffer[et].end_addr = CS_ETM_INVAL_ADDR;
-	packet_queue->packet_buffer[et].instr_count = 0;
-	packet_queue->packet_buffer[et].last_instr_taken_branch = false;
-	packet_queue->packet_buffer[et].last_instr_size = 0;
-	packet_queue->packet_buffer[et].last_instr_type = 0;
-	packet_queue->packet_buffer[et].last_instr_subtype = 0;
-	packet_queue->packet_buffer[et].last_instr_cond = 0;
-	packet_queue->packet_buffer[et].flags = 0;
-	packet_queue->packet_buffer[et].exception_number = UINT32_MAX;
-	packet_queue->packet_buffer[et].trace_chan_id = trace_chan_id;
-	packet_queue->packet_buffer[et].el = ocsd_EL_unknown;
-	packet_queue->packet_buffer[et].tid = -1;
+	packet_queue->packet_count++;
+	packet->sample_type = sample_type;
+	packet->isa = cs_etm_decoder__get_isa(elem);
+	packet->cpu = cpu;
+	packet->start_addr = CS_ETM_INVAL_ADDR;
+	packet->end_addr = CS_ETM_INVAL_ADDR;
+	packet->instr_count = 0;
+	packet->last_instr_taken_branch = false;
+	packet->last_instr_size = 0;
+	packet->last_instr_type = 0;
+	packet->last_instr_subtype = 0;
+	packet->last_instr_cond = 0;
+	packet->flags = 0;
+	packet->exception_number = UINT32_MAX;
+	packet->trace_chan_id = trace_chan_id;
+	packet->el = ocsd_EL_unknown;
+	packet->tid = -1;
 
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
 	return OCSD_RESP_WAIT;
@@ -361,7 +347,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = &packet_queue->packet_buffer[packet_queue->tail];
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
 
 	packet->start_addr = elem->st_addr;
 	packet->end_addr = elem->en_addr;
@@ -407,7 +393,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = &queue->packet_buffer[queue->tail];
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
 	packet->exception_number = elem->exception_number;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
@@ -491,7 +477,7 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = &packet_queue->packet_buffer[packet_queue->tail];
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
 	packet->tid = tid;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index f33e410e85bf..0175b2facaac 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -615,30 +615,6 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	return packet_queue->cs_timestamp;
 }
 
-static void cs_etm__clear_packet_queue(struct cs_etm_packet_queue *queue)
-{
-	int i;
-
-	queue->head = 0;
-	queue->tail = 0;
-	queue->packet_count = 0;
-	for (i = 0; i < CS_ETM_PACKET_MAX_BUFFER; i++) {
-		queue->packet_buffer[i].isa = CS_ETM_ISA_UNKNOWN;
-		queue->packet_buffer[i].start_addr = CS_ETM_INVAL_ADDR;
-		queue->packet_buffer[i].end_addr = CS_ETM_INVAL_ADDR;
-		queue->packet_buffer[i].instr_count = 0;
-		queue->packet_buffer[i].last_instr_taken_branch = false;
-		queue->packet_buffer[i].last_instr_size = 0;
-		queue->packet_buffer[i].last_instr_type = 0;
-		queue->packet_buffer[i].last_instr_subtype = 0;
-		queue->packet_buffer[i].last_instr_cond = 0;
-		queue->packet_buffer[i].flags = 0;
-		queue->packet_buffer[i].exception_number = UINT32_MAX;
-		queue->packet_buffer[i].trace_chan_id = UINT8_MAX;
-		queue->packet_buffer[i].cpu = INT_MIN;
-	}
-}
-
 static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 				      struct cs_etm_traceid_queue *tidq,
 				      u8 trace_chan_id)
@@ -647,8 +623,6 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	struct auxtrace_queue *queue;
 	struct cs_etm_auxtrace *etm = etmq->etm;
 
-	cs_etm__clear_packet_queue(&tidq->packet_queue);
-
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
 	tidq->trace_chan_id = trace_chan_id;
 	tidq->decode_el = ocsd_EL_unknown;
@@ -772,6 +746,15 @@ static struct cs_etm_traceid_queue
 	return NULL;
 }
 
+struct cs_etm_packet *cs_etm__etmq_get_packet(struct cs_etm_queue *etmq,
+					      u8 trace_chan_id)
+{
+	struct cs_etm_traceid_queue *tidq;
+
+	tidq = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+	return tidq ? tidq->packet : NULL;
+}
+
 struct cs_etm_packet_queue
 *cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id)
 {
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index e404753820dc..c757a1fb465d 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -193,14 +193,9 @@ struct cs_etm_packet {
 	pid_t tid;
 };
 
-#define CS_ETM_PACKET_MAX_BUFFER 1024
-
 struct cs_etm_packet_queue {
 	u32 packet_count;
-	u32 head;
-	u32 tail;
 	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
-	struct cs_etm_packet packet_buffer[CS_ETM_PACKET_MAX_BUFFER];
 };
 
 #define KiB(x) ((x) * 1024)
@@ -260,6 +255,8 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
 void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id);
+struct cs_etm_packet *cs_etm__etmq_get_packet(struct cs_etm_queue *etmq,
+					      u8 trace_chan_id);
 struct cs_etm_packet_queue
 *cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id);
 int cs_etm__process_auxtrace_info_full(union perf_event *event __maybe_unused,

-- 
2.43.0


