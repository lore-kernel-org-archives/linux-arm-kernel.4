Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADA606A6B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GmeiDLtt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgXZFqLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=; b=GmeiDLtt2uS05A
	9VQr5PgqSPNlGXTeA1N6nqswmv520LLGohLMtLZukkF6iEbO2kEcJXqo15+DvZ2C16O78IaV1GKwP
	WJCbRGWmqtyKvLAyWHuPGaw/As1As0rWZ+mRi3vsF4rO0qRenI2OD7NsECrAs2TsGOGR4L9wGM6BN
	i3wSNPo68puCOC/XXQLLfhSc+UQM4Er6bIOf/LKtnPSf9vjPXLgdcW4xlwtqyi2awmCQVSrEchDu3
	C/+yfvVXMf4hr2Wx9dblfvnUOCywkQ+ciAq4B8vP5f2h/Nh9SKiAd9jflXAbgz9nxSIJUZS5nKgW8
	bcu/URFSppil+CPMDB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZh5-0000000GcDS-2gQI;
	Sat, 21 Nov 2026 01:15:07 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdX-0000000GZaM-2uBu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:44 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4b563403c7eso488083fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223486; x=1795828286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=GgXZFqLwFTbQ4uWt32J2GSGVCJyngPIv23K0jdleo7RMq/8LI8Wvw+KZ3N2/Lb23qr
         wvfdq7DX3r3V4CLk9jQg/TvZExq0NOMssyb9KqxuIfxNYg4R0JhNrlFqHGWLaWz/J7WM
         Juzt3HBD4BAS3Tl3xRPKD4lWorl4i5cARkWKghjIGK3A6OsXDn/va9AXLn7554fBZjbt
         3Z6yRGlW6WudERTp69HY/2LLfjuUJ5s5zCeM4nHy0ReL5M6WTRXXACB0WNs/m9ogttZM
         N5x/yjzbVovSluqqAvZoAxhbniNQICig2R2wS5j4TAv66FH35IyLLhVdY4J4XfUJi2Cy
         EonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223486; x=1795828286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=0alHDajhisDgMRgQAm6TA0hsGSDXnIeV3n7SKfs2qSsUOxzj6GWHxzgoC2jX9j/qn9
         ISIXcXNIiq1O9xaAiYW+hBQpDNkziz7V1qASto0oqUja71PFeppiPgmaUQeVwSiLy5eM
         hg3b084pEYiF9DRMFqNs0r1fsqUBwWaBlHrUif3TUEU2zEAId4p7Uqw5y/hTxSTqlU+O
         310wEGsaiI8B8II5DHKFOLjKVxxEf5oxUfq0oZa9T21547R597xY6cMX5jNYnsBq6Ecn
         U54+5kTZJxiHPdwedi7imUBDyrOUcyZJ7w/JWelsL4RwH22tlWblBQLv8xoeQk7mX8nC
         CGeg==
X-Forwarded-Encrypted: i=1; AL+hErGmFtrq1FrHqTnyH+cce3bYS8rl0QQn+fca//fDnH37SJTrqBogG/tq87IjxLfIYmag7XOFAwpWagMcNsizRIR/@lists.infradead.org
X-Gm-Message-State: APuU4Z/Cj2CBroClcAQMgZGf/6muucMkkVvyCKYWjd57L78iwnVF1lwm
	eKo1MxL6/KRHVvRYUs0Q3JfhhmbJFXlocNZ7WXzvXb25AwbhkfeVjlej
X-Gm-Gg: AYBFou050nOJ3IKd4qX3jvr9xaJ5dUJDxI5vleZY15uAFCRt2rboOdvfmf4dGxaSEsW
	XR0ktXSnPDr9EAKLd9fXEBv5DdaopsR4shPo9C9XzCLYnVfotam9bqeVwTzsGbI9bj7JQyqrD/r
	UlAEN6FAd/H/dbTvswZUACBHItXGRciZjx1ud0fw81h8veTY9mx6/PLsrAf/ueQEXzUouN5oUHQ
	oAqMIEmejs3padhjE4WhJk9QecklEmRBJZhewyxh/4/iR30go8/qIqHvETZFUYpNiMh2//DvIET
	qBD8MhTNlSntMpt2fvKcF2u06mwgSBCRmN2jj5uqqechKvQwdHG0CS/kgAvhOK2fjeKfQF/cqXW
	YD3Fi5b43VtgOmn0PlotfVkBcHWYfNZQcbeXmb4HfAtJeoLn+gp0FPqHUh7w7yzUmKDZUGcobkJ
	crv3chclasKTYMh+lCRETNjMUIJkoQjo3edzQqEF9eqBavPNkkjIWZCF31aqpezqRBzsXj3Evt4
	ff7yKv4YzYVtxhso12URuuFg4H/PogWH9pcf/dExjrPEY8bvE68bPIzXSUTipDuK14ptTAyvIBB
	3R8yaVl0BaEL6zfEOx3JASw/dQqs1e2ijr8AXoHcnQRszhIO10Fnm1Ghm+OIDmLMGpomXF0j9lm
	uZbCw0FN7+L0maARqL/NgHJFnoaZzkAyUSZE93JQyJ3/2+XrQDC88p/ZYVC2p0m9orsCS92IRyP
	tOW84qDFoaMnIgL6TZNtA1t1kooFquQAZJ7Rz8f36OC6aPumRVLQor
X-Received: by 2002:a05:6808:6410:b0:574:16ef:89c6 with SMTP id 5614622812f47-57a0ab2e12amr5993188b6e.35.1795223486363;
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:45 -0700
Subject: [PATCH v11 22/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-22-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171127_790739_4E5EEA5B 
X-CRM114-Status: GOOD (  18.79  )
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

On a controller with several NAND chips, I/O to the first chip can
overlap identification of the next one. The driver registers each MTD
device as soon as it has scanned that chip. Normal I/O holds the
controller mutex, but nand_scan_ident() does not: its RESET and READ ID
operations can change the chip select and timings under the active
transfer. The transfer can also interfere with identification.

Scan all chips before registering the first MTD device. Track which
scanned chips have been registered so that a failure in either phase
cleans up every scanned chip and unregisters only published devices.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 73d6cd89ca19..abea2ab0cc42 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -274,6 +274,7 @@ struct sunxi_nfc_timings {
  * @sels: array of CS lines descriptions
  * @user_data_total: protected user bytes in a programmable layout
  * @user_data_step: maximum bytes assigned to each step, zero for a fixed layout
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -284,6 +285,7 @@ struct sunxi_nand_chip {
 	u32 timing_ctl;
 	u16 user_data_total;
 	u8 user_data_step;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2563,8 +2565,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2644,13 +2648,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2658,6 +2655,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2669,6 +2667,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0


