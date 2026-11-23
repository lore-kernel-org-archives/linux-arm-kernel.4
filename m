Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B594606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j5n2Uz2w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWGi/UYf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=; b=j5n2Uz2wkvM2kp8+mgSA+3zcU2
	GDnzap7F2EADV4Es6mB2lPKXnlPQVmL7VUY2vz93zEiSUxr0tpqkCCrBSF7SoI/9krKQD+gTtCdHL
	+N5tXWAB0T2KYhPy9z4Qpql5FwrHrZF3sJCHyEIBMC5ZS9bSYt7LtJx52/wSIUB3Wm4NGjQ0G8OpE
	QUsaHBi6J1micdzpnWocrIUx6vXASuwMPHuOS+F44836DZWNtxDJc4Oph1xyntqYKGD+lvNAe5uu0
	07uMSRXBQFnquya2BIlgChRSQ+sObCbQsD0ya9kBC0wrBfs46Y3tOobPsC1UnuIm0Xvums/G6dkUo
	u0LB6Lxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXhW-00000004KnW-3Ldg;
	Mon, 23 Nov 2026 17:19:34 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXhU-00000004Kmy-2iiI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:19:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1439571b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454371; x=1796059171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
        b=iWGi/UYfCTU20PgsfuUHy0gGGLLGTqeFrGRB/yyZdZNWTTtNqUvom2BpjoaA7AOEXM
         S8pRmZR0hvYrnZ7hJ5eqen5hNOA+tYc+hjFVr+SBk+cYaVy3Eo5pI9CZfix3KRKxz6HP
         4YdkkbzKfukpGeXSCJ+0kjtKFPTnZ3XpXkZRknLt0kCEU0hNavCBgOMGFqxrn8op+xsq
         rVJbnUbMBdtPUmhfHf2yVxPRvFBxaga50kMjhd5210+e1aXVPkE4Lo/5BJHQbbBxQO9q
         5Yot6pCBXycifQq7GC+ltQ6bgc5YFv/kUtcw24f4VsOXXwJmSX6sFusjA9p6NHDHjm7M
         0UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454371; x=1796059171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
        b=HLLkJNbEgnqZW+OOa6C6Ry1gLHggFeNSSkDUTNS/kblqBxejXn/4Uo8IO2G2KqWdpA
         bQVNuhzmXRbJxNIzeS48NITQ1u3xPqZhBPtNXPugHeNVYsTajDj1ZWEdwcahX3APNVHu
         QFyYk4lMBP7iIXsrzMxS2dbkxszaAf0JZDLb2VZNd5UScJu3mKOrafd3UIdGlaG81IJW
         e4Yq/QW2rkJOUo2k/xOo6TUQtH4KV/3+LiAV/AtQnPwDwVj2ECQ2Bk8xhfH8rOvHfSX3
         8e2azQLKMdICCxskrILywkpT8kZy/KRxC96gryAZA6wezKtY1+MdEHHGanSz7lFGkzRD
         E6jg==
X-Forwarded-Encrypted: i=1; AL+hErG0/U+AprAsazdeMj8c6oKHhhnmq1k39OLFarlgP9em1nrKtfV6RkdQSb4/abvrmtqF2rrGvvs+x0my/orBClK5@lists.infradead.org
X-Gm-Message-State: APuU4Z8g5g+fCKQJ3Q7m5pkUlGVSn+IkFnU1hc3aSQTUdpo5N0IVtevw
	/uC8ZAdMteFflPNyo2X53iesosUKtz/E8f8a/QFjDy6pYLvv5Sc7jaw=
X-Gm-Gg: AZFdTZfAQXjfmX5rmOuU4d/8bOUZS/zY6mzm81KTF5rWUXGbzq2G67OEmLOTM7Fpjz4
	qoRtMk/1IDpF35qF6UbSCOm1E10K4uNfL0mM5nuf7rOT5E8Bt01HLSb4x+1hCjal8fpj6LR5/KC
	y9osBIfWJaZfoFbEPM/jPJXGDu1BdrIqwua6nvbpbqTkm2kt6peb5L2dWzJF06pBqw/oI7EHS34
	NwwuY1jjkhkowDTYOTKRlwNEZwV795LZlpCRKLKwQ4K4pYQpde6EvLzk3I4vSzvZU0tGWLNq3HL
	hW20n28XA6JmOJAZgMo4PB+aDvuCBY4ZzgM4KJOKi3nZoB0GxkWv/S/qcHiiX3RYS8ENJd7fLd9
	itQLzz6UuTIOdDFHyE8DWxOskhc+PraZ0K1iAp6Dx4dpvRbHR+EhBnBk6K8AoVfWXLeRN6l7on2
	XD1vvxx8sWD0pLG1YddGgN1n2bPwEZYXR4T5TyHVV30y/sDy0lSM0T1qUQUbqUbcKIG/Mn5U8QK
	a7F0sk3YDESvL8VAfwI1AJhFxfxT6RuWxnJg+A5ISa68fM8TJ+1BkNIOEssLQcL56uFxz/m0LYE
	6pMXYk1QyMclrae9ZQuRatqvVQ+aL/6UQnA9W59lzfgsYw/CO8TdZLX02cL5reNyK2rU
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr11130870b3a.38.1795454371512;
        Mon, 23 Nov 2026 09:19:31 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:7883:5066:4773:c572])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cf5bsm5985151b3a.52.2026.11.23.09.19.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 09:19:31 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
Date: Tue, 24 Nov 2026 01:19:23 +0800
Message-ID: <confirmed-20261105-18-6a8421e1b241@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_091932_690055_EEB022A2 
X-CRM114-Status: GOOD (  12.91  )
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

The child-node iterator owns the reference to each PGC node, but
imx_gpcv2_probe() assigns the node to a newly allocated platform device
without taking another reference. If platform_device_add() fails,
platform_device_put() releases the node through platform_device_release(),
and the iterator then drops the same reference again.

Use platform_device_set_of_node() to give the child device its own node
reference, paired with the put in platform_device_release().

Fixes: 03aa12629fc4 ("soc: imx: Add GPCv2 power gating driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260530004541.E04701F00898@smtp.kernel.org/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/pmdomain/imx/gpcv2.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/pmdomain/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514645db7e0628bdddcf579d1f0d904..7b377bf0196491298e9e772b97d15a2bda9ff83a 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx_pgc_power_down;
 
 		pd_pdev->dev.parent = dev;
-		device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
+		platform_device_set_of_node(pd_pdev, np);
 
 		ret = platform_device_add(pd_pdev);
 		if (ret) {

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

