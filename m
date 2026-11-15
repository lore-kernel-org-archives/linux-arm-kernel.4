Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5AA60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyICMw20;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=bTY7rP6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cNveIAVpkhVpbi7+FYZP8+iE4eKe75P5j/gqWh+mb7A=; b=FyICMw20vkr/1UurVZx+MbVDzL
	/BwjHUqBjH2XqEeW9zMPwcZVm0Vt3hkXjzght7kr6yviweGuYzK6QIB0znx4dKJZy2rGKfKsSEppb
	UtahUU2YhikoyWfnIG/yvaOntsyLCDv8D0N+ZlLAdcIFCe5AOQ63tsQr8PzmVOkXGagia8t04zedx
	72Y/X/9O9J9GfN6vgUb1gJ4tWNj7lpHhf+HoB6ywjMYC4oqJ62oR5ATXQUbCodaccI8OCFX9N6hvD
	OxI9116v6nlg+PFRk4lj8MLdrvMc1WduIcguwnXwM9TFB8Grc3DfeRIBcukOpQ3oFBO7xW/Qki8Uu
	qTHbA8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYiR-0000000HTrP-1g6j;
	Sun, 15 Nov 2026 11:48:11 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYiG-0000000HTmY-1slP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:48:04 +0000
Received: from [192.168.17.1] (unknown [124.79.98.159])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54b7e04df;
	Sun, 15 Nov 2026 19:47:52 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2] usb: gadget: lpc32xx_udc: drain pullup work before teardown
Date: Sun, 15 Nov 2026 19:47:49 +0800
Message-ID: <179474326988.103840.10326852247134349070@seu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1df09040203a1kunmbac61c98bf783
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGElIVklKTEkZSEhJGUIYSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSU9VTEJVQkNVSk5CWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	JKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bTY7rP6HcMLSIs4lgrtWO7hXVznAuMLnG7V2RqvKxnJbGIQuJij5+oo+P9IjAswYmFwcb1EypOZ4DTFOXd5cMopo35EF97kCPrt8HBjqTA1qAAuz1lsy4wP8Jg2sRL/fsYaPhdpHBT/gWWkYdAKfQLiKn6RrOjrT9joX5rY7BSY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=cNveIAVpkhVpbi7+FYZP8+iE4eKe75P5j/gqWh+mb7A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_034801_243138_13721C10 
X-CRM114-Status: GOOD (  12.68  )
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

The pullup worker accesses the transceiver I2C client and UDC
state. IRQs can leave it pending when remove or a late probe
failure releases those resources. Cancelling the final pullup
work would also discard the requested disconnect.

After the gadget core has stopped its callbacks, explicitly free
and synchronize the registered UDC IRQs. Request pullup-off and
flush its worker while the transceiver client is still retained.
The worker needs no UDC IRQ to finish its I2C transaction.

Track successful IRQ registrations during probe so late failure
also stops all acquired producers and drains pullup work before
destroying DMA resources and dropping the I2C client.

Found by the author's in-house static analysis tool.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Suggested-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Link: https://lore.kernel.org/all/20260928134158.117-1-getshell@seu.edu.cn/
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>
---

Discovery: found by the author's in-house static analysis tool.

 drivers/usb/gadget/udc/lpc32xx_udc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3..d627a2a 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2978,10 +2978,17 @@ static struct lpc32xx_usbd_cfg lpc32xx_usbddata = {
 
 static u64 lpc32xx_usbd_dmamask = ~(u32) 0x7F;
 
+static void lpc32xx_udc_free_irqs(struct lpc32xx_udc *udc, unsigned int count)
+{
+	while (count--)
+		devm_free_irq(udc->dev, udc->udp_irq[count], udc);
+}
+
 static int lpc32xx_udc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct lpc32xx_udc *udc;
+	int irq_count = 0;
 	int retval, i;
 	dma_addr_t dma_handle;
 	struct device_node *isp1301_node;
@@ -3112,6 +3119,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 			udc->udp_irq[IRQ_USB_LP]);
 		goto err_destroy_pool;
 	}
+	irq_count++;
 	retval = devm_request_irq(dev, udc->udp_irq[IRQ_USB_HP],
 				  lpc32xx_usb_hp_irq, 0, "udc_hp", udc);
 	if (retval < 0) {
@@ -3120,6 +3128,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 		goto err_destroy_pool;
 	}
 
+	irq_count++;
 	retval = devm_request_irq(dev, udc->udp_irq[IRQ_USB_DEVDMA],
 				  lpc32xx_usb_devdma_irq, 0, "udc_dma", udc);
 	if (retval < 0) {
@@ -3128,6 +3137,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 		goto err_destroy_pool;
 	}
 
+	irq_count++;
 	/* The transceiver interrupt is used for VBUS detection and will
 	   kick off the VBUS handler function */
 	retval = devm_request_threaded_irq(dev, udc->udp_irq[IRQ_USB_ATX], NULL,
@@ -3139,6 +3149,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 		goto err_destroy_pool;
 	}
 
+	irq_count++;
 	/* Initialize wait queue */
 	init_waitqueue_head(&udc->ep_disable_wait_queue);
 	atomic_set(&udc->enabled_ep_cnt, 0);
@@ -3158,6 +3169,8 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	return 0;
 
 err_destroy_pool:
+	lpc32xx_udc_free_irqs(udc, irq_count);
+	flush_work(&udc->pullup_job);
 	dma_pool_destroy(udc->dd_cache);
 err_free_dma:
 	dma_free_coherent(&pdev->dev, UDCA_BUFF_SIZE,
@@ -3183,9 +3196,12 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 		return;
 	}
 
+	lpc32xx_udc_free_irqs(udc, ARRAY_SIZE(udc->udp_irq));
+
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
 	pullup(udc, 0);
+	flush_work(&udc->pullup_job);
 
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);
-- 
2.50.1.windows.1

