Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873AD606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wTLjDk9Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCpov68u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Poih9dB3auQAj++shuYGBNcxyMAxKrzMPsxjgIYbSBg=; b=wTLjDk9YKe0HTj
	vm7uKWoQdVNW5V/WrdwoABMrzzjsGFrUJQvkYrs3J3/Q5m2jhAdZmv5GS1AHz8gaJ1ZT6pkvSvMjR
	gdrZ56d6Ks6O+pF13SLnD+vYv7k9RkYQTbBe1cfXOafAPmlRyxqWK201w5Ll/ufGHs7/AgwAb7A7q
	GAT4horAYFFAEBsrv8N8tmrY4gCYHcmKzaFCd9Qv1+IWsJar6A6vBdeuQ3Vxz0gy+QZ7j+KkWWvs7
	36h8lBcrjWYA3StOz9I4DUOv51Gvbsfy8pAUSRmCf7jydGppkUnV1ubcRe2J9XpJx47qWeI2R2C6K
	J93Gb+4NGLrBER/J4/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBe-00000007XmR-2fkG;
	Wed, 11 Nov 2026 19:40:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBX-00000007Xe0-0Uyg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DF6865515;
	Wed, 11 Nov 2026 19:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3B21F00A06;
	Wed, 11 Nov 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426042;
	bh=Poih9dB3auQAj++shuYGBNcxyMAxKrzMPsxjgIYbSBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hCpov68upI2Hr/vcZo8JPCB73zJAAw4Aa9VSkxpRQX56FIfs+PeKuoAJibDNybEYC
	 K8EPn4GtkKZK0CLUJYMIh8a7A0vkKIJf16oMef4tsPBQkLBuaDoujxXELi4b0kDxgN
	 lPf/kNXlgFU19TqA1MSELM1yA1UU56Dsy6g0R1GGY1of3LA1xJHEMOb0L5fum8hjOI
	 EtcgZ0u5zat18owYkYfMYR1QH+bJsmq+xhr/VNIQFsGfqPyDt8lbnrh1pNEsguouZm
	 H7P8vRLiTu/Wy3v/2jlgtPW2OVKdy23tIEPZzUDWNilRzkasA0BYLyf2YckXE7pVxS
	 SzeVc9EW8Hb6w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:21 -0600
Subject: [PATCH 11/12] arm64: dts: hisilicon: Remove obsolete HiKey970 PMIC
 GPIO property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-11-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
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

The PMIC IRQ driver obtains its interrupt using platform_get_irq().
Remove the unused gpios property; interrupt-parent and interrupts
already describe the same line.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
index 299c4ab630e8..12f1f972ffde 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
@@ -21,7 +21,6 @@ pmic: pmic@0 {
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			gpios = <&gpio28 0 0>;
 
 			regulators {
 				ldo3: ldo3 { /* HDMI */

-- 
2.53.0


