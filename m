Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F6F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mx/AMpdw;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g5Sv/5N5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=; b=Mx/AMpdwlBuVC1
	agKd/tRNyghXr4tT+nHi7IHaTrV/WA1Jj2v4pr/hQVy1cRRMtjqvHCYnop/aTji1AOMIAYbM4BzZQ
	mGxg6+NnGhws57dU1EB9xUDsG9F0yKAhSk5UTNIgkr713rkoQpoXQiFt62o1Jpz5nwtokYJL33E3v
	fX5vTddkb9c8v8lM1tIMOoC1bTWyJ4lxpo1/7lR2pZu6FGN3zYD3AtKdCmuTjJrTUJYpq5il6v+52
	5rlHlePMIAcNrVOCuR2SPePiTouCMUMRGewOL8apBTWS09BdJtXhLLebim6EVC/XvpTBxbXGUGiBf
	pf5vCbr5yfVdhjmPd2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxd-0000000DteK-2JpC;
	Sat, 07 Nov 2026 00:07:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxL-0000000DtTk-3Nc0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
	b=g5Sv/5N5tmcNUADUtr1asSIWBgejqqksZ24XqE4n8CXfYveWQ75VbAjnDq11vqQ5li8CsL
	L/3hUXxe2tSnI1QknOoqyoW7d/HqosCAhpkeKaZWPZ/WNXso+KeB2qhUhPK4ot+2r5l6EG
	kI1B1wxX3xfJrEZRGFJAM2ux0Zanqqs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-1OMZ-uJZM9eMSws81WLEZQ-1; Fri, 06 Nov 2026 19:06:48 -0500
X-MC-Unique: 1OMZ-uJZM9eMSws81WLEZQ-1
X-Mimecast-MFC-AGG-ID: 1OMZ-uJZM9eMSws81WLEZQ_1794010007
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53661e036a2so23583561cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010007; x=1794614807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1jw8/k9HF1Z0QFcfzQluiREZXrKVRI5j5BkQVxckCU=;
        b=U6LrT+5tP1VhVnIGQtDm72uyjUB9COn2iT18xy4RTyFZziVscHXxw3ggaEFD9OUTc8
         6ffFvHjTR8Gn8bBKYly2xwAJDMcEDh92x+FOxQXjG2Y4wmPCVMwBj2Ng2zur1zIPyUXZ
         i46e26IILu9wTebTIBIgxfOCcIuVKWchRLNkejDUrSrcO91dmZjv667WduK974w4VDgR
         Hlg2CEAM1Xx5ikrIlymWF4MNiYEaTA/QysF0zStUPTf8KX/ivASu+guUZPIcj3UtZWYH
         UFUWevYpIAFRsApNb2ryXYJclzdf0Yw9LDUWV0988YS2Zg9mn9Fj6pEO8HwayuneKtnp
         uDnQ==
X-Gm-Message-State: APuU4Z8dXvQXrnPlaWZHv+NbMIRtm66kEyc6RyRa8Tx9dEZLbf0wvCWq
	oMrku7jH/OadK89q9ImGN9LWww0ab6OWF8FX5qC6uVfk2pUXK0ybUBzCA3r3S3IzSkj4hduV7Kn
	Dxfi0RZ2vxRVxCMb9Q/hi8SO7AA3G8AgcwJmqyuOdK5W6DMq3MMScigs+XPu75o6TnXxXPbJTEC
	vO
X-Gm-Gg: AYBFou2jGw5ldreZ+rnL6CgIPY3hbMCQneLNJbLRJoFHdv8ytjPG9uLnEfTREtPJ5qt
	+0WvQNDHnLjjLfvjzPbCXv/dzomKRjC0IyRyXXBfPNDJdkPxawIkOjE52/VUZHAEKDoovm4pMXX
	KjrTu4dlfUAioyZNncGse//zgGaFFDd1kjYRf1R+gdM8K6o+NcikEwq70/a/gxgD2FDmigGoBg/
	lZTvLBFPD0hkp8e8bg6zxwNE4Q3lK7pKeXF5YKIpo3RFIXdGzB/vBU9GkWIdm8PVGrff7BEmJNF
	bu2T1lB0Re9CCViUml7MUJjcy1Hr1+G1uhY2V5Mg5RxPIo7UrOsfGLF6YvHsMU0cK8RRD7zKCKR
	z9HGU92Dge5dYTeHlXgXyViXadYq26pT7+oG2GkyM9IfbrXQLHPVpzODWGI+7V/oVAbxPA49Dhg
	NDbI7XyT6sQiFLsrT2
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751661cf.12.1794010007253;
        Fri, 06 Nov 2026 16:06:47 -0800 (PST)
X-Received: by 2002:a05:622a:114b:b0:537:f05d:881a with SMTP id d75a77b69052e-54e132997ddmr61751141cf.12.1794010006668;
        Fri, 06 Nov 2026 16:06:46 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:10 -0500
Subject: [PATCH 3/3] dmaengine: fsldma: convert to subsys_platform_driver()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-dmaengine-subsys-v1-3-780eeddbf3ef@redhat.com>
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=hy3g6mWddGYLX6Myo7kSoYtQp+hY5Hbo/vUsysOb4zQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbeeNxabtVqgmXFuKMOEE2yy/Scinn4R5Zj7TWhOt
 atoruLqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiOouR4cR1jkNqh68wrEm/
 stlDUKbx8PxggVfG0h+OhJx8eL8//yQjw16uPZumb/y3PVJc7N7WsJVuGVcamc2sSnpsTuX05Pi
 UMQAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -tRZZUKWaFk4xpMXS2ZPFkDcFz09h6BPl09hay0iFNM_1794010007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_160653_952243_2FBE46A6 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Note that this driver previously displayed a log message during init
time, and this change drops that message.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/fsldma.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 99a878ed1444..fd3dca7616a8 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1431,19 +1431,7 @@ static struct platform_driver fsldma_of_driver = {
 /* Module Init / Exit                                                         */
 /*----------------------------------------------------------------------------*/
 
-static __init int fsldma_init(void)
-{
-	pr_info("Freescale Elo series DMA driver\n");
-	return platform_driver_register(&fsldma_of_driver);
-}
-
-static void __exit fsldma_exit(void)
-{
-	platform_driver_unregister(&fsldma_of_driver);
-}
-
-subsys_initcall(fsldma_init);
-module_exit(fsldma_exit);
+subsys_platform_driver(fsldma_of_driver);
 
 MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");

-- 
2.56.0


