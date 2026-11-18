Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F6D606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdOxDDcc;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dgz+ldy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N9Jw7QFfNNzbfMawOXRrxxwq0c/fDBFUSCmAzFzlE/M=; b=JdOxDDcc0H31mB
	95/re4BIt/vUpK536eJBpZUcPvzNPWSl5HK9G5/qbYLQbd+7ayqjyIP4+InM+pTC+mszI4aSvDNXF
	lYcERvgm1qmAsjnYRv+7K0NXL3qIYxXPkx7jwgUaakGXiVSSyapV9oFoh8D4qG4+bPIzn8zessWH7
	MOSUyLSVhNuLVjl0sFVmOH33QwwR9yZBZlon9CvXXslokSFTevl1rIhpZAvhu/PLMXCB3jk+nEaLS
	QEA1SGRbaXffF3G4CXBnOYu7YJbD5m1sZYwpld+tK0x9bi1EZ+YUbyiAKi6nGhvGgVTshaToQtMjb
	I0v5XciaRLazo8yQbNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg85-0000000912l-3zSy;
	Wed, 18 Nov 2026 13:55:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg80-0000000910i-165f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:55:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 84F821A16D0;
	Wed, 18 Nov 2026 13:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C2085FE9B;
	Wed, 18 Nov 2026 13:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8955211BC2115;
	Wed, 18 Nov 2026 14:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795010105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N9Jw7QFfNNzbfMawOXRrxxwq0c/fDBFUSCmAzFzlE/M=;
	b=dgz+ldy8nUz2LlSkOPJ0hVaotuQRRGW0T97xe8ymKyUtx1t0RZ7y1W2EFvkRz77eJnc5YP
	m/5/xi6jGLJTYTdiHzaFPUicr8vP7CkWLrXwxsu+HkRFEO8kj3v24ByI/qQd63s/otSB5v
	I28KY4m5YIBFVk3kzVhO8nAhbMzHX3IU9SQMwr5nL6vVMjrGobF4OCZJ0PqfFPyfAFHuAm
	aOnPi8uLvPKGokWiURxq3DPkY3a8FemPJVXTLD4PTw+KiQvQZP7GUhEC5BCXl0Z2HsqWvx
	l2H9LA1HF7/m3EiwxZQPgrujd3viE48JPeroQoILANDkw4FIbI2qjirEkF+GEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:54:55 +0100
Subject: [PATCH 1/3] spi: ma35d1-qspi: Drop a pure software limitation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-1-e5066ad2efe3@bootlin.com>
References: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-0-e5066ad2efe3@bootlin.com>
In-Reply-To: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-0-e5066ad2efe3@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_055512_456386_991B4E6D 
X-CRM114-Status: GOOD (  12.22  )
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

The controller has no documented limit when it comes to the amount of
data it can read in a single operation. The current limit is purely
software and prevents continuous reads. Some of the limits may be kept
for use with the normal SPI API, but do not make any sense in the
context of an optimized implementation for use with SPI memories.

To make sure there was no problem with my approach, I wrote a test tool
(link below) and ran a hundred tests over dozens of blocks.

Link: https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com/T/#u
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 0644bb2990b8..1ec631afa403 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -295,9 +295,6 @@ static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbuf,
 	if (!len)
 		return 0;
 
-	if (len > NUVOTON_QSPI_MAX_TRANSFER_SIZE)
-		return -EMSGSIZE;
-
 	ret = nuvoton_qspi_reset_fifo(qspi);
 	if (ret) {
 		dev_err(qspi->dev, "FIFO reset timed out\n");
@@ -386,15 +383,6 @@ static size_t nuvoton_qspi_max_message_size(struct spi_device *spi)
 	return NUVOTON_QSPI_MAX_MESSAGE_SIZE;
 }
 
-static int nuvoton_qspi_mem_adjust_op_size(struct spi_mem *mem,
-					   struct spi_mem_op *op)
-{
-	if (op->data.nbytes > NUVOTON_QSPI_MAX_TRANSFER_SIZE)
-		op->data.nbytes = NUVOTON_QSPI_MAX_TRANSFER_SIZE;
-
-	return 0;
-}
-
 static bool nuvoton_qspi_mem_supports_op(struct spi_mem *mem,
 					 const struct spi_mem_op *op)
 {
@@ -560,7 +548,6 @@ static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
 }
 
 static const struct spi_controller_mem_ops nuvoton_qspi_mem_ops = {
-	.adjust_op_size = nuvoton_qspi_mem_adjust_op_size,
 	.supports_op = nuvoton_qspi_mem_supports_op,
 	.exec_op = nuvoton_qspi_mem_exec_op,
 };

-- 
2.56.0


