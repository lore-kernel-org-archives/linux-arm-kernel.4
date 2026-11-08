Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6BA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHuYsesk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgIUDfbe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=; b=VHuYseskxsn7k5wWTRJwbddk25
	Dh0j/Z5OSpWsXhv+1BWBNQlyXfgq/VJxmo5NfGHqmG9sRI/dqtVCVc1zwd3plpiQy1hZGyZDEBIfN
	LfrOdrZXxpSGMv5BWCI162brWfsOGdHWeJPjGV9QkACbvjlkB4gXUInUJFseIJOcpNkIDsANURu5z
	gmhnB9eA4FlI+clbO3qExrNXpR2YeSR8MKr+j/Mg4hBXukgNIJX6I4RoKpMb2pom9udg5lVT0AutJ
	dQ4lWkPEKrhFauSG9CnPG4EnVTcd6CpHE+q3LzP/EQnDMzKAEaF8RQ8hA9djQgQ3XVsD3atF44clD
	dZgHNRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA6z-0000000Gg2H-07IS;
	Sun, 08 Nov 2026 21:07:37 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA6w-0000000Gg0f-2uPx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:07:35 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-85a6c747dc9so213559a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172054; x=1794776854; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
        b=dgIUDfbeBlHdoBauZG0phyRd8iCa+Hv9AfROxyz9nTtxn4j4W9jd9RczTKc1YIleQc
         t+BJnrh9IZ6DPqfdgh77U6jRAVahZi7mF1CjVLm/xce8g+lFTKy75ab9NdXjpkxSLMiq
         edc2QxLixApagZoQo1CVR/ir/S67QTSLyhcu4LQ6VvOn51gHIe62ql5F79QYST5PLNWy
         YkvnzyDb6EzVrd03Vv3UZUSdNw/HNHrOQVaDTWg/YXxHxy3TP9QL0zby2I9MNwxRQxXj
         VN8Nk/8eB05bXJ4mIgp/NLmrjwfiW5PiKoyhonZ3SF5rfaqsUPg9cVmZIGsJ9GQ57H+B
         A0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172054; x=1794776854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
        b=IafyWDaCz8AWa5bo5kpOxQNzwDdO46VKe4VJarUaOQ85ZYxlN7hZlg0jTlKuZz6upw
         s3gVlKP7/8mEzKxLq72snVbIOsXWQQfMb1wv2HIDoIHCywzNSh5rBAz8THt5ZcAhOWwf
         4bsyugjKDaQi6weOnhA9X8uXgPZKFeJeN0GuRM4tpBWi9HrhQYvWqnABjY9C9/RvgNNd
         /miy/Z4Ha+HN3oCvVSj/6lxzG5yPmFV3fEg1jrkCk+A6soqyelUkP3aN+d803eghFOed
         b0jbzuen7aA+YTQ8pahRnPeJ0scJUYy5QxGOD8Nim9B2owDv1Wlbj/y7nfoWgzppyiPA
         /EfA==
X-Forwarded-Encrypted: i=1; AL+hErF6mEKD1Y3glYyInfCuU+Jz4oe2uXRtw9++5sHL5bfVN9mp3sDr4UbdKhwy2vDvN/wIbFUfvZ6+0gVKZPnddSfU@lists.infradead.org
X-Gm-Message-State: APuU4Z/DASAlADZqOV/xp4nl1Cjl1iTjQzTQKjSlsjAwVfoGcnLkLIA1
	+5PZGtEi++jXKwIkpEN7a6n38oD3oprQjacQFqA2zyte/aJlONU+fZxxHeomXw==
X-Gm-Gg: AYBFou22SCAMjrXksc5fl7IGyuYU/5cOeiDM6cjvArMSXc2/dxHTSWrRoEjIdRT2nYH
	Dxu0b7aLSXzxLaGGonwN/hD4KHjbpq3ds8BK2iGV/ryY90S1qKhaLajJ40PMEj9a6zpdSERpPLp
	I+NKteFAHZMktJqtyYIQjcY7Korc7nN4krDLnDTk2LpDpLfl1TsQK8aydtwklbez+vKP9gfznXG
	BfBJxF4w7b7ebfckxwqXnDk1uT5EMntqQojwCmSf0Pyo1/szuq8vSM/kETMB3lO0jfHlVES2mtb
	6YQ/jn4oIDazIxL7Vcv4G11xTNll0AQSbmQhx1FxiqG4QIt2Aq81LKMg5G8oKwfBHPzacETmGgg
	MC5EE8IMBZvxwK1GDta0iXjMHN8dM+sdEjrNlUeiQ1LJHKO3XTyy+9R28AFi0UsGfW41MMcSwlN
	1UVUC/aqYgXSb1C57NWNSKSR+kSbf4y3oCS5+bH33kS7yTFkhDWWYhQ7uXvlqsWgCOpSGwFu1XO
	6vlt7xFUNyiswRpcZBalQHShrc6QxBB23yXB6zmlHYtnO4+DsgAX55kweVXE/2+pHktSBrzcQ+w
	b/vriCmduBT3kEM9XO3zrnELfbIoMkarGb4lnI4RUQpPltpts22IUgmht/yZypi1iB/ScJARFYl
	F6fyfom64+MBd+SVZyOngDFRRkYhoeASVGgbl4Tt7+8kzFmpVf5lSw70lQgkmMJdmBOHr/5Be1K
	vJh+nzPUFgUW9gzLZB2pwiCERHu6rfPEtGUGkCIM9jae7BUODas0mI
X-Received: by 2002:a05:6830:82f4:b0:85c:e511:ee04 with SMTP id 46e09a7af769-85f34abf688mr2547935a34.16.1794172053785;
        Sun, 08 Nov 2026 13:07:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb2b331sm2147379a34.10.2026.11.08.13.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:07:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:07:31 -0700
Subject: [PATCH] mtd: rawnand: atmel: release the NFC IRQ before controller
 cleanup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbZhm4mot2I82E+RGim6TSQh3
 LubHr5fmqcrJIpMCc7NCpFmTjxJCb1rwA9WboQcSoNR5qC16jC93cgZbR7pgWIlIMcXZrIxTB/
 BWWN/UmavOq+PwUFxnpF6Xn4/Ltd/F+ROPle4XjibCF204oc6jTm0VW6Flgzb9gWEzj8YpQAAA
 A==
X-Change-ID: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130734_743746_1E581535 
X-CRM114-Status: GOOD (  12.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NFC interrupt is shared and devm-managed. Controller removal disables
the clock used by the legacy binding before devres releases the handler.
An interrupt from another device on the shared line can therefore make
atmel_nfc_interrupt() read the NFC status with its clock disabled.

Release and drain the handler before freeing the controller resources.
Track successful IRQ registration because probe also uses this cleanup
path when requesting the IRQ itself fails.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94..9a724de67624 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -263,6 +263,7 @@ struct atmel_hsmc_nand_controller {
 	struct completion complete;
 	u32 cfg;
 	int irq;
+	bool irq_requested;
 
 	/* Only used when instantiating from legacy DT bindings. */
 	struct clk *clk;
@@ -2334,6 +2335,9 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	regmap_write(hsmc_nc->base.smc, ATMEL_HSMC_NFC_CTRL,
 		     ATMEL_HSMC_NFC_CTRL_DIS);
 
+	if (hsmc_nc->irq_requested)
+		devm_free_irq(nc->dev, hsmc_nc->irq, hsmc_nc);
+
 	if (hsmc_nc->sram.pool)
 		gen_pool_free(hsmc_nc->sram.pool,
 			      (unsigned long)hsmc_nc->sram.virt,
@@ -2383,6 +2387,8 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 		goto err;
 	}
 
+	nc->irq_requested = true;
+
 	/* Initial NFC configuration. */
 	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CFG,
 		     ATMEL_HSMC_NFC_CFG_DTO_MAX);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


