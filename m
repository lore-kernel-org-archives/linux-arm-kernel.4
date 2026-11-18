Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7860A2621
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHU6sy+g;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZF+L+tQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WRHWKRUMRo3z2ZrNBL7a1kOoOgKp/NNfuj874KBAObM=; b=vHU6sy+gbTJzN9
	pxbXmmJ9bNOfhB2UOYX68A/KkhHrEIyVO6EcE1BUYCnET5gr0Bcy1yFWC6pGwFnUJAxwij4HyF4US
	jLNHEtGM0aApp39HhMgUkgSe667KP7aNDjY1JcsQPCla3VFScHfvKBA1ZV6I6sxdas0DHj2m/FhF7
	gSXnyJ/YtvRZCPCapEjC92Em6jKoiSyo062KG5PGCR9svf+fJOLUZWbbo9oWPdYoT5yxlPDxJRp6b
	4EUy8yzu9s5HonljXYZvvetRXPTT+kUVU4tzKcjWOV5VpuHRdAaZ4lFToLCArnywJj0ACvUMpvzQa
	bKyxivmRjgyNCF3XnvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXq-00000009U7f-1qEV;
	Wed, 18 Nov 2026 16:30:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXj-00000009U09-40xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-492f563d1c6so455977f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019393; x=1795624193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRHWKRUMRo3z2ZrNBL7a1kOoOgKp/NNfuj874KBAObM=;
        b=ZF+L+tQhZSvFSC1M2fzgcyOuJAQYWR1CQLEXBU95pKNSRdXLbbVXEQDo/rdznsK/L2
         XBPp+Kalb1Gcj9rZUttMvXVOCvQz84AnV+XdqU42/GD8gxiqS/AsqQEuqJWwzyp6TXjz
         HjMGUeTDm+Qq6REY9qS4LfiZ5PnW+qIMYP2A2ojiGGPcxFgh+VaIyQ55CzwaRuTY7ntA
         7f98ktvEWZvZr52b5mnIFVLG9QF0Ld+8CIBlLcIZ7Iw+MJiboQA8MwYSwihmTzFO/MnB
         iWOUaCaOUpcHOWwdOr8WIrzOOpyZ2AtagtJQoCP8QL2MlxdXntwLtV3DTWkWpyfxdMmG
         Kwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019393; x=1795624193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRHWKRUMRo3z2ZrNBL7a1kOoOgKp/NNfuj874KBAObM=;
        b=RRAypuOAvtoVuS+47IWhXFJsxRC70zZku3jItbnAr/ds3W51JKlRqzcDg+D6NNDA2d
         16RUEZF4uQO2c4q1Iag+uwKb/M/XOudDOKJpQ2ruXojmfHnok0xYhn7YZzbai5ZFQUyR
         C4J2cmd8CF3RGbkAHntJd2RAgchkvGVzd/xUiar7xj9+c1Yzp6tcjsnBIUUeB2O7eYSK
         yxSlZnM52zCWbYAzCl8mbC1R5bV5UA1yyvr3hzJ2AO9yGiOyKzh90YOWae2VX+HqXcOt
         QJDx6jfst03Lt/BkWENPyDLTcByKY7N/XliKSg0x6e4hc0w+BHxuXEmz0vuPFiohQmWO
         baqw==
X-Forwarded-Encrypted: i=1; AL+hErHcrrBbTb8TmNPsJFar5fo+IY5vqt0j6HbewzssbziYZP9vmx/Wv66qyDmdofR3/jpX8pmWQ3ZCMxNArvQYzhmx@lists.infradead.org
X-Gm-Message-State: APuU4Z/t9tD3HZPTkynGbB9zSjaQEE2ItJaONlpO4uMBbg47GiXnKu6o
	8/y6cOPkE6RdPuDiYRzTFigbVCYdhN6CmFB2Mn4ueGVbIpnfoVlRg4TZEO0s6R32Hg4=
X-Gm-Gg: AYBFou3JUmuj0ou4V/zmUxBaBfi5VKgFdSYAbIX4MPCBPTkmTe1T5bl9v7xTpyjT2DO
	Rv0n6rGBwdoTRfMdXLkCQaU+tVS7tU8gnDVpz+WVR71EOvrsrGICC73clWF0gwrM14Wv9ib3868
	T6+I5m24ZWKFmsPUMiXOzbdse9vWHX5LvlkjoVwpoTj2pN5rEq65Rg8mn4w5rVrv3tHY+pqgbPB
	QIb7CPgujQ4S1LyJEZszfTiXUAbkkogvlYsNA3OXhW8lRHnOUV0izJ/MltGtOn3UaNL8wxrZDyg
	FfwczmrggoAYveEJYErClUoRShFbU5M9Ecp5a0oZCUkbVzgWrNP/fiNGiJJLMs4pA95PKpcxSDU
	YEAg0QEtMhaRqNBT+yyC1z4kdcAwV/xMJZu9d2vt3f2Hk5IabykrKi4I4UzuK6IeaUai4DbGyBH
	58pQf0qSaBtcAA9k50tzcsvyfxV0CHkGXT665qgXM6Lb2gKb2YAk85i0ccHZ0iQcqIlkFe6REH3
	tRCmxQoV57fiKVsO9oJO0aEIJsDu7X32ZCABcqk1e1JhF4D7emuXYpqYe50JW/MuqUhd/U7mQQI
	QDKjZxkQQML3snPPk70gzxwvnj68Uuf+dIPm3w9etq9VUBDKbXniSg==
X-Received: by 2002:a05:600c:1d0f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb7da349e2mr62508195e9.23.1795019393189;
        Wed, 18 Nov 2026 08:29:53 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:27 +0000
Subject: [PATCH 05/34] perf cs-etm: Use the exception level to tell kernel
 from user
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-5-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082956_042473_1803E1AC 
X-CRM114-Status: GOOD (  17.78  )
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

cs_etm__cpu_mode() decides whether an address is in the kernel by
comparing it with the kernel start address. On arm64, modules are loaded
below that, so module code is looked up in the thread's user maps which
results in a decode failure.

The exception level of the trace is known for ETMv4 and ETE, so use that
instead and only fall back to the address when it's unknown. This
enables the ability to decode trace from kernel modules.

Fixes: c9a01a11dfe6 ("perf tools: Add support for decoding CoreSight trace data")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  6 ++++--
 tools/perf/util/cs-etm.c                        | 12 +++++++++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b9397151748b..f133e11ccc7b 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -462,7 +462,8 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 	packet->last_instr_type = elem->last_i_type;
 	packet->last_instr_subtype = elem->last_i_subtype;
 	packet->last_instr_cond = elem->last_instr_cond;
-	packet->el = elem->context.exception_level;
+	if (elem->context.el_valid)
+		packet->el = elem->context.exception_level;
 
 	if (elem->last_i_type == OCSD_INSTR_BR || elem->last_i_type == OCSD_INSTR_BR_INDIRECT)
 		packet->last_instr_taken_branch = elem->last_instr_exec;
@@ -607,7 +608,8 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 
 	packet = &packet_queue->packet_buffer[packet_queue->tail];
 	packet->tid = tid;
-	packet->el = elem->context.exception_level;
+	if (elem->context.el_valid)
+		packet->el = elem->context.exception_level;
 
 	/*
 	 * A timestamp is generated after a PE_CONTEXT element so make sure
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 51431a4d5db7..3fce3c357943 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1134,8 +1134,18 @@ static u8 cs_etm__cpu_mode(struct cs_etm_queue *etmq, u64 address,
 			   ocsd_ex_level el)
 {
 	struct machine *machine = cs_etm__get_machine(etmq, el);
+	bool kernel;
 
-	if (address >= machine__kernel_start(machine)) {
+	/*
+	 * Prefer the exception level when it's known, because arm64 modules are
+	 * below the kernel start address.
+	 */
+	if (el == ocsd_EL_unknown)
+		kernel = address >= machine__kernel_start(machine);
+	else
+		kernel = el != ocsd_EL0;
+
+	if (kernel) {
 		if (machine__is_host(machine))
 			return PERF_RECORD_MISC_KERNEL;
 		else

-- 
2.43.0


