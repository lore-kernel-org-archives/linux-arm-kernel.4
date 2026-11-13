Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEEF606A88D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yPSIqZG7;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Cj8URl5m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tqmxNmR9sdF/mCrxZwXbkrGr4U8K+GGx99H7vvL2bZc=; b=yPSIqZG7YD2ZMoShk6nBR2+Sd0
	GyQ5v6gC1TPbsVfa8y13ExR3C4+CXqalZyDQjV4jY16DuhGbXZK3QWHB4lIDAispycw73tz/aGEhW
	tw90KO6LYG+WjDubw1i9zPJiBOzfxbx0vCVjCRhR7D+CXa2PfZle+qf2aStH5E3JLahBpIawBbVyf
	b5QVFih5k61ri/YDB+JISP0inEfZEvOU4ZZxmGS+Q9/bt4P3T+AuxbKRqLdQVS8LFBvqiaYRKQzNk
	8pci4l1ZnT3vAWkKaBZamjJKysPf3E1u3ugPohzNdcyboW71h7OhVH2LjxlmXe8jNRKxuv3mbOzjW
	18ZL62mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmkG-0000000C4kd-1fib;
	Fri, 13 Nov 2026 08:34:52 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmkD-0000000C4jY-0Kkg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:34:51 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jQrCj0nxLz4yjSx;
	Fri, 13 Nov 2026 16:34:41 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794558881;
	bh=EeJgTp3gDNk3CHuo2TOVqLIjmK59AK/kiIZbXuxrLXg=;
	h=Date:From:To:Cc:Subject;
	b=Cj8URl5m94I/ndWuQmwwyYZkWkHp8erBql/yqJJbIhDewfd9d7gClig7bZLOEmsGG
	 tlLDTrEHUTBl6LBmiHTHHNzXMMMLv9G5tPLa1zHWPOkF2imAUu1UuyYcY0uc1c+dLj
	 hufj56JXi5qlcgFouso6HpVt8sdhQpjKVxX1w2D6CB8OD0FOa86jxOHr1iDugl1vIz
	 eNiV062BodjZqH6esYrBCViUW1q/GZdTBcSPMUF2E5PjjD7b+Pa+CD8Qa+/WfAtoDR
	 BVIk7LUPX3qND7lCrvVa+MpFIG2DZGiGjH1R+KXPxG9sCa39woC1sheKqNkLJPhVKk
	 n8ltGpB4jVFmA==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6AD8YRLU065935;
	Fri, 13 Nov 2026 16:34:27 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 13 Nov 2026 16:34:30 +0800 (CST)
X-Zmail-TransId: 2afb6af6cb967e2-719c9
X-Mailer: Zmail v1.0
Message-ID: <20261113163430071vxN-ZVM94Ib9cZ18HMyHa@zte.com.cn>
Date: Fri, 13 Nov 2026 16:34:30 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <will@kernel.org>, <mark.rutland@arm.com>
Cc: <pawel.moll@arm.com>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <zhang.run@zte.com.cn>, <he.qifeng1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBwZXJmL2FybS1jY246IFNldCB1cCB0aGUgRFQgYmFzZSBiZWZvcmUgcmVxdWVzdGluZyB0aGUgSVJR?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 6AD8YRLU065935
X-TLS: YES
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 13 Nov 2026 16:34:41 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF6CBA1.000/4jQrCj0nxLz4yjSx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003449_663333_0611C50D 
X-CRM114-Status: GOOD (  11.70  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Qifeng He <he.qifeng1@zte.com.cn>

arm_ccn_probe() requests the CCN interrupt before arm_ccn_pmu_init()
has initialised ccn->dt.base.  The interrupt is level-triggered, so a
pending overflow (for example one left behind by a previous kernel
across kexec) is delivered as soon as devm_request_irq() unmasks it.
arm_ccn_pmu_overflow_handler() then dereferences the NULL dt->base:

  NULL pointer dereference at virtual address 0x198
  pc : arm_ccn_pmu_overflow_handler+0x20
  lr : arm_ccn_irq_handler+0x13c

Set up dt->base as soon as the CCN MN block is mapped, before the
interrupt can be requested.  The rest of the DT/PMU setup stays in
arm_ccn_pmu_init(); before the PMU is registered the handler only
needs dt->base and the zero-initialised pmu_counters array, so it is
safe to take the interrupt during that window.

Fixes: a33b0daab73a ("bus: ARM CCN PMU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Qifeng He <he.qifeng1@zte.com.cn>
Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
---
 drivers/perf/arm-ccn.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 0c69165e0041..3cbdda843b59 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -1213,8 +1213,10 @@ static int arm_ccn_pmu_init(struct arm_ccn *ccn)
 	char *name;
 	int err;

-	/* Initialize DT subsystem */
-	ccn->dt.base = ccn->base + CCN_REGION_SIZE;
+	/*
+	 * Initialize the DT subsystem; dt.base was set up in
+	 * arm_ccn_probe() before the IRQ was requested.
+	 */
 	spin_lock_init(&ccn->dt.config_lock);
 	writel(CCN_DT_PMOVSR_CLR__MASK, ccn->dt.base + CCN_DT_PMOVSR_CLR);
 	writel(CCN_DT_CTL__DT_EN, ccn->dt.base + CCN_DT_CTL);
@@ -1463,6 +1465,14 @@ static int arm_ccn_probe(struct platform_device *pdev)
 	if (IS_ERR(ccn->base))
 		return PTR_ERR(ccn->base);

+	/*
+	 * The CCN interrupt is level-triggered and may already be pending,
+	 * e.g. an overflow left by a previous kernel across kexec.  The
+	 * handler can run as soon as devm_request_irq() below installs it,
+	 * and it dereferences dt->base, so set it up before that.
+	 */
+	ccn->dt.base = ccn->base + CCN_REGION_SIZE;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.25.1

