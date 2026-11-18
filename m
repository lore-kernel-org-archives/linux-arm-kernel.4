Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB14E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=upB2R1of;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GgVG8kOR;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JFLVxPet
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=; b=upB2R1ofUGV0kL
	brQ2cfHk8XEZ+dssy7AjHYf41p8ngN1Qr1br5oLPvTpPV5l2bKTr0pL829+4+iHZl80jfDrtOQar6
	ydiuQqAWmVVpN2Iq5mQd3h5u4w1He7zZk7Uq/oF5gJ3xRDQY4TvnXLrNul9k6wNgTBX5DqiYmozd9
	boG0RX85ai2d6tEuzZxxo0n4U1T75N4G3iXbxDq63G6cm/Dz/5xoTp9QcnrHU/K6KiQti0pnHltq8
	Vk0GTSYp8LiqYdZuWCZ/BnSvTk4+qarg0ajlHlP/N66XsXN76X99fHAhESZ01CPCC55LOHmFN6Bof
	6aYHzE+ju6EpTc8UFVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZD-00000009VPw-1RVI;
	Wed, 18 Nov 2026 16:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYB-00000009UYb-2qY6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=; b=GgVG8kORkv1gWyPxW2CJ2H8fUA
	OyQq3SuYMpKaAd1ye9ahwWSMD/zpElVCAWVswxGYGMdfXx+r5TmjoyhkCwnocmspHZ2jy3UikjdwM
	PBzjx8GAJphveccrPx0bGyP33j/mF68gExxc97fudYp7rEn07SNYvgwrtyfX6Dkt8g/teNHGrhsFw
	scsi/ZH2h+/yL1pD9QPbBxtPiONQVaQzh3nzR05l4R4Rjumr1hvoDvSwH1/xf/IDwty8+hl8kiE4Z
	fiuZSl5CzyVVU6Ak4dtS9GSPx/Tj4zwR5uBALOmETJ/NzhNps1+l8i+tCEPHRD2lf7+qhWSmpSClu
	tW4fvp6g==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiY7-0000000GGjt-3na2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-491971ac844so1206824f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019418; x=1795624218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=;
        b=JFLVxPetzSVXIY7oMVvKz4aYli4dK3k+jzLVYIjpLPWd/POZ6YBf3cQ0JSUMWl5kIM
         aiFox77Kicg3zKYLjPKcKGz/xhRmlhaQAZXhsaZ/EhIjBJqUUgHcG1hr/catmoBuHUkK
         1fX14+ois2BGVA4OM9pbAkg+qpZL25TwxOQkd2kGV75V3jpLaoFbxqs61xc3GsuR8JnL
         V5MiJJKNftr3xoHKJkwhWK5DtCsgPwDYOnO3U+ywuPES7txV56VQ5hxWXRTKYaCiMVhZ
         wuEoPpgyZcqmghUYc7AUfS8ryKYq9wk6jXOPavYp6ruPD3CM5uY785o4RnxI5lw9DKl7
         vXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019418; x=1795624218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=;
        b=FEHU/ehEbsv8/ZpbKksCpp+JsAS2GfXbq1YDIvp4Hewav1ODPZuqK9ZOszPgaNWfOA
         dOigic+qelCyTF9mhfQgwc+P7UfEEqcwWS/3uXlMp1FIENezub8dkX7YQrS0c49cxFUm
         ltPoL8eiIuQCWvKY7b+ibuRBPJktVXZzx8vuNUKRmN2pPlg9gaetjFshdpHDaO4xzJqX
         jWzWAOpMYndgin9LKQxZBWu3D+BZHITEPW8QCvYtmHyq/XYse/aRvHYCKeDRmC3m+CFK
         iPn5MzZjDWDARvqrL+7Y0M4GZdz7g1ojJdvz5TeshBwowZy40jxxvHQsJIl9ixz2eQFB
         AEpQ==
X-Forwarded-Encrypted: i=1; AL+hErG0fZo4mSe2hpXjKJCHvk0MroiDhu23BJ7FFpvrecPFhhNQdvPFp4mPL7OArdINemm9j/Nww6CQUCfwLBCLkWPx@lists.infradead.org
X-Gm-Message-State: APuU4Z/L4mZ/D1Dy+LaWwHQpuZ+oXMHIq++baTBEyrufnqHfGCzOMPYT
	+nVSriBr+t65jNJQq6Tmy3xiHKpSdiD1s1ovHZRWOu0owPKRaAF0/Dll2n8W4tP+5v0=
X-Gm-Gg: AZFdTZd++6HLrqgvpBnivvgQ5qcPz00fHGXjkEWaudsjm21PkVfFMFR8FgeL1wLz8A1
	F34eTR1/1aMF7h7QB4IA3ZuE0J7alnFYeHp7BOPTHnlA74U6k59kosBw0dg+1qfFpoL0CofYMMQ
	57qlOK7tQ/e9cpVlB6XATgLwNoe79otq/GYR8aNHJ6JmZ36tD4it1e/BYpl3tqz2E+KllFuVXjq
	CLnCjtSvNYXnTAYd5zpRzesK1s9QqzC01S7otJB/RWZeUkC2omnEgrhw/3yVyliElYUghb07dMj
	7dUXuOy6LJ6hzsUw7jz7hPlFYOi+6RGXnt/HygMEn9l12dyohXW3muGrmmMozv7u8xZ2dEVOJNk
	+zzMuuEACokSq/SjxL03gw8PJNeSnfM4BSShHLSPXG8Ha434HOtJ25A6wFnFmQ9UQ7flTvtFQjy
	yrSxS3UYknVp1wlpsD3N71uC8/PjtEZfkb2BEDb8jtZMwfwImn6o1cYrBQ2G1QCmxwPTP5gBCUU
	5NlRfOz216zJdfbJOXD2pF0NUcPgA23w7hjrAXWkiQb+C/tqdPOiBhT9AY7K0TrH7kR3dhyWBLB
	KRygQy7tME5c/uJNtT2swoBeDReoAXER1A==
X-Received: by 2002:a05:6000:64d:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4a63b603a06mr6175135f8f.31.1795019417807;
        Wed, 18 Nov 2026 08:30:17 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:49 +0000
Subject: [PATCH 27/34] perf cs-etm: Add packet-only timestamp decoder ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-27-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_163019_915535_46B818A3 
X-CRM114-Status: GOOD (  17.22  )
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

Add OpenCSD packet-processing callbacks that find the next timestamp
without fetching instructions or producing instruction ranges. Bound the
search with CS_ETM_TIMESTAMP_SEARCH_MAX packets.

Keep the timestamp search state in cs_etm_timestamp_decoder, separate
from the full packet decoder. Each source's callback context identifies
its protocol. The frontend continues to use the existing full decoder.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 79 +++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 4f8da538d645..685d8d75912f 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -33,6 +33,14 @@
 #define CS_PKT_MON	0
 #endif
 
+/*
+ * Limit when searching forwards for a timestamp.
+ *
+ * Timestamps follow context packets (which appear on trace on) after only
+ * 1 or 2 atoms. Allow up to 1024 packets across all interleaved trace IDs.
+ */
+#define CS_ETM_TIMESTAMP_SEARCH_MAX 1024
+
 struct cs_etm_decoder {
 	void *data;
 	void (*packet_printer)(const char *msg, void *data);
@@ -48,6 +56,19 @@ struct cs_etm_packet_decoder {
 	struct cs_etm_traceid_ctxt *traceid_ctxt;
 };
 
+struct cs_etm_timestamp_source {
+	struct cs_etm_timestamp_decoder *decoder;
+	int protocol;
+};
+
+struct cs_etm_timestamp_decoder {
+	struct cs_etm_decoder base;
+	u64 timestamp; /* Raw trace timestamp. */
+	u64 timestamp_search_index;
+	u32 timestamp_packet_count;
+	struct cs_etm_timestamp_source sources[];
+};
+
 static u32
 cs_etm_decoder__mem_access(const void *context,
 			   const ocsd_vaddr_t address,
@@ -512,6 +533,64 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	return resp;
 }
 
+static ocsd_datapath_resp_t __maybe_unused
+cs_etm_decoder__timestamp(const void *context, const ocsd_datapath_op_t op,
+			  const ocsd_trc_index_t indx, const void *packet)
+{
+	const struct cs_etm_timestamp_source *source = context;
+	struct cs_etm_timestamp_decoder *decoder = source->decoder;
+	bool timestamp = false;
+
+	if (op != OCSD_OP_DATA)
+		return OCSD_RESP_CONT;
+	if (indx < decoder->timestamp_search_index)
+		return OCSD_RESP_CONT;
+
+	decoder->timestamp_packet_count++;
+	switch (source->protocol) {
+	case CS_ETM_PROTO_ETMV3: {
+		const ocsd_etmv3_pkt *pkt = packet;
+
+		if (pkt->type == ETM3_PKT_TIMESTAMP) {
+			decoder->timestamp = pkt->timestamp;
+			timestamp = true;
+		}
+		break;
+	}
+	case CS_ETM_PROTO_PTM: {
+		const ocsd_ptm_pkt *pkt = packet;
+
+		if (pkt->type == PTM_PKT_TIMESTAMP) {
+			decoder->timestamp = pkt->timestamp;
+			timestamp = true;
+		}
+		break;
+	}
+	case CS_ETM_PROTO_ETMV4i:
+	case CS_ETM_PROTO_ETE: {
+		const ocsd_etmv4_i_pkt *pkt = packet;
+
+		if (pkt->type == ETM4_PKT_I_TIMESTAMP) {
+			decoder->timestamp = pkt->ts.timestamp;
+			timestamp = true;
+		}
+		break;
+	}
+	default:
+		return OCSD_RESP_FATAL_INVALID_PARAM;
+	}
+
+	/* Report where the timestamp was found */
+	if (timestamp)
+		decoder->timestamp_search_index = indx;
+
+	if (timestamp ||
+	    decoder->timestamp_packet_count >= CS_ETM_TIMESTAMP_SEARCH_MAX)
+		return OCSD_RESP_WAIT;
+
+	return OCSD_RESP_CONT;
+}
+
 static int
 cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 				   struct cs_etm_trace_params *t_params,

-- 
2.43.0


