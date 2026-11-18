Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A6A606A7C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWDjLLK5;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l07VISbK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rxtdkHbmHqWShGblprejxNcYU2X2QKgIIxkLxdYfilI=; b=VWDjLLK53Dx+go
	8m+gIKpscOYOA99yo+l5Z2+kXWE6KPB834n/y4PUvvYMI03NWsrC049C4gPuJ4kxMWc0nyCaNau5K
	UmejSbJgN2tG1/22QAbK8r6Kj1EmlzLqKENDIJ1bdYJquTXegac7UyXjYNKlvgsZllOpcPY89X9Oo
	xWd4423h7Ewb/JwqN4FdW9dC6FBoc8cnXRfDtboeBaEFthngEJc2B2jMLZD4s7YnPqNVjpJBl1bsF
	GKFr0NSJVsLYBzlhZcZFcFWo0TKsd53uAYgJi92BZKlGpdjWB9qgER7Doh8xVhQmCHezZrkY4EPhL
	NpyyHe/DLySgprjPHFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZE-00000009VRL-1BIm;
	Wed, 18 Nov 2026 16:31:28 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY9-00000009UWy-2jz2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:24 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso729070f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019419; x=1795624219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxtdkHbmHqWShGblprejxNcYU2X2QKgIIxkLxdYfilI=;
        b=l07VISbKdOGDespF35evKX2h0vz0Z55Nh5vs4fX4Jy2SPyJ+iGo3rYS6K8U/EgknAk
         rG2Bt9an1cjg5tp5ZUmRyDyTXajzADdasZR7WJPgI7ByZ92EejckPGCM+yk71xhH2FUu
         xcG4d5dY43tecRgvHJuAN3OQsYAaomj2dwdu29LGCBKA2Qm1Wl3s3B24uGWA1gK4zsvu
         +EE3OsZrf0LYOSuOlI5vxqmEfcb9z3+7QrTIk9TXU42210RuZfOjJ40rtDRAv/H15pxK
         Rv5VDi31ytEOYQuO01qfbNIqnJlTQIYxAxHyCoDnCw0VexK5+bQteDQ/j4Ig5CtvtoiI
         dmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019419; x=1795624219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxtdkHbmHqWShGblprejxNcYU2X2QKgIIxkLxdYfilI=;
        b=qPydf5dAWW/xHtcZBKlVJnThDIdbIRbUOdSXPeevfqpJ26mpG5xEbvLRKi1qyK+8Vp
         KdeZd4yXSwbTkr2m7mDrfZx2yBZXe6SWDGDePx5l4Y3iWvnh5mdevVImU7KomHpLSmy9
         12vvywyGUGbJFcDeKHQyo8dA7hd1iMbAfo/G74m7ET8Es/wLJqQxzYYlKg4Y01jYTuUu
         wf6BB1ftLSK7dPSgat1OmB96yxk0fv5/9CGGYAH21HcYVBF+IOJUGJyBjhAZX4nSZuyB
         m4IR4L4ogCCoQhh0z9ddCTVjm9BHWPaD5t2nDHS322aQjD6+zbjs/Dj64IUNPdN+NEzH
         QMxw==
X-Forwarded-Encrypted: i=1; AL+hErGGSWD2kRr+M5i1fB8qvlVRrXckJmRJjuIeGnji23C/xAWPaTcGPrzSjr+m9bjP1K0cV4aqqOADddI+LJLYtjNU@lists.infradead.org
X-Gm-Message-State: APuU4Z9kpvTmUecX7nGdptba+KLiWU+lI5eLfXFea8US6EUVpvFwm2kJ
	k3Pej37qUvUEBHFEbYTJfEWzKyC28VsS1iunqruBqwEaFGVkIXAIKAWgiqmgby/nbjU=
X-Gm-Gg: AZFdTZdX7Detpn6iq22yZDuuTY+pUnc9UOED3VSPoqTaeVxPUrZ1e25GkIBLyeKTAK/
	HwuaWOHwSSkdOYeMOVXTbf+KijypirPBidYQQwir+ieiLNwU+YnLXc4oiLjeBtVAKX4LI04wQbc
	WwfZtVRBoMpcVKkxsBzPBUqsyI9aSgMp/wyNHZxVZzI4lJ2A6+sChGpDNkDoGpb5/JAfRlgRVLS
	E/c8estVKh5VRTn3YTCRTLWazBgGiyXIPIyJ/VahfE01lgijlcqQaRZt5Gnzz6pnTN7GfvLljrw
	RLxCdmn4dPqBLBx4M2mgY0+Ulu84uXPZruMlFv20T/AjsYzPefTPgJSANu7ozy81UPYmkhXvoCP
	5lCZrxHwJMQnZMJhzRLroeZw3I9LN2YR2iF0czXkcFFMfyIaT0kYsSO5pFI2xZVj/J1R0TdF6RM
	4Ic9R2vUoHP66qZQQcm487KaVpA5x64w7naBdpZOFZJcLB8azTu/yB6eRwy8dcEjKRmyNxnCusn
	FjbdEoLFK99IWSW/84RRmfwwaUAHkzW6U9g9XL8woWHdGYqqbRp1+qUSDgBauCwDtoqmm9JJPmz
	sIqGvlzQ7Uc0Q54fWCYIpEJwlQAxeDIy
X-Received: by 2002:a05:6000:161f:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-4a6334a7710mr5000193f8f.5.1795019418924;
        Wed, 18 Nov 2026 08:30:18 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:50 +0000
Subject: [PATCH 28/34] perf cs-etm: Create timestamp decoders
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-28-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083021_809005_7787EFF2 
X-CRM114-Status: GOOD (  22.09  )
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
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Create a packet-only decode tree for each queue when ordered timestamp
decoding is enabled.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 253 +++++++++++++++++-------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
 tools/perf/util/cs-etm.c                        |   8 +-
 3 files changed, 188 insertions(+), 75 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 685d8d75912f..56de6c76de68 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -10,6 +10,7 @@
 #include <linux/coresight-pmu.h>
 #include <linux/err.h>
 #include <linux/list.h>
+#include <linux/overflow.h>
 #include <linux/zalloc.h>
 #include <stdlib.h>
 #include <opencsd/c_api/opencsd_c_api.h>
@@ -54,6 +55,7 @@ struct cs_etm_packet_decoder {
 	struct cs_etm_decoder base;
 	cs_etm_mem_cb_type mem_access;
 	struct cs_etm_traceid_ctxt *traceid_ctxt;
+	struct cs_etm_timestamp_decoder *timestamp_decoder;
 };
 
 struct cs_etm_timestamp_source {
@@ -65,6 +67,7 @@ struct cs_etm_timestamp_decoder {
 	struct cs_etm_decoder base;
 	u64 timestamp; /* Raw trace timestamp. */
 	u64 timestamp_search_index;
+	u64 timestamp_decode_index;
 	u32 timestamp_packet_count;
 	struct cs_etm_timestamp_source sources[];
 };
@@ -98,17 +101,37 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 	return 0;
 }
 
-int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder)
+static int cs_etm_decoder__reset_core(struct cs_etm_decoder *core)
 {
 	ocsd_datapath_resp_t dp_ret;
 
-	decoder->base.prev_return = OCSD_RESP_CONT;
-	decoder->base.suppress_printing = true;
-	dp_ret = ocsd_dt_process_data(decoder->base.dcd_tree, OCSD_OP_RESET,
+	core->prev_return = OCSD_RESP_CONT;
+	core->suppress_printing = true;
+	dp_ret = ocsd_dt_process_data(core->dcd_tree, OCSD_OP_RESET,
 				      0, 0, NULL, NULL);
-	decoder->base.suppress_printing = false;
-	if (OCSD_DATA_RESP_IS_FATAL(dp_ret))
-		return -1;
+	core->suppress_printing = false;
+	return OCSD_DATA_RESP_IS_FATAL(dp_ret) ? -1 : 0;
+}
+
+static int cs_etm_timestamp_decoder__reset(struct cs_etm_timestamp_decoder *decoder,
+					   u64 index)
+{
+	decoder->timestamp_search_index = 0;
+	decoder->timestamp_decode_index = index;
+	decoder->timestamp_packet_count = 0;
+	return cs_etm_decoder__reset_core(&decoder->base);
+}
+
+int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder, u64 index)
+{
+	int ret;
+
+	ret = cs_etm_decoder__reset_core(&decoder->base);
+	if (ret)
+		return ret;
+
+	if (decoder->timestamp_decoder)
+		return cs_etm_timestamp_decoder__reset(decoder->timestamp_decoder, index);
 
 	return 0;
 }
@@ -234,6 +257,42 @@ cs_etm_decoder__init_def_logger_printing(struct cs_etm_decoder_params *d_params,
 	return 0;
 }
 
+static int cs_etm_decoder__init_core(struct cs_etm_decoder *decoder,
+				     struct cs_etm_decoder_params *d_params)
+{
+	ocsd_dcd_tree_src_t format;
+	u32 flags;
+	int ret;
+
+	decoder->data = d_params->data;
+	decoder->prev_return = OCSD_RESP_CONT;
+	format = (d_params->formatted ? OCSD_TRC_SRC_FRAME_FORMATTED :
+					 OCSD_TRC_SRC_SINGLE);
+	flags = 0;
+	flags |= (d_params->fsyncs ? OCSD_DFRMTR_HAS_FSYNCS : 0);
+	flags |= (d_params->hsyncs ? OCSD_DFRMTR_HAS_HSYNCS : 0);
+	flags |= (d_params->frame_aligned ? OCSD_DFRMTR_FRAME_MEM_ALIGN : 0);
+
+	/*
+	 * Drivers may add barrier frames when used with perf, set up to
+	 * handle this. Barriers const of FSYNC packet repeated 4 times.
+	 */
+	flags |= OCSD_DFRMTR_RESET_ON_4X_FSYNC;
+
+	/* Create decode tree for the data source */
+	decoder->dcd_tree = ocsd_create_dcd_tree(format, flags);
+
+	if (decoder->dcd_tree == 0)
+		return -1;
+
+	/* init library print logging support */
+	ret = cs_etm_decoder__init_def_logger_printing(d_params, decoder);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
 static ocsd_datapath_resp_t
 cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 				  const ocsd_generic_trace_elem *elem,
@@ -533,7 +592,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	return resp;
 }
 
-static ocsd_datapath_resp_t __maybe_unused
+static ocsd_datapath_resp_t
 cs_etm_decoder__timestamp(const void *context, const ocsd_datapath_op_t op,
 			  const ocsd_trc_index_t indx, const void *packet)
 {
@@ -592,73 +651,149 @@ cs_etm_decoder__timestamp(const void *context, const ocsd_datapath_op_t op,
 }
 
 static int
-cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
+cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder *decoder,
 				   struct cs_etm_trace_params *t_params,
-				   struct cs_etm_packet_decoder *decoder)
+				   int flags, u8 *csid)
 {
 	ocsd_etmv3_cfg config_etmv3;
 	ocsd_etmv4_cfg trace_config_etmv4;
 	ocsd_ete_cfg trace_config_ete;
 	void *trace_config;
-	u8 csid;
 
 	switch (t_params->protocol) {
 	case CS_ETM_PROTO_ETMV3:
 	case CS_ETM_PROTO_PTM:
-		csid = (t_params->etmv3.reg_idr & CORESIGHT_TRACE_ID_VAL_MASK);
+		*csid = (t_params->etmv3.reg_idr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_etmv3_config(t_params, &config_etmv3);
-		decoder->base.decoder_name = (t_params->protocol == CS_ETM_PROTO_ETMV3) ?
+		decoder->decoder_name = (t_params->protocol == CS_ETM_PROTO_ETMV3) ?
 							OCSD_BUILTIN_DCD_ETMV3 :
 							OCSD_BUILTIN_DCD_PTM;
 		trace_config = &config_etmv3;
 		break;
 	case CS_ETM_PROTO_ETMV4i:
-		csid = (t_params->etmv4.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
+		*csid = (t_params->etmv4.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_etmv4_config(t_params, &trace_config_etmv4);
-		decoder->base.decoder_name = OCSD_BUILTIN_DCD_ETMV4I;
+		decoder->decoder_name = OCSD_BUILTIN_DCD_ETMV4I;
 		trace_config = &trace_config_etmv4;
 		break;
 	case CS_ETM_PROTO_ETE:
-		csid = (t_params->ete.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
+		*csid = (t_params->ete.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_ete_config(t_params, &trace_config_ete);
-		decoder->base.decoder_name = OCSD_BUILTIN_DCD_ETE;
+		decoder->decoder_name = OCSD_BUILTIN_DCD_ETE;
 		trace_config = &trace_config_ete;
 		break;
 	default:
 		return -1;
 	}
 
+	return ocsd_dt_create_decoder(decoder->dcd_tree, decoder->decoder_name,
+				      flags, trace_config, csid);
+}
+
+static void cs_etm_decoder__free_core(struct cs_etm_decoder *core)
+{
+	ocsd_destroy_dcd_tree(core->dcd_tree);
+	core->dcd_tree = NULL;
+}
+
+static void cs_etm_timestamp_decoder__zfree(struct cs_etm_timestamp_decoder **decoder)
+{
+	if (!*decoder)
+		return;
+
+	cs_etm_decoder__free_core(&(*decoder)->base);
+	zfree(decoder);
+}
+
+static int
+cs_etm_decoder__create_timestamp_decoders(int decoders, struct cs_etm_decoder_params *d_params,
+					  struct cs_etm_trace_params t_params[],
+					  struct cs_etm_timestamp_decoder *decoder)
+{
+	int i;
+
+	if (cs_etm_decoder__init_core(&decoder->base, d_params))
+		return -1;
+
+	for (i = 0; i < decoders; i++) {
+		struct cs_etm_timestamp_source *source = &decoder->sources[i];
+		u8 csid;
+
+		source->decoder = decoder;
+		source->protocol = t_params[i].protocol;
+		if (cs_etm_decoder__create_etm_decoder(&decoder->base, &t_params[i],
+						       OCSD_CREATE_FLG_PACKET_PROC,
+						       &csid))
+			return -1;
+		if (ocsd_dt_attach_packet_callback(decoder->base.dcd_tree, csid,
+						   OCSD_C_API_CB_PKT_SINK,
+						   (void *)cs_etm_decoder__timestamp,
+						   source))
+			return -1;
+	}
+
+	return 0;
+}
+
+static int
+cs_etm_decoder__create_packet_decoders(int decoders, struct cs_etm_decoder_params *d_params,
+				       struct cs_etm_trace_params t_params[],
+				       struct cs_etm_packet_decoder *decoder)
+{
+	int decode_flags = OCSD_CREATE_FLG_PACKET_PROC;
+	int i;
+
+	if (cs_etm_decoder__init_core(&decoder->base, d_params))
+		return -1;
+
 	if (d_params->operation == CS_ETM_OPERATION_DECODE) {
-		int decode_flags = OCSD_CREATE_FLG_FULL_DECODER;
+		decode_flags = OCSD_CREATE_FLG_FULL_DECODER;
 #ifdef OCSD_OPFLG_N_UNCOND_DIR_BR_CHK
 		decode_flags |= OCSD_OPFLG_N_UNCOND_DIR_BR_CHK | OCSD_OPFLG_CHK_RANGE_CONTINUE |
 				ETM4_OPFLG_PKTDEC_AA64_OPCODE_CHK;
 #endif
-		if (ocsd_dt_create_decoder(decoder->base.dcd_tree,
-					   decoder->base.decoder_name,
-					   decode_flags,
-					   trace_config, &csid))
-			return -1;
+	} else if (d_params->operation != CS_ETM_OPERATION_PRINT) {
+		return -1;
+	}
 
-		if (ocsd_dt_set_gen_elem_outfn(decoder->base.dcd_tree,
-					       cs_etm_decoder__gen_trace_elem_printer,
-					       decoder))
-			return -1;
+	for (i = 0; i < decoders; i++) {
+		u8 csid;
 
-		return 0;
-	} else if (d_params->operation == CS_ETM_OPERATION_PRINT) {
-		if (ocsd_dt_create_decoder(decoder->base.dcd_tree, decoder->base.decoder_name,
-					   OCSD_CREATE_FLG_PACKET_PROC,
-					   trace_config, &csid))
+		if (cs_etm_decoder__create_etm_decoder(&decoder->base, &t_params[i],
+						       decode_flags, &csid))
 			return -1;
-
-		if (ocsd_dt_set_pkt_protocol_printer(decoder->base.dcd_tree, csid, CS_PKT_MON))
+		if (d_params->operation == CS_ETM_OPERATION_PRINT &&
+		    ocsd_dt_set_pkt_protocol_printer(decoder->base.dcd_tree, csid, CS_PKT_MON))
 			return -1;
-
-		return 0;
 	}
 
-	return -1;
+	if (d_params->operation == CS_ETM_OPERATION_DECODE &&
+	    ocsd_dt_set_gen_elem_outfn(decoder->base.dcd_tree,
+				       cs_etm_decoder__gen_trace_elem_printer,
+				       decoder))
+		return -1;
+
+	return 0;
+}
+
+static struct cs_etm_timestamp_decoder *
+cs_etm_timestamp_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
+			      struct cs_etm_trace_params t_params[])
+{
+	struct cs_etm_timestamp_decoder *decoder;
+
+	decoder = zalloc(struct_size(decoder, sources, decoders));
+	if (!decoder)
+		return NULL;
+
+	if (cs_etm_decoder__create_timestamp_decoders(decoders, d_params, t_params, decoder))
+		goto err_free_decoder;
+
+	return decoder;
+
+err_free_decoder:
+	cs_etm_timestamp_decoder__zfree(&decoder);
+	return NULL;
 }
 
 struct cs_etm_packet_decoder *
@@ -666,49 +801,22 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[])
 {
 	struct cs_etm_packet_decoder *decoder;
-	ocsd_dcd_tree_src_t format;
-	u32 flags;
-	int i, ret;
 
 	if ((!t_params) || (!d_params))
 		return NULL;
 
 	decoder = zalloc(sizeof(*decoder));
-
 	if (!decoder)
 		return NULL;
 
-	decoder->base.data = d_params->data;
-	decoder->base.prev_return = OCSD_RESP_CONT;
-	format = (d_params->formatted ? OCSD_TRC_SRC_FRAME_FORMATTED :
-					 OCSD_TRC_SRC_SINGLE);
-	flags = 0;
-	flags |= (d_params->fsyncs ? OCSD_DFRMTR_HAS_FSYNCS : 0);
-	flags |= (d_params->hsyncs ? OCSD_DFRMTR_HAS_HSYNCS : 0);
-	flags |= (d_params->frame_aligned ? OCSD_DFRMTR_FRAME_MEM_ALIGN : 0);
-
-	/*
-	 * Drivers may add barrier frames when used with perf, set up to
-	 * handle this. Barriers const of FSYNC packet repeated 4 times.
-	 */
-	flags |= OCSD_DFRMTR_RESET_ON_4X_FSYNC;
-
-	/* Create decode tree for the data source */
-	decoder->base.dcd_tree = ocsd_create_dcd_tree(format, flags);
-
-	if (decoder->base.dcd_tree == 0)
+	if (cs_etm_decoder__create_packet_decoders(decoders, d_params, t_params, decoder))
 		goto err_free_decoder;
 
-	/* init library print logging support */
-	ret = cs_etm_decoder__init_def_logger_printing(d_params, &decoder->base);
-	if (ret != 0)
-		goto err_free_decoder;
-
-	for (i = 0; i < decoders; i++) {
-		ret = cs_etm_decoder__create_etm_decoder(d_params,
-							 &t_params[i],
-							 decoder);
-		if (ret != 0)
+	if (d_params->operation == CS_ETM_OPERATION_DECODE &&
+	    cs_etm__has_timestamps(decoder->base.data)) {
+		decoder->timestamp_decoder = cs_etm_timestamp_decoder__new(decoders, d_params,
+									   t_params);
+		if (!decoder->timestamp_decoder)
 			goto err_free_decoder;
 	}
 
@@ -776,8 +884,9 @@ void cs_etm_decoder__zfree(struct cs_etm_packet_decoder **decoder)
 	if (!(*decoder))
 		return;
 
-	ocsd_destroy_dcd_tree((*decoder)->base.dcd_tree);
-	(*decoder)->base.dcd_tree = NULL;
+	cs_etm_timestamp_decoder__zfree(&(*decoder)->timestamp_decoder);
+
+	cs_etm_decoder__free_core(&(*decoder)->base);
 	zfree(decoder);
 }
 
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 376feffd6558..125696520625 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -104,7 +104,7 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      cs_etm_mem_cb_type cb_func);
 
 
-int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder);
+int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder, u64 index);
 const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder);
 
 #endif /* INCLUDE__CS_ETM_DECODER_H__ */
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 6bd833d9ed81..d275d3701165 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -845,7 +845,7 @@ static void cs_etm__dump_event(struct cs_etm_queue *etmq,
 		buffer_used += consumed;
 	} while (buffer_used < buffer->size);
 
-	cs_etm_decoder__reset(etmq->decoder);
+	cs_etm_decoder__reset(etmq->decoder, etmq->offset);
 }
 
 static int cs_etm__flush_events(struct perf_session *session,
@@ -877,6 +877,9 @@ static void cs_etm__free_traceid_ctxts(struct cs_etm_queue *etmq)
 	struct cs_etm_traceid_ctxt *tidc;
 	struct intlist *traceid_ctxts_list = etmq->traceid_ctxts_list;
 
+	if (!traceid_ctxts_list)
+		return;
+
 	intlist__for_each_entry_safe(inode, tmp, traceid_ctxts_list) {
 		priv = (uintptr_t)inode->priv;
 		idx = priv;
@@ -2085,7 +2088,7 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	 * We cannot assume consecutive blocks in the data file
 	 * are contiguous, reset the decoder to force re-sync.
 	 */
-	ret = cs_etm_decoder__reset(etmq->decoder);
+	ret = cs_etm_decoder__reset(etmq->decoder, etmq->offset);
 	if (ret)
 		return ret;
 
@@ -3251,6 +3254,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 
 out_free_decoder:
 	cs_etm_decoder__zfree(&etmq->decoder);
+	cs_etm__free_traceid_ctxts(etmq);
 out_free:
 	zfree(&t_params);
 	return -EINVAL;

-- 
2.43.0


