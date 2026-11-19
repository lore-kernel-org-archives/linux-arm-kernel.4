Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D860A3806
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XZGqBN80;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evak3zEa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n9rU9fO5Qrq2rYBu3VO9CChwd+KRDmH7T4kLHduQ4Uw=; b=XZGqBN802cCGfa
	fdqd3/IBvgdKJI1tiPA9D6txlkV8FxSgDFw6X1g64myBNQ0uEnmZjyNBPdICax0GKmr1+lLY9O/Md
	vZSGEbBGTAlKRKkslkQgxNJsGZM9QidkQVXqJmxCBjL720od7Xp1Ib5TAEXx1h/xE//xxI3q/kcKg
	008CKSCE8vFI2yfyzBL0RQJ9uxKJ9UGtHCFTuLXxKG9HbnQ/oBdXKuGazxNOOjUEA7Pnc+Wya7Uz7
	x4WU1m2b34O+Pla0Isfa2Dhfv9X2aVWVFATqhaMINcuodE265etZltFOWmnlzAg4mw/zGWvym5gUV
	HZibbw82aJVOPbdYug9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88K-0000000DGYN-3oBx;
	Thu, 19 Nov 2026 19:49:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88J-0000000DGWo-1CvP;
	Thu, 19 Nov 2026 19:49:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F38E45F5B;
	Thu, 19 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117762;
	b=AOQ39pSQcAYlTGexZuK3+D8cCU9NiMhBSBynePNOJw/XeWCeI9NCh6pOPzvxkZ0OyJY8
	 26vFOYHzgASU/hzu3yxLKiW4EhqZfrQspldSwD0jGy50ChFr3HaFI2o3bN/2sj/K9iE+b
	 YtlzEeYdtDjdxsfKNTQcyPmWNP/uXVhc2+s+5Qq+rmcrZSZy+idqAQeMP2eGCJakBysEn
	 AtNPe4A4T9hmmn2KXf127Lt3iSvG9e2hRi2UYvVE7Q48JODEx4BTKR4y5XqG54aMYGFze
	 gB/QmolBJuenDk2tm+v1UIn+iZSngeJLxys2VdEoEIu3XPwXIpIkkUqMU0Jln8uGw4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=n9rU9fO5Qrq2rYBu3VO9CChwd+KRDmH7T4kLHduQ4Uw=;
	b=HZOe0CspcgyAw6mJ8Fnc2LDehZy+kNGq62JqUl0oVTWH8gC1kKXCLFKFYjKQLDNlsM7K
	 fJnjB0KmRxHPV4wH79vug/bbEJ5+mekJrXsjuXoBHGr9eopkxP65Jxy1tqTMT+LsulAAO
	 PCkuBCTO1k8P/Rg8pH63iVMVo55xY6Npm+k7sRRvsnjVEDd6R7emJtCG09Ca1QqDfQI+r
	 lpzSTjX+c3w6O7PL0t5/3kfLWD4YLDkobKXCd+gip/lQRRk85bq+sZOB71nTLRb94rdr1
	 Bpvd9CqIQbVOro0eza9f8W1slWuq9OYn1pqM7WteRsiQCkF0rEFPO5CAIB00HDcPNug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 920AE1F000C7;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117762;
	bh=n9rU9fO5Qrq2rYBu3VO9CChwd+KRDmH7T4kLHduQ4Uw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=evak3zEadtcM26+vGTGzFWrBbIVYKOrVIPvyBC8S52ZOR/dRnS2ZWpLs0p9WhNO1r
	 MuM5QZvOp5MlpThLqr8MyYl9Xc/46JJXM7ftbEjJni9JRcYJvfCE/IVsm5WJHTvL5A
	 uX7YU4Bm5sYihyL48V0XhR96veF7faZZwzM+laBLX/zZCJU4ejS6G4nRj7PuGhFYuZ
	 jspfFeqnC95zH4RkLptvs/L6QnQ32e7V3adcGoVilPifeEY0sxr7J5xds/pnKvNYIH
	 fjx4tSLj4GJASdaonP6+0KqbThMrEECxx7EPevu2PBopcwTTczLkmAIAn8H0hO3Wy6
	 ErgHGbuyzQu8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F3DE4B3FD;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:17 +0000
Subject: [PATCH 1/6] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gta3xllte-usb-battery-v1-1-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1416;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=hf78BaYPHXU8fTomC50BXpD7afJqnpvHdHzfX9Bswkg=;
 b=hMXfPZsZK+A9lZWD6eOC0XTSbJyALSYtYEkVrFQGLpAuCihutOJA6vGD4DgZXJ8wZaWwZjhMf
 c3mO7shKsDDDvIZTyvpTc77yj/oa4tgZTRlBIRSriVoPXElCP4gVcg3
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Virag <virag.david003@gmail.com>

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy

-- 
2.56.1



