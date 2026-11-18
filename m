Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39292606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NQp2P9kd;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1qPAgq9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BNHb2upVNRY1oGSJTHZzcy5zKsk+4JwuCx/BHx8TrMs=; b=NQp2P9kdfZlJKS
	rlCNcgOGZjHNQrANRMk/+M5Zgrr3SuDXYUABfwSoJ8w6wsBsBh6WQ4dEDVLQHxOYCBI8WOk5ADL4E
	d4FU++n5LO4oNIkyB3XbLRXkeJR9Jr3wzSI2IeV4qu5BVewFI63pCxQLFVZudMxc4my11ScMEXiCq
	QpF/87sy8YdoYQt8u38wS0BFaZ6KYxPf+9Dm5Uj8iMU+xJWzbLBZ+f5W8CCZFvszQsxY0mahMkLYO
	5a/Cb1poPuon4pwXUkyJxl3wUtSB5JTIu0IQ/ZlUcI6813U0W8qWie5Ojd7apOee5vjgP1fGnLEjc
	d/4/awIdqBnnSuMAjYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg8D-0000000915w-0JU6;
	Wed, 18 Nov 2026 13:55:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg85-0000000912O-49yU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:55:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A5B2C4F77E;
	Wed, 18 Nov 2026 13:55:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41D435FE9B;
	Wed, 18 Nov 2026 13:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E80A811BC0D19;
	Wed, 18 Nov 2026 14:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795010111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BNHb2upVNRY1oGSJTHZzcy5zKsk+4JwuCx/BHx8TrMs=;
	b=1qPAgq9+GFSv/Un0KX3shDlC84r25LP5ddJJ/+Xz4sH6rqddbyR/7o3HxtN7uidbJmQ+3a
	UpaOWuUhbF3yw/Z7VGf73VfN0z7nNLJw1C3FIQRTFbyDeBMgD5OnbmYUOUv8nvvB117Zod
	lZ57zwXAN0YYSflc/4Z0D1WtEt9Qctjt9aLpezb8/QUlsv4mCBafvIbhT1XOWF2kJoN4iH
	xfK0oOTjkmskMCI5LV2bSWmdHIe1iCSUEMWrbc6DhiZbUjkEDFadTHHXWeFULp7qCRLPKf
	Hrh9qQghPazm3NekrIV8HAFm1ybXB3xN/ixliH9EVbpxNwY0MTA5UvMzHzcXaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:54:56 +0100
Subject: [PATCH 2/3] spi: ma35d1-qspi: reschedule during long PIO transfers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-2-e5066ad2efe3@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_055518_210108_814A0DA2 
X-CRM114-Status: UNSURE (   9.98  )
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

The driver performs every transfer byte by byte in PIO mode, polling the
FIFO status between each byte. Since spi-mem operations can span over an
entire block (128 or 256 kiB), the CPU may be kept in this loop for a
long time.

The spi-mem ->exec_op() path does not go through __spi_pump_messages(),
which is where the SPI core adds a cond_resched() after a transfer. On
kernels without involuntary preemption (unlikely on embedded systems
with this controller, but still), nothing would yield in between. To
avoid keeping the CPU for ourselves for too long in these cases, add a
cond_resched() point every 4 KiB in the data loop.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 1ec631afa403..65dbad6f63c7 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -328,6 +328,9 @@ static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbuf,
 		val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_RX_OFFSET);
 		if (rxbuf)
 			nuvoton_qspi_rx_byte(rxbuf, i, val);
+
+		if (i && !(i % NUVOTON_QSPI_MAX_TRANSFER_SIZE))
+			cond_resched();
 	}
 
 	ret = nuvoton_qspi_wait_ready(qspi);

-- 
2.56.0


