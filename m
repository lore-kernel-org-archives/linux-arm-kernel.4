Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A016075541
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Un1b04Qi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=g+y4v08/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05QXegOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=; b=Un1b04QiiKL04I
	ENKqcC7JfZnsTtJ0IVmXhf/RTnIuMBryPTyEadB7j/3rgjUYFFKPYEvlpTHK9NNM2lOFb0T4crsXQ
	zTkJRGng84X2d18bEJQ/PM4M19kvLNCQo8V7MhYpCFf7QBwNASNBpc86XPOxvJACXEm0c0FGLlAQg
	85VqJVp1LdVhUOCEiLmxl2+6yWn+yGIYjtj4/C6/FWZNwUccdUkxYx118S/DgJzCbpJdJ9NQZxF5q
	jSkEnfj4SLhzUA0VTD8lZhkkZALk4/GTbNIWwg76zvaP5xXxgpZrFHc6mDo2gqTUyxeYnUeyYvT1Y
	1z/gjFicgq3vqJ25sJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXU-00000002xBw-3x4q;
	Tue, 10 Nov 2026 07:45:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXM-00000002wqh-1fRL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=; b=g+y4v08/QJnPhuEcbKVAfeUevW
	0V/9qW5xhCmp77fNxlHDFqM7KIU9NegSHj2ntxy2F4F2iuQnw5xYAlMQfKHzwOIhqenpTn0btOgz1
	G4pfnJLqurGjTYbwsy7xVShHl6nAzAG030/1DaJqYOh0PzRpwHQhDpCJGHN7fx72W1KcZgDS6U2SO
	0kkCB5Frj82Pcnd2RJkjfhDoOp91QZ0QT5GGmMr3423sxi295UoF3Jeu7XZAM/SWTp0MohGUX3/W/
	o/MSdpW4AmbwhwU2EKCrFhcSS67AAAfAyZONURn0VI82QiHUA/vl2jm0+lVpLbckb39h28gq88NVQ
	W89pRwPw==;
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXH-00000009GDR-2cQG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:58 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-51f2e9e6987so1035598b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296692; x=1794901492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=;
        b=05QXegOFnCgoHvvnpjBki7mwyd1bb9fwsv8QEVPqo59mPxGuxOyCErEDcussV8XXPW
         nhx1fRxpmTrlwYJlgjLSRyZCcNytvrIUiASnjjIscDw8P5dND9Aek7aQwiFOvMhS7wN6
         rf+9TeaOCz8RMSERhjKeN+FRRW/KzTcd0wuclKOG79cs5Mp5bp6NPWzAkg6r+lx54g0C
         wvk93wgM7x8bZMvgCMzYd0104OMpSMBjH5HuJd2yLHXxvvsD4O5uL+2c7ZDEt+2dfbbI
         yXm1VMvMfh162wLab9T4pNlEAntnVgNxrkiq/1m9oj2lsWOeYHVmHqD6rOYj2EEIX9Sq
         iM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296692; x=1794901492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnh3TknHRyJjUfEzBIn85QSgOvZKi43Q3OPNIGPlc2g=;
        b=XF50KNREFNEiiK5p6hHHgQC6At9IQghPnihpPSDcPiHLfQobZPRLQcax2bWq/xZRB7
         xl4l/oZSDp3zTpvLA4/JHSr1ZBK8JfAxX1w0XFpKH73yKAa0F8tElf+DbDkAYDoaEyZV
         AU1TriNZOGvlTK1odGskqUQx3bijMzQFPrQEiW7rt0C+2R/6T9y4xC7+gzyVkfOmYFs+
         suYNVDbnY0hfX7nZ8FUrYS++ZfvFfxkToYznEDInq/Np2wBbqPjnuBaTLeZWylvzFaFA
         hYnjAImbrITVhrPiT9zSGb6cUOWvPyUugTlRUfsChcPjYAPMCmoSTIFsBR60iFNsxzOb
         MFrA==
X-Forwarded-Encrypted: i=1; AL+hErFXW0YLeZdivgcNMRYtUwXQTMqJBvTlvFNpNLrkbfQDShXEYvsJ96ocNEuhqeN5blFm1/8S5bvD+2WEBawYzeLS@lists.infradead.org
X-Gm-Message-State: APuU4Z8UhMdDqEtRVnW1JplpZ6dne/4LXOtOeBYehFcspB+UwV/smf9l
	YCqCfqjGxsUP8JqKDIb+jzNWqq5p3oKVspm4s70IpwpREP+6Nq7xwSrV
X-Gm-Gg: AYBFou1Tc4v2VomAyA1P4PzitTS7nWsQADMR+LiENC5Y65UlJ6PVGvKjtnsQkBUR0uq
	Cc0CS+mhAPIU5RJzXqSLfCiv1fgJWeptLwg9ndJPcSXmGaX+mRzfcRaJ80VAV7dJMhMd1gyQqtW
	X1f7ADgRX75Cn8F/JIsXfmd3lpiJDo8arOgVMugi2tZWT78yWjMq3urvWjAUbWIlUXv+Vnl+DYR
	KtB86GCHE9R01vz9miHoRf7/SR+PyUS4ACrf1s0sa5+21ne/OyxY82JrOrZWTI2pIJfhFlAOsYf
	djWfxA2wKeW/6tONJpbzuH0k5ezb9DBRzaCm9wk4tQxdI22xYxqKJxRWb65/s3nVgUxUPC4iZdz
	5HOPg8CfxxNAQdQpmsLcQEr7tO+HoNrDd2M0MCCbcaz2kLfLZiPiSOxwCLUBpr6nvcQybnFnae5
	4Jj66eyKEHwBmkg6Z5wgIWW3b7O58Kk8KJ8rGBEDBYTh8GypE/6D9u8OJk3uSiZSoxcp+Cvbx/q
	TxynWhwT0uSAaQ0zhNYPOUhTCxYrKuWDUjxtI2o2nH8ZbywIWrV/CTdtpBPPGfoMHpPmK3h+uxC
	SGauaGT/tFGGZByeq1uIa+/eas6szbYcm5YWtld4QkiAoCQKBFM9luN8Ai1tqPL7sx1ScH6riMa
	8AIDwK+EJx6xryHzcGVwxXIq2y80TVQTQ+AwEd036yZE+j+qVaRYP8MyaGIBtEH9OEukDIRihUz
	rROgOsLP5f0xFHVQrNxSLkoC2BhCbLwGV4oGkufvp0LKsB6v9oCdY=
X-Received: by 2002:a05:6808:148e:b0:4e7:f052:460c with SMTP id 5614622812f47-5687294b517mr772256b6e.23.1794296692485;
        Mon, 09 Nov 2026 23:44:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:32 -0700
Subject: [PATCH v2 29/58] mtd: rawnand: ma35d1: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-29-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074455_702617_B7965E98 
X-CRM114-Status: GOOD (  15.74  )
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

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 44 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index f659d3a6b9ef..90bdf2635a44 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -849,6 +849,11 @@ static const struct nand_controller_ops ma35_nfc_ops = {
 	.exec_op = ma35_nfc_exec_op,
 };
 
+static void ma35_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct ma35_nand_chip, chip));
+}
+
 static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 			       struct device_node *np)
 {
@@ -866,8 +871,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +880,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
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
@@ -905,17 +911,27 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ma35_nand_chip_release);
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
@@ -928,8 +944,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -948,16 +965,23 @@ static int ma35_nand_chips_init(struct device *dev, struct ma35_nand_info *nand)
 	return 0;
 }
 
+static void ma35_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ma35_nand_info, controller));
+}
+
 static int ma35_nand_probe(struct platform_device *pdev)
 {
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, ma35_nand_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0


