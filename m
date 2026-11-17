Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D63606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jhP7Jv/g;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=BZQ+rYVE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=khN6VDPnjL2LqUdtA4sH+OiPa/4+wQB3zpuMWXL1Td4=; b=jhP7Jv/gEM1XKz
	BSooUoadl2nhZ0Bc3rcbc6rWUS9PMuX2sSj3bkqEJ+ZpW108zfY3HqLEZmm76lrukCbINnzM5d758
	SxqcsqTMObTLiTvJHKl7Lhm6LUCp1NENAAeSJT6xk3Be5UHSegoJJbOeQRUb4Jf87Uj97dTtHSqAq
	TiaJJlR3vhldQPgpXIkvzwJChTA/O30No0ONuldiE9BBZZ75cAUX/w+Y62VlGNKxmIPTuCrxJQRYW
	nm8oX2k6qcFO70CavXs5ZLDJy/kmhElnKWmXMi5oR8GtqQYipQAjN7hRlRi1209NfKGQSk7RzbsoJ
	gZAZTeEmcVPUDx+8VNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSx3-00000007JTq-3e6F;
	Tue, 17 Nov 2026 23:51:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSwq-00000007JMp-0B4A;
	Tue, 17 Nov 2026 23:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=khN6VDPnjL2LqUdtA4sH+OiPa/4+wQB3zpuMWXL1Td4=; b=BZQ+rYVE1E2AuhqxEk4m8XoOB8
	owdC7L8wRELvw5zwtR/NhsSBpcdW+bq1OG43l/7WuUG2Z6COoy8lYfwQeWvPOmPssf4p6fzdH4+bp
	3cOO8ggcbu7+7PWDkOeQL14Xy5MN5HnsuRQ44TwVJSynryst5Miziidgbr75rnfgJJSqUlGDIZMza
	b4yT9WKQiwkm44jbnb0y9LI9SOFuHHuddldd12fD9P44tdArGuziF1zxM2OKlKTvafHIIqdx1b8dn
	ATZ9Fnmgl7GJ13hF9UkEq81TKzSvp9mjkePrf6I40MZr9WRWj9S65X1s1MktpEPO82JqVBQBJ1tGC
	D0ObPtAw==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 6/7] spi: rockchip: Move to pm_runtime_resume_and_get
Date: Wed, 18 Nov 2026 00:50:20 +0100
Message-ID: <20261117235021.2013719-7-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117235021.2013719-1-heiko@sntech.de>
References: <20261117235021.2013719-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_155048_126201_E898610F 
X-CRM114-Status: GOOD (  13.12  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Currently pm_runtime_get_sync() is used, which increments the usage
count even if the resume was not successful.

Move to the more modern pm_runtime_resume_and_get() which handles the
usage counter better.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi-rockchip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 8bb55d52d346..ce1629e5a513 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -255,7 +255,7 @@ static void rockchip_spi_set_cs(struct spi_device *spi, bool enable)
 
 	if (cs_asserted) {
 		/* Keep things powered as long as CS is asserted */
-		pm_runtime_get_sync(rs->dev);
+		pm_runtime_resume_and_get(rs->dev);
 
 		if (spi_get_csgpiod(spi, 0))
 			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER, 1);
@@ -734,7 +734,7 @@ static int rockchip_spi_setup(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(rs->dev);
+	pm_runtime_resume_and_get(rs->dev);
 
 	cr0 = readl_relaxed(rs->regs + ROCKCHIP_SPI_CTRLR0);
 
@@ -924,7 +924,7 @@ static void rockchip_spi_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr = platform_get_drvdata(pdev);
 
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
 
 	spi_unregister_controller(ctlr);
 
-- 
2.53.0


