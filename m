Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E7606A886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LJAEmtqL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U9fa/LBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fSJQ3TO/0mJb/kzZHlIBvtfMwySuWem/xgRkXkS+p24=; b=LJAEmtqL/Ay7+M
	5b1SQ2CqJ5GmiFJaFItqYH7NmN/JDVT4IaIrmrTkcOPXHZPISQ20CIdsYWFGM/c/S+6EQ6BheVU5R
	JVp2v6DjNxokA7YB/fF0U1tiOGopU9vhF6W7iAEclBg2TM0mgs6sRCL9woDXofD5c45FnDqrstQR9
	2XHiq2cc2N4Z4Re1N4usCFXpuauWsG2J6Vw0lAhVj9cLO9nVO1Zcl0e6LEQ+1wT2nVoDYWSKHJiMl
	2a63wHP1KR/v9Ce08IjSsM/t3Phl00zNQjbS4UYF6bN6ZVb1K6Kbpn82XHsIlJvaeZG3QqDqdX8B4
	goo72J3JEIYjez378HZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT11V-00000003U4j-1W7s;
	Mon, 16 Nov 2026 18:01:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT11T-00000003U4O-42A4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:01:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B96C40320;
	Mon, 16 Nov 2026 18:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742181F000C4;
	Mon, 16 Nov 2026 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852103;
	bh=fSJQ3TO/0mJb/kzZHlIBvtfMwySuWem/xgRkXkS+p24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U9fa/LBax4AtOV+YjYJYeYtt7gRlPvR1Y94LwiaByGlhj1mcwDS1/5n9EcuXHsLQ6
	 5LvUs9nO2HkW1fOF83D8mnbUWG2kXNyz6BbhrTjqvf5ywyHJaQxQOaiNU0N5Ow5xHV
	 Sl8MEglV75B0qx6DyOFXdSv4sCbOzi9TCW6tR5KtE6D+oDqlITPBJTKOXFS+7wLMSW
	 FfmFNUTwJZ006ahZavzHDs8h/uQmMfPGoLte1issOElvrxw2ivgWh1UeQKyf36JS7I
	 /lyc85goFIiOHPg9eCpnyrLqDIiZ56ONxif60sB8To1H1hdOiGLI3HTcw6XKU7/dAP
	 YCZJJ8IbofJBQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
Message-Id: <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
Date: Tue, 17 Nov 2026 02:01:41 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 16:44:29 +0000, Cristian Filipescu wrote:
> Continue Jernej Skrabec's April 2025 series, adding the board compatible
> and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> 
> Use the common Orange Pi H6 include and describe the LTS differences.
> Follow the schematic's LED roles, remove unused USB ID detection, and
> use generic PHY discovery with bus-level reset. The binding patch is
> unchanged apart from rebasing.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
      https://git.kernel.org/sunxi/linux/c/903a676a19ab
[2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
      https://git.kernel.org/sunxi/linux/c/a203a4bac331

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


