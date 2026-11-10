Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D0606A952
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sugzJS2R;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptUfG6aO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=; b=sugzJS2RZrs3AW
	C5oqRGtwOoCx9xfLaoN6NVFsS1ORgZ4hILQ8OsDVtSDT2bk22+/zpfouzz9eABShshgpJU7o18iMZ
	8a34bAlTXtxg2kAYR4JXtqXomkGcuxrX9ugZzBbITBgV0FyhvUHOsjZ9427ipi/niSJBO7LSY4zaW
	94iNokMugIPNBVKT8Vvf44JPKHe1Fv4Fa5DmtB/Ggxf09bTl0FGPEl6ZISlRb/hSKmTX3L48KAmje
	ZXUwvJFQ4GF9VymOWFQk04eSn+QkiuEGzIGax4ibn5ch2e8TJadoIX3yjX66cxVES520An4U3w2l1
	7gbWpgIj9VWl3g6Jfcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX1-00000002wAr-0S1L;
	Tue, 10 Nov 2026 07:44:39 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWu-00000002vuL-1xie
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:33 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4af173320f9so920381b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296672; x=1794901472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
        b=ptUfG6aO3GDgLw6EwLy6JbL671V1ZG0AFp9OjXqhXCaKTRLsan45yfx4fO0C/TtQm1
         GBSt1Y4guMk+/dBgAVnEbfYr7DZlKnM0+IU7i/UXXNzi4nyiuHKj1R8tkGfW1kEcx/o1
         IvopA3RWdri+snZsrs5uyO/CzXhwe1vjHegeOq+OOZtj8NppSbMbhXJao803kclevfZ0
         hhHiptltfkaPWcwLCV3LyYrMKjc8Cl56uQ/J5zYRoG7DC2VMpGMX7VgF+qdoJALgBOnp
         2ODn52c/rs2IyjLw8EzGdLpwaI0JBpKRTXgyAN7mkG8EwfXm8t1pFpWQPKZ0995UJcS6
         L/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296672; x=1794901472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
        b=2mpkvreuvD2tcRa9KPdIWk2V9XuWRE5PgZ2QnYNsdLclsmnoL9XIXjO4Jyvrx4yLrY
         m3dWR7aXy40vSpBh3tSli9qIhj1Mn3KRkYF5RBF3AWsaDLySOlZkinLSqw5p2g8aTuRt
         t8WPTpXW6ByNw4HPUMOpZKOeCF3q4VW6jdlg/qZvxxBm0uvKXan2RP7KPd6acQN0930S
         cz+3Gz3wQrOUkPuTAgoBWEgYAJLFadAtoW+/Wr5O42B9i2PlCSJ+B099malniNp6R5UB
         Dm0oNTOrEG6DZVTOpIB2z8kmVEE8h/gs2Mrc8gRBYRHwstyapvqB2Y9M4YFBaPjJcgn2
         Zjfg==
X-Forwarded-Encrypted: i=1; AL+hErG8Pki7m7JwALjSh/v68z08ay3yAG0F8bVfqmkP29c8yPDkcdw/oJveLdT+iwYqph04HDgWUF6rkKLdSoFzX1ov@lists.infradead.org
X-Gm-Message-State: APuU4Z914mjvF38mDYhO/di2eIcqNGTSbY/FYk6knZF24r3HxzLC1IH3
	GDrW0rCxhOr41BA3sYT4rtu2zokjRi3kLK0UkOKdJ3fMPCyc+HDMqOOy
X-Gm-Gg: AYBFou3MS1Tc+cEiz+/UrTcNwTu9n99Y4kQczfPvIK2zGyTR/kzvg8NE5hDZbDTUBxP
	IFdAL14FStZ1HBZF30jsyJIIV+ik/NgQ5PWZ+9GW6VOyLcC12uG0IaRpvJapb5zDlpmDXKcgxvu
	PTD5UyG/GjjwsdJ/CisUsTo0EFmvAOF32g0HXbYwLQKau1i7FkutwaOZShrE0PQ6bG/bOfsz3vQ
	fBXhN0J9XiGC7kSbflNfamLjvngf92JcJjm346I8LedQccSQkjS3pHuUsA3q298+ojCezBseTlT
	H2CmPBoYZ94mpCgBbKidSgG0pnSwY2tCdmOpm5r0JlhzNN8i7PARpJStJ4/cvdAuxkUkgi3GW15
	/e4PKnxd18XTn8i/nSkbiy+76ZA1pZPfcn15kjzQ64RYTFZdKr67OBQnH2HSfjdKILsYsBcAmrM
	BUzQDrE0EnOqZ3Rnoc7n7eQ/unbpvE1em3IeS0YNgGT3VlsrxocZ88icrZ99YtU8xOWB8qQxNCF
	+sRClWSNeTtgTspdb/OKebaZ2UqO/RHTJbDQCjeOmJEEdldZ9XUp90o8TQiu4WWmJGBExvasH/D
	qx+yrtmSvkd1yeDmoVxUwvK3YGPn5ZunQvfvcsV05FVboN63/FlcLzgbwE1ZpBheEnKo5JsZmDL
	CPIuLupxPoRCMYeTg6hzsR6k73QeZ5UZaP2OJ61v/suqk8qqhGDEhOFq/h+ylTndQJE2f5iH6Ar
	AMhuQ8EB7Zit+TdigMBuJKSoJSV034BS7/tnbL27qTrts0WzlVexY=
X-Received: by 2002:a05:6808:192a:b0:568:3866:d1c8 with SMTP id 5614622812f47-5683cd1afa7mr1399971b6e.42.1794296671626;
        Mon, 09 Nov 2026 23:44:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:13 -0700
Subject: [PATCH v2 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-10-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234432_614322_D047ED23 
X-CRM114-Status: GOOD (  16.70  )
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0


