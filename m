Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92416606A95F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UzLq8L9/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UG3/wZiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=; b=UzLq8L9/v4dXv8
	fP0uoOD4CfYmmGLzeexpwFRPWqYU8PWb+mtv/kCq9/VJCRaUg67J2FhC4YvDSUMlgs80TmnPj4/aV
	9/r7XewwtNHclKVqgW/eoaJOY9pdeaB8j4ZFzep16T6XT6Rd5CX7wyDS8Wx8OGujTh/sDmr7g9zPa
	1OnrtclMWyfiUFFedk6bzRbmTlh6pFjfe63FJAtkapLkwrStCuyHgfdKkPXtzMoZH754m5wbMQ0Z7
	T4Yp0hgV/nyGZMrEp0zjTFmU3YFrBgHbNW2WqTQ7daQFe7Mlq3gZJT6L1gfhrapYW/YsHMs4Br74c
	bdXkTvg9bmAN4MWYuT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWv-00000002vxa-2vb8;
	Tue, 10 Nov 2026 07:44:33 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWr-00000002vnS-11RB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:30 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-85d363fb73cso941164a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296668; x=1794901468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
        b=UG3/wZiY+ztjHO40+2zDfv4qK5gJNTap0gkuivVulYhpgZStWnn82kCd6fbWOjQZ/r
         HWkbw5qHidWnmTlFkDmg9oDMLzehvbaTbyONTC2AMlNebsnuMQDKKKMkSlEPAXLFcfHN
         3HQ3aW4M9KLFo+/jEfz7QQjlGqgTvRvTS0LoYCOXB+TjiYbgagfibByZQyo1uJjSiVS0
         nI/Kbn0Hr33Ae+isF+U3qDjwm8NL6YRRENgz/oQVW3YU5TgbkJvvfMb72VErIdXAdQvK
         64afrEX68ym6FLVaMwBgX3cpxD6GbK5wqX98mfVRol9C78pV1CcNKLFqucuCDEnWDjut
         srOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296668; x=1794901468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH1D8xUS0Wsmy5FCcW7l9mY0KtwIx90p9dMzy4JwA30=;
        b=QgFv4KQmO60v3ucY1mCd31tailmiIY6zzDWWPdCkaZvr+2f0QhP7Pc74lXAm4s4Ekj
         n3Brtj153a7yjw9wM2tSArV5b5i0lrb7KDytRr4TaUCGB9KVcMnk8/Rr/QN9f79wQEfh
         icFiCVVluI29PEklarTqVLx7W/ZcnlfK5BSOTxgqs3CqQcd9FRdTgIoKP69yv3aQPW1k
         AQo4LbJifJkafblthdPRehva4wNitboXzJfzwhdiKo0sNnN2lU2O3pgeQCQjkMp57Uhl
         ZBPtrwBE1nbJz0KAZf9A7hJq1jt5zJwMKxZZ2oYrSidds9HXj/UE57MCZZSGtebpTHrP
         b13w==
X-Forwarded-Encrypted: i=1; AL+hErHhANIEX39Ggy0/4o2r6YJEPuPTWGN/2oO9o7pW8UOtlCY2fAHlu/MNfsLjQTxFEl7TFizmuB45OGXDQIHqj2YL@lists.infradead.org
X-Gm-Message-State: APuU4Z+uzxwbuTu3jgo4Lx+Abq6tzs+Ln84mKe+U+KxhI3e5xiIy2vGx
	5JaSWNQIVrSMpMBFDXDqeXn5lvmK5ZUFaLUhP7lgKAb12Ewt6qYt7hUF
X-Gm-Gg: AYBFou0kYEHZF0IJB518rasyyC5AvkpVkFEff52lRJ9y8LeNVojDpgpssvCwNopIqk7
	8WhQh3WmCMtx5msEQc7Cg9mV8dbKJiFvpzaeyBN+EKVK3OFM1qUcX9sspyKHAEaBcHDXaOqCZjA
	2yXFIi0XeCoKh977+1N5jGRWYY1EFLfypCx8j836hiW38Nar+heGdcb7eskBbSbx1NaZUyTGh6A
	R9nkMXjq4PYhE7iU/Y9xIKZhSgBcbmNNId2jpLCinnxXq9iqepo6z25KThe3WAEY8b6StVaxeF4
	gaIF+mRLRkr53m47Vj9BRnmqzB8ARXKnNmE2cyJOl4GZq2ZACaajVFAJ8AbBXrxIv8yI9wTowRa
	/70WehtQitPtPIniLFKjO7M1lUf8yGkOakieB9fqQ7hFAax7VVdzfhf06Rhqum5S9BkhrP7kIzZ
	X7op3tich0EKfYLTL+dKsAfBDj4JWt5XW/e8yeMjyYZlH2GYltlwKIGKLiLBd0d3/ne/7xCrxWq
	1ByvfXb6qHxpwrYr5NKPhIjI0QYWjxxWQcKYvuZfOmb43AJVzV+BEMR7C36ZMx8p9WlOenTLKCT
	xe+GBlkR5eKkVN3o5ljhCYvrSGUJOwxepf1E6KUPfuA0MxoylZhLZU2IGGZQJqKhzelDPwF/0n0
	yIiI7G/hhsANmdy/9vdVhDrI3s3JLOE8OrIsPN+LD+3dM6Mzon4IYPutaB3A1kKKB99xc8xLrpJ
	oKb4T7JNqPC3/6bYnqn073Di5Zqsi7DgfmXovhYf+yRwcEWmrTPq3x
X-Received: by 2002:a05:6808:c1f5:b0:4f9:a153:8446 with SMTP id 5614622812f47-5683ccd9f03mr1360370b6e.38.1794296668122;
        Mon, 09 Nov 2026 23:44:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:10 -0700
Subject: [PATCH v2 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-7-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234429_295547_28581EA3 
X-CRM114-Status: GOOD (  20.81  )
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

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Defer nand_cleanup() and chip destruction until the final MTD
or device reference is released. Retain the chip name, flash node and
per-sector user-data lengths along with the NAND metadata.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..57894ce45065 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -405,6 +406,13 @@ static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
 
+static void sunxi_nfc_release(struct nand_controller *controller)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(controller);
+
+	kfree(nfc);
+}
+
 static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
 {
 	struct sunxi_nfc *nfc = dev_id;
@@ -2027,9 +2035,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2052,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2427,6 +2433,13 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.exec_op = sunxi_nfc_exec_op,
 };
 
+static void sunxi_nand_release(struct nand_chip *chip)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(chip);
+
+	kfree(sunxi_nand);
+}
+
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
 	struct sunxi_nand_chip *sunxi_nand;
@@ -2440,8 +2453,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2479,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2490,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2533,32 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_release(nand, sunxi_nand_release);
+	if (ret)
+		goto err_cleanup_nand;
+	mtd->owner = THIS_MODULE;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2639,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, sunxi_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0


