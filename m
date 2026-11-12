Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44860A2604
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3BlXnqFE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzilFVWX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dWFD3THYHsWU9y1SttPbbRwEUnR6O/yGa6Xh8feGmTI=; b=3BlXnqFEMG1rxo
	EfaHjEnPOO3s86Oo/DaYsgrxtQKfJ4IK6yTjB3attn7Gw9j57xkbQZz8ujHuDM3zqtEBYBMK4lyzU
	2OZma6pBadigsnKDqq+dj2VzN5nPufiyLmLiHI2v1Hyf8LPXDA9KOoXhDoBaE3cTkksnAp4FgwHqd
	kRqG47v7to6l6TUg+lAp/bvEV9X7vobzGQYanxSEfqJz8lD45JOTLOvy3gOpeF5/Gs/zWXRyDa6NS
	Jk7bts8mqH2WDnqV7+5TK3eOYI5rz0bTGy+jZxFrr8tIVDKA19Q/Dgyjs/u62YhMGxnwea8dCq0y0
	4X68sxIJ5x1bvSbfzwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQiz-00000009HO3-2b1Y;
	Thu, 12 Nov 2026 09:04:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQix-00000009HNj-3iCz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56E88634EC;
	Thu, 12 Nov 2026 09:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DB81F00A05;
	Thu, 12 Nov 2026 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474243;
	bh=dWFD3THYHsWU9y1SttPbbRwEUnR6O/yGa6Xh8feGmTI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CzilFVWXa4D/+g2U7PP0xEDL4dLuN5Qwy4sUdENoRqLbk+axDMjvWlYZa40R1IaAS
	 lj8EZhkMlcRk0vzyCzu572Li6R/Hkh7PCHPVPR/MrFTIQC2IAAUJWS7mBvrKOetjHY
	 v9Zlz2U6EB3WJfOAEW1s5WpfBrrUCnvopP0utWfsBSkUuCkFvwu2UVRXIsrXFauYPJ
	 2AdvdPawNQEVyL1iAVorUBA0gjGtPf1hcQvENWCYVYHuZ1lP8MV/x0x5vEaRQj+xTR
	 UHAarNplydgfLH3Liif/hlv+SAe/Uo/LNLeKo+woO1bZ5xgr66r5oLm2VJRz6+nxZ4
	 le0JY5ibm/7Lw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@nabladev.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930214729.809649-1-marex@nabladev.com>
References: <20260930214729.809649-1-marex@nabladev.com>
Subject: Re: (subset) [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can:
 Document Microchip ATA6563
Message-Id: <179447423905.428303.6835437411622016722.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:33:59 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 30 Sep 2026 23:46:38 +0200, Marek Vasut wrote:
> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
> It is pin-compatible with TI TCAN1042 and has a compatible programming
> model, therefore use ti,tcan1042 as fallback compatible.
> 
> 

Applied, thanks!

[1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
      commit: b338621a7e68bb9dc91d08e1774262deb0db50f6

Best regards,
-- 
~Vinod



