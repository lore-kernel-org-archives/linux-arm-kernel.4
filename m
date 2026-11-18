Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353F0606A7DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0vrIlil;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cnNqHh3d;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iZUvPNqx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=; b=y0vrIlilMZTufJ
	rrTfrZxtwhaKA8+LEE/XwSIo2rQ7qsM853MqRPlMPfuqA2PHTb3/vYpfqj+G2MFk2ou4Bp8in5ESo
	QfO5ZKLzVBn4NGo0EcFruyc9vClHUUhLxmU0gBKY4ofY6zvxqD6YoUnxvBM8CKIqve0fUN5/J7N3W
	ZhrX4lRnkFOinae1cUn8rR+Pz4A98KdTwF3DTcSjskh4nj0dDWcTKNSnafwEA4AQ7KFUAOwaAbnZg
	ZaU7mIBYvk7mjI9GEexkTSdE5HePE9AkVlY6DS1nSFXJVK4rFZq41I25bP4BZDkdnlkNP+698K9A4
	bdjDkTUU8+rzYKdhbE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZC-00000009VO3-2vbp;
	Wed, 18 Nov 2026 16:31:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYA-00000009UXa-1cmo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=; b=cnNqHh3dm9t9TQKNGgnC9W8RGj
	4etG36KIjCZiJH+lEkt6uuVRt2jqLrfAMQiSOY6yQZmEV2Oe7RxrnlLBfVZMHJAgCZ4OA90Nc+Lx7
	5fd3YHpjXGxILYBYxB268krYS1ooHc6s+DsD+hLum4HkVNALfi3xsw5JZg46ub+wRUxafuFrMNyvH
	bswh0/Oqn7HztBYDs709Y4nI3LV94+kwhPSwH7bH68JjetCG7Jlrw9qxwfpzYu0bpmCFMTyeXDtqI
	wvSujkJxUoMuU0fO/oCgycHLF3gTMebh5JOT9tM0+HqXddSgPbuxaVZnbIFZ5YSyCpUSeVFzhxDSt
	dbhZfKoA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY6-0000000GGjI-3gq3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso554419f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019417; x=1795624217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=;
        b=iZUvPNqxgoDf/+GaQF2TYxr5c4A7XAW9Ui215qqdXJ3T/TzcTgsMCQEV5tR/WHqj2v
         eCGhktjgMoDjIJ8nZsXkFLf5NcpQjPyBvo5IjwJ8zYYJiegPqTMKmFFWozoEh6ZS18MT
         7HGV0lUOBPORlt+1dsKedxJMxpNpjpgLaSH7MKB63pw255i3XzVEwjAwZ/JQt1ntXdB1
         bo+Fu72GH0YeHPJWg0CXBr/eDULJgPlRT4U3JXlF+IK1Wb8y2UjEXr3cGUeLINh003Bk
         tdzuDQTYWvCJPIXEXpLY0fotxN/9N9d9aOoJBjlc3PgrmT8x+Sjtk29+cbQ8YYdbLQui
         uQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019417; x=1795624217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=;
        b=i40eybF7eeyitvrz8JNxHhzVtqG3InlfqYkHiY2AZgbFMkXKDPWa0Cbekyx6NM7LcP
         4B6brIKdSWICOFCXQo/bjz7wTPrbNhb8Wb0FDiO8ZCoIyhKdnKm4HVRYZbtVc3eKFMgo
         rlwWgVW1WmU7sap/dOSEoXRp87Pp7TdBmqY/BO8XxduXAuseytS4zuFlU9hgg4Wbiwqe
         daSIXyFylxn9wG+ei8+de2gxALkmNxqRw8iYuOnfxHiiDW7JY6jeSgfRtepnd3A3/rs8
         +XN+rYPdBIEtu7I3sgWKoYrcN0FYkH8z16sl/sN1VCk4cNamu/eJ1dXcVpLv2E8xY4t0
         QRrw==
X-Forwarded-Encrypted: i=1; AL+hErF/y/LXdSD6Sz/sLUWb39MJ3vvANLIDg8jHgsu14h4zwfb/CsUU3useC0BV4ekW2fYTI0E40/kmgFj5A5ViD0Eh@lists.infradead.org
X-Gm-Message-State: APuU4Z9fpuOWrD+FKob7KCrbobATbXGsLmtHo0+aP9WFVADnjiSPgXX8
	4Sq72AQi7Amq0mhfUmFYzVafK5pruLI796oNuQ+cOk4L4x8mI0OLnN652gqHYuIZQQ6Zsr+ytOJ
	mJtleP/Q=
X-Gm-Gg: AZFdTZcvTA6MRCFoHey4nZxRtjY9HaOsA/j/+1puHp0zmXmqkTsfQLG3fFkvnysNrdH
	RB7vBs9WdBWat7q9ZQdFyOw40Rft1Jhmg4sufmuGQoFDH1S4tJDOzC+ZfFnWKvVLZvhLdArxF76
	238TNr69kqA8EajyIHg4hFXXkE8tv9MM6jrmypQTrp3fqu1+VwMp1xq6LE+i3WhvntxMq1Cg+Ig
	dLd2XlLg8w2/xZjnmpLGcRnQvrulo6npHLoKeW+Sownutw/HFcLjtS9ubaPPJbb43xZXVHffzOy
	ckkq2PVbNHrRJ1ehBcgA4Tu1KY2IOCB/sL33OUgQLFMR65uu7ElXmGZeOxNc/T4Sl+m95zZRtwg
	jff3d9ILpcg/Z64O/hhkb8yzN7QLd6xkekD5H/AoLOYsqnhFe37ogowGD2wQA/+IYor4vWwK7Ch
	mnw8yjhvXWigPWmfuLFDuhjiTuYr2WrhXcL5egKmzK3bo8FwOPqcY6J1nGrOhiBOiOnxbSCI2qz
	OiXhhDTvWbZ5jKIe5Et3FxCheBuFcibLhUVX0bHaqOE5YrqDNXCs7WuDUKmVDTU02EFrm/ZCfck
	8pJcqu0hB3dPXiq5INh1TDJaubIgSSEDyuXT9RMcZ++Lt00ytfcGew==
X-Received: by 2002:adf:e188:0:b0:492:3176:3d6f with SMTP id ffacd0b85a97d-4a63ca2f773mr6237311f8f.47.1795019416789;
        Wed, 18 Nov 2026 08:30:16 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:48 +0000
Subject: [PATCH 26/34] perf cs-etm: Split base and packet decoder state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-26-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_163018_816301_B55B9B25 
X-CRM114-Status: GOOD (  20.31  )
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
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Separate decoder struct into members that will be common with the
timestamp decoder and members that are specific to the packet decoder.
Then the timestamp decoder can use the shared base struct.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 80 +++++++++++++------------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h | 14 ++---
 tools/perf/util/cs-etm.c                        |  2 +-
 3 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index dc17a2fd6c00..4f8da538d645 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -38,9 +38,13 @@ struct cs_etm_decoder {
 	void (*packet_printer)(const char *msg, void *data);
 	bool suppress_printing;
 	dcd_tree_handle_t dcd_tree;
-	cs_etm_mem_cb_type mem_access;
 	ocsd_datapath_resp_t prev_return;
 	const char *decoder_name;
+};
+
+struct cs_etm_packet_decoder {
+	struct cs_etm_decoder base;
+	cs_etm_mem_cb_type mem_access;
 	struct cs_etm_traceid_ctxt *traceid_ctxt;
 };
 
@@ -52,19 +56,19 @@ cs_etm_decoder__mem_access(const void *context,
 			   const u32 req_size,
 			   u8 *buffer)
 {
-	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
+	struct cs_etm_packet_decoder *decoder = (struct cs_etm_packet_decoder *) context;
 
-	return decoder->mem_access(decoder->data, trace_chan_id, address,
+	return decoder->mem_access(decoder->base.data, trace_chan_id, address,
 				   req_size, buffer, mem_space);
 }
 
-int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func)
 {
 	decoder->mem_access = cb_func;
 
-	if (ocsd_dt_add_callback_trcid_mem_acc(decoder->dcd_tree, start, end,
+	if (ocsd_dt_add_callback_trcid_mem_acc(decoder->base.dcd_tree, start, end,
 					       OCSD_MEM_SPACE_ANY,
 					       cs_etm_decoder__mem_access,
 					       decoder))
@@ -73,15 +77,15 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 	return 0;
 }
 
-int cs_etm_decoder__reset(struct cs_etm_decoder *decoder)
+int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder)
 {
 	ocsd_datapath_resp_t dp_ret;
 
-	decoder->prev_return = OCSD_RESP_CONT;
-	decoder->suppress_printing = true;
-	dp_ret = ocsd_dt_process_data(decoder->dcd_tree, OCSD_OP_RESET,
+	decoder->base.prev_return = OCSD_RESP_CONT;
+	decoder->base.suppress_printing = true;
+	dp_ret = ocsd_dt_process_data(decoder->base.dcd_tree, OCSD_OP_RESET,
 				      0, 0, NULL, NULL);
-	decoder->suppress_printing = false;
+	decoder->base.suppress_printing = false;
 	if (OCSD_DATA_RESP_IS_FATAL(dp_ret))
 		return -1;
 
@@ -469,8 +473,8 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 {
 	ocsd_datapath_resp_t resp = OCSD_RESP_CONT;
 	ocsd_gen_trc_elem_t type;
-	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
-	struct cs_etm_queue *etmq = decoder->data;
+	struct cs_etm_packet_decoder *decoder = (struct cs_etm_packet_decoder *) context;
+	struct cs_etm_queue *etmq = decoder->base.data;
 	struct cs_etm_traceid_ctxt *tidc;
 
 	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
@@ -511,7 +515,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 static int
 cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 				   struct cs_etm_trace_params *t_params,
-				   struct cs_etm_decoder *decoder)
+				   struct cs_etm_packet_decoder *decoder)
 {
 	ocsd_etmv3_cfg config_etmv3;
 	ocsd_etmv4_cfg trace_config_etmv4;
@@ -524,7 +528,7 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 	case CS_ETM_PROTO_PTM:
 		csid = (t_params->etmv3.reg_idr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_etmv3_config(t_params, &config_etmv3);
-		decoder->decoder_name = (t_params->protocol == CS_ETM_PROTO_ETMV3) ?
+		decoder->base.decoder_name = (t_params->protocol == CS_ETM_PROTO_ETMV3) ?
 							OCSD_BUILTIN_DCD_ETMV3 :
 							OCSD_BUILTIN_DCD_PTM;
 		trace_config = &config_etmv3;
@@ -532,13 +536,13 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 	case CS_ETM_PROTO_ETMV4i:
 		csid = (t_params->etmv4.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_etmv4_config(t_params, &trace_config_etmv4);
-		decoder->decoder_name = OCSD_BUILTIN_DCD_ETMV4I;
+		decoder->base.decoder_name = OCSD_BUILTIN_DCD_ETMV4I;
 		trace_config = &trace_config_etmv4;
 		break;
 	case CS_ETM_PROTO_ETE:
 		csid = (t_params->ete.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_ete_config(t_params, &trace_config_ete);
-		decoder->decoder_name = OCSD_BUILTIN_DCD_ETE;
+		decoder->base.decoder_name = OCSD_BUILTIN_DCD_ETE;
 		trace_config = &trace_config_ete;
 		break;
 	default:
@@ -551,25 +555,25 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 		decode_flags |= OCSD_OPFLG_N_UNCOND_DIR_BR_CHK | OCSD_OPFLG_CHK_RANGE_CONTINUE |
 				ETM4_OPFLG_PKTDEC_AA64_OPCODE_CHK;
 #endif
-		if (ocsd_dt_create_decoder(decoder->dcd_tree,
-					   decoder->decoder_name,
+		if (ocsd_dt_create_decoder(decoder->base.dcd_tree,
+					   decoder->base.decoder_name,
 					   decode_flags,
 					   trace_config, &csid))
 			return -1;
 
-		if (ocsd_dt_set_gen_elem_outfn(decoder->dcd_tree,
+		if (ocsd_dt_set_gen_elem_outfn(decoder->base.dcd_tree,
 					       cs_etm_decoder__gen_trace_elem_printer,
 					       decoder))
 			return -1;
 
 		return 0;
 	} else if (d_params->operation == CS_ETM_OPERATION_PRINT) {
-		if (ocsd_dt_create_decoder(decoder->dcd_tree, decoder->decoder_name,
+		if (ocsd_dt_create_decoder(decoder->base.dcd_tree, decoder->base.decoder_name,
 					   OCSD_CREATE_FLG_PACKET_PROC,
 					   trace_config, &csid))
 			return -1;
 
-		if (ocsd_dt_set_pkt_protocol_printer(decoder->dcd_tree, csid, CS_PKT_MON))
+		if (ocsd_dt_set_pkt_protocol_printer(decoder->base.dcd_tree, csid, CS_PKT_MON))
 			return -1;
 
 		return 0;
@@ -578,11 +582,11 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 	return -1;
 }
 
-struct cs_etm_decoder *
+struct cs_etm_packet_decoder *
 cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[])
 {
-	struct cs_etm_decoder *decoder;
+	struct cs_etm_packet_decoder *decoder;
 	ocsd_dcd_tree_src_t format;
 	u32 flags;
 	int i, ret;
@@ -595,8 +599,8 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	if (!decoder)
 		return NULL;
 
-	decoder->data = d_params->data;
-	decoder->prev_return = OCSD_RESP_CONT;
+	decoder->base.data = d_params->data;
+	decoder->base.prev_return = OCSD_RESP_CONT;
 	format = (d_params->formatted ? OCSD_TRC_SRC_FRAME_FORMATTED :
 					 OCSD_TRC_SRC_SINGLE);
 	flags = 0;
@@ -611,13 +615,13 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	flags |= OCSD_DFRMTR_RESET_ON_4X_FSYNC;
 
 	/* Create decode tree for the data source */
-	decoder->dcd_tree = ocsd_create_dcd_tree(format, flags);
+	decoder->base.dcd_tree = ocsd_create_dcd_tree(format, flags);
 
-	if (decoder->dcd_tree == 0)
+	if (decoder->base.dcd_tree == 0)
 		goto err_free_decoder;
 
 	/* init library print logging support */
-	ret = cs_etm_decoder__init_def_logger_printing(d_params, decoder);
+	ret = cs_etm_decoder__init_def_logger_printing(d_params, &decoder->base);
 	if (ret != 0)
 		goto err_free_decoder;
 
@@ -636,14 +640,14 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	return NULL;
 }
 
-int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__process_data_block(struct cs_etm_packet_decoder *decoder,
 				       u64 indx, const u8 *buf,
 				       size_t len, size_t *consumed,
 				       struct cs_etm_traceid_ctxt **tidc)
 {
 	int ret = 0;
 	ocsd_datapath_resp_t cur = OCSD_RESP_CONT;
-	ocsd_datapath_resp_t prev_return = decoder->prev_return;
+	ocsd_datapath_resp_t prev_return = decoder->base.prev_return;
 	size_t processed = 0;
 	u32 count;
 
@@ -652,14 +656,14 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	/* Drain buffered output even if the last input byte was consumed. */
 	while (processed < len || OCSD_DATA_RESP_IS_WAIT(prev_return)) {
 		if (OCSD_DATA_RESP_IS_WAIT(prev_return)) {
-			cur = ocsd_dt_process_data(decoder->dcd_tree,
+			cur = ocsd_dt_process_data(decoder->base.dcd_tree,
 						   OCSD_OP_FLUSH,
 						   0,
 						   0,
 						   NULL,
 						   NULL);
 		} else if (OCSD_DATA_RESP_IS_CONT(prev_return)) {
-			cur = ocsd_dt_process_data(decoder->dcd_tree,
+			cur = ocsd_dt_process_data(decoder->base.dcd_tree,
 						   OCSD_OP_DATA,
 						   indx + processed,
 						   len - processed,
@@ -678,7 +682,7 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 		prev_return = cur;
 	}
 
-	decoder->prev_return = cur;
+	decoder->base.prev_return = cur;
 	*consumed = processed;
 	if (tidc)
 		*tidc = decoder->traceid_ctxt;
@@ -688,17 +692,17 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	return ret;
 }
 
-void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder)
+void cs_etm_decoder__zfree(struct cs_etm_packet_decoder **decoder)
 {
 	if (!(*decoder))
 		return;
 
-	ocsd_destroy_dcd_tree((*decoder)->dcd_tree);
-	(*decoder)->dcd_tree = NULL;
+	ocsd_destroy_dcd_tree((*decoder)->base.dcd_tree);
+	(*decoder)->base.dcd_tree = NULL;
 	zfree(decoder);
 }
 
-const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
+const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder)
 {
-	return decoder->decoder_name;
+	return decoder->base.decoder_name;
 }
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index afe9a466986a..376feffd6558 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -14,7 +14,7 @@
 #include <opencsd/ocsd_if_types.h>
 #include <stdio.h>
 
-struct cs_etm_decoder;
+struct cs_etm_packet_decoder;
 struct cs_etm_packet;
 struct cs_etm_traceid_ctxt;
 
@@ -87,24 +87,24 @@ enum cs_etm_decoder_operation {
 	CS_ETM_OPERATION_MAX,
 };
 
-int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__process_data_block(struct cs_etm_packet_decoder *decoder,
 				       u64 indx, const u8 *buf,
 				       size_t len, size_t *consumed,
 				       struct cs_etm_traceid_ctxt **tidc);
 
-struct cs_etm_decoder *
+struct cs_etm_packet_decoder *
 cs_etm_decoder__new(int num_cpu,
 		    struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[]);
 
-void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder);
+void cs_etm_decoder__zfree(struct cs_etm_packet_decoder **decoder);
 
-int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
 
-int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
-const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder);
+int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder);
+const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder);
 
 #endif /* INCLUDE__CS_ETM_DECODER_H__ */
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 97c1dde1579b..6bd833d9ed81 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -78,7 +78,7 @@ enum cs_etm_format {
 
 struct cs_etm_queue {
 	struct cs_etm_auxtrace *etm;
-	struct cs_etm_decoder *decoder;
+	struct cs_etm_packet_decoder *decoder;
 	struct auxtrace_buffer *buffer;
 	unsigned int queue_nr;
 	enum cs_etm_format format;

-- 
2.43.0


