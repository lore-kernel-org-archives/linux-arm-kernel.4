Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6994B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dm66tqTT;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=IuPGr4rE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mv0YhMwlZaVJeB6/GGNwh8usC8IciHc2g8crk5dxwmI=; b=dm66tqTTRkaO0z4oa1F7d81FiP
	BNChmvHGxnrgYumhhH6o3SLL7eeuz9e4ivrGMU7scTVSRIExyI3qY5iRiUuFAhmFKkBc2UN8oBQ9U
	GSAJX+gk5gp4nG20hEPGxcYQviijMF54wpgFGnZu0N53Whd6jjD0ZCFe/v8wde5on9Vx1WwiqDa9U
	2CQl3thahiV9S/FZZ/a21gFjuXQTHLAKa6baCV8kBxE3XrlIYy5ig9gMoS26YSbnVLnv7NE71u+sq
	BkHCY5fcobwy7x1bZ4DFoTXGFoEmF8A6fxDCki+PPTvHdUifx+Y12c2uwlXMg8a0UyH2jLY0yQHyY
	w7IjbWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIPY-00000000mpr-3T6r;
	Sat, 28 Nov 2026 13:24:16 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIPV-00000000moy-3qSd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795872251; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=mv0YhMwlZaVJeB6/GGNwh8usC8IciHc2g8crk5dxwmI=;
	b=IuPGr4rE3zhcWAWmNnEiNPe6r0Ut+8BxZIjwj/xeWmfPueTKg4/4VlIIB8U47jAGqrR35+XMse3Haz7zo+oezyHJrXZSoLRstwd1qRVf80g7mmoTxz3YSjM+BJ7c0tE45SII394fXC/+lRdy2ezYw6ORFTskz9MNVN8zlN2DGFA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFaaN8H_1795872240;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFaaN8H_1795872240 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 28 Nov 2026 21:24:09 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH] perf: tegra410: Fix C2C PMU init error cleanup
Date: Sat, 28 Nov 2026 21:23:55 +0800
Message-ID: <20261128132359.2246185-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_052414_246230_18B42FF3 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If platform_driver_register() fails after cpuhp_setup_state_multi()
succeeds, the dynamically allocated CPU hotplug state remains registered.

Remove the state before returning the registration error.

Qoder, an AI coding assistant, helped analyze the issue, develop the fix,
and draft this description.

Fixes: 2f89b7f78c50 ("perf: add NVIDIA Tegra410 C2C PMU")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
Validation (two-patch tree):
- ARM64 defconfig W=1 build of the C2C target object
- complete ARM64 Image and C2C module modpost/final link
- checkpatch.pl reports 0 errors and 0 warnings for the code diff

NOT_RUN:
- runtime platform_driver_register() failure injection or module loading
- CPU hotplug, real PMU events, or target hardware testing

 drivers/perf/nvidia_t410_c2c_pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c b/drivers/perf/nvidia_t410_c2c_pmu.c
index 1fc2adeb7195..d6e250fb1141 100644
--- a/drivers/perf/nvidia_t410_c2c_pmu.c
+++ b/drivers/perf/nvidia_t410_c2c_pmu.c
@@ -1034,7 +1034,12 @@ static int __init nv_c2c_pmu_init(void)
 		return ret;
 
 	nv_c2c_pmu_cpuhp_state = ret;
-	return platform_driver_register(&nv_c2c_pmu_driver);
+
+	ret = platform_driver_register(&nv_c2c_pmu_driver);
+	if (ret)
+		cpuhp_remove_multi_state(nv_c2c_pmu_cpuhp_state);
+
+	return ret;
 }
 
 static void __exit nv_c2c_pmu_exit(void)
-- 
2.47.3


