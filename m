Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0417606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dKDlwGJ6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuU0Pfqd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=; b=dKDlwGJ6tiTaYe
	7Mr4k+cz6Cq+aPcXJg/4Io5mt9XFFhyO4uBBC8q99Q2vc31brKFqi+QVJx2TnW7qMLLHd2G4VvVGZ
	ypygv+hU9UmQ8V6WlT+bPHmeUDzq41tvnBqKG+iIyyaTpYZ6m0A85BmmT/MwAf2OOX1mnHzqlB6kj
	Gvvk27CkS9matABCwxSrFPM8t6ZoBtkd+PC495imjQD7jaSlMm14LrXRyd7DE7Q/hByIZvFt2FJWf
	RSmmstfOnzLu7wEvOQMpps2fmveGql4oOmkWkxPOlMAbDK+gAC/qjPSHVvdVYeytuP/9bbTHC8WnW
	FK7CtXtMmJQQD0pRY2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqJg-00000001JQR-0vDW;
	Mon, 16 Nov 2026 06:35:48 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqJd-00000001JPc-12DA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:35:46 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-5722bc8ddc5so362676b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810944; x=1795415744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=DuU0PfqdKWq7WzxiOTahwtLkw1v/vmQdLdTkS+OL/jrQ7AuZ4foukgR5ZVLei8v3rH
         eZTYtvQyNFGmpk6Nu2XbPfhwLuDOL2A/+aXIJfqHy5AgNQEHI/IoaUX6FaSMY6GkCJ33
         EQcL0n8XG83GcDdIOIudQ+Ml6gupV/cddO0HdSw4LxGpw6WRpHkPbyCzONZPC9X+2Lu8
         /TBE0iCgJnLDqY3ExxuehhWgrO5QRWGcEG3/mjzCJaHUwauco2lNq6Q/Hu7RSXJBVtoO
         9xZlynDcgnlGh5Rc3LMOLLobJsOjzGQw4tAClfmkQzOhYS2Su4RrBmHQi0KeNdNcU25b
         6oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810944; x=1795415744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=VJxWAd7oynPlTo9rhU4pZVI8VsMk74KRqnrq6c0SxRcR5WT20oGJM++t20gflucZh4
         nf6dvXlAWe2d7ZRYFrfn6YIkyw9lfFifURI2OYzgbwjPi32e/YgfnxrJpIvoY0ZdvsiE
         izjjC7xXxJz0WsWkygXZyS6cJUAAIb+SVPt35FjWN2Ei3LofoM0nJiFB4qifNg3GWX9Q
         rNi4ALynzyQCbE06HgRY5f/POCI9uqzUu4gmCiBPzPnuZywwfIRU0b7Po4WpVVDwCVVi
         4nt+AbryXZid9opHBaprqOlsZKFrYLc6nrRz1TGhPrmf63aZNSJoDTRRB8DB3/R+rhi8
         AKOA==
X-Forwarded-Encrypted: i=1; AL+hErG1FmD4ibG0BHP8qzg54FtapOCEQcQnuNzH578Yd41QOT5jI78iT+GCAVwK6jQV1SpsV5tDRGwnywqklwCS6rRC@lists.infradead.org
X-Gm-Message-State: APuU4Z8qf84EnE9hKgpWLRhT2PaX3p9IbH/JHRipPQKBxOx5OiBfvIca
	JnegldFmsZNehFElTMBnFDKndlXmo+5uIFxop5VQcE8GD6Akc41cpZPIMc1F8iIK
X-Gm-Gg: AYBFou0Cic5CMKwaoCQz9PBpnrIzCUy1tfeTG0aro+V9lGVf/ltUH8quIbOp5vnLZne
	rV6PuR2QIEaxIaE3zX6fihROI2PZXeNZwLUUdwPSVGpNOx/0N9RGXEit7YSZN0vvyOcJ8cgGyBv
	02lmvvA/J6dGBYWkjIe2IKYooY4DoqNdiy8waxH0BYA07GLik7bGTfJ0lz5zMML1hZkfcShteIB
	zzLHHtr59K2Qdb2ccdgW5cN5YbSYwvxlfIeZC4bZNwo16xwj0fjcBsYwClLgavXxjGGIeLSJSti
	9Zat4dzsiY63eK92zqrknQZFUeUhkEvON97P/sG3uwQNx5GnhWA1igZ7aYuCecavxvjWs6LmcjP
	QH92Jz0vxUAopKYW/DnBMi5tlLW6qMY+zaoSLdgDI2Wz6CUxBMhrQSaqjB4+tH+Yi80tmtxaTAM
	S3hDsFCXiMPodm5n/NG3osN/1hCX2oiIcfeb79ODKIaB6ta0s00EtWwIh5xNAMG9YFyiOlZ4Zpp
	JZ8nuOlJxFc6Fp5wyaTCPXpqd0HWJwPSd2UfCXxAaKKjCocJkxEujIRoJ91QburL/EW5Pu0gjOX
	0jHPMoUrovQI8JguFYcYKlgE7BenSZLhRfMFDVRXXl1YLL8GPN1jKGjWBLXJdgrBEblVcO6OHTG
	DWkkmANk1VhLtH6xFvH3XtKIax9GhYOFwX/jWX6SLGd/Z43wmmG/wW/oLABzxOBPZr+qXN5542/
	XWROWhBg4KWL1HerUCEGiIjxbpZqQQnKxK+0KXN7w4LTi75OdSxIw=
X-Received: by 2002:a05:6820:1c91:b0:71a:e9eb:6ba8 with SMTP id 006d021491bc7-71ae9eb6f4fmr2091389eaf.45.1794810621709;
        Sun, 15 Nov 2026 22:30:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:44 -0700
Subject: [PATCH v5 29/58] mtd: rawnand: ma35d1: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-29-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223545_299482_9EEA1539 
X-CRM114-Status: GOOD (  15.45  )
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


