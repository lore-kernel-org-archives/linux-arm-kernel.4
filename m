Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mfHN8ug+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amJVoekf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=; b=mfHN8ug+EnUX9C
	utSFISPhG81eY410uZj/qeHz51GXZuVuKwKy94nax1d/HAncvyCsP1mNuyVLGK4/XWG3yUrwNVFq3
	1C52iScWtHei0E9JlzVkhnpdLKqz04N8CVrbrXU9Nl8tjUIsv4iY4akdq+/RfrooKPjKmWEuLsxVc
	QuypprKscYPCX9+792a6jTR+NoLderDIsCkoALY8DRCMVS1I/KzKayjc1dOkiN5QYf4dOF4ImnhKW
	S4UbhO21XVmz9sOeO9sDxmZvLitc2Cl6aOAvVOYOdzqZ4FgIhRvxvT00bolXLA0J1QeH0RIgKHmLO
	pgcNzltyJlIU8UykeeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQa-00000007le6-03NY;
	Tue, 24 Nov 2026 20:47:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQQ-00000007lXp-0cqN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5991E61ED9;
	Tue, 24 Nov 2026 20:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945EF1F000D4;
	Tue, 24 Nov 2026 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553256;
	bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=amJVoekfOtgDvlPsAoePhzXqrNMlqOe55eVd2FBvi/Zo9R1AtMChkEHnv6ruAaGo8
	 xTdIPzmjDeXBYqFkJG5hoD5UmF5B94xcC9aiZ+6sIkmRIZczYd3tRd6pbWzDa44mL7
	 8ePloa4dDxiKPv0FGwTbFLMvzq+8tEof1XLCi7JUsYCt0AbBBcssokQv9oLCCt3P34
	 FisYeFU44Kv/lBS0Nh+ggEXv9SjqvTlZ1HTwu2vFVdAE9CGr/fM1gqVJGHXHnjFim5
	 B85af6+2vC4ab97/j9BBcgQHmbcFkQUlJqNZQq/0+qnEyufHnNzlqG4t8mEHMViPaz
	 iaYmOCiDV82iA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:36 -0600
Subject: [PATCH v2 3/9] arm64: dts: marvell: Drop SPI max frequency
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-3-663009a769da@kernel.org>
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

Remove spi-max-frequency from the CP0 SPI controller node on the
CN9130 SolidRun SOM. The property belongs on SPI devices, and the
flash child already has its own maximum frequency. Plus, pretty
sure 1.8GHz is not a possible SPI bus frequency.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
index f95202decfce..7200f72b934f 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
@@ -106,8 +106,6 @@ &cp0_spi1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&cp0_spi1_pins>;
-	/* max speed limited by a mux */
-	spi-max-frequency = <1800000000>;
 
 	flash@0 {
 		compatible = "jedec,spi-nor";

-- 
2.53.0


