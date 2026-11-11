Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95129606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjIIJOUv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WaONLq7Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=; b=LjIIJOUva/z+4/gHQ3mprWuqH/
	Wmvn4hAxSX6dqSTMkQ8fgZSnI3odORh2kBKmzLCFB3XcCDD2CoDjr0DJTSdVN1w5ktLvFtxObo53W
	gJRnhr6WhcZLfL+oAykLdo1T6zhl/XN3c73nEU5IQYCx+X/OUAU+A156eaepPrgpPZDLyBex/g8Re
	FVj9fTTPMxSSR0NZreqwAGiSP+1ELkeyuL723k0qIrj05nPdYeHU+HYaEtZr4K0sDHwZP97BeEjXq
	p7GN1cZPzo0eQ9g8yrXPMmhHUP7+SYW3GfYi9G+hDuxd/jaZEvgCEVTluUAxvJuAva9+lXyc4gOpm
	BvsfjpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy57-00000005Rzh-11tD;
	Wed, 11 Nov 2026 02:29:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy54-00000005Ryw-2yF0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:28:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso1260086b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364137; x=1794968937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=WaONLq7QwKsrXIm6R/Lkfrz7DEJD4qprdfvMPW/Fj8oJYgEVSSfl3erwqaeBctZcJZ
         NT1R7PgwpXOOHpuHkr/GYEoWJeXwpr8geO5c+1g20s4hAbEIcNbznsQSto37vyxXwYTa
         i8Aya4WdumVu05oQAROO5LQC0cz+nQGOCDnCOiqa1MWwtqbXNIkncoLbsrwTNguCT47M
         ifk9siXc7Pp1HE/PYlxBcVyHE2KpMoe4FKLOheia+1zkPXRPJoGGqgG/4hrCZYyexX6Y
         iGPAe58H0JIyu8LKQHWGT+iNQ7xU606ikdgo7DYy9yFLUcetuUHVDv/OXoqLDK7PZImf
         YH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364137; x=1794968937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O32a4AiJGMwcCR/+4zjDOYox+W85VRB2HAzvlPxTqmU=;
        b=LEsW6XB3OUJ358clrglaeDtmUgpAqPQQIrUvoYRpESmQmI10RkU86F6h9Iwxaf8vQg
         B+eVltFKmTlSkPqNqMyVeYJhMh3UDy4+Z4nwGTKj5bUkm9Hgw2hrZEcacbPM6FoFFrrf
         bcu4IhIXMh2+uGU4ClylbfLtyCAqnq21eX1LHJZGhG5l0s+W5OFJDDV8E4qngnQ1E4Kp
         cZnDC+COMlnDmgeIqFEzwyogOi8ggm3WwI0GrOfhyumXCy9vdJ6W3TI/kcILuFSLQNWP
         fxeXlI879tN0VcaiiY+2GkfGjT3eX3T/TReqTHv58KJjnEVAvirCksT/DRYJ3W/5JXbC
         6a6w==
X-Forwarded-Encrypted: i=1; AL+hErF45o4TQotQlHlSY2EtfMbWZSYFJWCIu4I2rZxlOdbdS1ZlMxzswc0krvx1XigPnWMkdhaNzVpnMEY2NKa+FbUU@lists.infradead.org
X-Gm-Message-State: APuU4Z9Xri08ZFIrb39RLDMK4AYPI0zNppIfhFWvo1DgTqE2l1lD+MU1
	hdSwDbCkKvAJTYcdbwUlni1q01JuE/zvrFcQ8PglO+2E/T7sxAkX/H9o
X-Gm-Gg: AYBFou1zmjjwABJF5LOrM/Hfky4qxt527K1Z5XMRVKpeQD9MvZQy72dEmYLuPMWT29A
	B/GTsiWVGy/BS5iK3Z/o+M7SlkTIZd4rlXrChkFonJLF/3dm1Ml6Rw4/XfPWADnp07pNGD6b2tg
	Nhi6ep4TGUTs+GANV7Qcy7P2mZu4QkhlIte/c8jAaCMleOXf93ST5oQJJpmEYdC47tI5wN8Jy40
	blQ5xq+aISrdiJWw4oQPCWb8NK50iYYZiA0NyHPFqQukcPJldcY3btzKQ0qBjqpTIS40IdvEkkS
	jKmwwVLC4gA8bhGGLpX0XoAfuIWzblrWo2tKbBefKl1wAXILCIwwH0O7RjD9wqmfAUpYaNpU548
	Ww8dK2dt5Ey8otMhp3MEUo2k2MbNm4V7bhElRfWrm/DD0j6CRb7ZcKy6nST8nLFn2elh+jJ1Ok5
	gTE8L9Q8taIyn+LdcSGgeqJLXIiyL3nHfLQtJPZy8XGj7e1JdLA8p7VGIxO7elVs/7jw+IV+6oD
	Jhuow6MGIWHm9xYtgn9lMB16LytOYDr3vAItbucmblQIlGhggwcjdnDz12QDyztjj9WrrdULquA
	XYNmp2h1yiIWZ+zTyL8pulYdJ6nf6asjeMd3q3lx7fXT8DcFPnyQDL97i3bK8buGMEP0KzB8rTh
	YAzIhuFMFXxIe9f4/yrf87mdxkxCLOxNNs+F7M3qp4K2+S4UELJwWT2a1zUv8tyJLylpC3UVL7h
	VW1g==
X-Received: by 2002:a05:6a21:1391:b0:3e1:9071:acb2 with SMTP id adf61e73a8af0-3f2ff2e0b6cmr821227637.33.1794364137319;
        Tue, 10 Nov 2026 18:28:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1603153b3a.21.2026.11.10.18.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: nxp: imx8-isi: remove kzalloc_objs
Date: Tue, 10 Nov 2026 18:28:22 -0800
Message-ID: <20261111022822.67474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_182858_749561_66938887 
X-CRM114-Status: GOOD (  14.47  )
X-Spam-Score: -2.1 (--)
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

Use a flexible array member to combine allocations.

It looks like pipes never gets freed anywhere. Meaning this effectively
fixes a memory leak.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use devm_kzalloc_flex
 v2: add fixes tag, fix typo, and move pdata assignment to original
 place.
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2005584a1215..dcf6c25d7faa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -473,24 +473,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
 
 static int mxc_isi_probe(struct platform_device *pdev)
 {
+	const struct mxc_isi_plat_data *pdata;
 	struct device *dev = &pdev->dev;
 	struct mxc_isi_dev *isi;
 	unsigned int dma_size;
 	unsigned int i;
 	int ret = 0;
 
-	isi = devm_kzalloc_obj(dev, *isi);
+	pdata = of_device_get_match_data(dev);
+	isi = devm_kzalloc_flex(dev, *isi, pipes, pdata->num_channels);
 	if (!isi)
 		return -ENOMEM;
 
 	isi->dev = dev;
 	platform_set_drvdata(pdev, isi);
 
-	isi->pdata = of_device_get_match_data(dev);
-
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
-	if (!isi->pipes)
-		return -ENOMEM;
+	isi->pdata = pdata;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
 	if (isi->num_clks < 0)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..3165a65391c1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -297,7 +297,6 @@ struct mxc_isi_dev {
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;
-	struct mxc_isi_pipe		*pipes;
 	struct mxc_isi_m2m		m2m;
 
 	struct media_device		media_dev;
@@ -305,6 +304,8 @@ struct mxc_isi_dev {
 	struct v4l2_async_notifier	notifier;
 
 	struct dentry			*debugfs_root;
+
+	struct mxc_isi_pipe		pipes[];
 };
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
-- 
2.56.0


