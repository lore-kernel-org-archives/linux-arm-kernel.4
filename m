Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653D606D29E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OwwCkYU6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gb1EAiKn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgx/iC6r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=; b=OwwCkYU6tj6xU6
	8annN0igceEZQgSHB/rfu2WcuXF4Fgl0Qa2xBmnjbkrhBcLwRHY6e8uO1JCddM54BtHOnAT5wbYhT
	zwQqTz5ucTZJdPJUTt5tCbQqNo+sIcm05SuCMnh7HAXEUDBm/OGEvLxIUD80hHavQ8EqqSGZtF9yD
	KLJ2Hg48buHOHFZ+XGpAdKpswJfx3TIms36NR4WvsdzL3kfNLcoxsQhy432g6WmiBC+ayWdH0HZDC
	vMcR26ajDPlyRkwZfiPKZb3Q2PyHPMz7tQzMJsXfEdjCy1QTk6X+fshsInQbrz6cDl2Df/sexoRZ3
	dwxSiXnlmjIv9D84AXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXS-00000002x6H-3Jk9;
	Tue, 10 Nov 2026 07:45:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXJ-00000002wiv-20v2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=; b=gb1EAiKnf1qVfjanlaNwaoYg7x
	HCK0LTcOWBPpWkW/J2XxyQ3Tt4GZxCfkjhlld6aOzkL7JkJryh477SNUQykeEas5lcyaCaMBgTHSg
	iUoX+8VylaHQ+OMFiqErl8SzqvfLKUuB3BwPmkkakOvCtjHOtbCVz2NLYqT8kLb4IdYi8AGoGr02t
	R/BjhF+Xv+PoStXwTbIPzNLHBf4uxidj4vp9/EI5vivycWUdCF2w0UqkGJKsTKszZn66873ekckig
	3zYIYCc2V3QJU7Ac1MIyMG91vIMdrBX39MJ0MEVqDmMP5WpwLb17p0xO00WR2Mz8KUcrWFIr5JGus
	j5sOKVZA==;
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX3-00000007dz1-0N3d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:52 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so646809fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296679; x=1794901479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=Mgx/iC6r6SHxT/0mxjOSGDS57RZ8N6Nl2F8ALS+Jo4k43Ph4nISKKkXsJGUtomcmAl
         xUL8SX+vhRZ6ZejjmdR/LQ01tI6VpINczd++7kD9GsuWzI+VQDTwppWmoVBbrBiLCuDH
         Z/3eZx0lzcYsOEXZiRZ2mnV3hA/ZBsPY6RGnFybNFy9l7/L8Bjy0INge9ktfUtakWFeo
         Hi2+a8dW0lCCM9IX7Oi94AG1gGiYdp50YHaHK2FRXlf3qBfp/CpnFmyeodYfaST6W/V/
         cVSe0lOhBVS7+O13OmDpddy//L5Pz3d3Inm9K03tX+jnAh/XV1Xx7qHBg/0Fgn2bQRC7
         TShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296679; x=1794901479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=Zum3ifQU1K2fbSIvrqq6KJNtGbQeSVFQV6MPKApvbwuDB3+LlyqtRWuH0fL923tYdZ
         WEAX4OPuHExy7wGwUOuyYEC7PBgflbe0qooYN8pOnFNI509onHc89A+L0njuiUg7O6I8
         nOgvEdPE3CGZ2InCLE2Y4sKdcL4cVoC/6pMVZQCKH+UA4drE8333EzXrNewThi9qynL7
         zlVqDpm3Kf6xk9XPWspCS/FyOI6UeLC9OkEm1BUhsLrZ/28ZKQ5XLZk+PgcnhbMzWS4E
         J6p/lldlaGBMl8D9ARSMbeWQiHaKOwF0LKMVtHIgJ1GhI5iOYmWNs0TD5ox4kleJ2vL2
         6s8Q==
X-Forwarded-Encrypted: i=1; AL+hErEJyAt9sbDRBtpLPPBbv9RuXjLbkWN0TL3G/hcZ/rsLNJ/FD3An1QwAXpKTcAqtXWpCEn4zbungrYyf6EMC0n5Z@lists.infradead.org
X-Gm-Message-State: APuU4Z8jZUzxSl/53D+nTagqIrnf9l/++Dz3euCQSIRmMQId+5RAKR5v
	6f85WZdiw3OqFN8Um+KOVumsovlCVAz1n8mBKOqWluexDoBxOe6op18g
X-Gm-Gg: AYBFou3Qwa4aDDXTHv88klF6xP0HdGIsOlPIPiJxqHXWRCUiYF5tyKTl3+jk91GtB8+
	H5XOu5FC0gbbwJe82kx7eh7tURkKWue69+izFxzO/O+n5gPDQebQoac0G+YtppEc8crc9ublD9o
	Cez7SIeDl788v/vSEuyoecJhwTG1NucY5Ypmg6i3Yi/q5flxW/CatoxaXpgvgXxaKuDt10q6mwl
	9HLqzoMXejfZDAHfPo85TGq1vrJl9fHcvyveNIM4HXW19900RiNtRZlwYGc0+WCg+IejP6pPSwa
	daaV2EeStABbKA1gpHg/w0dqSnmlw2HljSUpaOZLlGyqHXCDm8d/KDfrvN0PDI/6kfL8GkakEci
	ajyc5uGZyCevIoeCpVQQ2pxDyDvzNIKwJWeDva1OqUo1GImSMMMVLE82Zr07E3pRYnqoQqEtdyS
	UiqrJF4azwjxbEhRrYhj3gOP4jxeXFwPtHZDBQsh3zjVvXq/qYftJHZhS3Se6YlqvBQruK2N6/q
	6obER5p2IbqJEHKJNFS7fMBLcABpmRD4UcL9h3QhRPjBG4xVnKkec8ZqoTpw/CDiCavh04jm6S2
	GmAR4DapumvoGJF1/iZ/R3zk08R4opN5tnpXcSyd73cT3f+4lNKVQqlxmyWROdQ5fHMfoD1CpEc
	14wWQSeanz4fKg121S7em5WjAyxsrRwlwSl/OYgHzctNz2EuXJ+EO6QuPx+9PgYPKan9L2sfaqb
	+QM3SHIiL27/gzAkHOqC9Fkk9DYdXwhw0LXvR3KUywZUQmFfLoEImK/AA2jzuZqNcEhNKGSTFo
X-Received: by 2002:a05:6808:c1f4:b0:54e:31cd:dcd2 with SMTP id 5614622812f47-5683cd3d902mr1873142b6e.44.1794296678725;
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:19 -0700
Subject: [PATCH v2 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-16-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074442_162552_E220B65D 
X-CRM114-Status: GOOD (  17.63  )
X-Spam-Score: 0.1 (/)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


