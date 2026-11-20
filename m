Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8575860A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RukNY3xy;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UaDEIKq/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hEdO69vVL5rwCpel8UiCyiJqyc8aP/573OWZYMkPaAo=; b=RukNY3xyw2WQx/61gq4/Jkw3ro
	Rn15oxin4oYsm2QeunPUuQCLGmP14BLaemeFhqXbNue7zifYW2RXliOLLmuNbsIgr0es9AextcWcC
	WJ9coiRcjA6IDKBIUdzp4Hi9lm0lICAthA9olQpcVE9cF4W/AyGdARUoPxBD4is3fjcdjXDF0idOF
	RzPecUawnjeQnQ/XqOQkIQ0yicK1VNC6is4TOOIOWfUgxbWVkXnVaVbzRbJjm7+BubtxiCQaDITz6
	p2NOQmJFPrAmqnJcP7bY0SfN/xgkDzdQg8iQ9td5euG65dur8wUvy1JwAsZbAB5DUwg/04TcCU9XX
	m7FH4+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSWt-0000000FjEY-1Xx4;
	Fri, 20 Nov 2026 17:36:07 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSWC-0000000Fj8Z-3nxL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:35:41 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0abc;
	Sat, 21 Nov 2026 01:35:21 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] resctrl: mpam: Fix potential per-CPU data leak on probe failure
Date: Sat, 21 Nov 2026 01:35:18 +0800
Message-ID: <20261120173519.3923924-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa06efde03a1kunm98e3e691238b77
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGB9MVh8ZTB0YThoYSU1OGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UaDEIKq/cgqGyzDB5Vooo8BjZBjXwDYuRLBCocMmLicUQSuLdNN3I4K/8Jm3ihCtBtSIEgxRYj1POm7hKpYXKWpj5CAXplAz6YJPgo1VqtHpLdtH/LaRQa/gPHO2REZv0S0qRMFf6W0gBa0HQnDjM/dd8qsNAd3j/oM+hnMtobs=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=hEdO69vVL5rwCpel8UiCyiJqyc8aP/573OWZYMkPaAo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_093528_337644_A0D2C308 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..3e89f9183041 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2351,7 +2351,7 @@ static int __setup_ppi(struct mpam_msc *msc)
 {
 	int cpu;
 
-	msc->error_dev_id = alloc_percpu(struct mpam_msc *);
+	msc->error_dev_id = devm_alloc_percpu(&msc->pdev->dev, struct mpam_msc *);
 	if (!msc->error_dev_id)
 		return -ENOMEM;
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

