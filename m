Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE96606B038
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j2KwX8+E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxbFGovA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=; b=j2KwX8+EqbOkrN
	hK8KXwkamTAeNu8T4M4XW5LNppR32UJlBz66UQNc9YYXknE/3t+E3J2iDC++6ZcNatyrz0/hXTf9o
	TNO2Ce6ohA1WiXTRxZbw65tbQ/iGyuYSVWmnmsoyKeO16gR7gl5p517/taLZEL/LjvO4mskkC6a3+
	XaE5x6BYIxVbRK8AeGDze14U3zC3ERpAJHcnSwbVApR73U4rgem5AuBUfIHU6nNatXLG642x3+zYq
	5xrG80FFgCKEDho2Eun0k41yHk0ceHprjf8mM6SBBakaMb8JGd35znnrar+8kYmXdvXwO3EPS5l3C
	tUlGuKvGldVcCu71PiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2W-000000080Qz-1xBg;
	Wed, 11 Nov 2026 22:43:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2N-000000080Kl-0iCd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE99B42AC6;
	Wed, 11 Nov 2026 22:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805641F00A07;
	Wed, 11 Nov 2026 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437006;
	bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QxbFGovAddVgfQIBYt3i06TYTqIA+xDMdvDo8WJTWnPzCj1V4h+CSL0XpUJgV/eWr
	 GfkNoQ1VjRK3K1z08+/VGIADIV995Dot4RllhCoST85lE3ybquJnyXzhN7ij7Kd3OR
	 uQPtuUVs29t3UvaGQTXRr09PTbQv3dD0v8ftRYKVEsYw7c1329rjSjIqcneF50ujj6
	 aqOWBfZPdR0hPbbidIWsV3/H8lYGESybD1PYDa7owc+vk5nyF7eH76z4gUhC/3+riD
	 V6jBpwKYA9i3pzdB8uoAU4XK5dI/9vehG16fFIgKo1qSp/GChpSRvWsD2cybIUMTxN
	 BfzOpUXnW55mA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:06 -0600
Subject: [PATCH 9/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add switch
 fixed-link
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-9-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
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


