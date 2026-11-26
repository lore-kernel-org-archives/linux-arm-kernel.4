Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D56C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VnE8Oc8q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esyhmBHt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WPAtgMgxEKWKs98SMk8PjA2m7IZXyiYi3zLjRxfu6cg=; b=VnE8Oc8qL50aap
	Y/6grgMPwFVFIeVktguctcjS3/8diGea8PblqA2Ye/3g2r12PCLQZZYbKI4DH4xl6eG56x7x3nI5L
	DohTHU8qAJLQjKqQqKb38pwqgMbph5f3EplXtpdHQfKca6NIwgjvWh9iG0j/RoeVmMYRcmw0w+kEB
	fyROtCz/xdiXA6A3K4OQFbthAAfG3M5/elVSPucSOc/BieKi+O4Uc+KFZ2C6vyTpGdgr0Ia3ORDLA
	LdsXrFpefBujECB5zfYwY8cW7K1vxuwKXT7OzPDnQGvXBXFuN1WMeV1qClfFobC1sFH2YmCWCpzD6
	nqedNvQXT/TFVxwXlnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV2-0000000BfrI-3zbw;
	Thu, 26 Nov 2026 00:38:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUK-0000000BfVT-3pGC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B20161D75
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53711F000CA;
	Thu, 26 Nov 2026 00:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653444;
	bh=WPAtgMgxEKWKs98SMk8PjA2m7IZXyiYi3zLjRxfu6cg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=esyhmBHtqVJ6rRTjtaTi8RAOA8c7+UnwGbpLfZLy1voYIte8ck0PhC+x3fYQ4RBub
	 N8Lrp4MdCMABV7Lh6COJS2s/LpwAiX5Tu7FD1QkbamT3BBaXlJ84zzoU0Ikil4E1+R
	 enOLmqlADrUUY3tdSkRRhwAGWESMROqnH2K35rz+3qE85INTrP8GdWMv7Qblhaq94o
	 +A2CQvLcAwlaBS1E5pC4UMX63bEYsLs3YC6m9y3d6H6C3rWxO22DSb939wG013oJ1P
	 BddXQadcLXlriqV42NDghJ3vCp8j5aXnXVtrZsElGuQbjauuOjqJ5h1V1mersB04mC
	 jiZDMrrj41goA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:11 +0100
Subject: [PATCH 07/20] ARM: dts: ux500: Encode Sharp proximity hysteresis
 as bytes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-7-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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

The GP2AP002 binding defines the hysteresis registers as uint8 values.
Use an explicit eight-bit encoding, matching the values consumed by
the driver. Found with CHECK_DTBS=1.

Fixes: 2ae6193a1b95 ("ARM: dts: ux500: samsung-golden: Add proximity sensor")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index 3f5499a7247e..369572347222 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -248,8 +248,8 @@ proximity@44 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&proximity_default>;
 
-				sharp,proximity-far-hysteresis = <0x40>;
-				sharp,proximity-close-hysteresis = <0x0f>;
+				sharp,proximity-far-hysteresis = /bits/ 8 <0x40>;
+				sharp,proximity-close-hysteresis = /bits/ 8 <0x0f>;
 			};
 		};
 

-- 
2.56.1


