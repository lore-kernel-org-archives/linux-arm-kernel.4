Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZENYtzX;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hcpOm9UI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=; b=iZENYtzXXIjPTD
	L9PeZBbH5O833YRe9Zq8RIBdk9gbWSFU8luh+NXVyLX/3bgffb6iqj6WizUCCo9NsGaouRWiMSDRr
	6A2Ur61rYTpAvW7mzB/Nf1BOfxDKBth7Ibnv3uaGYDboDuF/WrxU8eyRBFRdQtblqZEgOwUkxa9zs
	aNb5Pt9aEOBECW2yB70/Yrp7ZrXjtD+a7WNyyYX5+rCJaRJs+/tHeBPiucm8cb56YPb54i3TrriiJ
	Z0KQAZ+H8Q/31MOfncJiebq6/Pk+98kch92KyaUlDKTd2Tl5LQV7cBvayYLl6xNs3MJvpSkE0/m3H
	KAB1R14f1vCOWI1jywqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUO0-0000000DvpW-28tz;
	Sat, 07 Nov 2026 00:34:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUN6-0000000DvgO-3tNF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=;
	b=hcpOm9UIT1e35jCCde3iF3D3dghBYK7uXlrJ7SvktBX20P3Nab4wIC78lZyWah5Z05Snt+
	SSrLHmVsePo7qSet5j8m0o74yndSyqICb3nILobBK6sOrypG9qwVSLHI+hxUljxYUOtDlw
	n8pnOViQgJ/cJ04vsoQwkJIHzg3g8F0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-GpugBvvXO5mLXgtEwt2Z3A-1; Fri, 06 Nov 2026 19:33:26 -0500
X-MC-Unique: GpugBvvXO5mLXgtEwt2Z3A-1
X-Mimecast-MFC-AGG-ID: GpugBvvXO5mLXgtEwt2Z3A_1794011606
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536778a8137so21482761cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011606; x=1794616406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMUy4txGMl5roDNZhY9tu886qliNRol+/oxaNAbU7p0=;
        b=JocY63ZlluZhVxvvJd9L1O+k8W7LgrWLMXdi2l4ONPKi2e6CI610p0RT6fkbnosvQp
         yWrIb/uDVAC2LN1r4PVE50tqjc5odh62fTXNwVVM3BR7uDpuTxWBzch/s0zEjg9nUU3U
         1ObZtI9mNo73fD0macTHoEWB47m2gQk601GgToimamTQhlNFHEEVU6yXLOPwR9jYqRdY
         jt4QsSLBsclYP0eCZMSDH7EzqQnbI243UKdm2mY6tO3ABpFjHoZAvRZ1OrE07lS4g430
         8g3blKW0EImEqtgvQF93csZvQexjuDILjyLlmI6PgeEZ9KFiealca/oY0vpkNi+6NA9J
         McQw==
X-Forwarded-Encrypted: i=1; AKwUvByAoGICylkMxujHdqBJyUliinIuhC4bxUgrbxcei5+ujfu324XscauUeDden1oPVkALOV+seofxTuj3HAv2WUPM@lists.infradead.org
X-Gm-Message-State: APuU4Z+Y15MqVj+7c7MtD7FjU08g2+15atBb9+cIZt534LRunoQA6VkE
	kX9Cno2YnEMjghR+6tPnHTCcDlMHVM8OW/QRS7sdzd5/7q6mesIWAjOZq59dka4XVNSdU5Pp/3i
	Tom0pEmagOvqYc7dIMz2ceIsAPGskHPAwhn5LX9FxNc7XXJO03zyCQqIPP8+c1E9RFx7gDa6Wm1
	Oo
X-Gm-Gg: AYBFou0WJV3XXc372rQqW0tc2t2Gfx5URUcC/WOW+/UZ7KUT0wLyTpk2cUP3GntIU6t
	imIiVVXzNw60Bvt//cGZnWRonw+k9VA/+LhkZsa48Fw99bR5wVfo/jHzdFd2gB6+AcmPHmR4h7J
	xbsXYhhh5fG3dAFnTOCG8V+2bUXxqcB4+KeDyGOGMRjaHRiD8EXlLwKfE1r6aqOymFPC+gXCDFp
	kcvB41YkKSFHRKg4gfMRrX6XZkSZLUklTt2sFn9x1MpBHYkecrekRJrfRkRXcYOlXQOJ+0mIB29
	KV9X02a4EX7agGM8EQzl4xsjoFjHp13J9l57xwarOJ4Xep1zF22mAlNFxMdsYgpCilS8Jkr84pa
	BonRnZz2Tf4bX5gxAmnSM+MI7RDvMEnLbekZf9PhcPD2UKH1iRdBGBheKNqJ8MOJ5RluzO60t43
	yW5KQJ015zp7im1Uj6
X-Received: by 2002:ac8:5fc8:0:b0:535:a5fb:6459 with SMTP id d75a77b69052e-54e1576c1f7mr69286641cf.68.1794011605999;
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
X-Received: by 2002:ac8:5fc8:0:b0:535:a5fb:6459 with SMTP id d75a77b69052e-54e1576c1f7mr69286361cf.68.1794011605554;
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm32684126d6.10.2026.11.06.16.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:33:08 -0500
Subject: [PATCH 1/2] spi: omap-uwire: convert to subsys_platform_driver()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-spi-subsys-v1-1-a51a08f21cf2@redhat.com>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
In-Reply-To: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
To: Mark Brown <broonie@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=VXOL6bEGlUlQU4NkQQRQnkjQZinD42MMCclT0CLWHzM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFZ5+bJG4e+VlhwvSB85WtURMW2viyDrty4/6P8+Sg
 9OmW64621HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE2uoZGVoF5vxjPHejLvBj
 6qVNy633+z41zZrMz9QpXS+7XfUzuxcjw7JDNiYOkfEuyipcEwMdnnlcfRJWav7r8IdFnKsKXNi
 K2QE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FFF_NP_3mBLMpa0T_H7evDsTB9qpq7mbwWtbqtI80Vg_1794011606
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_163347_752317_C9EFFA41 
X-CRM114-Status: GOOD (  11.82  )
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/spi/spi-omap-uwire.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 83e263eb6069..91bd733ca15d 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -528,19 +528,7 @@ static struct platform_driver uwire_driver = {
 	// resume ... use ck
 };
 
-static int __init omap_uwire_init(void)
-{
-	return platform_driver_register(&uwire_driver);
-}
-
-static void __exit omap_uwire_exit(void)
-{
-	platform_driver_unregister(&uwire_driver);
-}
-
-subsys_initcall(omap_uwire_init);
-module_exit(omap_uwire_exit);
+subsys_platform_driver(uwire_driver);
 
 MODULE_DESCRIPTION("MicroWire interface driver for OMAP");
 MODULE_LICENSE("GPL");
-

-- 
2.56.0


