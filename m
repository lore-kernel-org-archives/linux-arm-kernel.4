Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AD8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ylJQhpK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBEYYEus
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=; b=1ylJQhpKLchpdP
	sockyKdojwl6AXHvYHwtGRpMeXZ6GGgSwGIZso+xR4sN7zypj7HWN6Ifo+hHjQJlA67qK0dBWmv9V
	q9IEu0XW/SSndD+EUi5kZ2kLGf5G+EF8+VrafjJBGZM2Qrv9OlQWaxCVXLyrOrpx6phr4+H6zURLt
	N2PdRc5LbB1EAstxm6S3k8fzobVMfTdNVvvP6COqOPtzDbUuDAxETrwPlS/m4omoqnNSYjVHhFDxo
	xr/TQTAy0nAoBUqVMkTohFEPGLxTGyJbBRS+gduDviIqqQChmPc8cp+vSRV4t8kUPvLnBe+XlF1Zs
	qlGRnrR7dd/oBPjCvs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxRR-00000007mDN-2mkL;
	Tue, 24 Nov 2026 20:48:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQc-00000007lhQ-0YBJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC33B45BFA;
	Tue, 24 Nov 2026 20:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4D31F000F2;
	Tue, 24 Nov 2026 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553269;
	bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LBEYYEusI0eGswHz62x3zy7t23eZcqwxp1riyC1v6vuseyAM6ueps2nM12eLzqy1n
	 88d8asmSTk4NwNUvIZIUvIY7zjyzT3Wpi3m7x8iQ1qGOSFtdDIs5KTudFWinnqXAwI
	 qh6V9wfRMPrBgCmEcc3Pp/rRoYWuYT09u5D518aY/Hg8dN5ZNkNFk2ct5t3WK9zDSf
	 7nvoJtyvE0gHxEGYFEi8n/G6krD+8hCPLGSBf2/uTQNLAId3EGeiC/BIOVSRhv57oh
	 HPGR4vRUojKahJMD8JA3r5/2y6fA8jsCJpM5ubh5EWF4br6QBv7fQ8wjhjfqm6VMUV
	 reT9tDXUKwJ+w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:41 -0600
Subject: [PATCH v2 8/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add
 switch fixed-link
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-8-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

As the switch port 0 has an 'ethernet' phandle, 'phy-mode' and one of
'fixed-link', 'phy-handle' or 'managed' are required by the DSA schema.
The expressobin has appears to have a similar configuration, so copy it
and use 'fixed-link'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index a881a3326dba..93af902f4f6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -161,6 +161,12 @@ ethernet-port@0 {
 				reg = <0>;
 				label = "cpu";
 				ethernet = <&eth0>;
+				phy-mode = "rgmii-id";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet-port@1 {

-- 
2.53.0


