Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B4606B037
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CoO/nDBD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFJg7ifo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UeJIGxY5ErXXyutQODurGJuOPaEIwFDPftosdrDquo4=; b=CoO/nDBDgEHQFk
	XtLpDU7GRJIAuQnYP0u8w5THUwoXWFkPSXYWtzWNV7YgcOwLh8eGMGFCmjY+La+sPSJE5u9QseddI
	pxKzRo/YCC/f2xLPbq850rvadyguGoNXICMLU1iZEzRG5e3b0TFCuP6SGM+E4BOndnp3cm0963RgX
	Hhzqn0FYYiycRyl4bErisPt0pvBTeh0SWzqEV7IPOCaPjRC81PXQAaSYACs+USa9tNepxCps/Rl+Q
	ZkDjo9g9Heo5g5eKIRw4sjPsDR7EgEhlwKznB3LpxVKUe82x1PYgyicbAtAzlinnNivFceUJnuY3E
	0V1pvT4BjhTlXY9xtxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2W-000000080QO-1Ncb;
	Wed, 11 Nov 2026 22:43:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2L-000000080Io-0QX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C7F96398F;
	Wed, 11 Nov 2026 22:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6F21F00A06;
	Wed, 11 Nov 2026 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437004;
	bh=UeJIGxY5ErXXyutQODurGJuOPaEIwFDPftosdrDquo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UFJg7ifoWir3FpRhZXf10gK6sJsDWAE5nZot4uimGei2FVwGbQi09RGw73Va4/wCy
	 76nLG8BPhPOXoMU7zmhaHOUQazwjcZVOU5QoonImdFlRDiLwxFx/Ih7akKV/yk90Oo
	 q3wE/bPd/7UyGjGI/wWgQVOhQYncjO9kbsr57XEJ3BWbbVa+0rSrlsqpC7RxMh6XCy
	 3Np5yTsPSd6D2cnFlwGMrui98dLeTo3QhZTbh9ALkBBptdn0OIdagl65R10xWXrr2o
	 K4bOjoYrXRd9j9/lRn2ISKR2BOGK/ldbg2RuHCUndP9CdDu+lODBrzhbpYLBxJI1yd
	 voJgfnzH4qCHg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:04 -0600
Subject: [PATCH 7/9] arm64: dts: marvell: Drop unused USB 'phy-names'
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-7-938788aff3ae@kernel.org>
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

'phy-names' is not valid without a corresponding 'phys' property, so
drop them when 'phys' is not present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts          | 2 --
 arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts b/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
index a7b6dfba8af5..5823b25e5faf 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
+++ b/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
@@ -28,11 +28,9 @@ &cp0_comphy2 0
 &cp0_usb3_0 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
 };
 
 &cp0_usb3_1 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
 };
diff --git a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
index 71c225221617..a68c958fbb30 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
@@ -89,15 +89,15 @@ &cp0_spi1 {
 &cp0_usb3_0 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
 	/delete-property/ phys;
+	/delete-property/ phy-names;
 };
 
 &cp0_usb3_1 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
 	/delete-property/ phys;
+	/delete-property/ phy-names;
 };
 
 &cp1_usb3_1 {

-- 
2.53.0


