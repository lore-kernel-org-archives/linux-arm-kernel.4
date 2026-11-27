Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD58606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJKZ8U1g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXGE1eAT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XZW7HoJlvzZWJEECVtCjZszj1uhHhZwfRBrtaHgMu20=; b=CJKZ8U1gek9Bi6
	tT+8Kqzy8Y8tOqhgJugH3HDpopEmEEV0uTIz/d8MH2r5hV86ayr172YpeZLXd3BBORlGJ7wh28mq1
	NCUnZc6Bh/RKtU5Gu4qvECA/7r2n4fBPMhBRLfLzR/Wld14vSQZ2NcDp3WJqU3EiSwkWAc+iXa4bh
	+JED3IvYbz3AsN2Qwhl4sJ1+ZT8dFbGMHxqTX9SHlpeAzQAOIBhYfzTBmgfTSXysAjfOaURwX995z
	ZwhFvI/OSf9KFbJvav8D5j85CHQTi8UGgaUPdrsI9WVCjLp8HkgG7UdOcqygPLgwy263hKsxEs6gW
	03+2KUi6gDdspg2i8xwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5ab-00000000CLD-1YfI;
	Fri, 27 Nov 2026 23:42:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5aT-00000000CKA-45KM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:42:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B889343DC8;
	Fri, 27 Nov 2026 23:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927931F000C1;
	Fri, 27 Nov 2026 23:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822961;
	bh=XZW7HoJlvzZWJEECVtCjZszj1uhHhZwfRBrtaHgMu20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KXGE1eATdQmTwJfNK7TVVo1E80cn6jIzaAlO8J3hNoco1vRRNGIOxdSjHdWzSrEJy
	 dM/0fLvN2ZGGCxzuSGa1+hpdhKUeE0Aa5dClRWLQciH0u9wlt7yZer5gv2lMbVjF3x
	 g2xf1zt6pcxiGgefrLVfHM3KvH3ISFw5WxbVaES+jKEKg41WXRrz1i+a3R9CF5qtj1
	 SsvvKxIPO+87upa2XX7NMBzHHpoMWxiXiOwHlsHgsQWNRfoHblqy7V0Z9pRTH1feRJ
	 RPqL8+kG0Ediu4ypjCi4rxT+6Ski5fKSmSwnYANLANyS6BmY21m9ju4Z5l6kVmvCI5
	 cYb3ckbLGnP7g==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:31 +0100
Subject: [PATCH 3/6] mfd: db8500-prcmu: Drop unused partial APE clock
 divider mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ux500-prcmu-clock-move-v1-3-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0
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

The vendor partial-25% mode is not a firmware OPP. It emulates one
by changing ACLK and DMA clock dividers around the mailbox request,
but no in-tree consumer ever selects it. Drop the unused emulation
so that the clock register lock can move with its remaining users.
Leave the actual APE 50% and 100% requests unchanged.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/db8500-prcmu.c       | 55 +---------------------------------------
 include/linux/mfd/db8500-prcmu.h |  2 --
 2 files changed, 1 insertion(+), 56 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 1d9114edfbdb..1c58cf804e4e 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -781,52 +781,6 @@ int db8500_prcmu_get_ddr_opp(void)
 	return readb(PRCM_DDR_SUBSYS_APE_MINBW);
 }
 
-/* Divide the frequency of certain clocks by 2 for APE_50_PARTLY_25_OPP. */
-static void request_even_slower_clocks(bool enable)
-{
-	u32 clock_reg[] = {
-		PRCM_ACLK_MGT,
-		PRCM_DMACLK_MGT
-	};
-	unsigned long flags;
-	unsigned int i;
-
-	spin_lock_irqsave(&clk_mgt_lock, flags);
-
-	/* Grab the HW semaphore. */
-	while ((readl(PRCM_SEM) & PRCM_SEM_PRCM_SEM) != 0)
-		cpu_relax();
-
-	for (i = 0; i < ARRAY_SIZE(clock_reg); i++) {
-		u32 val;
-		u32 div;
-
-		val = readl(prcmu_base + clock_reg[i]);
-		div = (val & PRCM_CLK_MGT_CLKPLLDIV_MASK);
-		if (enable) {
-			if ((div <= 1) || (div > 15)) {
-				pr_err("prcmu: Bad clock divider %d in %s\n",
-					div, __func__);
-				goto unlock_and_return;
-			}
-			div <<= 1;
-		} else {
-			if (div <= 2)
-				goto unlock_and_return;
-			div >>= 1;
-		}
-		val = ((val & ~PRCM_CLK_MGT_CLKPLLDIV_MASK) |
-			(div & PRCM_CLK_MGT_CLKPLLDIV_MASK));
-		writel(val, prcmu_base + clock_reg[i]);
-	}
-
-unlock_and_return:
-	/* Release the HW semaphore. */
-	writel(0, PRCM_SEM);
-
-	spin_unlock_irqrestore(&clk_mgt_lock, flags);
-}
-
 /**
  * db8500_prcmu_set_ape_opp - set the appropriate APE OPP
  * @opp: The new APE operating point to which transition is to be made
@@ -843,9 +797,6 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 
 	mutex_lock(&mb1_transfer.lock);
 
-	if (mb1_transfer.ape_opp == APE_50_PARTLY_25_OPP)
-		request_even_slower_clocks(false);
-
 	if ((opp != APE_100_OPP) && (mb1_transfer.ape_opp != APE_100_OPP))
 		goto skip_message;
 
@@ -854,8 +805,7 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 
 	writeb(MB1H_ARM_APE_OPP, (tcdm_base + PRCM_MBOX_HEADER_REQ_MB1));
 	writeb(ARM_NO_CHANGE, (tcdm_base + PRCM_REQ_MB1_ARM_OPP));
-	writeb(((opp == APE_50_PARTLY_25_OPP) ? APE_50_OPP : opp),
-		(tcdm_base + PRCM_REQ_MB1_APE_OPP));
+	writeb(opp, (tcdm_base + PRCM_REQ_MB1_APE_OPP));
 
 	writel(MBOX_BIT(1), PRCM_MBOX_CPU_SET);
 	wait_for_completion(&mb1_transfer.work);
@@ -865,9 +815,6 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 		r = -EIO;
 
 skip_message:
-	if ((!r && (opp == APE_50_PARTLY_25_OPP)) ||
-		(r && (mb1_transfer.ape_opp == APE_50_PARTLY_25_OPP)))
-		request_even_slower_clocks(true);
 	if (!r)
 		mb1_transfer.ape_opp = opp;
 
diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
index b6e3450b1d11..7306303494f1 100644
--- a/include/linux/mfd/db8500-prcmu.h
+++ b/include/linux/mfd/db8500-prcmu.h
@@ -521,14 +521,12 @@ enum prcmu_wdog_id {
  * @APE_NO_CHANGE: The APE operating point is unchanged
  * @APE_100_OPP: The new APE operating point is ape100opp
  * @APE_50_OPP: 50%
- * @APE_50_PARTLY_25_OPP: 50%, except some clocks at 25%.
  */
 enum ape_opp {
 	APE_OPP_INIT = 0x00,
 	APE_NO_CHANGE = 0x01,
 	APE_100_OPP = 0x02,
 	APE_50_OPP = 0x03,
-	APE_50_PARTLY_25_OPP = 0xFF,
 };
 
 /**

-- 
2.56.1


