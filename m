Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87617606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u3wcvRnA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XI/jS4E0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6rogdOocEwNLZf4ag958lfiyvWWO3bMcbTKmrC9iGKU=; b=u3wcvRnAgmsaBf
	NC04YyZx+toqGJtoRwwcm5hTq3Px0I4+a2P7dU+9jPxG4qI7u+LXA6+2fz0FDRdk0awaASOY1JIdO
	j8qzelvdi2p1f9Bft/l28BISC2TmTematoW0hBxlLXB5J4qn0qNE8XUWoJeGlUP0+vfONJR+gwi3A
	8/fbozmmlTk/MwTniUNtGCIv3PPc2uvvFxCAH76npr941a65WS60p9aFO6V1ST3sEn64wnK8gP11U
	YEkCPDPICE++UKd8IXRdLGMl5iwqEitXDsGKbHNjSxC6GkOW5GcUVScKU2pBX5kszHDttgVw1yO7/
	7gym7LcnTWlFgNfzLYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoQ-00000007EZP-2bGz;
	Tue, 24 Nov 2026 16:56:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoP-00000007EZA-0kE2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:56:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9371C43859;
	Tue, 24 Nov 2026 16:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69EA1F000D0;
	Tue, 24 Nov 2026 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539368;
	bh=6rogdOocEwNLZf4ag958lfiyvWWO3bMcbTKmrC9iGKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XI/jS4E0PQIJ1iAUEt8UTQOcabXi79J22DUYKSGWINJKKQmg1z1nxiNxc7MqIzvpU
	 /mOre7/hK44PjEXd5P+o1lE8EkskZgsBfhRfBSnQWG2T8YNrrwYCLFKm4rIiTUajUJ
	 EqCr1HT2u+4M4FptPq14nPHyJfdJ3vnzUHqNei/SBr3YzFetqa8Gny9w+ELb6l/Wa/
	 A4E4x+TI8Yv0Ul7ixF/YCRd+I7IGskTM931dgJIF8dlKxOrfvaUx5jiRe+LrSLJvJR
	 GTDRD8FJ932gDb4SSVU4KVc91Zr8tQc2+6PFtVijAiQAnX+WegEEwixo41VHZcbZYz
	 WrrhK+0bTr8Eg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20261101100000.725282-1-amadeus@jmu.edu.cn>
References: <20261101100000.725282-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 1/1] arm64: dts: allwinner: a523: drop redundant
 status=okay
Message-Id: <179553936644.1403078.18380005344784307573.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:06 +0800
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

On Sun, 01 Nov 2026 18:00:00 +0800, Chukun Pan wrote:
> Device nodes are enabled by default, so no need for
> status="okay" property.
> 
> 

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a523: drop redundant status=okay
      https://git.kernel.org/sunxi/linux/c/b1ec3dde5185

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


