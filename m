Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sUlcqzPr;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eRwlbATG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=; b=sUlcqzPrG6G6Vd
	FyW1l/arfty8jVANojQi+2CPBjPMVQG/leZ7yLJhs/MM1tyWTMnXaXUnu+0fQG3DJyLWkgcSmCpX6
	MJqBju7d1Uxt4eGO3XGEnbmhIYf+76IYY6qR8RpdUAs8l+QqJUaWX4cZ/XQBPhYxWZQRlBZqF12Vn
	Q/evV7ZhQ1swfMV4azWjXEnutteJoF3cG6t58Zbjg/wMMKGsZkLV1cUJ1RS6VrIJX1MM8XcUtZXE9
	6khE8yledQnERK7m95683AUV4CKFLvj6X22JOw6S8E7s/9uBhhLRfFYAsQhJPS8+kP8PJvrzUm4Bk
	cH6oywrThECcRIxD3qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxR-0000000DtWg-3tV1;
	Sat, 07 Nov 2026 00:06:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTxF-0000000DtQ6-1oMk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
	b=eRwlbATGuePqRoUfDSZ9qs0RrDdYZ+KAJ7W8YOSwyruxWr6QSwtuhfpmSEKbs0RkuvS3tq
	nDRF7ibxDb2QRowCIcx4fyeXiTxtwfid4l4jQyVnUyDmgMfNi5M3QTGt59FIsuMAveEHIT
	gklSeZm9ZhWhFE3Jsw4LD7nznNwoFKE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-Lr3O8J6CPD-f3MMSREaY3g-1; Fri, 06 Nov 2026 19:06:43 -0500
X-MC-Unique: Lr3O8J6CPD-f3MMSREaY3g-1
X-Mimecast-MFC-AGG-ID: Lr3O8J6CPD-f3MMSREaY3g_1794010003
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so67636985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010003; x=1794614803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2lKTQGAydL4R+xsCm0cY669RVVtn0VvIRtylww03o=;
        b=RN7i1zPhQChWwt3snINBbMokz3ahf68twQ18D8qzL9StC9JAWw8i0Gup5iNObPgR7h
         oZGZGALzBsweXABV/xDQtW+cbsWTrwkGyU1Vjo2zTGUf+Vqy5VLqwtpZlVk3zVAEBAdp
         YRx9hUWv8Ac5I2AATck41o4evgevsBoc/l1iuYgOUmm4qhInUfvLXQceHJ9gyWSndRJr
         3V3rzwOTaxqPI+FgyAU8ozG+17CkBdtMoJHCaH6CAwQbmr98Q56db9R8PCRC9CiBUGvg
         W/0tk5dZkNYJQU7WcmaR8/kRkxdyfelBXCFUTSZ2Sq9neWh87sgUB7FR0BcO9erdOlXG
         haVA==
X-Gm-Message-State: APuU4Z/WU5+jSWqzRbSx5GQlBts659Xq+ke3z1dFs9sKYt8wkjwSk82g
	oOffc8ZJqvJZ6dyJStLfoDmwf3G17GJJdm9lznS75N25TvHXtbl+suS4wPgl+7iKM6SX9AZ3SvK
	d+YiPXuIIH+rK/kXL2TbExo0PB1EZYuvz5x0wA3zHiFrbISaGW5J9ndAS3neBD45FZeh1YnKRyD
	fT
X-Gm-Gg: AYBFou3RgnPtyKT24dmJwlv3dicnRqUG/Gvw4J5RBxI+zJ7xP0B5AephORzIrRlFTRu
	iyYcFRRhOeWyqsNlN/+4VO444AJAr3yadfeHckGJlaI7jAycWvJJGkHKwSn9DAdE0xKK9+ilSe3
	qnXaiXbZ26JRo3Xs+PC1qTP8o96grHj7HrRt+1mIlD4Mm7knVIO3SUfv757FurAaUhR96JI0naN
	T5YDeLXlpLR/5Z6QhD2sKoUN5kc6YRrMZ936G7bbc+SaVFH6kT4gohMXxhP0w18o1LdKjGO6fw6
	tty23ZXbOudqjg9/S8raDhRQ+vc+6H/1qUPFEAa1dAicDJEQGDw2iPuJqwmZUmXjHFtznPsjsu1
	tJIV9uRWD0bv/JLKRSmnV2o01JJbJvYCATPQXOgNZHF+uMsXl5Xuwp5OE9VCk+7cw8XvuWfcwHo
	Yfy2/8N0YO7ATka/IE
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704446985a.40.1794010002597;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
X-Received: by 2002:a05:620a:468f:b0:93e:6325:ae6d with SMTP id af79cd13be357-945f349ce35mr704441785a.40.1794010002132;
        Fri, 06 Nov 2026 16:06:42 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:06:09 -0500
Subject: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=FjTOp1M8Xy8WBCnxDwFzONX6zQMkkI1R2AYzFx+nwrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZbdoi/pLp60VjjwvcUxslVrirb5DV/utktpvPDq5W
 Wn/wb71HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykdQkjw6JqyU0+3VVfSzWl
 u41X9l86OG0B89PfCwV8v3te0lN3YmD4K1PKxrDgtUqx6oLWQ+/ii6VYfpw6XSt0c6OA5Me1z50
 zWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ooaj7bUVUhgYLLmiS5Rm1ep0Bhc3QUQo_FLIGWjLouY_1794010003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_160645_552167_897BC2F8 
X-CRM114-Status: GOOD (  10.34  )
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

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/dma/imx-dma.c   | 6 +-----
 drivers/dma/ste_dma40.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..8e0e82df8c5b 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1238,11 +1238,7 @@ static struct platform_driver imxdma_driver = {
 	.remove		= imxdma_remove,
 };
 
-static int __init imxdma_module_init(void)
-{
-	return platform_driver_probe(&imxdma_driver, imxdma_probe);
-}
-subsys_initcall(imxdma_module_init);
+subsys_platform_driver_probe(imxdma_driver, imxdma_probe);
 
 MODULE_AUTHOR("Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX dma driver");
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 2e83503f71d1..4fb54c8f2d23 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3990,8 +3990,4 @@ static struct platform_driver d40_driver = {
 	},
 };
 
-static int __init stedma40_init(void)
-{
-	return platform_driver_probe(&d40_driver, d40_probe);
-}
-subsys_initcall(stedma40_init);
+subsys_platform_driver_probe(d40_driver, d40_probe);

-- 
2.56.0


