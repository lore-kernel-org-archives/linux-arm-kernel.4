Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C4A606A680
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IgyAnaJO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Slu8LTZa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gnUxDr8iTuCvL4uQT+IasewkCi3fkXXy/fajo1SSbUM=; b=IgyAnaJO8UarSz9pTu+/w/vbkv
	pQrD5qw1I5dr2WqDDXD3P7JaxW/qRXN6z/HxZqdzoMrsdqJHDFQ72yxsKDf/x7ne/Znw6xxQQcdpR
	Af0SExbtPbwf8ogExc19CjqakkgrG5oN/fe8fNXwwNk1BToh7t8VhREwitNwBEgGh0QIxMjCJf7Jt
	wKx+LtdSSvbFzjNbp6nkFPt35pVOIJtoL1Hr3ZZmzEOsLgxdjYpI3XPIBRi9Y9jMD/MItUTlrt9u+
	L5c6bm+rQuvfilUPqqCa/KDUnCJEFytSNX3jyKwe5pDhkmAVjmXFj0zcmnvprLdGibRZKi9QoeoEB
	IEC9Bqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Px-00000009Jeu-2EHe;
	Wed, 25 Nov 2026 09:35:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9P4-00000009It3-2PCj;
	Wed, 25 Nov 2026 09:35:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3A3D62632;
	Wed, 25 Nov 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795599301;
	b=WQBPDHntzSwWojbrbMGuqd0j682Y5SGoiEd2Xc8quLC8JdvvOSvc7cM9KuYcb7kPtisQ
	 OKbsk33NECwqmcK3ZEgRzZxZsGn0D9Bs9fwB+k5pvg1f24aHd7r2M6VRFJaBESoPg5Ics
	 7034lYMBkSWXvBm0ChJMRIG5a34QzXffKOuchv5C/FEph0+VD1fL14O+hnBtXhOgC8b+6
	 l1gh6yYiS04GcPNSV1EdZjyKa7TVePD3svflyat0U/v/x9sYPUJU96nq1eIIh8rc+NYAQ
	 rB49SS6AqgN1oJG+azLCvQRIyvBg15TgP7JMAkqKbtqnKHPYyZauB1Rrsn/ruhmNJFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599301;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gnUxDr8iTuCvL4uQT+IasewkCi3fkXXy/fajo1SSbUM=;
	b=xxZ/7GYvHuf3R7H1Mr3p7jl43fC/oyGJQB0/ssJIZ4D84nGYXs/pmriDrC1+OOCguMh8
	 PgEQrqbUWh727AVKn0WIgMKpcgV02tyO3wl3VADyMAIUfElEawsG7iM14BJX08fY/QTHh
	 aIAIlX97KcEEntLHws7FfqZBz6/n3tNkgnAbweacqgqIzf60OWrVTEVk5oGyzPGu+NUr0
	 Ts6jbj54pa0qDL+qFXaOwWYftl2b26fubJ+8nMqU3gL4SeiM3qOrx6qAvZxOhrAQDXeIs
	 klQT3UeUQbL7lpwRGmAAwzvJ2k3LGzkZZMIA88kRScPdNtISfWksoXN9h+07NycSCBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE56D1F01576;
	Wed, 25 Nov 2026 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599301;
	bh=gnUxDr8iTuCvL4uQT+IasewkCi3fkXXy/fajo1SSbUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Slu8LTZan2+5q+msNfA966pzDIZZXhRhv9xccOF70UiHw1LrNIwYf6mbyVwiBsfVn
	 4MWz/+MlWGUdbUH4tXzvgMCozA6A5ihdt6yrx5C+mRiI20bVEQ82ZdAZPEHSY5gzAg
	 P1KSRH5ATPxIa2X2oFoYeY83I67zA5V/VZXt9ZqlpN+0xQpR2ietbZHqQAOlZpyF7J
	 F1+ii/n8rBJ9SPwTmNv8bNAYqgdQi2EPnYTmB721Nv0ut7LFveu1Zq0Y4jmSgJCWPa
	 HwALJehn5LaUM9ddCsbYd8p7uGkXjGzvVrruf40kAeAkYuBuPCSf3D5x7RP4zA/GwZ
	 woWe46IXAiemw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C40964CE1E;
	Wed, 25 Nov 2026 09:34:37 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Nov 2026 10:33:54 +0100
Subject: [PATCH RFC v4 12/15] arm64: dts: s32g: Add SCMI reset controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-s32g_serdes-v4-12-3bfe0589be8d@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599274; l=1237;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=l/V60bH7c4MUIrvfEGRqXVRIYRgJeQupX/xfO3YQ/kc=;
 b=2hlcYHc724i5xgwbHJrrPvFzLGsD+Yg7R+zpFWle7rFwYq58Nc0xacCZeQW6osTBrTKojV+Zl
 bRRMqKdmJ+4Cx8drYl0A1xFK0r1iqnoHcC4MNjzUsmGQLxqm/rHiGpz
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

Add the SCMI reset domain protocol node (protocol@16) for S32G2 and
S32G3, so that on-SoC controllers can use SCMI resets.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index a7e5977bc146..ff5d2a061d50 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -100,6 +100,11 @@ clks: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
 			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
 		};
 
 		psci {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 0770af61a2c4..fbe87475bcf6 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -139,6 +139,11 @@ clks: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
 			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
 		};
 
 		psci: psci {

-- 
2.55.0



