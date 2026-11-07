Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GS49b211;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jq84orGE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=; b=GS49b211O32nuJ
	9Q2KVCbyZFl7505YdNFSUCfHQ7vkg81zqOHIu1R6R8l3u6y9CmBomo5lnjBmrXY0w6TMN7lh4wk3N
	xVXCAHelGonOAnVV2Ljo+p8vBnb+aeNI9HKUaJhjJyj2z3CUd+STgpunb6tSaq4k3bxu4pfbLWnwt
	rbcB8xuLSbKEV+FsPC91eOh+cC6/gowKE0oqUlC4qejHuNw/jwM5eDT7aLi7DbY1Xn8tQG6JE2J8r
	rVciuUEEis7blTVYaCC87qB5OUWhk0/I8q78JI5IgUyoiPnNUzDmjQBYSdzyPtNPqAzu6IqyDNhkY
	wR4iAyyNHMzKZrPBcyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUNf-0000000DvlT-35rg;
	Sat, 07 Nov 2026 00:34:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUN8-0000000DvgP-0lTt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=;
	b=Jq84orGEbv5gemYodNaS/Zkp8XdpfsiR3DASh0ID9xN6e32GiapCeUe7Exlx5zpmP4z1Lu
	qUByevFMA7FPHEBLZ8d4si6IiBXsoaIAdjX9xlOEup0ZQvjpH3h/L7WiQVKqMwGN4UulHx
	Q9GyBcpRqoo+SIauS1CfuaqirdTVM3U=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-LCKAH1woNnC6TkmPrNx35A-1; Fri, 06 Nov 2026 19:33:28 -0500
X-MC-Unique: LCKAH1woNnC6TkmPrNx35A-1
X-Mimecast-MFC-AGG-ID: LCKAH1woNnC6TkmPrNx35A_1794011608
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so23922611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011608; x=1794616408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EpZk2mArj9f3PAZHMhYhxIIajV8999GqCaFVZmGcaQ=;
        b=agkq/lgXzkFsqfPJ3dOH8TMFMEu+QgItqyyyG/YfPuLWWiI+LA2ZK7mHuq1pRAL3Ta
         XN+C1lIc8Tkthan2QG76Y7SIbJ30ncDQU2IYewwyYsEz7CAxjPlPiB6+bTFCBEjcj6yt
         /jCElSPmidv1Setx6lpbOQAeIOSATOrDiOI67qT1syYTYgPf/GWtwJEgy4S4D1XYsT/9
         NGmvxp2CX/qFziJXOs1ShOCCHY/5IjgnOyWJ9QtrhAQZ+1cDc1uFJjQZYhaR9mU91Kx/
         BgU0oKQgzDwi9e+65b7o+NwjYfOG6w4SAghCyRy2FbxaR7rDXTyFghUgNoOS5nlJT8fw
         3UMQ==
X-Forwarded-Encrypted: i=1; AKwUvBys6UoK4POs3zGkGgY4gy42tMkzFWLR7u4V6t6VbyenN3rI2TykA/YYWOOnxfJ3z1cL5JBbunaM9lMEgZDx+9p1@lists.infradead.org
X-Gm-Message-State: APuU4Z+kh18HJ3XXKG8gzNQOUq/1PnCHVTn7x6DpRx5O21nSlCN0I6gK
	vTnBTa8BVsCSp8U+asQpHtv1TzZuCBFfoh1MzBlscPdNU1Z6fuIX9/VPUo4kQ/Pt5Va2YV4Y01V
	ECph65wd1qG/hbOOt5+S9Ud+nAiZBQL3v4iEAY68dqpIpgAs5SO9ZmiWcTfSF8nR4jHM2MNC6da
	zOVdQgrrPYsOA=
X-Gm-Gg: AYBFou1r5HNjpvr3RnfCrqJPlSKdGzYiyq7JHae1GNf1rQ6lRJCCeVZegijPMzxVKtw
	2xm1YibugPdpEWQaVYn5U5l9jXDQsr1rD9knMdSRYL/OM8A7EqpGao5crso4LlwkAio7koqeUxH
	RY/nyimSRDXzpcn0ai6/lz2UtncKHInVDea0n8PFSXEgyhY98IL2Aladn8FPKWJAmU3W09wSmXD
	B0P/rUIvQyYKze8NKvAtPvp4nNvmVJe4drG8SxdOE7z7OJOmR0ns7n4Gm+gpkqWvcnhas1atcqb
	HR9RQ4GxmUplHa8sUQu95sO6TeztwkczarglzaTW7y98FrD/qgp7hG8+t6QWEYhJg3go45hg1Gf
	pD+JEnHrfRlQXtuC9TapbHDshRKWrqqJnr5+S+OI+sCk29/VPhabhNjxoUgFavID8VHqZEGmSJ+
	eeNR1JtLjtjqCwXa2q
X-Received: by 2002:a05:622a:4c1a:b0:536:64c9:b1b0 with SMTP id d75a77b69052e-54e1496d927mr73578391cf.36.1794011607838;
        Fri, 06 Nov 2026 16:33:27 -0800 (PST)
X-Received: by 2002:a05:622a:4c1a:b0:536:64c9:b1b0 with SMTP id d75a77b69052e-54e1496d927mr73578081cf.36.1794011607417;
        Fri, 06 Nov 2026 16:33:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm32684126d6.10.2026.11.06.16.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:33:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:33:09 -0500
Subject: [PATCH 2/2] spi: pxa2xx: convert to subsys_platform_driver()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-spi-subsys-v1-2-a51a08f21cf2@redhat.com>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
In-Reply-To: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
To: Mark Brown <broonie@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=g2ewlZkjpkqGNUKfIKVBhFWyd1ww0rgtdqdUZikqli0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFZ79Gnr8VqxV2xXlxut6DlN2X/yyUWh96xJGle9LF
 nbPUbA51VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBErngyMjzPmXZdcsHZs9/2
 3jzqOjmn+MO0M+ZTSl48PrLIZ6eQvqIdI8OJf/9t3lUfZ6iJl3m6zNZU8EJo/PFFj1fs3Xz9N4d
 mXiYHAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kGs9BgNNpgNj2Qdzjs7WDbOCm1LKYKrFAEuUxbMpliE_1794011608
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_163347_752923_3B2421D2 
X-CRM114-Status: GOOD (  13.72  )
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

Note that this needs to rename the driver variable to pxa2xx_spi_driver
to avoid a compilation error with the macro.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/spi/spi-pxa2xx-platform.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-platform.c b/drivers/spi/spi-pxa2xx-platform.c
index 849a14cd0343..2151ed168e57 100644
--- a/drivers/spi/spi-pxa2xx-platform.c
+++ b/drivers/spi/spi-pxa2xx-platform.c
@@ -198,7 +198,7 @@ static const struct of_device_id pxa2xx_spi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, pxa2xx_spi_of_match);
 
-static struct platform_driver driver = {
+static struct platform_driver pxa2xx_spi_driver = {
 	.driver = {
 		.name	= "pxa2xx-spi",
 		.pm	= pm_ptr(&pxa2xx_spi_pm_ops),
@@ -209,17 +209,7 @@ static struct platform_driver driver = {
 	.remove = pxa2xx_spi_platform_remove,
 };
 
-static int __init pxa2xx_spi_init(void)
-{
-	return platform_driver_register(&driver);
-}
-subsys_initcall(pxa2xx_spi_init);
-
-static void __exit pxa2xx_spi_exit(void)
-{
-	platform_driver_unregister(&driver);
-}
-module_exit(pxa2xx_spi_exit);
+subsys_platform_driver(pxa2xx_spi_driver);
 
 MODULE_AUTHOR("Stephen Street");
 MODULE_DESCRIPTION("PXA2xx SSP SPI Controller platform driver");

-- 
2.56.0


