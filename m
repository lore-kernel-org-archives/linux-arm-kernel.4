Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEAB606A880
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CaSwUW/G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mWbiokyI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dE7lJf5c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=CaSwUW/GxtavFV
	b9ZzSTIyamdiI3jUpObatp7Yh3H9GZRS+1ICYFLjBX7u6JGam7GJY4MaKLqwHESiJazzpcoMI2qSB
	Jf/E+0/7wMQ34OL5Lyrl+nSS3bLOCuuNqc9Z4h6h9kwwtiBN/UoHz1syP+lbnJGjEIJUmDWqyoRbo
	IGsQfkg2B7YgIjyzGHmglg6v2dgzMr1oN4KdWFoQYz+SjpbxeTE8WZQpn0901ZsH6IHa6ImvyKhjt
	4RIpDzSb98nYXdNvdyP8f8dsUB5h7B7SvIT3W7XBwmCiy0L8Ea3JJFOrX/7QfIoe4rH5tpVxmj0yD
	gcnqjFE1WwX1/jMS3IlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd9-00000008MnP-0Yjw;
	Thu, 12 Nov 2026 01:29:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJci-00000008M9J-2NLO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=mWbiokyIHGDGCKvgmj0YjIxaOq
	rN9qSFWj3qCD3SpLIzrf1HY3gDj/siUp3LUcUnwc4dNBshF5Q/tz83P/KBDtqBNlESddf9KyK3iK2
	CFy7HO83CRAY+GTY1q6bozuELL9WSfDiNaTjsv65H8zToaSclmBBhMin9sgGW+iXS09EteA3R3Cuz
	QQ7/XqPtZzt+ZoqWQkokDCJCppJ26nMKOLI/sa10EwcvNVVSemQFHaQc4enOBTrjAm4hbE3VIWeDe
	NDiOPQ1LFuMCXG/lrF3bLnKl/rTtnblPa/WlYNbtbo2+dZFP9dN8sR38+/qhGNcJRfXN7LjZrxwJn
	E5mc0H9g==;
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcf-00000000v1q-1mo2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:07 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4b28d7c729fso2411153b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446943; x=1795051743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=dE7lJf5cKrMJK04CtyZ3dkMuPpwuwfc11vAetI5ZlxMxJevrpcJUbsS0ekZ9Wrbf7c
         O93hdL9QYtrBN4/AQohUbtlTms7HV3OWqJZj38HmTzJweVfDGNVByUaGXe5U6fSRIY/O
         b6nCSlGrw4zRIklOWxH721fL4Qpw168eCQPVNBQGfqh5FItY5pCmdxRkXGGdWZUev2LE
         lywFiYJDPrrKmPQIChQJlMYCO2aYUJBnWUHm2yyEw+ibFoAa6gwK3i1bSNE6yJHc2vxS
         ZRAN1vj2TvFN3jQxq1hbdPO5d2ZhXNi/RieWkFthTM9LnPg/nZoTxvcV+xGQ+nwmnTcy
         jtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446943; x=1795051743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=S9CqGrD9Pe2XvEoTTovQYguIYCmYmzuwnlOk9JZFxQ2ry3xrWFyNQUhDWoawjRlwaT
         aXejVypiQhWzULpDrAbiAnPYE4sxZYIbjP4H4NOV+F3QIpLmv4KVu5wd9hl5aKVyI7h4
         XsEJDUo1NMwEymoNoUJRPF5URO4diRmcVy7bYU4tMvkL0W1b/6CTZOQnhrc0Lj6MFBqD
         wpZnBjiAqttSp+yPR6vko5zod++NbKv9kYv3CvOd9wTo+9i1t1HBPaz7V8BVBvFYjy71
         N/W5rl8meAp5bhaEcnOW8fLYqToHX0TKAKhYrdHTzLJ7taAg+Hub1SpJ9gT15kVpCSzd
         tN8Q==
X-Forwarded-Encrypted: i=1; AL+hErF7CtseRWj5I3GIByFLVpzFN44TvNVU6BPF6M+MTWo8ZC2fhU+30DgzFNUgmW0Rg5XfK5ren2gHflQ2vLvrEy7r@lists.infradead.org
X-Gm-Message-State: APuU4Z9ms8xtfNvCx/2h6oaOhKiHnh6GHREtT3xx1y3MDZNlX4JgZG3K
	QgVrobhHGSt1ZoQEYTcLI7/Si7UcxxqEM1aBZ1Bd5nUaE/Y90WF+/8f3UNlZn14f
X-Gm-Gg: AYBFou21f8psOYM9TQvlZhRZyh1I7B48KvBboPcsSaBfgodRHk8viX2V0gk8WbsluOT
	wIyUMeN5G43OMVnH4YiMdup8wz2DQt12CXsJqdxO5p6wqLO4mYXcjKUlufGooi43UNMTOtvHxez
	gPgTKvJMwirQJiKC0n/Fl07VmjcNHEKCzTKdj8HPCPxS4M2yxHPwSB5cAMvLrpYiXXeuiACUi2l
	Ht+c0Cn+uX3Ot35y5wVz4LYxMgeJ2h848Zy95Aiuwqd10bjl6U19O3LAgQeUGaxxEzC2b5VLTY+
	J8bL3ZZbx2m3YQhTdAIYUS2Z6yB9eDDCGwoZq4lwJbjDog+rVQnjIfrXevHAMLGmW4dCUvVspu5
	viDdlfQq6IJE8aWAWCPicV3QoVAGE8ZeIjyMg84966pe1Zj5yNdAL0Vg7ckVtNA8v09v+gQ4nMQ
	uUeyoAKci/KW6tDqx8uCWRW++ybZD2TiYVV521CFXTzzjQ+M1JI6DNyNX3mDjD4lOnUAagamMAy
	9h+hDprZws5ZWdt4uGhGhPFH5iKA2JKuB8vtDmMqNzrwDNjhW910CPnQai91R+L3YIQIHXnYUe2
	J3QncWJEu0UZvVJtWZFOO+4Lmflbfno0hTnniI/e9vuIXe7clBks5uaenmy0364Z+piTXjgW7t/
	R2erQJ/HKBVvnbgF6heAt70Bx+bm4ZEbnJf/h2bJ0jqdJPELZmKbh0zC9zRFPf1s5o9KQZRHIjI
	qHDwLcVRotm0SS58po+XfJVkXRM4HeB111IBXdQ2m3CbDRD8EFyFt4PVe4KjZ9dbgWPdNgO1Av+
	y0=
X-Received: by 2002:a05:6808:c3ef:b0:4d6:92f4:d684 with SMTP id 5614622812f47-56b989191f4mr3926705b6e.63.1794446943169;
        Wed, 11 Nov 2026 17:29:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:10 -0700
Subject: [PATCH v3 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-31-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012905_518916_94D8444C 
X-CRM114-Status: GOOD (  16.10  )
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0


