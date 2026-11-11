Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35AE606A89C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KF2pNxYn;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=O3btiuwd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5ft7sNkyBnZQKcl8yjWTxI0pp9pDYp7fOU712sGAOFU=; b=KF2pNxYnsyt0+oiKghDmBb6eit
	q9XPiQeGQDmiscopLe0UxRbo9P0Pcvjr42S9lEWb3XY38Cwp3p5xn14fsZmQHm7YS+9GYua/qD6R0
	+TP2xI4AfZZ66Lgac63c3a2cnKiCA6sNIo81bkAf1gLpqSMHcYVWyIq5r7E6fQqMrE0pubtWXXcP4
	nYZOmgk2Tu8RMRMQM0yz4ibzAIds5Ax4+dHddt/9RtDJ6dgrixjApdFR4mS0gAzixPmQ/c4DqUVhy
	gYPHrTYp5sA5ZsgbeVGR3brj0EjRgHsEC+Mbp/cbdDG6bRuXmwWFNw0nzLSM06vs4QpHtzxfJSIvl
	8sIO8aOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7ML-00000006f1K-1Rjd;
	Wed, 11 Nov 2026 12:23:25 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7MI-00000006ez5-20S5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:23:24 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54502a177;
	Wed, 11 Nov 2026 20:23:18 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] perf: starfive: Fix potential per-CPU memory leak on probe failure
Date: Wed, 11 Nov 2026 20:23:16 +0800
Message-ID: <20261111-e5624093d6-perf-starfive@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ca90038103a1kunmb074d2a81b3671
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQk0eVk9NGklKTxkaTh1MSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=O3btiuwd6QfNJ9dRzz2jF7iTYo/iKofY+oPbwVvUqzAwaleCEdUZPcWPV6lKlgN1exIdLvoi5ReLhmk/m9UICfXnqSE9YifETztp9x8aQw0H8NgcIz77vHflnsobErL7R+ytS+WnaVxS3p6e+SaTtaSwcqMi0bjW5j3KxSfnx+s=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=5ft7sNkyBnZQKcl8yjWTxI0pp9pDYp7fOU712sGAOFU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_042322_795891_F53B96F2 
X-CRM114-Status: GOOD (  10.68  )
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

The per-CPU hardware events remain allocated when a later probe step
fails, although the device-managed PMU structure is released.

Allocate the events with devm_alloc_percpu() so failed probing releases
them after the interrupt handlers have been removed.

This issue was found by our static analysis tool under development.

Fixes: c2b24812f7bc ("perf: starfive: Add StarLink PMU support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/perf/starfive_starlink_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/starfive_starlink_pmu.c b/drivers/perf/starfive_starlink_pmu.c
index d9843645554b..25d57b904028 100644
--- a/drivers/perf/starfive_starlink_pmu.c
+++ b/drivers/perf/starfive_starlink_pmu.c
@@ -519,8 +519,8 @@ static int starlink_pmu_probe(struct platform_device *pdev)
 	if (IS_ERR(starlink_pmu->pmu_base))
 		return PTR_ERR(starlink_pmu->pmu_base);
 
-	starlink_pmu->hw_events = alloc_percpu_gfp(struct starlink_hw_events,
-						   GFP_KERNEL);
+	starlink_pmu->hw_events = devm_alloc_percpu(&pdev->dev,
+						    struct starlink_hw_events);
 	if (!starlink_pmu->hw_events) {
 		dev_err(&pdev->dev, "Failed to allocate per-cpu PMU data\n");
 		return -ENOMEM;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

