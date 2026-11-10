Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A68606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9M0HrRj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YwZbRMXn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4GGcNU5e5uIHD896KUGG6qBkwzY4UuTfmj4ZpF6Jokc=; b=l9M0HrRjO4Nv0Mh+xkDXwtSxPw
	sNYKNeDX1iEleVlLWgJI5Mj9DWQDjHOq6GHcgcwZqP/2tPWFaCdq18ra/zwyEzpnIg4aUZkdJSpJS
	iEi0uTQcUzLf35b913pFj8LGjHOW3cAw/xC0lqx0jOQc5RGw9xB73DMubCqEsHZy20Blud1ZhNEyc
	Fv5ZRMPXYr7CKzW07oxMmP5QdqQVVc0iZi1b7s/pSKKyHJcAsH1vGtRnqAJ4p+BSQ+C/iEG2A2lQa
	lYkvHBQxt2Ml0iEVf6rR7y19PNridhHZvqZBj7GqOLsz4irKnvMy2I/JyYAZMrzvrno1yT6lGjLrb
	K7rUXpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfyR-00000002kQy-3pDO;
	Tue, 10 Nov 2026 07:08:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfyQ-00000002kQ6-3GDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:08:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EEFA43472;
	Tue, 10 Nov 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294534;
	b=DckU4pmtAQo4uHypGbKbDRFd0x9El26uDTnW7rhJfDnhsHeCoo6UQ3uC6WG2CvMZwfiL
	 hrVjGzvjhVUVFdsVbFf0SwIiknfueWsCCeYA6B6NCLDAxY2KPy4/zOPlh2RsDM5lUWUf8
	 +vGw0P8wgmBT/tAbJUUofy/YhcGCBqk8kBc4Eh2if6vEXT+EUNt+G7FYSlPYmhZEUU73s
	 t9ZCGtP0LwQM5334ke1VWB/12Ric82F7LWSfoJ8SAM3KPro/KPd8gEaG1VFzhslrIt/fj
	 UXPRwPDdc0DVCPPKnSlAYOZ/dsoUekEsl0r8eO4XHp6Oe7z7icfEY3W9Mc3nt+P1I6w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294534;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4GGcNU5e5uIHD896KUGG6qBkwzY4UuTfmj4ZpF6Jokc=;
	b=p7/5hVlfxekU+luGhnfPuNU6R2RUqvkxY10Gn3yTnN9WzjdYikJSAyOZ7/rgPx6OnIwK
	 nmDGVVjlyiYItW42AbZM99uRIGx877IfTaAt9NjcJbN+2L3jFnAVUO3V1WFjXzylV/xJK
	 d6Yom+QqrdWEPMmKaFwSMC8wmtkY9Wa6qkTSSzOK38YHd4fXTrM7dQy72SasoRl+XHrUh
	 lQt2gX3zUsOiR/fW982SJ+TprlfRXySkYmrVnPUMCnJSCllvuch2rY7264bYBHhdMQYqv
	 LNJXrY5S5tIidZTYZyvdhJtRcaPmnnY0bt6VXurP3TbTibTS6U6GYuVRHMa4ikJQy5g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AC2A1F0089F;
	Tue, 10 Nov 2026 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294534;
	bh=4GGcNU5e5uIHD896KUGG6qBkwzY4UuTfmj4ZpF6Jokc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YwZbRMXngb1885fy75xHZ7gEZRxqJi4GuObApJ6P2blGY0vF8oQuptWckZ0aHWtIW
	 Jsk4PhmZuGSwBI3y9RLE9jP561nV6TGz8R75mKD9OMuClF3YjisHG6p4DWRR1TVdUw
	 jb6mdkHODOaEvcwRwC1FMXweCupc1/EuEvrZtlR3T7E9lkRi6Cveq6mwseJSC79lLB
	 XW3qMJCj40ee0xQubJliv3HWFYA6C8O8xAtH/oUasnfwdMemk8RnStXTv3x77OSFu6
	 IbxbcyFjHOc/Kjnkre33q6w3G2GsDLbGXTPYlp8R/Yfcepf9/97RGfVLQ+CzhdnA4i
	 m5MXaauf+jd/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 88F344890A;
	Tue, 10 Nov 2026 07:08:52 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 01:08:52 -0600
Subject: [PATCH 1/2] usb: musb: sunxi: Unregister the generic PHY after
 dropping its reference
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-musb-sunxi-unbind-v1-1-d821584fc4a4@gmail.com>
References: <20261110-musb-sunxi-unbind-v1-0-d821584fc4a4@gmail.com>
In-Reply-To: <20261110-musb-sunxi-unbind-v1-0-d821584fc4a4@gmail.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: regressions@lists.linux.dev, Zijun Hu <zijun.hu@oss.qualcomm.com>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Rajan Yadav <rajanyadav0307@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294532; l=4698;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=eUHfUOy8mHnS4tm+sNyfT5FtNME+N65p3UiFyU70Ldc=;
 b=93/spdKuFn6nPrVDmAMIQZKoYK4cgQR8a2VXwb5WXdpzGlWQ7Ic5L36HW8mRwYr7mHCUJlTpe
 XWCZLNN04/MDY8OWQbFG6WWtp4QHLUP1IkMGhO0PMTBIbCjSrZC4O2H
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

Unbinding musb-sunxi oopses on v7.4-rc1 (KickPi K5C, Allwinner A133,
KASAN enabled, no out-of-tree modules):

  # echo 5100000.usb > /sys/bus/platform/drivers/musb-sunxi/unbind
  BUG: KASAN: slab-use-after-free in devm_usb_phy_release+0x2c/0x68
  Read of size 8 at addr ffff0000057ef080 by task sh/329
  ...
  Allocated by task 48:
   ...
   devm_kmalloc+0x5c/0x140
   usb_phy_generic_probe+0x30/0x184
   ...
   usb_phy_generic_register+0x9c/0xd8
   sunxi_musb_probe+0x310/0x5c8
  ...
  Freed by task 329:
   ...
   platform_device_unregister+0x24/0x40
   usb_phy_generic_unregister+0x10/0x1c
   sunxi_musb_remove+0x44/0x54
   ...
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
  ...
  pc : devm_usb_phy_release+0x44/0x68

sunxi_musb_remove() unregisters the usb_phy_generic device. That unbinds
its driver, which frees the struct usb_phy_generic holding the struct
usb_phy. The reference that sunxi_musb_probe() took with
devm_usb_get_phy() is only dropped after that, when devres runs, and
usb_put_phy() then reads x->dev->driver->owner from the freed PHY with
dev->driver already NULL. The probe error paths unregister the generic
PHY with the devres reference still held in the same way.

Commit 6ed05c68cbca ("usb: musb: sunxi: Explicitly release USB PHY on
exit") fixed this oops in 2017 by calling devm_usb_put_phy() in
sunxi_musb_exit(). Commit 498dbd9aea20 ("usb: musb: sunxi: Fix
accessing an released usb phy") removed that call again, because
sunxi_musb_exit() also runs when only the musb-hdrc child is unbound,
and the PHY must stay valid for the next bind. That brought the oops
back.

Keep the reference for the lifetime of the glue device, as 498dbd9aea20
intended, and let devres unregister the generic PHY device as well. The
action is added before devm_usb_get_phy(), so devres drops the
reference first, on unbind and on the probe error paths.

Tested on the K5C with v7.4-rc1 and KASAN: unbinding musb-sunxi gives
no KASAN report and no oops, the generic PHY device, musb-hdrc and the
UDC are removed and come back on bind, and 11 unbind/bind cycles stayed
clean. The probe error paths were not exercised, and no USB gadget
traffic was tested (no data connection to a host).

Claude Code (Anthropic) found the cause from the oops, wrote this fix
and the commit message, and helped with the tests; I reviewed the fix
and ran the tests on the board.

Fixes: 498dbd9aea20 ("usb: musb: sunxi: Fix accessing an released usb phy")
Cc: stable@vger.kernel.org
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 drivers/usb/musb/sunxi.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a6bd3e968cc..d880c3758c9 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -674,6 +674,11 @@ static const struct musb_hdrc_config sunxi_musb_hdrc_config_4eps = {
 	.ram_bits	= SUNXI_MUSB_RAM_BITS,
 };
 
+static void sunxi_musb_unregister_usb_phy(void *usb_phy)
+{
+	usb_phy_generic_unregister(usb_phy);
+}
+
 static int sunxi_musb_probe(struct platform_device *pdev)
 {
 	struct musb_hdrc_platform_data	pdata;
@@ -768,11 +773,21 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 		return PTR_ERR(glue->usb_phy);
 	}
 
+	/*
+	 * Registered before devm_usb_get_phy(), so that devres drops the
+	 * reference to the PHY before the PHY device is unregistered.
+	 */
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       sunxi_musb_unregister_usb_phy,
+				       glue->usb_phy);
+	if (ret)
+		return ret;
+
 	glue->xceiv = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(glue->xceiv)) {
 		ret = PTR_ERR(glue->xceiv);
 		dev_err(&pdev->dev, "Error getting usb-phy %d\n", ret);
-		goto err_unregister_usb_phy;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, glue);
@@ -792,23 +807,17 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	if (IS_ERR(glue->musb_pdev)) {
 		ret = PTR_ERR(glue->musb_pdev);
 		dev_err(&pdev->dev, "Error registering musb dev: %d\n", ret);
-		goto err_unregister_usb_phy;
+		return ret;
 	}
 
 	return 0;
-
-err_unregister_usb_phy:
-	usb_phy_generic_unregister(glue->usb_phy);
-	return ret;
 }
 
 static void sunxi_musb_remove(struct platform_device *pdev)
 {
 	struct sunxi_glue *glue = platform_get_drvdata(pdev);
-	struct platform_device *usb_phy = glue->usb_phy;
 
 	platform_device_unregister(glue->musb_pdev);
-	usb_phy_generic_unregister(usb_phy);
 }
 
 static const struct sunxi_musb_cfg sun4i_a10_musb_cfg = {

-- 
2.34.1



