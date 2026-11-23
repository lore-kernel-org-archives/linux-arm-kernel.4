Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8CE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hswgBWt8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=algQOxSE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rJQj8diT46gF85iLvVaD+FzVg+GKyURO+Mwx9Pr2V/8=; b=hswgBWt8iYz9R3Xzvq6HpD/0jD
	WYN4RJPGP9fWqxaP4gvKh6mXI17Hk1JwuV2PYSvNptxgEECOZ0h+abPtCNU17RCvHEIASNP0YrgGv
	rghlCB4In6x289ctPkwvm1LLpOc+WHpxZBfZE+J4mmoLSy+9yZOfKPvxE50ia/3xmyt/wwGY9BL40
	PBHuLTG+CjUcBQCa+vGBLX68QYhR0wPLTVQle9MSJyHSkvpWBYkB8MqjdU0toOzOoCJYyGjo9mu2k
	sqotpAJajoDnlmGAdTEH1lOOUpQVRgagekFptIe5sxFslgrg6raOPHpPrfitiDV0c12vpLQozbT1n
	G23D5eWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOcM-00000002TAG-1EoZ;
	Mon, 23 Nov 2026 07:37:38 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOcK-00000002T9u-0h1k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:37:37 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso1766629a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795419455; x=1796024255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJQj8diT46gF85iLvVaD+FzVg+GKyURO+Mwx9Pr2V/8=;
        b=algQOxSETFykS4RPYyHnD/zlWDHCbFNKUZ7/0jYIMSFwCF4HbI/5b82P/8dHF9BUyS
         ha5zDJB5j4Pa7R9yICCz//GV/92cjmXd//PyquLnvKd8+k9+8nEE+90hGXfaMW6dvz7w
         vostw+H1iNE5lK6Uxvxf6p5F2ir9yCl8ux+36hwbBUqzMImE7r0qkkVcwvYdz0Jvvo76
         au7lJim0BviRuyh8ShQq2qw6dEB4qutJ7/JU4R0CRHkhBLZAFfyuN0OcXOR+GvZ10/UP
         0bGLNUOoIF6zCYoJ5hgDbmbyYcZ+rpSpG4TptfNh/R7mK0UAMrsYAiWa1KqzYfwiPfiI
         gB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419455; x=1796024255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJQj8diT46gF85iLvVaD+FzVg+GKyURO+Mwx9Pr2V/8=;
        b=OREOzoP7BkycvziS1H6e9vWUtOvAbqHJHFddhN1jsoWyQ5alRaGWoIv3WmjFaKikcv
         bju3eemhap5tQ5tTZad/Hw1mU11b+2gso5b4DfgTGl/PpHtT/qjJZiM/YtIlShXIk0WO
         ASHy7767Tq5T3f6Kk05ktcuhFCwNaFpW1kFJaKL09qP4dzmnMI54uD4hit3m1ItjIkv/
         XZ0nhTqpml6dpGpszag19Cg/DPkNB7v/gDAeQxmgX6Y87gUVO1TNfs17zP278d8rzmZG
         Ds9PYk7F9fxjxt+r7L6Yg1iLtjjYqeHa9fCfcoy8TK5nquC7IsPSo5vqqXRDMxTbpmEM
         NlfQ==
X-Forwarded-Encrypted: i=1; AL+hErE3il64H+cHnYUct8H8tfWTxbfqyp0jXxDzA4zz2lu0GQ1Vm/lTUzNW2nE1ziYOk/7nKbB5Ufb13jtLJCb5EY6b@lists.infradead.org
X-Gm-Message-State: APuU4Z/yfG1Ilhn8DOh++TGZT9T13Pq/hRgWrOO88Y9g+raWBr8evGoO
	/3Rup9L+SNhkSv5Tw8mJqIKCqKPhVSSklMxHnMcYn2VjceBCMxNxjM9r
X-Gm-Gg: AZFdTZdgR/Mn9cO+BSU6U2n/ZXhFDYiBmZkCkPtXm/gObL4QTo7rwI2DCv03BFOUZSb
	C/oKRuR311JXTEMX65Zh8ELcQWcpHfDk0PFQhQYiWDhM5DK5OJXL0kzaNCcG/Rgl44kujn7zAgv
	4zhq5nm/TUk+xR/POSo4c6poxWUSSo9G6P0dGo4C41NhlgkLtAIb4Cksw8zoYk49e0jo/rvnZqw
	6AY7BlherV+5888g1XuBwVojZMlyNivZVKu9Sd/B8a9FaRJ08S2Y6KecQO7Mng2JcB2uK/FB3rJ
	qRdnftG5GZVyT+0IBP6IdxgYuInxGGiQ+N2bE0HUZHpIFfQ9p5k7pj0nlvCl0L211g6/S1gk2Rt
	zYspB/qoB1a1Md/GMefuvf4SGyyJ3DtxdlB4Na6GCCLjIQiBSAz0e8FWmIUGjOrLfz8uGegNwP9
	H4mQAbP1lus6ZW22IAbLqBJsAdPyJ4Oefm2UslY0M0i01ZF3uea2LyWx+nXc7lqrs0tHEAvXpt9
	OHhbbyaQeOVIZU2xkanuvbWIio8zPcBipVgzgiFnv9+UsLRFumQ4HBf2YD4tZ6IakUPcDrnpEMY
	wt4ulQdO32faABs8aNCyn/5mDgc88qOn7g==
X-Received: by 2002:a17:90b:4c4f:b0:3b1:ae88:5c31 with SMTP id 98e67ed59e1d1-3b41c959673mr10442468a91.43.1795419455243;
        Sun, 22 Nov 2026 23:37:35 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm227222a91.5.2026.11.22.23.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:37:34 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	leo.yan@arm.com,
	james.clark@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] perf: arm_spe: Probe PMSNEVFR and PMSDSFR filter bits independently
Date: Mon, 23 Nov 2026 15:37:19 +0800
Message-Id: <20261123073719.3190149-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_233736_231044_3227463E 
X-CRM114-Status: GOOD (  21.00  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PMSEVFR_EL1, PMSNEVFR_EL1 and PMSDSFR_EL1 each have their own
implementation-defined RES0 bit sets, with the remaining bits being
RAZ/WI. The driver discovers the supported event filter bits by
probing PMSEVFR_EL1, but then reuses the resulting mask to validate
the inverse event filter (config3) and never validates the data
source filter (config4) at all beyond checking for the presence of
the FDS feature.

This has two consequences:

  * The inverse event filter is written verbatim to PMSNEVFR_EL1, so
    if PMSNEVFR_EL1 implements a different set of bits to PMSEVFR_EL1
    then a filter using bits that are RAZ/WI is accepted and silently
    has no effect, while a filter using bits that are writable in
    PMSNEVFR_EL1 but not PMSEVFR_EL1 is wrongly rejected with
    -EOPNOTSUPP.

  * PMSDSFR_EL1 holds an inclusion mask which the driver exposes
    inverted, so a set config4 bit requests that a data source is
    excluded and a cleared bit requests that it is included. Bits
    that are RAZ/WI are stuck at 0, so their data sources cannot be
    included while the data source filter is active: exclusion
    requests are always honoured, but inclusion requests for such
    sources are silently dropped.

Discover the supported filter bits of PMSNEVFR_EL1 and PMSDSFR_EL1
separately, probing each register only when the corresponding feature
(FnE / FDS) is implemented. Validate the inverse event filter against
the PMSNEVFR_EL1 mask, and reject data source filter configs which
ask to include a data source whose PMSDSFR_EL1 bit is not implemented.
For missing features, keep a full mask so that filter requests are
still rejected alongside the pre-existing feature checks.

Runtime-tested on Cortex-A78AE (SPEv1.0, which implements neither
FnE nor FDS) and on an SPEv1.2 CPU implementing FnE (but not FDS):
the PMU probes cleanly with the per-register discovery in place,
event filter configs are validated per-bit against the probed masks
with unimplemented bits rejected using -EOPNOTSUPP, and sampling is
unaffected. The PMSNEVFR_EL1 probe path itself is exercised on the
SPEv1.2 CPU, where the register happens to implement the same bits
as PMSEVFR_EL1. Only the FDS path lacks coverage on hardware
implementing the feature.

Fixes: 8d9190f00a975 ("perf: arm_spe: Add support for SPEv1.2 inverted event filtering")
Fixes: e6a27290d800 ("perf: arm_spe: Add support for filtering on data source")
Tested-by: Ping Li <leeonion.muyu@gmail.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/perf/arm_spe_pmu.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 707778c67dab..00d54202c59b 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -92,6 +92,8 @@ struct arm_spe_pmu {
 	u64					features;
 
 	u64					pmsevfr_res0;
+	u64					pmsnevfr_res0;
+	u64					pmsdsfr_res0;
 	u16					max_record_sz;
 	u16					align;
 	struct perf_output_handle __percpu	*handle;
@@ -818,13 +820,22 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
-	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
+	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsnevfr_res0)
 		return -EOPNOTSUPP;
 
 	if (arm_spe_event_to_pmsdsfr(event) != U64_MAX &&
 	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
 		return -EOPNOTSUPP;
 
+	/*
+	 * The data source filter is exposed inverted, so validate the
+	 * value written to PMSDSFR_EL1 (~config4) rather than config4
+	 * itself.
+	 */
+	if (ATTR_CFG_GET_FLD(attr, inv_data_src_filter) &&
+	    (arm_spe_event_to_pmsdsfr(event) & spe_pmu->pmsdsfr_res0))
+		return -EOPNOTSUPP;
+
 	if (attr->exclude_idle)
 		return -EOPNOTSUPP;
 
@@ -1228,6 +1239,20 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	write_sysreg_s(U64_MAX, SYS_PMSEVFR_EL1);
 	spe_pmu->pmsevfr_res0 = ~read_sysreg_s(SYS_PMSEVFR_EL1);
 
+	if (spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT) {
+		write_sysreg_s(U64_MAX, SYS_PMSNEVFR_EL1);
+		spe_pmu->pmsnevfr_res0 = ~read_sysreg_s(SYS_PMSNEVFR_EL1);
+	} else {
+		spe_pmu->pmsnevfr_res0 = U64_MAX;
+	}
+
+	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
+		write_sysreg_s(U64_MAX, SYS_PMSDSFR_EL1);
+		spe_pmu->pmsdsfr_res0 = ~read_sysreg_s(SYS_PMSDSFR_EL1);
+	} else {
+		spe_pmu->pmsdsfr_res0 = U64_MAX;
+	}
+
 	dev_info(dev,
 		 "probed SPEv1.%d for CPUs %*pbl [max_record_sz %u, align %u, features 0x%llx]\n",
 		 spe_pmu->pmsver - 1, cpumask_pr_args(&spe_pmu->supported_cpus),

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


