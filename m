Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86340606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vr+Tq7gY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzQSEVcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y7iu/ep1a65WrbASb13lQq8sxkeDKAqMwd/fkbVhul8=; b=vr+Tq7gYTXrMVU
	PYrPw6ESI1d+wSF0/eCc7W8nCyd//XwcsmEeyCdD5xwQQkcCXCwB0/YguNzk2vwwxBHgHOTFOMGNr
	eFxOoFIcHaufgR0d96Xdg6yK7LDxsR7oGl5sx6u8pErvWZQ+4bW1f+KPHgtxE9KUB2r9pea4tNdTJ
	jTL0zyEznbXAo46pcQOFXVL0+y/ZokozSj3QjPPXCyY4fRXhtfSCZO7zTgWeKGHNU7Nmn510awIEm
	tvM5drNmmDuh4VoGUzi2HEC/MHBSaa4VmfCpg4key7lF7lyhWlSKBFkjfMCCvkkE3og9nMYIr/rns
	fG1GfteV6UqJ0436G4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7L8-00000008rFS-0cNo;
	Wed, 25 Nov 2026 07:22:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7K3-00000008qhS-38PR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4563A43499;
	Wed, 25 Nov 2026 07:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008541F00AE3;
	Wed, 25 Nov 2026 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591302;
	bh=y7iu/ep1a65WrbASb13lQq8sxkeDKAqMwd/fkbVhul8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IzQSEVccBTFtOV5CVdMu6avznbK1ZNELFKlz7DtIEp+wcnTEb2K7tJHe8Gc2vHx8z
	 k81yz59N58s17BAOkeZ7KAF0m3Cn6XnI1sDSYX5hrG7MTqNzUOcuwQCFKOGlFl6YU6
	 Sij9E7Pq5berwcQp6wz+JDBM3zq6rMsUSolOQlQDdsP/4Bb8+TRx4OARNPuZcA81NI
	 80uNEGN8/K7ljiT9An6fRTvPvawLEiSP3PGqvSJEGJgVPIusF+YJTiinwQBD10tzH5
	 j6QOHbikVuUZeeT9iwGFgISRFL215mjAvEOI1GKBZaaW8cLaJekdMuSJROvsEq0Jk5
	 oCHO1+DAzNXsw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-2-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-2-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:21:39 +0100
Message-Id: <179559129960.9063.13932232293411846925.b4-reply@b4>
X-Mailer: b4 0.17-dev
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

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> Add specific compatibles for the AP806 and CP110 system-controller
> syscon blocks that host pinctrl, GPIO, clock and thermal child nodes.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Update compatibles to avoid old legacy ones
> ---
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 6 ++++--
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

