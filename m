Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B790606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UKvrRA1M;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PBzV4Wsp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WcbMZkXCoDF1VinxpXAJnqvIlxoOmrzgyATGNwq43+A=; b=UKvrRA1MaK7A55eBWG2rbJek91
	BMy1+tJLJNS+6t2BAVhUC9ksV+qx4ywXYEi0QqIp/SbdbvXCr89nwNQ2w+073PBsV43hxwrVnOpPP
	g13tvjijcAStvV3opKP0ck0Ax3o3s9ixp2fJq+Z3rNU5vtX9i8DOw2UnV9DFqtQEgsJ4gCeFSyPWy
	B8jIzyv5r7axft80SBcZiOFFF1QwUV15MPnPFOhZMdoeYuBWPT37tP5Ey52j4fV/64w72dEmXju1c
	cbaL/3xh1ZeZFft12yeMRbIZSK2G5HJ2S3IgVDC1sfT0tTfb91WR/9H1NLwpr7IJNaiepas3JP/tC
	xPRatvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmJ-0000000C5AT-1s0x;
	Fri, 13 Nov 2026 08:36:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmG-0000000C59q-2p7l;
	Fri, 13 Nov 2026 08:36:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C664F625CE;
	Fri, 13 Nov 2026 08:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5641F000C4;
	Fri, 13 Nov 2026 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559015;
	bh=WcbMZkXCoDF1VinxpXAJnqvIlxoOmrzgyATGNwq43+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PBzV4WsppZXw4ka2DOy1kwykexWL4bAIMtz3UGqpszC8BjXZOqibQVEak+Kq8c2AD
	 E9MoBORWZjLCTHwkZw2yNrZpnDZYomFvPvujDxPrnlTKZhareQb8KW03DjiHggPsVD
	 tKHuFgUA1YCBXSlUCpujHQPA63MU1r4pjl7ydLipOTatGwpsKnG2FqYBuSZz0w9Qcy
	 8VYFjAuReeAASmkWQEv7vtyws10AHAFWupq+Efm/0Pcw3uODhzFFTmxZQW9IbZ64c9
	 Buwdmzq1v2xC4k+hKLTIiIQ1FoKFwnZTNDkNRnOtkRClPBEcafGl1qVLk+RzZWSyaX
	 PHmF4rAz+hHjQ==
Date: Fri, 13 Nov 2026 09:36:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sergei Khomenkov <shomenkow@gmail.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: media: rockchip,rk3568-vepu: Add the
 reset lines
Message-ID: <20261113-eminent-vociferous-walrus-2d63df@quoll>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-1-18561fd48838@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-hantro-robust-v2-1-18561fd48838@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 08:30:47AM +0000, Arun Iyengar wrote:
> The VEPU121 encoder cores of the RK3588 each have their own AXI and AHB
> reset lines in the CRU (SRST_A_JPEG_ENCODERx and SRST_H_JPEG_ENCODERx).
> They are needed to recover a core that is stuck on the bus, which its
> registers can't stop.
> 
> Describe them as optional, so that existing device trees stay valid.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


