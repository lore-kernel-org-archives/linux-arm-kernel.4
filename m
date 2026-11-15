Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F0606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rbxX4OYU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q1+k/83u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UkiklBSmigTGFwB3QGp5YCKUqwJdvyqJPa3i1ak1MZQ=; b=rbxX4OYUpU/MNpqKCXg0ilKaqu
	V5zQNd5zsESeSwi5iWdPrP+L9HuiERuw2B7NmaVdQNq+1/s6xlF3dsD/NCTne3HDKEevK7zE3egFK
	O87pXlJ4nP/bUShhXaO9s5ZTt++rDOr/7u4n3TeGnZNWdUXjVKccaqwsoH9VWUgaZqWYPp7///Aij
	kj7E20encXmzwTl4f5X8apQD2VzK7epGyJKz6ZtgPm32sWhgA30OjfRKwS5uYsr+s0XZcXIORhkLp
	z13qeYSU7eQj2gkhb23xaMR+XrpO42iYwCeZe7bq9U1M9HD89UrHftpcbxqpx2qPUpSgUmKXPfw3m
	xpHQXohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijk-00000000e5f-3XGP;
	Sun, 15 Nov 2026 22:30:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijf-00000000e3X-1WQX;
	Sun, 15 Nov 2026 22:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2400F438D1;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=dmf26HyWukgAprFEkSlfsNpgDQXICvdQW/TUfDQgI9lR4QAPa6F38bLN0GeI/XpM2e+o
	 4nYP4c1Y6knHYve0WOemxi8R0hhY9L5IbmY0KbsVhlU4HGq2CRO/ZxQ5vynghXmJIrtZL
	 a+lGXVMm2BasHhEmmQpoabRhlM0nm4WKfVg3FF0t3a9OZg+vAE8Ero5sb23eIeB8SiMMJ
	 UyIYhYvt9WZ1mr7kGSq7FxGUvPpN8O9wBvUHTozo9aum+c8ZF+S4sy2NzBbc7Dfe1+lTf
	 1Qr71tWrfzq3UzwGd5x4MdmdnRWycMGtwhETVqpeRhYu84ho+yGXDFRQisORdP4lHrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UkiklBSmigTGFwB3QGp5YCKUqwJdvyqJPa3i1ak1MZQ=;
	b=mHIImkop5QdIYtADJA4jCkOJB4yLgdPM6NIuAsS9zHwStduktaS2uwOu/n1S1IaVlEft
	 zeBJVCdaCTpRC8ba0gP/caPVh0ixiI7Z7gUTQYvBBr9SKzS0eNyDeIIA0bO2IPLZoSFjH
	 6xfSP1bdBncoU//0vo21umo+jr1T1yWBgv5g9Hl+N6uZFyEQtmwMKhHmNwPBhsi8UsdUd
	 48m5djhHr+bQVU8vYB7VcdzCnTX4yWK0H2xcU99ScO1t8lJ1wydlbG4sHDeIVYTnSVqEL
	 8Vcs5D/yFMrDzl1u3CKUw0HzVWkB741JSSYei5WFGkJQIhiXS4mIbgp4Og0Wu5cK2fg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7D9E1F000C6;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=UkiklBSmigTGFwB3QGp5YCKUqwJdvyqJPa3i1ak1MZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q1+k/83uIokbGty9IfQqgd6b28ScGGgmrFr4Pxu2GK5UyaLagznW3xG09WYCPFtKS
	 WGtTx81CLmgpKLtfBWG7P8yqCjCMUiaw0hE7NGpYpwXuDR/gjZrNUtuff/tZYWDGEQ
	 QH1caldzFK7ANgdCcpQwdt+2/5QowyTy5BNPHn/WuHf/GtbtDOUxYxT8YoQYFGOuOr
	 w4Ujdn4gTx4CYWkJxncePQ67N8V9mwCaa0K0zQ+zk9FqJQGv6EDw3H83DqNmjXGSF1
	 s4G/CvffQfaQ0QyooUIjvIE2690JZ5hpol+XL6B5vzaPrs+uZm+Wjl01ZnMKYOslYT
	 pKd9PNq5HkIOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7471D4A224;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:37 +0100
Subject: [PATCH 2/7] arm64: dts: amlogic: a1: Add ranges to periphs pinctrl
 node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-2-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=oskDA3lqc2OXkomXgBBue1EJY5c1W7W4Jw8yaVrxwc8=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo5RVdYkvJ4tUbw67vWqhh93cb+1r5UT47rxjZMpg2
 T1/5Yt3HaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBEDM8xMrxjb5z2kPWilo1Y
 f3tE0mJ7l2mhck3stosrZJb+utc+k4Hhf+CBy0s3WEb9X5u3ONJ+r9ayk5c2egcd3n5p9rxkmzu
 SArwA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Building the amlogic DTBs with W=1 reports the following warnings
for the periphs pinctrl node:

  meson-a1.dtsi:131.33-483.6: Warning (unit_address_vs_reg):
  /soc/bus@fe000000/pinctrl@400: node has a unit name, but no
  reg or ranges property
  meson-a1.dtsi:131.33-483.6: Warning (simple_bus_reg):
  /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges property

The pinctrl node has no reg property of its own, and its empty
"ranges;" does not describe which address space is translated to the
children.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..f59495c1885a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -132,7 +132,7 @@ periphs_pinctrl: pinctrl@400 {
 				compatible = "amlogic,meson-a1-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x400 0x0 0x400 0x0 0x198>;
 
 				gpio: bank@400 {
 					reg = <0x0 0x0400 0x0 0x003c>,

-- 
2.43.0



