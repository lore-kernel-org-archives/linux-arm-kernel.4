Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7095606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ue8ofZr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUIQdnWS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VmfA6XHX6bSxK5Q5qFwsI30WcMErOR0nd0Fwd8626tc=; b=4ue8ofZrgoXGyc
	9ZtGj6ZJk8Bj1Z1R7AaJpgi1Y9uwQ69+IcKC/yaVb+iq608+xqRzktUcCUggq2P7VLbdN62Rr/Glv
	421YxyTZvSANO067ocUXdtN6dYyC74oNyLEuxwp3ewecetUuQMO5RuoDBIGNCMnJ6r2HJ+T0u0ZS+
	YzNlzcpWrvcQfLsUz16E0M9JwMbSeVdpgOJYnzf8CTsJkQsg7r+tk0Wq+7YC+b4u8aRV1RgRVnScq
	ZWxxRO9J0AXEQzf76P0BrXeGmFpSZTMpvo8TueCBS+cch1x7foM5LT667iTjg2of3RxVxJ1iTlOmM
	yLKYOll1joWTt+z/0ojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBd-00000007Xjw-2zqg;
	Wed, 11 Nov 2026 19:40:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBO-00000007XYS-48kB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB5D94786C;
	Wed, 11 Nov 2026 19:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BF1F01558;
	Wed, 11 Nov 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426034;
	bh=VmfA6XHX6bSxK5Q5qFwsI30WcMErOR0nd0Fwd8626tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GUIQdnWSWONQnFCCMBQC/+gjoa9RmHbkwxa+fYVzMu04dS+y1uLISCDXt1tSlkBPI
	 859YCjtqdybRWfbXz9sw5Fk0afk+6OEyCY2QFEm80jKZG+7ZHn6ntLgpplRIVJCXzY
	 werZVQq2UNLZ+t2bVJ+QDtkYI+SmrcHbgvsbnPIDFTqgS/D93BMP7oVSsuzyUHatM6
	 MWp2bwESNY6EZu0/spE7txLkY7bt266Myst5fxwyotcSnjOXy+PWw+jxGroEsH8bxk
	 c37g6+nQgnXOjcduGrG+JxhDZ+qHOhQD9ijxSPlR2be4wMs6IsP80R69EaXJWoWat4
	 aO5x86eGdIGlQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:16 -0600
Subject: [PATCH 06/12] arm64: dts: hisilicon: hi3798cv200: pinctrl node
 fixes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-6-6c9f5f80716c@kernel.org>
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

Rename the Poplar pinconf node to pinctrl and correct the gpio9
gpio-ranges tuple.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..6d4bd1dec6fe 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -214,7 +214,7 @@ combphy1: phy@858 {
 			};
 		};
 
-		pmx0: pinconf@8a21000 {
+		pmx0: pinctrl@8a21000 {
 			compatible = "pinconf-single";
 			reg = <0x8a21000 0x180>;
 			pinctrl-single,register-width = <32>;
@@ -510,7 +510,7 @@ gpio9: gpio@8b29000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&pmx0 0 64 7 &pmx0 71 1>;
+			gpio-ranges = <&pmx0 0 64 7 &pmx0 7 71 1>;
 			clocks = <&crg HISTB_APB_CLK>;
 			clock-names = "apb_pclk";
 			status = "disabled";

-- 
2.53.0


