Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A53606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q8SkLcTt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVTSML+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4eAcgUNnxWrp9hy8N4DuyA/w6sJxP6JRbsBLxfU6jTs=; b=q8SkLcTttpopJx
	uJgJhjmz9vBTxx8kb5pouAw5emzYLeDSoHq5CJa17v/ZWSDAKWA9tQ3SEzZBgSZIpM3kGt1STfeGe
	DH+AemM/T1jOuM1A3Olh1CvLM3t1JtvfLk6LEH7S4vEsYgwCOLo4xhtW9XvrMk3nQEvUZjEy91aE0
	0RfCQy3EFc6d/CUolwEwsR9LBv48a5AGEtyPGRcUHcrtdWY8eVFK44FkLcAwD909XlDqacghw9LS4
	5IXWgdKqe2vBQGibG6uMDhnLAOnmmuSz3c65rhcJbcIg1LZ05QtDWM5AKQKtSXdFCTymWsPyhGqOb
	fthhWR6bkCs4gE8gDjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaE0-00000004mQi-3CDo;
	Mon, 23 Nov 2026 20:01:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaDX-00000004mJ1-3gDU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:00:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56758624C4;
	Mon, 23 Nov 2026 20:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DA71F000D8;
	Mon, 23 Nov 2026 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464047;
	bh=4eAcgUNnxWrp9hy8N4DuyA/w6sJxP6JRbsBLxfU6jTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gVTSML+cPW/P25YS69F7J0HcOpM5kwo3uCfWf2rnSAppsh8q8UQfyO9MmSOx7kpTj
	 d6N9VaPGiw0QyCJo9o/OcnCKLoEBAAUhTmp0mZ/f6J202u9xjyj3cWFQ0R8TQbDtfJ
	 /BybRBPNSJeg+ezcNLjT6d2OiaQeJFuARiXPg/SB9dtB9L4mkgIz5TmuoFnUxIjT3e
	 AgxHl4VRV+WYknmTHI8EUJXt/bheVdj2XDF0EfZRft3obwl2zDVjsnep2MhhYGZNjD
	 pWqMMFlmq+WuRKO3CryNksoxas0w/IgoA3fd+ktsnP3T7z3oH0CXKCw8Ley046CJ9Y
	 aY3wVjTW+f/4w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ming-Jen Chen <mjchen@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 03/10] rtc: ma35d1: allocate RTC device before requesting interrupt
Date: Mon, 23 Nov 2026 19:59:14 +0000
Message-ID: <20261123200012.502284-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123200012.502284-1-lee@kernel.org>
References: <20261123200012.502284-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

ma35d1_rtc_probe() registers ma35d1_rtc_interrupt() via
devm_request_irq() before allocating rtc->rtcdev via
devm_rtc_allocate_device().  During driver unbind or if
devm_rtc_register_device() fails, devres unwinds in reverse order and
frees struct rtc_device in devm_rtc_release_device() before
devm_irq_release() unregisters the interrupt handler.  An RTC interrupt
arriving in that teardown window passes a dangling rtc->rtcdev pointer
to rtc_update_irq(), dereferencing freed memory and scheduling a freed
work_struct.

Allocate and initialise rtc->rtcdev before requesting the IRQ so that
devres frees the interrupt handler before releasing the RTC device.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Closes: https://sashiko.dev/#/bug/linux-26674087-baed-4ef2-83a0-78888ea8d16a
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/rtc/rtc-ma35d1.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index eb0da8b091dc..beeef6db92d9 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -235,13 +235,6 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret, "rtc init failed\n");
 	}
 
-	rtc->irq_num = platform_get_irq(pdev, 0);
-
-	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
-			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
-
 	platform_set_drvdata(pdev, rtc);
 
 	device_init_wakeup(&pdev->dev, true);
@@ -254,6 +247,13 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 
+	rtc->irq_num = platform_get_irq(pdev, 0);
+
+	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
+			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc device\n");
-- 
2.56.1.750.gf70dc682cf-goog


