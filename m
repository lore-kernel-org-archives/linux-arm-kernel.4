Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD76606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odvPctle;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mebzoGBR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lF5UuwW4GEyXYzWJ6CNQ8ISStsij2YV9+m0dlGsHQ5I=; b=odvPctle8QZpKEh3swOLQxE9UA
	iqLsfLd3dxDTJ6WgKIL1zv1iqMnYodPCvMasDt7BclnVj8F+lalskqXHWkbaP2p8Gt//bU+JBdm7+
	RzltmzsgkMCGRvvtE7pcgjRi6XpnwHRGjndkHYSvkxENqpEFpeqTk4Upgq5ZLQ1D8r/dIA4pfDD8U
	JSfwkL53v5URSpEghxGFmO4Rd+2jnMaueLawXPCol+Aq5ki3nfydIqaLF4kcXwP5a8Q7boxbsRrT0
	2kfneiCGWSCq1UkBBiAt8l2OCpCqFAy23tPrMLhAQ3rfHgUDSovSfmpM1e0iq//EAKqZLYEuPFJfh
	laAEBqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ow-00000009IjY-1Np7;
	Wed, 25 Nov 2026 09:34:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Op-00000009Ig4-2pQP;
	Wed, 25 Nov 2026 09:34:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE6F162273;
	Wed, 25 Nov 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599286;
	b=E3BbchgD7DRDbS6n3Tpstg8pD6LtLETP0ZIZYijze3hez1QyaMGP4UaZ0JNv+UI065VJ
	 ac64h5z4Mae7uG0WVcqKc5OO4isVM2Oa9T7SdqkTGro+3kPpTSQrdu882d+T0SiR7NoE+
	 KyvlxxVEi4+vbLQOHwuPawHEekF0i4+TwNSdJYTeONgIlfD5vYWXHXsL6Lrh37mchZXcc
	 gFw0MiVCPjDwZA/QzUVb8MoYMtaOj+ej9XZNKRYSzUloMdCPD8h4/ZpKMCqTislPRj7MQ
	 7Qgv/Ad8dXc9aWTOv/P+K+/jFQ36+0oAL450ThE1zwRh+G+otG9eIAdoG/64yVqyqnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599286;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lF5UuwW4GEyXYzWJ6CNQ8ISStsij2YV9+m0dlGsHQ5I=;
	b=ujizd7Xvx50ozHMHqNjNprqFJRplRQZFYU/w6Kk4NfU4udzlLcDeBYbAAzJEz8AqeZAA
	 bpO7zzGDUtupMA0xKCZKP4GkIpF/B1IVE4ViPrzi0HqtkbLjc8vmRx1lg8OHE6NjTFvlU
	 SaOMhyGXCuF+wOwioC2h0AyeO4ERMhf1gXWbQwZdUIaxte9sBSOmker9BP/EivRdj1nvY
	 0IWsknk3H5/RfDgfRuaIOxyXTcHGK1MNnnxljz+BwoLBM0kG2pmfmXazmB9oFeX1SBg8U
	 T7MbRVHKtMN/ooBGCxhbRqaHwFvHwUjhH/ovQ4dx7ZRviFzW61gOx8FbmV+XqVO24ZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 130C81F000D0;
	Wed, 25 Nov 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599286;
	bh=lF5UuwW4GEyXYzWJ6CNQ8ISStsij2YV9+m0dlGsHQ5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mebzoGBR8YxE6sIUuYztGqWYTeK2tMHqv0ebtkmP5XRZ0Pa/CJtEGzGQtsDdeo4ko
	 bp/P5OnVC1zZ/sa2jaKF+3/xgfbWBjBsvxouOnULljTUFNOF9S+AoHFDp94oAlXYeY
	 fRGtm9dWFe6ALBj1N5rxbyTCjRhnsXrRGscfV2UN+8fNDhEbTy5jUkjx0v1J1AvzA+
	 9ykTjlb/V6sAcMYSuItcF5wBWvpwQdBMyJvPRwlfg4tpng/LmkrutIsD/8jItW6u7G
	 FVQTPlP+bMe6Kc6MS2FS9IszV1wj9VMCLKiZm+EtKMYxtFxENfbIw+/7ILCh7ElSvN
	 9Pp8WXIlIjiSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 95AD74CDFA;
	Wed, 25 Nov 2026 09:34:36 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:45 +0100
Subject: [PATCH RFC v4 03/15] dt-bindings: PCI: nxp,s32g-pcie: One PHY per
 lane
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-3-3bfe0589be8d@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=1169;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=2T8jUwEi3ltYre4gdZGzsO3mt+/q6xBMsHs8FYuEF3c=;
 b=XbAHEFssMX3nbhcwDXGXMqYOtnF2zGW+H0r80LanO7vG672d2emcQaF/5/QcYFy2PXzjshoH5
 5Z9n+6m6KtKAsPR5RSPzrFIdTz7Sr2W6MhknODVlgLZvrBRJR5fdO1S
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The SerDes binding describes a link with one phys entry per lane,
<lane PHY_TYPE_PCIE 0 0>. Allow up to two entries on the root port, and
make the example reference lane 0 that way.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
index 66a050028278..b90d169f57ed 100644
--- a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
@@ -57,7 +57,9 @@ properties:
         maxItems: 1
 
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
+        description: One entry per SerDes lane of the link.
 
     required:
       - reg
@@ -124,7 +126,7 @@ examples:
                 ranges;
 
                 device_type = "pci";
-                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+                phys = <&serdes0 0 PHY_TYPE_PCIE 0 0>;
             };
         };
     };

-- 
2.55.0



