Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0927606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1oxZ+KA;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=f6Wrk9lu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fe6waKdNkyaZ7iMH0/zpUt81dGcgiN278dUR0JooI70=; b=b1oxZ+KAH89YGP
	kYABa+9PfE/AgcVg8esIaL3h7nXP1oDN1tRRzNqO6gEBlIhxpgyTAQappG+m8+CRRmNk0nXB+V53F
	Cx/ESz5sRzE9qwGLdXzuRC7a53RY1eRYppD3YN8zG0F8pzLUaUGg3Oo+dXWT7RKGeRr7YJCi7bOAF
	uQ4w385baueltZynFX3TmO8XWdYbBcECXKznpRVxmMauBa52Nbb4CLqjIFX9wFhbYrt1RAoC3JTkm
	QkUBQGQY8BrkSpg3ir4YWwiaaJYkwUTiexvp3lf+IU6JbasXxcSZScjxq7pkmSSyNvVw3hMIhlh54
	3iMWYI7ulULUShLqS+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq6i-0000000F5yL-3Efo;
	Fri, 27 Nov 2026 07:10:56 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq6V-0000000F5w1-3rnm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795763439; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Fe6waKdNkyaZ7iMH0/zpUt81dGcgiN278dUR0JooI70=;
	b=f6Wrk9luUosyElP3hPfOXXN28ihefZ/LL+VZGjGqTZ76/PXQh0skKNzk7DUVHfPBmXyauOd1PQG70cr53AnO6pWLqzPWHlSsMzGi3PLhUeomxQ3GLaWJInaYa+FcEzDr9Ykw1ufWkWS3iPhemMTUUXBngS9tuu/QTkhKTILNuHY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFX36QT_1795763436;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFX36QT_1795763436 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 15:10:38 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jiangtianfeng@linux.alibaba.com
Subject: [PATCH 1/2] perf/arm_cspmu: nvidia: Reject missing TGT address-filter resource
Date: Fri, 27 Nov 2026 15:10:09 +0800
Message-ID: <20261127071021.820833-2-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127071021.820833-1-jiangtianfeng@linux.alibaba.com>
References: <20261127071021.820833-1-jiangtianfeng@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_231044_499528_E311DEC6 
X-CRM114-Status: GOOD (  11.20  )
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

acpi_dev_get_memory_resources() can return 0 with an empty resource list.
In that case pcie_tgt_init_data() leaves addr_filter_reg as NULL but
returns success. A later address-filter event then writes to registers
computed from that NULL base.

Reject an empty resource list with -ENODEV and keep the existing ioremap
error propagation. This turns missing firmware resources into a probe
failure instead of a runtime invalid MMIO access.

Qoder, an AI coding assistant, helped analyze the issue, develop the fix
and source-derived state model, and draft this description.

Fixes: 3dd73022306b ("perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index af256f662731..a0257dc3249d 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -555,7 +555,10 @@ static int pcie_tgt_init_data(struct arm_cspmu *cspmu)
 
 	rentry = list_first_entry_or_null(
 		&resource_list, struct resource_entry, node);
-	if (rentry) {
+	if (!rentry) {
+		dev_err(dev, "no address filter resource\n");
+		ret = -ENODEV;
+	} else {
 		data->addr_filter_reg = devm_ioremap_resource(dev, rentry->res);
 		ret = 0;
 	}
-- 
2.47.3


