Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298CA606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nmUY55/x;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jc202QXK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vDq/y+dEbPOBsyucbglp5/n07svA8cTPyznmOYv5igA=; b=nmUY55/xbFUsp+aNvXuFjhbBV1
	rCASKnjWV4bdVrbv0htQhlP2LfD3jw21jA5ocWJwiukaDI4T90bxBZs+nnCR3wxRuUNRJatFJhvlT
	TZ4Xtq121KmcCE9WYpKMeTrn4vdbyBRb97eHiD3eo/iTwG499noglFX16ZzcHe+TIxX3CxGNt6V8G
	9aFYCKTz/CjB9u7ks9EBoYLZC+599KKT3pCEFsHpR+lgBUgVqeIBM8ZNePCEyRi8YPqP4QvjF7Ijs
	0Gd1GvLTFHxS+4h5us3VjFQhZpqR42ijvVfzw+lIlK+/UVbVOVUduIkOQZ6KTge9hq+dyNaOouBeF
	WTt5xAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyhj-0000000EZMC-3uIQ;
	Fri, 13 Nov 2026 21:21:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyhi-0000000EZM3-282w;
	Fri, 13 Nov 2026 21:21:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA5D544758;
	Fri, 13 Nov 2026 21:21:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794604861;
	b=aQbFRRDnyjhCQXZCXxXZXk/gXLmhnBpz3Au/yVasg83Sc1hRXieJXZxvAdAz+c9XhoQz
	 Hi8cScsMk3CtaYiY7eLijfPQ5PZcmoqcVB0keRoyELnYxRcj8bfG8V2MsLV2hCvQSzfBk
	 Njp1XI64amzwasLuL0EJUxq9hh+OEHBDM5zc3CzSlBcwBadhOxqFU4uUZP0gyrQ+yqo0t
	 51OoG6KjG6CIWzWoK1xopu+Mv3Q0fueS2hiXYStob/DO03k5eWyjH0SywRRmV2AmBkgYr
	 KxOOMt2+zFTVl1pU/uPjzlpMF6tVOeWO21AXQW70094tahCfY+79oQ492i/zS4zs8OA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794604861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=vDq/y+dEbPOBsyucbglp5/n07svA8cTPyznmOYv5igA=;
	b=qgLEn6Et71dPkBoLTUBr+Yx2O3fw7rZqTLFUkJWtPJZlr2YJREIp3dNXHQLrHQB907Gi
	 vKs/gV1kgr3W9jOueD0ncwskCsVV/oAmosD3PMrlNy9fUosEdT/oZLVn9a1f12XfvSZJc
	 /JrnTG0OOa55GCkcA6WsgcisMkEDTleheYNJHba1J7GRQHlrbqnE+0kfHptC7uPLLYfCo
	 O2Fr85iMXiLqgX1xn2aU7ta92RTQlQCpXMCPiAf+pixiAff2Hcb2byMJ36hyEngslVFxr
	 XwGPSdJtdZYBhEzqZ0lT+SAtYo7N3rM1j63Vfi27D/SR68LXtCI8/SMjfAAp8QOODNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F3991F000C4;
	Fri, 13 Nov 2026 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794604861;
	bh=vDq/y+dEbPOBsyucbglp5/n07svA8cTPyznmOYv5igA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jc202QXKZJcAB2NMLsXt8vh1hCR5LrnkP39rteHjTdqjcgbI1MYTUzZRGcFOyFWnp
	 yCR/LOS7I95M6MB6H88aJUABF7nEiutdfE649p2PanpBPmE9N+zifKC63Iq5Lkc7+4
	 wai1RJpaFeO/HtrGksGp4ygLHCCLA+oXNWmyn2/5z1xIOF21Mfwhd/4qVlZ1B6yXSC
	 aTttkX4+8Wo9Byt5QmJqm0xNHruFvwv4EiqeorABCLPASM/KrBQyN+faTYqQdwEeGK
	 Nhw1vPwDyCX7yPlkgXbN1ormOqBuB/a9D3QnPHeiQq6wdHOOp0t65EZbSvsE8lVqo3
	 0pqHP9RFkW5rA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C52E549990;
	Fri, 13 Nov 2026 21:21:00 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 13 Nov 2026 21:20:52 +0000
Subject: [PATCH v2] arm64: dts: rockchip: Enable SDR104 on the ODROID-M1 SD
 card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-odroid-m1-sdr104-v2-1-1a1611fc4cbf@iav.lv>
X-B4-Tracking: v=1; b=H4sIADN/92oC/32NQQrCMBBFr1Jm7Uim2qCuvId0ETMTO6CNJBKUk
 rsbewCX78F/f4EsSSXDqVsgSdGscW7Qbzrwk5tvgsqNoTe9JSKDkVNUxgdh5kRmj8GK2TnjB+e
 P0GbPJEHfa/IyNp40v2L6rA+FfvZPrBASHoS95cHTNdizurK9FxhrrV/+6JtbrQAAAA==
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=bk0BmaYleLaidbW/Gg6PAAPuKLMUdjp+ycVXNHy1qDY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnf661D3W8Knv7y4OkXxgllDB5KF5w5Nfe8Ut/syHut+
 tCmqSf+dpSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJXN3OyPBk1Q+t2JRfh3+l
 Z8RObd12tfDEFo59BT9Z/rJc9796zXU+w2/Wxy2bNu3jbbPr8WuYL7hqifq3Y3ZOscFLth86IjQ
 n2Z0PAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The SD card already switches to 1.8 V, but only SDR50 is described, and
clk_sdmmc0 on RK3568 is a mux without a divider: dw_mmc-rockchip asks
it for twice the card clock, 200 MHz for SDR50, the mux rounds down to
the 100 MHz parent and the card runs at 50 MHz.

Describe SDR104 as well. With the 150 MHz max-frequency from
rk356x-base.dtsi the clock comes from the 300 MHz parent and the card
runs at 150 MHz. Hardkernel's vendor kernel already uses sd-uhs-sdr104
on this board. With a SanDisk 128 GB card, direct read goes from
22 MB/s to 58-64 MB/s and direct write from 20 MB/s to 47-50 MB/s.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested with an Armbian 7.3.3 kernel (rockchip64), the property added to
the DTB with fdtput: reboot, sysrq-b, watchdog reset, poweroff, s2idle,
deep, hibernate, hybrid-sleep and suspend-then-hibernate; the card
re-tuned and came back in SDR104 at 150 MHz in all 29 runs.
---
Changes in v2:
- keep sd-uhs-sdr50 next to sd-uhs-sdr104 (Heiko)
- rebased on for-next
- Link to v1: https://lore.kernel.org/r/20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv
---
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index ec43dee18094..27793d3970d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -611,6 +611,7 @@ &sdmmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
 	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
 	status = "okay";

---
base-commit: a9d78db32fe78bdbe7c66ba77cb7dbb729b885de
change-id: 20261110-odroid-m1-sdr104-f6e03a0c5ac9

Best regards,
-- 
Igor Velkov <iav@iav.lv>



