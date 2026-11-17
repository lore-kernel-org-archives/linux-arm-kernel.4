Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5070D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MseXcL2W;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Q3HQ8yTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OLUnGvYwOC48SloSAiu0WufUKOV5tVIRadr3I27DxbQ=; b=MseXcL2Whs5DyuWPrdrIRaPs0K
	UEfNJ27d5xXiwYqJt/C9jRAoy73OiR6VXhu7/eMhBnKayi3RSTFpgVla9KqT7qEFEHZ5TM6DpWxPT
	t4/rJY50ira6C6PRcJQmY5+b7FARIIiIciTQSLEZpcUkzKC1q4qjTIK4LuQHMO15A8aiR1wIqoBCz
	+EJnd216DTE21X0/PpivWsZWr0Da+rq9zYsHN2k8k8Q6DibEm7cdk7ME3CkhyKmKYrap4bqJ1wW5L
	Bdjk9BlpvSD26n4lwFExwokVOWyZdkOxs78JRUBcjfMRt/JrdryzIDg0WyHJGh2sXiFDcvPNTKaxm
	kTowb9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8c9-00000004NAh-2zZU;
	Tue, 17 Nov 2026 02:08:05 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bH-00000004MSO-2KJb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Q3HQ8yTxEirvq4yYQgtq/FUTOSFxUVY9KJQrXPH/kXTOJ/5EteUaqG8tlTkBlZnqe484niPxQfpRt
	 B8oVS0nWe/Q3SvU8kyyMjHaNZP9CtbrucUEIUahKxtsbuIRx/yY2krQ0gn1ZYHkvE3XPVI2cXni15b
	 pZiXklSoaJUnml/c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afbb6cb9a8-013b1;
	Tue, 17 Nov 2026 10:07:08 +0800 (CST)
X-RM-TRANSID: 2ee56afbb6cb9a8-013b1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afbb6ca618-9edcb;
	Tue, 17 Nov 2026 10:07:08 +0800 (CST)
X-RM-TRANSID: 2ee56afbb6ca618-9edcb
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eugen Hristev <ehristev@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: pl022: handle clk_prepare_enable() failure on runtime resume
Date: Tue, 17 Nov 2026 10:07:11 +0800
Message-Id: <20261117020711.20158-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.24.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180712_157869_C41EB098 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pl022_runtime_resume() ignores the return value of clk_prepare_enable()
and always returns 0.  A failed runtime resume is therefore reported as
success and the controller is used with its clock off.

Return the error from clk_prepare_enable().

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 drivers/spi/spi-pl022.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index f52130465a..64bf9c4b0a 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -2067,9 +2067,8 @@ static int pl022_runtime_resume(struct device *dev)
 	struct pl022 *pl022 = dev_get_drvdata(dev);
 
 	pinctrl_pm_select_default_state(dev);
-	clk_prepare_enable(pl022->clk);
 
-	return 0;
+	return clk_prepare_enable(pl022->clk);
 }
 
 static const struct dev_pm_ops pl022_dev_pm_ops = {
-- 
2.24.4




