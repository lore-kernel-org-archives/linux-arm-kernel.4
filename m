Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3142606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T4qmk7rR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIWAjUgl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=; b=T4qmk7rRp/CYBp
	iE9RAuLYFWbFf17wij/O0Vurnf8JbT7MK6KPSgyCuKZzaIjEdbMb2vxuKslIoQZjT6O9Vx7a9D71e
	av7PQr17ZTUATsIKlUfnlcFB4qcBYH4MNpDFSagvHBFv60OyouR4YNGwSwrpxhnM12kdk99tDsjH2
	IYf6UAHRdumtYOPU4rn/kWFO9DDlv99jMUo/aXLYzmcV4ToDuvsewH442rSd/Ym1nPve8dwCqLBlC
	gwiJdf4+4jhLkBfMnMJ759Gdcz6F5oYyscO4XayXbg0xtfGeRMJv6m6xVxGHclednhV6eK3Aw4d2I
	hR/pn05X2AFEGixo5V/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxRR-00000007mD3-2LLV;
	Tue, 24 Nov 2026 20:48:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQZ-00000007ld9-1x26
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C70645D1D;
	Tue, 24 Nov 2026 20:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1721F00A01;
	Tue, 24 Nov 2026 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553267;
	bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JIWAjUgl5n2OuNOs2aaa55AegzOK0ju9PfMi7wQkrXMbx/FHizoUEaaVYWudSI1eB
	 9648wf7r40qhxBHFzlDUBKBiqWhAlN7fZWQCzDAky3tHT3yILDXXGh/iOLsCWt++TZ
	 NjiUeFHzl/bPFHTcVAyxBmpz1gxXk0YgEfrUVQzRttZKCC6giNS3wI8aJu552eLP+8
	 +PpL4QgTqpRXpB8Yak6FXFhIgtvtz4YW7XvZ4xmaDGR2apyWL2SlaNTyUolqJkfUUE
	 W0jARJ8j8U/ZHZVTWtX2iJ5gcmW5fa259H/3x330lavLzndq9jawtYAiDu6cDXkBng
	 CqlvvEcl2D72w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:40 -0600
Subject: [PATCH v2 7/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-7-663009a769da@kernel.org>
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

The part has no reset line nor does the Linux driver handle the property,
so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
index b6aeba7d0a61..0b079e1428bf 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
+++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
@@ -252,7 +252,6 @@ carrier_rtc: rtc@68 {
 		pinctrl-names = "default";
 		interrupt-parent = <&cp1_gpio1>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&cp1_gpio1 13 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.53.0


