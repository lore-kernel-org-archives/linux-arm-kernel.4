Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA89606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YsJ7TQ6f;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOgycG4R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xvBl9sRZyc0ZM+YkhN+XeMSl4+2u4RMdz2hWt5xJPNQ=; b=YsJ7TQ6fRULLzGOb/Pvf3pYo3e
	HMlCoBzD+NjX9MEJ5aPvyszPvMFPwt1g9iu4yBo3GFcCvEJD8RmR/tsEvGVsFBjyjdf7WSNMB6lyF
	xYcNNW18k9w73OhzQtVQ0wZNC70tu3mjiIpHMUcUS+o/64JzUzGxg8ToMPaJcc+DqQx7+t7kVNRTt
	BYyKcWmvTrfB8lC/atq67b8cooWUnxKXeWX0aqiY847kksUETGZR5Yh5AskChEHPme7hqxlYdMmOj
	A5V2wjZxyrvbry8osNKNd1YSX1O1WOU18yjEh2fAZbM/uGv0YASofKToKeXNWX5S8s6zxe9VzCpRc
	7wnMvU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQna9-00000004LGF-2LwO;
	Tue, 10 Nov 2026 15:16:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQna8-00000004LG6-358i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:16:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D79341FE6;
	Tue, 10 Nov 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794323780;
	b=XF1ENQUfJCg9NC2cDxoF4aMLH5P022rkvmeWLP1NphptgzEVWWHzNM3ryxFls81xHrpF
	 elkI0E1WCvcuJvYHTmTZcAdII4wUZmYobOqB34vgMGHUxJyaQtPZTWQcDnaEal/B8r3pJ
	 B4rp+PqjAWFHtG9XDKKwaxvUvC79jXw541o65iTGu9+8VhLmDjyqaNXJy9nZHr1MAG8Nl
	 zqjZiH7xgIV4iE7hI6hZE5e9vrOcf4KIWzTTDsi9p8SUi7jvg0JrXKSTlQDAzF1u7Yfsc
	 Cn0mQMPB95odw9UcshlwEwufeeMjku0KH1xpwS0apwEaR1evy1VApUWzK7IWQTGkBnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794323780;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xvBl9sRZyc0ZM+YkhN+XeMSl4+2u4RMdz2hWt5xJPNQ=;
	b=CGrH91PIoi5AAZxSsTSldnvwxIFaTtlHS+kNlHlERLWXHxLBfCnCYiJiR6ZL6mX4krDN
	 mWzga+VM/EZyRHgUnfOqAL1XkTeqP4T/WjT+M42j6KlYVfhZwENM8Rly7UDx4Ba8Rkd8Y
	 Qsnc1ZEFFauESnDkNGDUEw2t/lZWSriOq0WR7FPPim42xfXLwjZlI+bj8EEo0052u0xBP
	 MYdPqMOIaLSLHohTz5Vya9IMeLjk6CaUUZ0zav2rskJsR5ZHY9QVgG1HmOE/+meJwJggJ
	 nTLP7AYPgdOG3TTmwYU7rb2SlmFb2P+gP5QsF1NtASYYB6Pj9wcdKo02xW9w/b1clvw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B310E1F0089F;
	Tue, 10 Nov 2026 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323780;
	bh=xvBl9sRZyc0ZM+YkhN+XeMSl4+2u4RMdz2hWt5xJPNQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oOgycG4RvEfKBPAYn8+vHOaH0fjPS+egnHrhAvcEpP6yN9meo+EkAhonYBWDhuhpp
	 pVOG1JHSmUi31hxXvx0yfy4YnKr2sHh64s7+nPvFu/wXRAfwmWy/1AoN3IB4wRUyWV
	 g3osCANbDxMCpS64JslYpgG9y5Nhx15GtVTb3+u0qvAV0CNbeeOTpa42yOt/u6XYd0
	 oyEg39gS9L9zNntPAGopZbozX2YY9NlwCwWlhYlZgb8br/g7vkZTC16Tc+cnXHBl2+
	 NhRMBu+eFdN7wMCyBp+J0Sv7vhj7Zp7fGKQrxvnZkyLi1aSRJM3DVl/M/BLD7DRgfe
	 rCToqcNNVs/SQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 13C7348BAB;
	Tue, 10 Nov 2026 15:16:19 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Date: Tue, 10 Nov 2026 15:16:19 +0000
Subject: [PATCH v2] iommu/arm-smmu-v3: Invalidate a new level-1 stream
 table descriptor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-smmu-l1std-cfgi-v2-1-dabcae9a593c@cs.columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNSwqDQBAFryK9Tos90QGzyj3ExTi22uAnTKski
 HfPxH2WVfDqHaAchBUeyQGBd1FZ5gjmloAf3NwzShsZTGYsUVaiTtOGI+naou96QU9l3hjnOnY
 5xNUrcCfvq1jVkQfRdQmf62Cnn/3f2gkJbcGFye7OFmSfXlO/jNvUiEu53aA+z/ML38AmzrQAA
 AA=
X-Change-ID: 20261109-smmu-l1std-cfgi-c194b2aafea4
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
 Xuheng Li <xuheng@cs.columbia.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794323778; l=3915;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=vrw2x4/NF30qA+HPgtOkavd6zjgXcD+1Xy7g1vNZRQw=;
 b=BhRfG6l6tXiOPUeBYvIBMfVP3wkb5KWA40Amo32/l2sUqL0Q8C3urNZOfxbCrgjmXtle8/qfq
 D2GfVoSPczaCXuMaMxYnYtFLdx4zTB4ldgFN1G7rgpAiCiuipLJoghk
X-Developer-Key: i=xuheng@cs.columbia.edu; a=ed25519;
 pk=L1HVV+goqxYmEMO/OXakL6uf9isSpgk2QrLlFqyZ2Qs=
X-Endpoint-Received: by B4 Relay for xuheng@cs.columbia.edu/20261028 with
 auth_id=1349
X-Original-From: Xuheng Li <xuheng@cs.columbia.edu>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xuheng@cs.columbia.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xuheng Li <xuheng@cs.columbia.edu>

arm_smmu_init_l2_strtab() allocates a level-2 stream table when the first
master in its range is added, and makes the level-1 descriptor valid. It
issues no invalidation, and the attach that follows sends only the leaf
form of CMD_CFGI_STE.

IHI 0070 5.1.1 requires the non-leaf form of CMD_CFGI_STE when an L1STD
changes, including when an inactive descriptor with Span == 0 becomes
active. An SMMU that cached the inactive descriptor can keep terminating
the master's transactions as if its StreamID were invalid.

Issue a non-leaf CMD_CFGI_STE after writing the descriptor. The RMR path
runs before the stream table is programmed into the SMMU, and
arm_smmu_device_reset() then issues CMD_CFGI_ALL, so it needs none.

Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
Changes in v2:
- Shorten the new comment and drop the one at the RMR call site (Mostafa)
- Add Mostafa's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6d4520c47..e5c09aaff 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2030,7 +2030,8 @@ static void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
 	}
 }
 
-static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
+static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
+				   bool live)
 {
 	dma_addr_t l2ptr_dma;
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
@@ -2053,6 +2054,11 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 				   ARRAY_SIZE((*l2table)->stes));
 	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)],
 				      l2ptr_dma);
+
+	/* An invalid L1STD can be cached */
+	if (live)
+		arm_smmu_cmdq_issue_cmd_with_sync(smmu,
+						  arm_smmu_make_cmd_cfgi_ste(sid, false));
 	return 0;
 }
 
@@ -4261,7 +4267,8 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 	return sid < smmu->strtab_cfg.linear.num_ents;
 }
 
-static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
+static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid,
+				    bool live)
 {
 	/* Check the SIDs are in range of the SMMU and our stream table */
 	if (!arm_smmu_sid_in_range(smmu, sid))
@@ -4269,7 +4276,7 @@ static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
 
 	/* Ensure l2 strtab is initialised */
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
-		return arm_smmu_init_l2_strtab(smmu, sid);
+		return arm_smmu_init_l2_strtab(smmu, sid, live);
 
 	return 0;
 }
@@ -4333,7 +4340,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		struct rb_node *existing;
 		u32 sid = new_stream->id;
 
-		ret = arm_smmu_init_sid_strtab(smmu, sid);
+		ret = arm_smmu_init_sid_strtab(smmu, sid, true);
 		if (ret)
 			break;
 
@@ -5713,7 +5720,7 @@ static void arm_smmu_rmr_install_bypass_ste(struct arm_smmu_device *smmu)
 
 		rmr = container_of(e, struct iommu_iort_rmr_data, rr);
 		for (i = 0; i < rmr->num_sids; i++) {
-			ret = arm_smmu_init_sid_strtab(smmu, rmr->sids[i]);
+			ret = arm_smmu_init_sid_strtab(smmu, rmr->sids[i], false);
 			if (ret) {
 				dev_err(smmu->dev, "RMR SID(0x%x) bypass failed\n",
 					rmr->sids[i]);

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261109-smmu-l1std-cfgi-c194b2aafea4

Best regards,
-- 
Xuheng Li <xuheng@cs.columbia.edu>



