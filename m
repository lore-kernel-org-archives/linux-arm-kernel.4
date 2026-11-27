Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iP7AENaP;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=eEdpprqI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BmIMXQgJGIIqJkFNfsmR4WcLiXrFcXVgQaaICBnrIt4=; b=iP7AENaPF9dPOr
	+t+/3xYLU6kT32f+afSQuXEX00oiVDhYHVVThQifG7SiPb7ZrzH+6VkTUiHVFYXgO+rMTM2NEizNv
	tl7vvOs9U1slhde1tvfyywSqMNb+m++y/qYjnflX3djo0sx0Wl7ZHn1wc/MGqqmmr1mutexGbVsb3
	HYPlcT+HpOpp1BdaDY/5cn8nXgkOk/wb5iZlBGA4E7j1OPMSin0oAO7LyvP6f4b2jIl4Zr2SIHFrH
	SxnzGEn2+Wx2pkmMU9qbSAgivjNpmiNur3Ff7e9Ti+iF6TNWhDFnPU+bp1gzWfQUF2TC4mS0eZ5Mk
	VFGqlSSid68CshggfDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq6i-0000000F5yV-3e1R;
	Fri, 27 Nov 2026 07:10:56 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWq6a-0000000F5wW-0gFf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795763445; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BmIMXQgJGIIqJkFNfsmR4WcLiXrFcXVgQaaICBnrIt4=;
	b=eEdpprqIyC6LP7dUxYTE5Fncyzv4FtLnEoVz6gEl/5mJBFyPJ2gUOCl9iOopB6x+wXG8F0JgtxG7RSEmyWnVQy+jvhQcD7s8FvvE5ExnH0kd1S2nK4m2USMLBASUf37ZgbCUw0H6NZ1rIzJvB0Krsu3aPD5AhFWs1N/R7aCw6jw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFX36RJ_1795763438;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFX36RJ_1795763438 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 15:10:44 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jiangtianfeng@linux.alibaba.com
Subject: [PATCH 2/2] perf/arm_cspmu: nvidia: Fix TGT address-filter slot lifecycle
Date: Fri, 27 Nov 2026 15:10:10 +0800
Message-ID: <20261127071021.820833-3-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127071021.820833-1-jiangtianfeng@linux.alibaba.com>
References: <20261127071021.820833-1-jiangtianfeng@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_231048_412072_2054B930 
X-CRM114-Status: GOOD (  14.19  )
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

The current lookup returns a free slot before checking later slots for
an identical active filter. After another filter is stopped, a new event
can therefore occupy a different slot from an existing identical filter.
Reset then searches only by base/mask and can release the wrong slot.

Reset also matches zeroed metadata from free slots and decrements their
refcount without checking occupancy. A zero base/mask filter can thus
underflow a free slot's refcount when another filter is stopped first.
Cycle events never allocate an address-filter slot, but their stop path
can still call reset and release another event's filter.

First match an active filter so identical filters share one slot. Only
allocation searches for a free slot afterward. Reset must match an active
slot, and cycle events return without resetting an address filter. This
keeps zero base/mask as valid filter data and does not change the shared
PMU callback ABI.

Qoder, an AI coding assistant, helped analyze the issue, develop the fix
and source-derived state model, and draft this description.

Fixes: 3dd73022306b ("perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index a0257dc3249d..1e9e52cbec09 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -589,7 +589,7 @@ static struct pcie_tgt_data *pcie_tgt_get_data(struct arm_cspmu *cspmu)
 	return ctx->data;
 }
 
-/* Find the first available address filter slot. */
+/* Find an active matching filter or a free slot for allocation. */
 static int pcie_tgt_find_addr_idx(struct arm_cspmu *cspmu, u64 base, u64 mask,
 	bool is_reset)
 {
@@ -597,11 +597,17 @@ static int pcie_tgt_find_addr_idx(struct arm_cspmu *cspmu, u64 base, u64 mask,
 	struct pcie_tgt_data *data = pcie_tgt_get_data(cspmu);
 
 	for (i = 0; i < NV_PCIE_TGT_ADDR_COUNT; i++) {
-		if (!is_reset && data->addr_filter[i].refcount == 0)
+		if (data->addr_filter[i].refcount > 0 &&
+		    data->addr_filter[i].base == base &&
+		    data->addr_filter[i].mask == mask)
 			return i;
+	}
+
+	if (is_reset)
+		return -ENODEV;
 
-		if (data->addr_filter[i].base == base &&
-			data->addr_filter[i].mask == mask)
+	for (i = 0; i < NV_PCIE_TGT_ADDR_COUNT; i++) {
+		if (data->addr_filter[i].refcount == 0)
 			return i;
 	}
 
@@ -748,6 +754,10 @@ static void pcie_tgt_pmu_reset_ev_filter(struct arm_cspmu *cspmu,
 	u64 base, mask;
 	int idx;
 
+	/* Cycle events never allocate an address-filter slot. */
+	if (event->hw.extra_reg.idx == cspmu->cycle_counter_logical_idx)
+		return;
+
 	addr_filter_en = pcie_tgt_pmu_addr_en(event);
 	if (!addr_filter_en)
 		return;
-- 
2.47.3


