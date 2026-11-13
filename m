Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092AC606FE60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nZoCgEO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtq3/vJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=2nZoCgEOtqouHc
	qkAhI6ybPeAmkxTln9CWDiGYGb0qVRJMqwCNE+pGuVSABJe8r1frFjJDqhohRj8z6aMzsqg5mHKgv
	pRrhH3K4Y2QghaIGcGQzEB1pXsm1SwBxrW2ct0GbgKTCp8z9t7vi+Qz7pmrtsD+QJvSz+GNlHvnR1
	nF1qX04hTU7NNmEOeG34b/NCBk539/cryDRAWgrmnG5hPv8Brena/ZjV3JW14dTPYUuOiy3OvW8+F
	GZp1+TRyOR+ggfjgWEc+aaAoHNLYv9Gm6ifDR7ivmQSjdwq4q5VErL3jiPw++07UVI+Jv8oM6IoYu
	W2aEj/DrYqqbLjs1zIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp0-0000000DsEx-3v5D;
	Fri, 13 Nov 2026 18:16:29 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvok-0000000Dre9-1eYf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:09 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2090248a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593765; x=1795198565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=dtq3/vJI2sbaPXSOGW5lEysvhhPdqBk/l1uvL11NZwdcT+b5mcsNh/EQLOhQzrqnwR
         BHanHgANZcaAa3VMpHQEtb46SuDTZLDUYzgeMaiPWxc9o7C5kda2gDxJFqkOfrS8t3By
         /ht9sYnKWHq+/BACZEQ93dUkHJr+PMsJ95J4x91RiC1oTwceSO+3EeBzxL9xMZWhVicq
         z+Z6zMmt65C6AY3D+gj8sVBhKOwMwIUMySHw9YnfnNmegnyRizqSdI0TioFDHXcfXsj4
         TweXx5L+zLl36b3nXw3zCve3xS/oA9rI7fJ1D/q4sQO/DyNNLzBgQHbQ0jf/9x04ZTV8
         l96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593765; x=1795198565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=ueH2ebfNSr1XIDt5D93i8DyuxlUqIZuKWIoXxxPDlGUHBCFIMMx3kLvW3RN7YcFd7r
         jLZEeU8bT2n1FMzlVqvRNM/KBJ/RC/q4XcSAeLc5uR1400jR2qAJHotdkDTS/O39L1DT
         kL0QhoAczPa3zqvfSgWJyMIPQE9dzMsRSxe19wR2Hbos+HdMHGmJ3HA1eUEpolAx7TV1
         /4+Ex+It6o5c+kDOraOWvtIAs9d7iX5cRnakHORSA0rzMuXVRXgrJKgoaGhFBOgE/AJX
         m57emDSpK4MAPtrM3+t5PpclurRnRvtgHT4U0m/wmFZj7hUw1egVRfd5ECLr9DeuLeGq
         koIQ==
X-Forwarded-Encrypted: i=1; AL+hErElVKWpSUQFFBQDONux85F/oyGO88Qi8Wj0iQMUqS5sAM4RPLHU351VsQ0g2xewPGFufWOwhZMShZWyQdzsMBax@lists.infradead.org
X-Gm-Message-State: APuU4Z9x3ii8C3NY+uCYJD9jExum1T94hX4y6ktfQCsfYeUUYAJa240l
	//vZ6i9cf+fiI3SJAlA1R53DkOObSAwNmhBduMO1RF4SvaSz4zbWAZ8x
X-Gm-Gg: AYBFou2BDlRJEJjabuEiM0qFatfV4AY13OPoW+pfFF4w23zxoETxb/pFyy2eYqyZ+El
	pxD3bpY9fnlmwZATWE5HaclCfMqn8AduyAzNWmiTOYBtOvpHT+p3uB29GU1mBLoOATCnPj4u5vp
	bWzaQ1Ehsw3rQ2rAlsTwu+PHvTpv1KgQ7XOjvurkdQiBirZrDtSYOIaOaMMd5s672pS7FAnLHta
	mgjXwtIpInuF/MOjP4cdgtYS2P9NvveqSp3azST+HI8kpQ8BdcqPUss6yvHKEouuFGpE3/lvHnR
	yDLCNoyiVoPVFfWTL21nDUO5MzqhWAAl7WxFcbZkATpVB0ycIzCH1LJGyaBshECz11Pj/j15gUj
	UL9NMx5BFcNzPpP+RjZT3ZSgzZiJwyzKJDrsa2zgV1vNEWdMIm+Rdt+KwDoTTlpNEs2kEexj/v5
	ShUWZlc7IpS4ytLpDCvX/6KD4bVpRXBPr7nxfQkOvCyd4a3c6D1qO4ND199u/Xx1fr7GpBHfNMd
	qCNquzZfOrF5T5zCzOPCSGB7yCRqEFe2vocfKm3QSHNZ5OQsd59ogjLFaGjTMWiKkWGowzO6wc+
	wNcfGkMyBcj/QANFDQFYaeTR+n28Kdktuu/8BBz/6CPEmWwA785ENrPr9BF+lksXPU9B8huxh+1
	rAlx74cgHSibHwPoZjL5g13G48bRuNDh+mG/rpX1hHXEWs79/+LDnkc+sVc+lNcCkbq8vCGTbL4
	FphoZ8lbnq8XdOWLQxC+HmO2qYa1eyckCesBMYEIi0XXgB2f+o+B2A7xy8IV8xODeANjn3rYYY/
	w==
X-Received: by 2002:a05:6830:230c:b0:822:a034:551f with SMTP id 46e09a7af769-86289738d61mr4118424a34.2.1794593765498;
        Fri, 13 Nov 2026 10:16:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:47 -0700
Subject: [PATCH v4 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-31-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_101607_430789_8E601869 
X-CRM114-Status: GOOD (  17.37  )
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


