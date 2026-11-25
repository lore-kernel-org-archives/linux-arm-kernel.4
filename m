Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uEBZ/Uo+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDVsTFrv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GE0X2Af1f0g88wp6AaRBRdIJWXxatq8TXaVKu/Afmt0=; b=uEBZ/Uo+CMdrsv
	KOfStJR6+qFdr76wWML9h1me0nnXuP4scpFuErPff7I0Mnl6ZmnNbgS0BqTqpoAp1laXopWPzXy8i
	LWOaLlXoleeBvgNCOA61O2TVsVZDhZiu1oRdu9a06Ale9curBEEBNaSlnxSA4WWxSCc/po2dtEv+e
	BD7ks4SiKuj/w2mrXAKVc9wVgmftX//PHOortVTgeJOBgUmOVFdpjiyKTjHFJKXOVlw8t7LILAICL
	U/Kk9riIunH0nPe5HNQW3wuJ+09lWOOlVziZ4nQFOpakPO2YalOergaAQymu7WjqtivAZsmPb2C/K
	P5T9R64CD2z6xFIXJafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9RP-00000009KRf-2Jnd;
	Wed, 25 Nov 2026 09:37:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9P6-00000009IuS-0LM3;
	Wed, 25 Nov 2026 09:35:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84B9A6255F;
	Wed, 25 Nov 2026 09:35:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599303;
	b=aDoJSC1WrCk30FvXCCZm23DtJpGGfKZ4E+pMT2Bn5wPKZr+STFkFWmai2u4HmUMgkr5v
	 1kXsdNO5VOMNCR4glnCLLtKuD7okPf8+4v0/g6ZL4jONCGoIY7no88FXPbOkDAGLKrsL0
	 sHB16Ealtql5pN6eVoRI50/0i6IIEwOGBhdES+VjWgnfHE3KU6Qc0IdxNAb+T7z1P2BPe
	 z6FrWUf+Eq8SeAYZ5Gec7bnHj2Sxf/JAeA+GuY42ypcTL4nJ/6Yfxgyo6d/Ko6r5uklyt
	 anBEDTqVxj630TNljkjTFaHTCpcLp0BRATqST9fCiIddeMilViPXPg8O3ka3qoehFxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599303;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=GE0X2Af1f0g88wp6AaRBRdIJWXxatq8TXaVKu/Afmt0=;
	b=OQEnMTfso6mprUkagjmmyP1Nek8+Ypq+uPwKL4gJwWkAgYAPbyTrd2dHqYqToELkcoZo
	 vsoaFaHqk1cos3VW1xv0uSu1sGsL4rRraF51PKrGqyGfMFRViytesmsPLbLnwbpQBK6xb
	 VN9SU0VnO9rY5QOL6Yb6zKtIHqOFBBMc7jYJGDN+KqydoDPvTfxV6oPx4SXqlDtWfvJ4A
	 AmKItDzdOFwM3PBvMeAGlm2iJO3d018NR5G1nBQ0fWBOpiX2YkFZQuRRRxR6w9Y1Y4ZC+
	 we7hSIY+pppIeeWEAqG6tLnVsQQTz7fBy+6yZI4Rl5tlgNU5sy2ftXeOxXV8x/F67TA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE2641F000EB;
	Wed, 25 Nov 2026 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599303;
	bh=GE0X2Af1f0g88wp6AaRBRdIJWXxatq8TXaVKu/Afmt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jDVsTFrvYlqAq+dA94tWpUMzQQ6OKIyhWJ+44xfFQynlxGiJwE1tvwFL6EC0GGpx0
	 WIn/4HACg6ZCAllPZlI+X4a7tUn1S1DuxxSMKafU8EDO4SiLZtxBcyWX1dfwqufe2j
	 YxCHw1ZkH+5HMDThEPsgbmhm6exJFLcUAIi6zMjxNycMAqHzhXjrkcAT8LfF0QQvqi
	 dImf8kj+69AMC3LvEpP9P77Lu7+CXSDiT2gOs1xGfTk05Ar2HMFG44mxUiWgfodRbv
	 3JheS6fAh7ag3g13/bhixOEkJnR0rLdPv4h1q45f/XJGVoVRJSUIr7qHolsoXthc/W
	 XEgLk+BWrKdag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A3EFA4CE1A;
	Wed, 25 Nov 2026 09:34:37 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:53 +0100
Subject: [PATCH RFC v4 11/15] MAINTAINERS: Add NXP S32G SerDes entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-s32g_serdes-v4-11-3bfe0589be8d@oss.nxp.com>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
In-Reply-To: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
 Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=1513;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=86svSsXyW7XbXvUHtBhNIUJ9Mfx/TitxfATul2iPoAs=;
 b=Gn3XzjwMZOtGZ1tpGqksVlxXFvvg/WVPIMYMlFPNjKYIjT+/z53UTUVfoAcEhSfLFZO4pJrFP
 rnLdd3g1YLCBeMxaKmPQkCpeiJ+E+6Aemr9FWq/nclrrZL9SVwY4VL1
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Guittot <vincent.guittot@linaro.org>

Add an entry for the S32G SerDes PHY driver, the S32G XPCS glue, the
S32G part of pcs-xpcs, their headers and the SerDes binding. netdev is
listed because the PCS code lives in drivers/net/pcs/.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
[jan.petrous: dropped the shared core entry along with the core]
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291f..cb465ba42d73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3449,6 +3449,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
 F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
 
+ARM/NXP S32G SERDES DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+M:	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-phy@lists.infradead.org
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
+F:	drivers/net/pcs/pcs-nxp-s32g-xpcs.c
+F:	drivers/net/pcs/pcs-xpcs-s32g.c
+F:	drivers/phy/freescale/phy-nxp-s32g-serdes.c
+F:	include/linux/pcs/pcs-nxp-s32g-xpcs.h
+F:	include/linux/phy/nxp-s32g-serdes.h
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com

-- 
2.55.0



