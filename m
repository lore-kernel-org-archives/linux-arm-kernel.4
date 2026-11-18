Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jKL6iJh9;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PibSgD/W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s+BpYLchpa1pf5ajqwxSUuxe/1gF9WVzSXBzO3/xxkc=; b=jKL6iJh9F8EjYf6pZHWIoD64pf
	tHzJhR/xn4qfxvqNmT1V2x7UHOHnoJh8JQs8v4u4Qz8gSGqjZ4qzs4kwnyR42LYDAexjCoHjgaTcJ
	zWlY3jKgvqUpCsornG+2PyW2dFYuYJcv/RFX1gJutOt51WQMyPN6wZ8bKsQVt8/KXWDoyyiALkX64
	I7I5+u48HkgyVFYzPg8AY4U2pCXZeYcAJq3iI2nHMiHeQN+sQqFCRqF7HnVFafwAgFcKp+OEXQgxl
	vnfVSblWFaPz4lNx2gvazDcAkFNPlQk3T/sJPFokZmjK8AWOIphz3x2D/vGlwdfCF3Ig0HPQQH0Ic
	+AXIn6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgC2-000000091ef-379P;
	Wed, 18 Nov 2026 13:59:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgBz-000000091eG-2YAd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:59:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D15BE4E4162A;
	Wed, 18 Nov 2026 13:59:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FAD15FE9B;
	Wed, 18 Nov 2026 13:59:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6003511BC14FB;
	Wed, 18 Nov 2026 14:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795010352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=s+BpYLchpa1pf5ajqwxSUuxe/1gF9WVzSXBzO3/xxkc=;
	b=PibSgD/WM5RFvQx33QLstwvEjIYO03evEsIlyaYPXStLWyKsHsdID6YRjQabtUFFaiygKS
	xRAffipgYRDrm6Ma/waV3nj94zyfHMAuDL3EY9G4hE+GEnX0Zv27rEA3PgqA5BsnyKXQ8H
	Ja/Y4ykMxqeKx5cryCsNiqxlPKa7cQIyWuVmYR1ex1zBXiaSkaanY/oJMdu5aWmMx9gQzA
	LpW6QBllsTboqL70FmWyV658LWImyjcV+Cu+APy3Uw4SDK7ujjXNXIcNVRmy63y4oRC+Cp
	0eDf+IlLzkterx+5/ID7Kh0AVCamD/abeRlCj7CQZOUj6pPTba+Nto5A+d/iVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:59:04 +0100
Subject: [PATCH] spi: airoha: Explicitly prevent continuous reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-winbond-upstreaming-airoha-cont-read-v1-1-acc0b6410868@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQ6CQAwAv0J6tgktiaBfMR6W3QI92CVdUBPC3
 914nDnMHFDEVQrcmwNc3lo0WwW6NBCXYLOgpsrALV+JaMCP2pgt4b6WzSW81GYM6nkJGLNtWF1
 C6joeeh5vPUeoqdVl0u9/83ie5w8xLwqEdgAAAA==
X-Change-ID: 20261118-winbond-upstreaming-airoha-cont-read-1332872b972c
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_055919_802163_0BD7CDB0 
X-CRM114-Status: GOOD (  11.17  )
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

The SPI NAND core currently treats the lack of "large reads" as an
indication that continuous reads might not be properly supported, but
this is fragile and might evolve. The real problem with the Airoha
controller is that it lacks full control over its CS, which may be
spuriously deasserted. We now have a flag for this, so set it and make
it clear that this controller is not suitable for continuous reading, at
least with chips processing a CS deassertion as an end of read
condition.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-airoha-snfi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 95bfde7c8e7f..1070d4697fcb 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -1018,6 +1018,10 @@ static const struct spi_controller_mem_ops airoha_snand_nodma_mem_ops = {
 	.exec_op = airoha_snand_exec_op,
 };
 
+static const struct spi_controller_mem_caps airoha_snand_mem_caps = {
+	.no_cs_assertion = true,
+};
+
 static int airoha_snand_setup(struct spi_device *spi)
 {
 	struct airoha_snand_ctrl *as_ctrl;
@@ -1121,6 +1125,7 @@ static int airoha_snand_probe(struct platform_device *pdev)
 	ctrl->num_chipselect = 2;
 	ctrl->mem_ops = dma_enable ? &airoha_snand_mem_ops
 				   : &airoha_snand_nodma_mem_ops;
+	ctrl->mem_caps = &airoha_snand_mem_caps;
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->mode_bits = SPI_RX_DUAL;
 	ctrl->setup = airoha_snand_setup;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261118-winbond-upstreaming-airoha-cont-read-1332872b972c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


