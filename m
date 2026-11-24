Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843E606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m1AXmb1r;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=PGm67Vz3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5gSfmSe2FFDhLwZ91DEm5hYRWAqljw8ghWO0ejwJl7w=; b=m1AXmb1rfz/HDmUK6vwWD1aWHA
	1rD7KeL/cG57HuUEPxekf0BNPPaj9//LKu7o38knihSVwxn6zfyxRRNpDIBVmYip91hRqAgqgO+Ho
	5CXmBVNW5PRgAvOpFIwvetlBWi4u6vRgy+6Z+uN7HF9q1Vq3osON2swO7EPUaaXB3USrma4kkGKHF
	FHhLwq1uTUVPz9IanflffYbnMCwQMkM/RpLSj+P+zoxf99geoGXEUFfzcj6wOE0o/oUnZlh9g2gEP
	wWxGplUu3cqr7x8VGDC2vtk7EmO4bOWlst/0+Eguu6OEZ1VGdhjQecz+zQrkBY9/ZMK7nGFAOhFS4
	WhjS51DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVr2x-00000006hGA-0VYb;
	Tue, 24 Nov 2026 13:58:59 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVr2q-00000006hEr-2Rzk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:58:57 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55d4cdba2;
	Tue, 24 Nov 2026 21:58:44 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] arm_mpam: Fix potential per-CPU memory leak on probe failure
Date: Tue, 24 Nov 2026 21:58:43 +0800
Message-ID: <20261124135843.2276437-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa20dda106e03a1kunm0af25ebf3424bb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUJPVhlOS04ZHUtPSE4dGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=PGm67Vz3wVI0Vuw8LDonjTVzkmI8dWN0bbNybxX45V1nTloqfY6ELKSKYURkWiYCQXKnXAbRsUim/7pm4ptsSYN3Wi/sHUaU4wLuaNvklMY9FJQg36bzvgLLmj2ZqF+TEtuKe5SSQofEiVQHWGKDEiff6ZkjsKzlRRoqcmzu4d0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=5gSfmSe2FFDhLwZ91DEm5hYRWAqljw8ghWO0ejwJl7w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_055853_524964_EB41F664 
X-CRM114-Status: GOOD (  10.67  )
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

The PPI device IDs are allocated separately from the MSC. If subsequent
resource discovery fails, probe destroys the MSC without freeing its
per-CPU allocation.

Use devm_alloc_percpu() so the device releases the allocation when probe
fails. Its cleanup remains valid even if the MSC is freed beforehand.

This issue was found by our static analysis tool under development.

Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
Cc: stable@vger.kernel.org
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Changes in v2:
  - Use the arm_mpam subject prefix and describe a memory leak.
  - Add Fenghua Yu's Reviewed-by. No code changes from v1.

 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 27abf60f4d67..ba341a6a59ce 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2351,7 +2351,7 @@ static int __setup_ppi(struct mpam_msc *msc)
 {
 	int cpu;
 
-	msc->error_dev_id = alloc_percpu(struct mpam_msc *);
+	msc->error_dev_id = devm_alloc_percpu(&msc->pdev->dev, struct mpam_msc *);
 	if (!msc->error_dev_id)
 		return -ENOMEM;
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.43.0


