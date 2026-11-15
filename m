Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1rUSIOsP;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=X/wwuzMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Bv9gCevH/+FIfoLSK2kJbM2sZfdEGa7J4pwZ68VLq/8=; b=1rUSIOsPrfAGH/W4yzwU16fBV3
	YqYcbeguPj7rU3zlQT1hFDMNbbUNKVEQEF5UCRxSah1ovTAUMKcsrpuNZLokaj8mEyBqQA6ymiLa6
	zDpCwPo9v/mjB0m63HOxyE3qwa9/r8pSrpMFtSPKeA7I83LPUKBxqzRKivudcEpDM0UpuzOX4Gzzc
	q1IkTppe/e400K5LlrK2vL92epBwhTth1KI/kJuv6wgwtlQR+7T3MCHT4EaqnBKAg4N/JNhJ5UM4S
	EaEFRUKGHFXn1BsqLKwCIQU9o0iNPkQDQN+6Iz93P/CjZJ9EoCauAuIHag0S/5bX3MMANuHOXkTcI
	FjYyaKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYiW-0000000HTtW-27Bs;
	Sun, 15 Nov 2026 11:48:16 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYiP-0000000HTqK-2Svm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:48:11 +0000
Received: from [192.168.17.1] (unknown [124.79.98.159])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54b7e04ef;
	Sun, 15 Nov 2026 19:48:06 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH v2] usb: host: ehci-atmel: stop clocks before releasing HCD
Date: Sun, 15 Nov 2026 19:48:04 +0800
Message-ID: <179474328429.103840.11561415733183356947@seu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1df093c5203a1kunmbac61c98bf7b1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0xDVh4YH0sYTk9CTBhISVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSU9VTEJVQkNVSk5CWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=X/wwuzMV9fd4pTJMLSh/sPgRmss8WvxtM8Je4yrIJJwkPg7+8qsbuiuetIta7X+lkqw2Pxzgq4u5nZfQKUJP7Mx52h0vqC+UQe2QJeGg372qv4E86bQQ2uG2CxuAcM8UpwMNNUmQV1p4IfKkD4SZoLym8aOsAKc0amVxh4mToBI=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Bv9gCevH/+FIfoLSK2kJbM2sZfdEGa7J4pwZ68VLq/8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_034809_841232_BC8700AD 
X-CRM114-Status: UNSURE (   8.86  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

usb_put_hcd() can release the HCD and its private data. Calling
atmel_stop_ehci() afterwards retrieves that HCD from platform data
and accesses its private clock state.

Stop the controller clocks after usb_remove_hcd() has quiesced the
host, but before dropping the driver's HCD reference. This matches
the probe error unwind, which already stops the clocks before
usb_put_hcd().

Found by the author's in-house static analysis tool.

Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260806060557.1747-1-getshell@seu.edu.cn/
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>
---

Discovery: found by the author's in-house static analysis tool.

 drivers/usb/host/ehci-atmel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 6574727..bcd56f8 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	usb_put_hcd(hcd);
-
 	atmel_stop_ehci(pdev);
+	usb_put_hcd(hcd);
 }
 
 static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
-- 
2.50.1.windows.1

