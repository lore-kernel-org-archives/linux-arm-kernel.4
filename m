Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623B60A383F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eMou47Te;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OPtfYLyh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JxroZQuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=; b=eMou47TezVJlsT
	aVLi5durXb1CGpmVphh6ivR4y447MQf0IihipwtRt7/2VcI5W0pBNEPCVzE8kiVj5fYEJti0FvGqW
	ID0ynMeS4fqDH8BDWnL5kG4P3778BdKiZAMCB076/jftkPNiLVY9ay3EEggYP1Srpkdwi9fCwRB1k
	3g8AXRYC/CRibFgZIY9dfMYs7Day/bLn1qAFFl0ascpvXwLCFUlru5OSiBM1XRZ92/qJagJrsUqg7
	C+M4rhnYWdjaXGtXI2RaRIhwXfeKzLAWw/NLofoK3J1kYEGTx7ZoPfmYqhDcQiSaNnIbCVPom8n9a
	VJh9tF3BZwFttb5i8zMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvox-0000000Ds6z-1OEV;
	Fri, 13 Nov 2026 18:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvod-0000000DrTR-1I3y
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=; b=OPtfYLyhL80lmeg0jJE1QsHnnS
	iPuR338zwGs4OVAyOlLQSvJCP3hJkBAlhOq0xNfArtlekT5cAjfFfce8YIGwXetFC4qyqiX07Ip2h
	NOSBZKajhcHO11DTlwnKA0mhlITqBlIfBdNuc/SDlwar3nQ5BQGiQHnLPrAeSvLvI3tAOV2Jw0Ef1
	rouOdykAtFnylJhNixckTLKYqmTODq/6FKaNQfxrRCI3waK4EEEn0plt9PST1v9R6OLEgUw1ZaREm
	s4IdVOCZPvr2soiupXEdVDurVEkh/dYUyUy9Ni/ZRdkpRD6LF5p4Hbb95qQ4rjjmd2UiE8LnNZZO8
	hm1lB4WA==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoa-0000000Bdnj-2TzM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:58 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-7143451981fso1711094eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593754; x=1795198554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=JxroZQuVYmhdqz6DpEtQrx2fFwma0m8IpdbxXMNtNTuF7Ey+Y+u1wUM3MX3V9icNFY
         ZgQpF/Orz02PinoKNXV5VOwJ2XzxOYAuGH56E8C92jGVOgtH/KiVNUYifnrx7TPDmAph
         Jwep48Uu38GNf/CN+WvdX7NVRF55PhqPnW/dsTvYrHn05qZoq61aCK/0CRviYvmy63Uf
         TZG8bSKYRSVY0Acx4yxU6V7a0/LzemRed2gg2q+gdZC9GXi8Ff+197nVpuvFoLNPaEUo
         qmTt7/2Wd7/ObGS9nT/m1uf8xCesZvKIW9/ix+y1SJb4SWNcrbLws2iIKzDWfrOprJpf
         y2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593754; x=1795198554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=uqAHH13xmQvTP2LmMOnkUt8ZyP1N3CqXd3NaocpzO65gFuOWh8hPtKNcB4FpJxWr41
         G9pSEvdliHcLFvNJNba0PwZp6CQ582i6gQcaUQ3fwVkuq2D8S6JvmIMKP3K2hd4zuswO
         rm2zXH8Ye6cK0GswaXlnuWz+mJ6vNEDc7l47fOvxffkQ/zefbMDKeGonalVUxVADoyBz
         vfFTFWLAVDE1Gb3WQxjz3PbeM9ITtChGyKPC+l/0YdK22j0eQr7gaxOLuiu+WWIXCw8o
         wqVT622DqmE1X7xzaklHHO+julbwIW4qIhIpQoElKs4d11agQyddh/09FOO8fHpwV3vv
         Pctg==
X-Forwarded-Encrypted: i=1; AL+hErFtIk+wm14AO+fzVKXrJz32tSpCxgTb35vhqDDf8wjCh9DgEP0RwTUuDMKsIiR4acPyefDczNnnSr2dlEdRCVmU@lists.infradead.org
X-Gm-Message-State: APuU4Z9o0BZq1eqsdWthg0UKYky4z6d+0YNAQnRz/h944pvxU0nbbr2A
	agtNGfc2VbN1LLlFiFlsRK7PeGmc3go83GBvj5QGeQssqchYqE+TaRdq
X-Gm-Gg: AYBFou2hp5fwkKkoduVu8yb5T1JsI2jpDCDBV1DuHplgyZEMRZQygXxm7wx1YwnnyQY
	LwmeHfnDvS0v6VfKn7ctmaPYf2xHpT6/diYTqt6xGfIEdQk/p53wdg2EEFWTFj/E+DLaZW2VRjn
	wR0tzxWL2xPgNKqj+Wu4N7n2Y/rrGmI9OCNlmc4AYHwqGw0KO8lYcf6elUAXbsaY73qTtg+tNLN
	J71UuaC7W1MHglyhZHzxzUJhywpYDLtyVjh8+p2C38Dui0gyeE9wjRSiYRm5D9krHfYK786OTbh
	47JPKT89ZNN9TIHKPh2B1rvWCEa+Xpfe4Ecq+1QQ6Lg8wJ2z4pCFDYFTTksfs+p179l0QQXY/cK
	0dGssg6QGISWQ1/X7AkZ4q8uMkp0h/VHcG8E5tUUg1WmjLyGkosXnk7tMDkItrbgmm8paRIjKUK
	orYp41AD9fA9t9YidBVd3KeRxzyu3I15NOAMRLVPyStJdPhzfHWLUvCDiOhoC+aoZwWLUaBLXQr
	7M6mSX1Rineif785E7MfiMx2+bde4RiRWFOmm63AkKTlFbft2bKItjLCmbEkfAGlzZbL0pN8qME
	/Llv+6JxtaXPZxQ1nHnwYF32KhFWpS3bmixcZb6DUfESLh9O0h/GsL/36RxvKO7dDJu4u4U4vPj
	m5uoOIJ9S33BuB5gYLUUi/fsYnK+KaJwzhyU/e2C/qP5DUafO8oBdeLr3DOnBwTdl5VjoOB7NH2
	PaLOt7XMZkSGHc7QxuyQAiS0O/aQcT3fDZGq8sEU5Sh0AyS2e8pyY=
X-Received: by 2002:a05:6820:1517:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-71ab4cd94a9mr2120429eaf.2.1794593754457;
        Fri, 13 Nov 2026 10:15:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:45 -0700
Subject: [PATCH v4 29/58] mtd: rawnand: ma35d1: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-29-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181556_721311_AE71DF09 
X-CRM114-Status: GOOD (  16.47  )
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

Unlink each chip before dropping its initial lifetime reference.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 23db2f4fefbb..9d89263ac09c 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -866,8 +866,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +875,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -899,23 +900,33 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	nand_set_controller_data(chip, nand);
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, container_of(chip, struct ma35_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +939,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -953,11 +965,13 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, nand);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0


