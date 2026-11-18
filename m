Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C4606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0CX+gII;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bVLM09yF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9rbmVMuhauk6RT7/BuxdWNH6HE9Yom6LLFGVubFIKV0=; b=S0CX+gII1DHYWw
	JVD3XCC2TgvM/T6JYlVk1cDVRtbbhVNi+yIxTyKTG0pdJ2KqTlbYXrGBRpWtyoyo5Irna6ddxREC1
	gnSe/ltAJWMiL5jbWpP4S6VjJz7tbcLlh6sGvWqNZYgNMokHa94LvggInrQgroPmuEb/OGU1LTypu
	gmFhq098SRZSUEx4K2HrK//Og8vBfrRTq4nxbiJCDlmBs9Rc/C/SEINzYZHqQLYvblrpMIJHuqm+8
	AQbBIFYHg4S2bMIXwcM7cv5BIbupUdafEVuqXtv4ivNJSEmB99tPKkowCxs/U5bhHRlASXWi64jCw
	OsVx6EX2OHzD8M+TfLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXr-00000009UAG-1zRa;
	Wed, 18 Nov 2026 16:30:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXm-00000009U2E-3VRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b001cd92bso728638f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019396; x=1795624196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rbmVMuhauk6RT7/BuxdWNH6HE9Yom6LLFGVubFIKV0=;
        b=bVLM09yF8r1j2P3wHUBqk+uK1BGhmk0S298Gw35CHxzgDyFfG3NvlQ53qB+0fvys8u
         rWblOiTa8+MiM69OdvDZU5R5H19t5i+pzz8RQUhZFnvnLmyW4CX8YQy1rwO36EWeBFbT
         cqSgljGO+xHzSv8SYiiDHiDgnv9O3EXOmgH5tMlaqYTj65qCxUxxkLD69IkGA7Z2DRF8
         pLPs72aeF5gfaP5m9cKOIRsT8zL/IDMMyk1DWwrxGD1Hbq7HOAj7TOwxY6T4ms/6osAu
         bIBjKsbMikgGVSKqQ8p96uPJ99URkxmMky/FMQV4/9R6FcI1dYnEW3hTUU3IxpeNqvLv
         xOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019396; x=1795624196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rbmVMuhauk6RT7/BuxdWNH6HE9Yom6LLFGVubFIKV0=;
        b=LlrMFObDCV6G+56JFtZbcAK9H0xPj/9E128/oknMaT3Flvt++fpsYeGMzGLeGI0gH1
         Z7xYYjqAHC+SWLx4Fid5TmOJ3N6lwAKYYNWrIAi1IIEBr+FQ5KbtJRz7AIhnGsXGrq1g
         Kb1RYla3oztn/l977j9qiWTHg/1wBM3A5TuKCSfiCOkHnN84XIphGvCjKO2dHax+NPTf
         e1naNh0H/2yqkGqdXpINcKVBtv4H++D+yPquImqfSSUzyw9OyBOMp9QKLVdUkbMh5Fe5
         Tg+2PLo7nNm+sEO6QKQswRB+/0TYlzC/15tB5K970gtt3flMYSm+DFhIFeeV+TnMu2Bl
         rOjw==
X-Forwarded-Encrypted: i=1; AL+hErHd4c9fAjJf9932uoN2PwJsL0GVdJBw6xiouvVO3QTRxvlu6h57Um4gWcNjYHqIEbdAXS8aVgRBIKWajPezCXwx@lists.infradead.org
X-Gm-Message-State: APuU4Z+7+YuqKzpp35lsyPhTys7zvZpQ7OEHxu6rmFIx4vk+ENo+P3RE
	FnGya7g63i3ReavNjbfR4x71laP0HuH7x6nR8rBlZFgtj4fzo0gh9GQBsHjA1esq2ck=
X-Gm-Gg: AZFdTZcwDKUEsTMdbibwm7EST+8ZIfpNQQFqSaqhkKDxArBlasThuNRC4alh3ogRDG6
	FQthG73O99l0Tlt+Iz4faFo+R/rjpoa6cu1NGz+BWRyyk6GZm0USLsLWeLQ6yvPCRvQ1akX5+yD
	IM9qDYiH3KClM2qL8iJw5Veqinr+jyeB/MylUxTLsNZWP9QJPhZQZb7rpgfLGKbEfpitAku8aqq
	sLUTvPqHEVyTFiLWB35zTHF7Z70gIYUz5DVNNTPz/RNNlmtwYazSyVBDu3cFX/nriUtrm6yiBi5
	oTMb2hbAUOfBmy6fU5CkkhK5Ff/i1yDakjD4ZGdFwFUyRW9KW0lR+IZLY1+ZWHL5bp6XbIJGjej
	pm8Uz/t9FGm6f1Cx/R1BL+B4LO1pFHxM9yfh4fI2WwOTItHPud6FiAp6m3Jc3BsLxezErpVuifi
	hD37lRcoh28zdaaNbMiAio6RmuUsYymZsXhTeeTg4wnSgHJmEVm7eRI/iVn1X/y3sbDmGjNHnpd
	wIMaa0uU8fkIfQ/zTCGKS8BKbXD5H2kv5DX4ZkXRF4kjq23twg8XoyNGHVkMHHJdXtXhvTDF/RB
	CYtzf0MWenOrTnuJ3raFEdwZJsQCcasp
X-Received: by 2002:a5d:5888:0:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-4a638338280mr6254961f8f.12.1795019396217;
        Wed, 18 Nov 2026 08:29:56 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:30 +0000
Subject: [PATCH 08/34] perf cs-etm: arm-spe: Use arch timestamp in HW
 tracers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-8-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082958_929803_DEE5DD69 
X-CRM114-Status: GOOD (  10.59  )
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

To allow the JIT dump records to be correlated with the HW timestamp in
trace, set JITDUMP_USE_ARCH_TIMESTAMP.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c    | 5 +++++
 tools/perf/arch/arm64/util/arm-spe.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 84a5d7392a5f..809da6f1a892 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -909,6 +909,11 @@ struct auxtrace_record *cs_etm_record_init(int *err)
 		goto out;
 	}
 
+	if (setenv("JITDUMP_USE_ARCH_TIMESTAMP", "1", 1)) {
+		*err = -errno;
+		return NULL;
+	}
+
 	ptr = zalloc(sizeof(struct cs_etm_recording));
 	if (!ptr) {
 		*err = -ENOMEM;
diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 8d6a2bde2892..53899c7de846 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -521,6 +521,11 @@ struct auxtrace_record *arm_spe_recording_init(int *err,
 		return NULL;
 	}
 
+	if (setenv("JITDUMP_USE_ARCH_TIMESTAMP", "1", 1)) {
+		*err = -errno;
+		return NULL;
+	}
+
 	sper = zalloc(sizeof(struct arm_spe_recording));
 	if (!sper) {
 		*err = -ENOMEM;

-- 
2.43.0


