Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22468606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e+JY8EET;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leR47+Lm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3h4Y3MoPqzZwX8Pzftsbtft4MfZrzDfTleVCuWtieqQ=; b=e+JY8EETiX/R3OozVUBSqh/YNX
	SBNOH8lxPA8GlafYyxhpg8tElmS6g5yAXAzI9+YWZFYxc3Q95nRPa2x+DLVC91IBIpJDKVEdChNMy
	88+SoFlaBX30Yz7/DqXk0EeJhiFmSFNWDLfPtW/gaFVB5T+HWsY/PDumafK1cdYZkWO9feqIghmcV
	CwdyHTCdWlK0EeroNqyTgGiQRha3Vtz8avL/6D5o5H1026dW28Jv9VG+HhhIAJPuXj3AJNe7+zcMg
	UhfntfNh+SsZyLrq2mDFuU1Npe836LBAXetSPhsAwK1JHOa2YQyEe3PNIgfEBbfH6fNsMbQySv6bb
	zWtI5tng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmTz-0000000EqQz-3YnG;
	Fri, 27 Nov 2026 03:18:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmTy-0000000EqQk-1bJ6;
	Fri, 27 Nov 2026 03:18:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10CA8434AE;
	Fri, 27 Nov 2026 03:18:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749521;
	b=Zcfqf1V75UzwpqAy/ChfS1StAW2eWTEItM4Yzt4wN4R6aUYlb939m6um52vjahzwItv7
	 MBi4fp20aFZIvcvV7QBDgbOlUo+iH0SDq46i2yrT4i/J/hmVF/DZJY32gZzGJSCwnQcdQ
	 NLAnzx0sN0lUtAEPV9tY8ExEq/fwQ6GczzPPE7GwARW5yA1KbTJd8h6YJcRtOKmIP2Gp4
	 Lvh3AEwCx9ZTZzaPf9cp9fKZyqj+6+u6qxa6FLU10Yv4grOfJUP/cfTiKToWajFkvKVJ3
	 DHp5R6PE1zklovr2XHpYxPg4no2m9OJgJYZraX05hFLxNwMiCaAKwhkK4z0tvqPKM0g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749521;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3h4Y3MoPqzZwX8Pzftsbtft4MfZrzDfTleVCuWtieqQ=;
	b=hSNAYuTvWU58V1uzVM9DC9CmqknQ34OxaFvDs/QrkTxne8rgxZhlXHeJAzv3kUDRxt/R
	 OMJSj4Jw11u4mesHc0PdTR8tVkRkd0FqpA03bV0X4AGhx8soNFwqK17FIBXMpvgxAji0J
	 4bcN69/J3vMJt+3qjYRpGp0W9TUAvA1/Z/hts4pYYtEdheW9OtQAoPVqwELB4t1Ma9Mcz
	 3LPfJxGubF0vGO8V65J+AvOlOYe85JA/Iha4CT9MALMWVrNtF4JM3N/jz3RHLFY7AUZUC
	 ApSkpxcMidLY4tSl+S2vwP19abQLeWIMxr4z+YpS4UUSfKZsZ3ReOfWd9xlrXCUEtjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5117A1F00893;
	Fri, 27 Nov 2026 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749521;
	bh=3h4Y3MoPqzZwX8Pzftsbtft4MfZrzDfTleVCuWtieqQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=leR47+LmsgQKxfD97iB1PfGWn1T0yBdNBqTjBjHRQyoLoSz9xpu4Ppt3h1Y8kvU83
	 Io2IqKX1t3xt6nwjH+SHArB/74mv6+Un+/z3bBO/lir6ABClL+ShEoyW7a7l5wrkCa
	 uSPhXQ943iiTaVx7ZVJtBGU40paF/CVCpxOzaiXXvLB03p8HA8z/S+BiEi0MavccLe
	 sbxRwye6A4tLzwsvGIt1JO7NJYD8O0WIcUy08zh/J6TwY9P9BIJf89A56tKcTi5caw
	 nxrvl1Oguw9GU2H7g/hFrAhsNo03P0SVsHWBEG2nBZdgVlPZuWipDbJXmACwo7Gzgp
	 6OeH8XCvKoo8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C14084B514;
	Fri, 27 Nov 2026 03:18:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] ir: support IR for Amlogic A9 SoC
Date: Fri, 27 Nov 2026 03:11:11 +0000
Message-Id: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/0CGsC/2XMSw7CIBSF4a00jMXwKhRH7sM4wFtoSWwxYIim6
 d6lTRpfw3Nzv39CyUZvEzpUE4o2++TDWIbYVQh6M3YW+7ZsxAiTRBGJjcY+Yl4Ld2FaWUUlKr+
 3aJ1/rJ3Tuezep3uIzzWb6XL9LWSKCRaONAxMY4yjRzNcQ+dhD2FASyOzT6c3xxbHgNFWGekc/
 Dv+dprwzfHioBWKgpQKaP3t5nl+AV/U+8EMAQAA
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749517; l=1292;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=o1tFMbikJR8uoT4fM2pfRpJ2xpJUNoomYOyi+A42x4g=;
 b=OvLv8K+WoJIrKRMobE10x83yaOq5h/bt/ZVcOu49zWbhrfV5gkv0pfmk2zmHgFCyxnGNf9gYo
 lU7J6k0agxdCVHzvYjYy0TF0KqNCIkZ3yxvRv3GVN9nHydTCxG8bfqJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Amlogic A9 IR controller compatible string and
add the IR controller node for the Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Add Neil Armstrong's Reviewed-by tag.
- Add Sean Young as the primary recipient.
- Link to v3: https://lore.kernel.org/r/20260903-a9-ir-v3-0-cd471c667c15@amlogic.com

Changes in v3:
- Align the node of group-remote-input-ao-pins.
- Link to v2: https://lore.kernel.org/r/20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com

Changes in v2:
- Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
- Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
      arm64: dts: amlogic: a9: Add IR controller support

 .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20260706-a9-ir-354fb297e716

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



