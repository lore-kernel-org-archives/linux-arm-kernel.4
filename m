Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C73606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PKKlin2O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKZ0Ghey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1zueIy4IpFVqmygoDdLCHo8BpwK2BqtoOiBnrgfJRao=; b=PKKlin2OHUSbVU
	1qkekeLpeiZBHg1Vn8yLNEHQyLMU0/LW2DJThzLZN3j5Y/OczJPrvkiPK/BYJu1mIs6lTa61kDbpL
	UJDNfJOt7GORowaKZ6xc41jFyoHCHKlUW4MqjcNXXBF4gtR7TB/9nnAK9o0IuilKKIyjp0nLmA7TH
	igpL0D0TAJTdn1i4aXgVxJJUwzAtuxKdtcBYzMuYcEEmX/HFEDj3l0epZm0+SXgwtP+Sh4DqZNLju
	mSqAkQ9ozsGdQC76uQnUNsZm1yok7We6n9N/wC1RQIbyLfHF98B1fCtyniil+vjmUmRe7Kj/H2VM+
	B9LlCjiYSjlwkNYQ2zrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBe-00000007Xm7-22D7;
	Wed, 11 Nov 2026 19:40:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBV-00000007Xcg-2D0S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42C0142B79;
	Wed, 11 Nov 2026 19:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CD41F00A11;
	Wed, 11 Nov 2026 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426041;
	bh=1zueIy4IpFVqmygoDdLCHo8BpwK2BqtoOiBnrgfJRao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kKZ0Ghey3qJBAYXsVpyFj0ax/Cz2c2Y+3xFiVLwuAfjcolArrDGse7L5u40UTQIML
	 a4/DFOhm9FY/Rmp0BcFl0TUIc42JHgw5c1ea+jDu9WGY4Mi6U8opvI7qW7fvJaWq8X
	 HwNuUfmvLOv368Kz9cazcToFOdQ4B2olYz9YRx4MsdIPDZSUiEhNu9+XcyZVPAswI3
	 q7XMdjbg9289b8Tq6mMXO454YbjdiQ/9alFHkkqX3Q4j9U3LoqVdP4fiMgQAMW7qH/
	 1P+uAdsBA0hnY7+D8IFEhZQf5dovBG361JsVFzzbCzXOUcSH9wH3BzgN76uk/1NtSX
	 MDkFRKVfGuCfg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:20 -0600
Subject: [PATCH 10/12] arm64: dts: hisilicon: hi6220: Correct I2S channel
 ordering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-10-6c9f5f80716c@kernel.org>
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

List the Hi6220 I2S transmit channel before receive, preserving the
channel-to-name association while matching the binding order.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 1cf552d02ecd..2d65d9b501ce 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -906,8 +906,8 @@ i2s0: i2s@f7118000 {
 			clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
 				 <&sys_ctrl HI6220_BBPPLL0_DIV>;
 			clock-names = "dacodec", "i2s-base";
-			dmas = <&dma0 15 &dma0 14>;
-			dma-names = "rx", "tx";
+			dmas = <&dma0 14>, <&dma0 15>;
+			dma-names = "tx", "rx";
 			hisilicon,sysctrl-syscon = <&sys_ctrl>;
 			#sound-dai-cells = <1>;
 		};

-- 
2.53.0


