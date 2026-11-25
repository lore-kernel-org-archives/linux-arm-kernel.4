Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2671606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PMNOaPwO;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=I1vtHIVQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AE/wzhThT744Ehg7OqHssiTU1Rv91pn1FajB72yyO10=; b=PMNOaPwOsFQCSo
	zFdeutdVywnuVxPyfjcjWM6ECFPWpJswretlpYTbphoQJ/fvo0l7TBouA5cxgiaN2yrJXvJkZ3blh
	mrVHmrwNLm9tSEdCN+t0G4oe4Y08ZjF1vibGTeUheWbxAk9Ok7FE6crTpue1WWHs5neu1MzS37/wj
	hE0czgVc+n+z0m1J5A/7l4S/z+vBls1KTGCaAoFRwQFWSZRiYnvB/BItmK/MXHzUm1NkwXIvjCgoJ
	0pZ2pndLrTRasg0p0k+jojvu+gpPdceQ+CIT0jC2Jk7Xx/2jR6vVCPeIPHkDyS1zTCRUu6Dcuewii
	Eekw4PqoxIGfj0vB08sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJVj-0000000BGkK-3ozd;
	Wed, 25 Nov 2026 20:22:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJUV-0000000BGCC-49Xa;
	Wed, 25 Nov 2026 20:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AE/wzhThT744Ehg7OqHssiTU1Rv91pn1FajB72yyO10=; b=I1vtHIVQSiSLSL2zq/c+V5J0x2
	f67cihlOJIHb8zJdc4fPWvrRhFxrRZaN4gMbveyDN6PGvul6xZLwV4s0g5dyec0Li8urjyYcoiouX
	OMI/YPDjH++kgN0q8pn7FFiRmyb5Z8hgucz3ubuKgYFSe0fZrr3YGz6WcH2ekomtCdAy6DHkJt0l6
	OYp3DPawIBCyvdRKQS2AQNM9oFqnIcei2OZQlywpD/FccOe56ordVioyDrpoViNm1BUoPhVRJ4va6
	Vps/IsvCA6KOGOz/cTrraYm7kD1Ak69mmjhN7fIbYzC4nkA9Y0UM0CCk0ZqQPqU12wYxcxAiGnLZk
	NlHULMxg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tim Surber <me@timsurber.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix HDMI RX 5V detection pin on CM3588 NAS
Date: Wed, 25 Nov 2026 21:21:02 +0100
Message-ID: <179563805243.3885553.17543172613899587160.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118024718.1540336-1-me@timsurber.de>
References: <20261118024718.1540336-1-me@timsurber.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_122120_061587_2022FB17 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -2.1 (--)
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


On Wed, 18 Nov 2026 03:47:15 +0100, Tim Surber wrote:
> The HDMI receiver node uses GPIO3_D4 both as the receiver's HPD output
> (hdmim1_rx_hpdin) and as its 5V detection input (hpd-gpios and the
> hdmirx_hpd pin group). The GPIO setting wins, so the receiver can never
> drive HPD. Sources then see HPD asserted all the time, may read the EDID
> while the driver is writing it, and never notice EDID updates.
> 
> FriendlyElec's vendor device tree for the CM3588 uses GPIO1_D5, active
> low, for the 5V detection [1]. Use that pin and leave GPIO3_D4 to the
> HPD function. Tested on a CM3588 NAS with HDMI0 looped back into HDMI RX.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix HDMI RX 5V detection pin on CM3588 NAS
      commit: d7db59f605810f37a625d106e2a04c985fcc3e6e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

