Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76446606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqcUidjr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RvI/9aBW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlCTqxCE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=; b=hqcUidjrpl5PYs
	qJ/eXWk1Ux26g+OU2H1T4WfTtzK6RLd2fxIlzAJZIEKVDFsYSiSrdc4THViC2KKe1qUaCUSjPw4R5
	bUB+kHPWb5sC1KLKOOX4TiOJf9kSN6XpFasZIrAeLnoBHReuK/354MXM+balAA/89J+Nm1gQbajY3
	XX/9VyN8fEYUsa1bQ7CvjwWTPXxNGQphM+RQhwhxueW+9ixR9q56mCOIQbzbqJflTopoeh/IohGw7
	trPMZ3ytlIKiSNBgSIHLpCU4Wqv/5+LdGRWVwPcgAIEUeWOznCCFKZWmu8bBrlaLz0tnfwuEMiHyy
	kLfuKna05BsVtsdgTliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYH-00000002yJZ-3Ucf;
	Tue, 10 Nov 2026 07:45:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXa-00000002xLo-066W
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=; b=RvI/9aBWXvjdLRrqipwNAiohTc
	zLhLXRB3C42EmLGlND2zJ6GgVvnePQ2wws+DFoytLW8t8gr16PMMBSVgXebl8KmsLa0h6F6t88LIa
	zzkPClLtJORx9Gy5N6L+Ah7l6/ruOPU7KnnKkYeBn1+O8LNKrDlAnnxUgIXqj/I70SV3uWbqbuLsX
	vcgaIIPqxCXPeOWZvGaeKQrj8UvGmJX+dBUtJ2/1pRu1aFz1rBQOs+SCt1h9tFfnETjx8CHMjLlNb
	4faevE/AmBvremc4V/To+AM9YStt1SQFNnyFX93gKYegP6HVxn1lyhwAz0om+L3+w0EF4F2sMCvm0
	APXm7ayA==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXS-00000007e5t-05ZK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:11 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-82380b0f55dso791635a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296702; x=1794901502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=dlCTqxCEYlb95IUNKsnrjB27kEyVqj7CnSMBefJJtqNOKex8QqDMy7dDxVA/2mxlVV
         rXQjg3eccDUGYbitNoVZe5rnFjxg4F5JfdXixT2zbgyeInrMA0oWk9hZuuJDLmidEXU9
         OqLLq/eaFin0k35aXf0JD7jwyaXFRGVJquZd6czQLPm6XOv+I0KFFkGd2TQ+E+htb/c9
         9RVuiPGOJt/SEAZZrItpvFJZxAl9khiZpG2LvhAoGjQ9ct2pGIymF9grEJHB3nrwoFlF
         7C7HRMUIHCVlztPxbyLazCjpy6+n6sv/AZWqJEsLeMANL0K9zP7vwfsaoBw1VjjYHriY
         hzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296702; x=1794901502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6d55RypgZfTuo6Z+ldZnGqGbPs96Ff+heKOjw0B6/Y=;
        b=u97zBrqiIqejLI7snEOaudZIK3Fqgp452wjfTeqLJ+PrAGpI44rP8e8SC3o6JJPlgt
         MQuv/xPQL5mc5Ek5AT3Ko/Gq6q/OwBiTlXtj5tZiojMwZH14h9PH/1ECezvNlO2oBgKT
         HVSNSHqQh0mYstdCgGZbkit77RnABIb8wfk9moRlYlnPE0IBx39GQlhMAFv8yf+KxYSW
         d5OZkFEzF8M4LVW14OIKmMjWWZF5owXUVJ8CdWMiSeRA457/QCgw+C1QYsNIYzJJ07up
         zBsG105xGRcRuEMErXuBm9+YkL5qMqtNCVBymizm/NmVvMsf+p75RPRSxvgPdBcYDO5z
         2qGQ==
X-Forwarded-Encrypted: i=1; AL+hErEkQLez6zs3I/1iLFN8p1SI8JFZJO3i+RaaUHcMhB9IX3ESy6mWlN+hSehGs9ejjLMmrybpRwjbpnwTXr9eh8Qa@lists.infradead.org
X-Gm-Message-State: APuU4Z/EB/AyMH9uT5Ni2QfHVXBXq36xfwgyvSiLYYx69j2Vubsb863c
	tPaZxo/5vZqQMH+LpP8Dp5Be/BEKyNBAt+uEyLlj0G9fe0FylYqAvpV+
X-Gm-Gg: AYBFou33SzHtQ4D8l5RTJFga5tNDOMk1Iw5f1+map1Lf9IZxJrQksLPp51EqHgsVAAn
	QPC0RLa/NXD1qcpERYgtnzq3FAXrHpgVdcEyW0mXqprULr9RtsmikPDvEegZRQ5TRQOhpuAK2xq
	B8w2sO1tBZm1Xpgd4s3Z4xlDgugr2GUxcubwTmYx2UWdd2NzJJ6UD0094xv+TOBZZhjK8/6mqNH
	DDuk91LJFzcxMhDifpEL2yFjpC4ZvAIoOHCJDjgdQGTYPeB84OlbIuUq+u9oHcmt+B8zg/aYpl3
	IMPBnrcisWqdwp5AHReM8Nwbmw0TfuivmR1E2T9aW1hB6jLoJUz3OKE2uYSNVtpK1p166Ln3O26
	iCcbyeXuYlCNlUTntLa6U/8QxN7v+U7AAPMYjLu+/0fiV2zW9Uk3W/PjlJHdzK7vaJAxKIIHjc8
	ePTgOd3msXnDFFFekfgfzhXcOvsFbmWIplV34nA6OrsMs3mhHVSCBUjce0Vbez/BozCXcJjWBWx
	j1v6muwhMjyDR/oBJKN7+1GdKZqw0kzA6gvhA0SsjWFdgQ2wc73dqzwZMoX+EACKmyvtyvKSNQH
	6QlQsPFFzETC8idGsOsJqtBTkoBGAu7uq6/1FtCEAJdVGwKhphZ7r4yAmnUgDy+P03LvTL6/p5F
	NWhSFG/IS9U/d+feYGlqA0gHOfvzfZ0Xk+NFSy6oAo//iLn7UlTlS2EvLZt4pA/LF2X/Q3LvZlI
	9FSY4WXpfeHgcs6Afjz1Xepf9qnhNEttvrp/EmiapuMnBZo6tUPCM=
X-Received: by 2002:a05:6808:c232:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-5683cbbd185mr1424922b6e.68.1794296701713;
        Mon, 09 Nov 2026 23:45:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:40 -0700
Subject: [PATCH v2 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-37-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074509_809085_1A8B1959 
X-CRM114-Status: GOOD (  18.66  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

The deferred detach callback only frees heap-allocated transfer buffers.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..4f33ea7a1b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1381,6 +1381,11 @@ static const struct nand_controller_ops meson_nand_controller_ops = {
 	.exec_op = meson_nfc_exec_op,
 };
 
+static void meson_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(to_meson_nand(nand));
+}
+
 static int
 meson_nfc_nand_chip_init(struct device *dev,
 			 struct meson_nfc *nfc, struct device_node *np)
@@ -1398,8 +1403,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1414,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1434,14 +1439,16 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1456,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1464,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_release(nand, meson_nfc_nand_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1501,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1544,21 +1560,28 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static void meson_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct meson_nfc, controller));
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, meson_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0


