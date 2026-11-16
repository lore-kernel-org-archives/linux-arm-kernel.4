Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0912960A263B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xOKPm612;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fC77j0go;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJ7Vhgxa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=xOKPm612e5XaKv
	b6SdWvfNwqa2Fw3BW+eo/H1KN9PadVa6pyQWMZc9yonxrhVgpBCYWIoSlDy+wEpfGfEHRfpVs31CF
	p+rXSE4cstSSvyRUdPgp6I74WbVTeNE5CQ7DqrSC88EvRCWWOGQWu/j9bjKUr7wxfGaSBv4f5Vfee
	1hZFhyYNbMTcitvxSMOE+3OiM5683NX9Y5CyEsyOJOeuvOtbgzFL+yksQaHKdcyQgXBRmJ8z6PhYl
	EuqXCdqS4dn/jD47nsAlnASOk666OjMpqpcJBeI0nla23695oZ3wMGu35bd6D/IIVGIad9s5nZWky
	Rnf8tc0ITk5MvO60Cuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEl-00000001GBp-2eCJ;
	Mon, 16 Nov 2026 06:30:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEY-00000001Fml-20lq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=fC77j0go+1o6dJcIUWXZ6fxpPU
	cSnkfIwjpCZ3JEf+XUNFPENH/ec5ktSFlW4ZV3WO6qi2EkGnJtcnuYHqaWuxMqYeAXtvwrYUgQUUH
	DAIeISyRvx9J4j4kWi/WTDFGqCXgRuWKY3sB4xdx5Nj4HaTvlC4lI2x9yeTrnSE/meRJzRnmCmZaM
	U7NyH4qHNQTSIPBNFmog9LUiPqySJIzuE6QWgunUfrhuCW0qVdA6t88A88hFIfKXbTtVJJ8cG7M0R
	79FJhyGb0D2HvD2GF7QLlWHqh8MEAgdrIZuUi2OyiSWvt9GN0owXA0irFopnDxmwxGhZc0HY0t0UX
	cwlh3i3Q==;
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEU-0000000DPFx-1wuP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:28 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-716b58a4365so2119242eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810624; x=1795415424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=lJ7VhgxaepDA3UjHm42l6wp1g23uT+flyVzVMyi1hdX/UmihG55TNnJVsgiJ/LLQks
         MU0j4XIlijw17NPGeHOd9EXLbw6oXzNcFaWHb9bWAzIv08+FacL/IgFKCI++IqHeq3qc
         C+uKyeUMjteoIfnG7EcqoKB1TDibS+CAyYfMz4WzcK08dbFCBpcENG6NdN+gKOzvE5KJ
         jXjndCPPQqrIbdfui0ssMq5ByZrOcSyn9xz5mxN64uBQTtF/1o7/ETxSO1tiK8r9Omnr
         M2nKAw6cyTeSFCG56H3GjvV8fX2RTyiNqMSQepbVzpH0FPhY7ih/YBvNyR7HpSqCQXNS
         c5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810624; x=1795415424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=eUiK+ZYiDkUx+m3JeY2vy2j1cIqgT92uVJ1+A9d12f1iY6qrTi3fEvv213xbp16XZd
         /08g2y7CVMcbNQhNkxwi14Tm6siNj53FiNpG0boXWvVOz6zsFNEHKqs6djy4+HgYeDBp
         ZHfQh2yOfrof0MesP7faR691XBo7uFBlr5qv1AVSZuQQ9gfk7ODM+E8m6ab1Y98XYy4k
         KnaNstlXQ/39QWRcnEkx5KBohAAUWR04LQ6P1Et/YKhwcJxWrBXSs6gfUTPyyHct1oti
         D3jxQOpxFjgOiyxI2rMymd/LtNGy7laDYCC9qOfyilJKGjTQDSv1BSAs3EIEodZrhGmt
         3r4w==
X-Forwarded-Encrypted: i=1; AL+hErEOxk61ryWq5zH3Z8dQo/pxoCEttSUHhwFoNZhkGloVtaZ2eXHqddKD5AbPBX7i6XnaUBYMrV5Gy8pkmirgFRHj@lists.infradead.org
X-Gm-Message-State: APuU4Z9xTSAUnSYKvlKS3Z/sVBE4WA/kWs7PAjgM1yZZGIIfK8i94206
	6K5sdlNhaZZhWoEY27DHG5rHMhddDS6SBH71gRWKAF9a/E5m4tpoHI5Q
X-Gm-Gg: AYBFou3Ak5Vu5nf3vhzTqqduMlcIykCtJRM/0pd+P52Z6h+XY9EilnKc0b4WRnwvW8O
	B8poUqQM2AP2ajfYi9Sbr+vWqye2wl3pgcjyqaRVwW7qxNgyaeq/9RGtSFZDbNuRrp+TxXDsSht
	aFZDbNDpOa+nn32HUuT+dXkVi+nKY1V1kJ1Ohc+APt0Pj8pb7OgmDMVcesul6WgLHbYR+tyCxam
	aikn5JnUypQunydnzEBMuTtLChMa0AGHrXpQ5RyzfcsFQhomy7GH9Jc6IV3MpKwfD9zVp4UK1AY
	c0QZuhiN4PlzoMcIBaNGIrUcE7sRjYwAHfG84evVQFIuTRCsRlBaD1yE+oDBwYwkU3bmyld3uRJ
	QhIPwISHxPJtBDT2k/zJXHW21VEU0cJz8xZbyvWcpKKBaOHkiLz5OhAHsZcCgY8ZPMmBpCAmwY6
	4TP9v6YRzxXZwnC7OJKWy9sgKViyo6JXuSOQQvVNNP3uAeEVxwBhSnCID+4oSaRIz4VlVCCLwFh
	3vOBJyVmutILIboNyMo3Lnvn+UpiS/7e1lV1yinrF4T5DpQMmKwmijhciWiECnHkrr1fY9bXjxd
	SulXmZhegkNboSbsspabgzX5x5vxkWOpJ03DQrCeBnKh195NZoTJ4vcSv/79Fk3ibihBWoMIgyZ
	zIh2/OV5M9s/cNrJ51c4ImN+jiZpo95VOO9Br02S6FmzxrazMgh65xwXfoxTsQ2Hi/RLOpxdoLg
	5BD8H49xDaUh4Wtk34bHU23IODkmWfMkEmr0L6wZ358EcFK4gP3RA=
X-Received: by 2002:a05:6820:f016:b0:71a:ce4f:4a7e with SMTP id 006d021491bc7-71ace4f7812mr3792885eaf.12.1794810624151;
        Sun, 15 Nov 2026 22:30:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:46 -0700
Subject: [PATCH v5 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-31-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063026_601881_82C65A05 
X-CRM114-Status: GOOD (  18.34  )
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


