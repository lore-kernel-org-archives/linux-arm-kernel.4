Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D25606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUEkTv1r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByH0MfZ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=; b=YUEkTv1rQ1QXvH
	9WXrDO4zKk2DsXOgPeCGku25GBMg7J/bUS96/bRORRZOVcXCldsGXShKvk1cFjZPW9UYJan4ygX2L
	nzKonmkg3g1ojAK5Nw1DEXzWC77Y7RfVw/gNaFbh+UUfAV6clCjIABeetF2qNY8gYvqjX5YoEPAJG
	NOIe2EDHu3k0ugSzu3SU2zCdY0Td3Fth7x/m2kvCDCn+8ms3FXHFYjzCzhBwfirw65mVpZ4AG/NcA
	ot5EFD3uXtb1hHyeD5ur2PFHqWGHHQMqO0IrvwQ0mNRRdMkKbAJsfdMO2i5ApVrL6561R8EAtCDkl
	tgeSA4wD6Q9LPipi1nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzKJ-0000000FurC-1dtA;
	Sun, 08 Nov 2026 09:36:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzKH-0000000FuqY-1wZP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 09:36:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1928735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130596; x=1794735396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=ByH0MfZ1XId8oZvjPSDjDb1onlLKn5UD1P0Pick1UfZSrvdvsc3/AK4vw7XVdNgrOa
         OcPk+tV0KeNkF3ckBM9wZHmX2xCCXMsAvyuAsm43spJiY1qWZbyvXwuUkembFBGX8gbd
         82WnwNcYvDm37T5tYzQHbeOuS2HeQOGNCJx9c92+X4wNMvdF8H3Mgwkr5kHJDpMbiV1z
         +gpLPbnhYxXh5dwTHdF5LV2mAd/KAii3RBWP88JXAHrvRZ7acfonS31olxRYorQ3Bry/
         0Qvf5K1F3FTVh/zVRUOXK1i1Uz4DetiUr4IiJucE4YwPODotWPI6x/npnj2/ON71qEs8
         WHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130596; x=1794735396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=bOulSO+YmNLXJAYpuDYQTYsznFh0Aq6wbBDL9NrkUeSDVHrsR86+BBpwDD+Ibjyocd
         zavpsuyn+YPD/3PX3z3eQhnyZbhgzv2YpGWol4H7PdBlxCvL4JcYlhSry/QTEG5MHd7U
         V5wV0s4MqxbrvuUEk1w4ZFEXGX5bwJ3/qXVMHEU+74nP5vhL0fi/G3ohTqMsdedCaI6M
         7KyiE8gMmokm4COFTncY00zZ9OCy7w+iHqr+gK+pYk4qNmToOXO5egq6osSHjFZ3XTQo
         uGjjtndCZGvf4rUaZVRDE5buIgPfYLFJo96/DNWOgygUMrmtv2SjfPsL/nGPt4pxazaW
         PKSw==
X-Forwarded-Encrypted: i=1; AL+hErF4UNNt0Htmcs5nZHUH3xMd+W4fphgBLJYZFhmV9zHtJajV0t7rorhX0JKORwoQ3Lw/tIEnkWn3Qi7qykkPsCJp@lists.infradead.org
X-Gm-Message-State: APuU4Z+2PlXsEblEKFkOsx+jEKEhRIWIzWLegoxuLvD/jzTttL1lKpuw
	PtlQTQYBn2lcxvrL7rXeNd1AXpj2atu4b253n/iosJaYiwPC3uDLgRhC
X-Gm-Gg: AYBFou0jnEBfFdDq2Ulj3yx3Ah05rYXQ/YLlL6BPlns+1zADPiSJGBWXujeZN6UY5xT
	wRBSm418si7GvQDLG6lpmpfhPrSmWkITpF6QGm4RhTcZDwSSg5lniVGFP/YUN4lfr4kG57EzWDF
	rNWMHk288Mt9eF4qlrU29AzAjMCx9OvxXTFNQuB2e8phk3HKh2VEWfNQLTKV135zO+uCvbCDq+x
	D4yUPDvdIbmHUr6iu64rB8t46mOwPrXfFIVKoWNnGhD/CpGdiLGL1KTQ8WRGqHO/37h8RBqcmLp
	DRCImsZQbwiOKG4gKAYuwz9vRG0698rmBR9zVOXbb8DORtsLOgPd5eyis/+afGtMrln7EcC1RUz
	8aWpqx6IAhxOH+xg36BHGSeecXd9gkSVeLumP9DpDkNQ8+9Jph5flOBH/3QYpCBp2o/0ohzBSxA
	Y7SdsLrbW0RdMbThnOBto1xjc0+jZZQjq/GDN8jQrs0eJtJVXga65ZFB8w4AeG2QjINmbZk2kE1
	3gZi0bWgqip3jINCYPc7RZ9jfM+JvL3r6m/bddt9UcTqZTH8RVxFgUkVpNiQ9eCPq8Oyee6nKhm
	6lwU51tSYaTXSTQQRVinI87+U+FZd056WVfT4MvYvwzvREHaqVVlpK3F8c7EKoM=
X-Received: by 2002:a05:600c:4e05:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4b963c6d1ffmr18967885e9.19.1794130595723;
        Sun, 08 Nov 2026 01:36:35 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:35 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Sun,  8 Nov 2026 09:36:02 +0000
Message-ID: <20261108093602.329554-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_013637_516273_1F23B61F 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0


