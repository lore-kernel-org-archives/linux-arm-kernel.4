Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2B606A890
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d1L1APQN;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jJ7Neod7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ipD9z61No5E/UoxkAuOX/M6L7hnvJUNvWGwglb7bkpU=; b=d1L1APQNKusTbUM7b6Iwxl2AhS
	0KEFL9M9a9PNhe2BD01WVLAaF6TbO6PfWw8VrTJcoOQnrKVMIt3vq7GjrStj5RWFk8u3U9ekvleYC
	WWFzW8HZ9P0RUun+H2crvd8B8tFqoPDsss8V93TFR2bwWK71nQk/zfp5uYZiNLWymWUrM02AsuCQR
	tVwjL242m6+bu53663KvvW72UdK4cCNSb1sz8PuZWqWoioomnyzLqRzY+sxxflbS2My0bQjG/gLVb
	CVLT6i0TXtZcrE5knL4h7ogeXQTFodC34+lZMDUqK4q8v5NVO+KWAct/OO25vfHsLKLj7+el/sFXH
	FB+nOQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8ay-00000004MEs-1oXG;
	Tue, 17 Nov 2026 02:06:52 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8av-00000004MEB-1F4i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jJ7Neod7ur1ZxSEkH9hxI7kURcTDIwS7pZ7C2wSUYtqxY/3JNaqkP1Pe1Gi5qoZ3Ju7NUmbBuuPg8
	 zZXbQRF2sNyL3VOc/OeDDt1JE4dIXs1p1+Y7Ry5ox6Xxc1zS6PW0diNQGHZsrzimkleIVyPFX/zo9D
	 5DKHoRdaUov8O3u0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afbb6aeb2d-a3e3b;
	Tue, 17 Nov 2026 10:06:43 +0800 (CST)
X-RM-TRANSID: 2ee46afbb6aeb2d-a3e3b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6afbb6b1370-9e880;
	Tue, 17 Nov 2026 10:06:43 +0800 (CST)
X-RM-TRANSID: 2eea6afbb6b1370-9e880
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] spi: orion: handle clock failures on runtime resume
Date: Tue, 17 Nov 2026 10:06:46 +0800
Message-Id: <20261117020646.20111-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.24.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180649_918497_0D355C1C 
X-CRM114-Status: GOOD (  12.22  )
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

orion_spi_runtime_resume() ignores the return value of
clk_prepare_enable() for the AXI clock and returns the result of the
second call.  If the first clock fails, the function still enables the
second one and reports success, and if the second clock fails the AXI
clock is left enabled.

Check both calls and undo the first one when the second fails.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 drivers/spi/spi-orion.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index b8882229c0..9c3c16449c 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -825,9 +825,19 @@ static int orion_spi_runtime_resume(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct orion_spi *spi = spi_controller_get_devdata(host);
+	int ret;
+
+	ret = clk_prepare_enable(spi->axi_clk);
+	if (ret)
+		return ret;
 
-	clk_prepare_enable(spi->axi_clk);
-	return clk_prepare_enable(spi->clk);
+	ret = clk_prepare_enable(spi->clk);
+	if (ret) {
+		clk_disable_unprepare(spi->axi_clk);
+		return ret;
+	}
+
+	return 0;
 }
 
 static const struct dev_pm_ops orion_spi_pm_ops = {
-- 
2.24.4




