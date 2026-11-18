Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AEE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pNQfhcfy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UV+J/67M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HDCAkeZEKgNECITteEp+O5Hl5QzBetAGqDu6m3T4vtc=; b=pNQfhcfyykEMyVm1+U1UeUSVsH
	jYqVZhkEetEe8wmSJCbwxlh3EwTBr1gp8ZORYX5jUJlvPo34GckiIPyh0+V9hC9TSRwF7adssE45s
	rNBiiDSPLXaPTxWtoeA/PIJDmYQdTB4kLJf7dugejwogqCEAqFHOxy8EvXsRVqKA03hlcEaky7q0A
	Q9eOokqp288KoByGa5nMCctlDp/E+3cMRbUCUpxAdo0BnP1RAPuWj0ps8rMRAslSHPCH1nTJzK3Ps
	Hbbuh/Z0gNspfwaB5+gFYbyE2b4pI0Xy/rM86BnIStx0/wZPoE6HFfki1aAuYMlw3og7T3bdKSY68
	5HL3wd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmwz-0000000AI2P-1giz;
	Wed, 18 Nov 2026 21:12:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmwy-0000000AI1z-0hQv;
	Wed, 18 Nov 2026 21:12:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A74863DD9;
	Wed, 18 Nov 2026 21:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7651F000C4;
	Wed, 18 Nov 2026 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036335;
	bh=HDCAkeZEKgNECITteEp+O5Hl5QzBetAGqDu6m3T4vtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UV+J/67MbY357XaDQY1wb463wX0IRk8wkHXFkoWEZenbFaJyhzFuIQfXCNSwvwfJU
	 qy6eTYeIkjCOEiGamXPX38F9pDt1amP3aLvKuwNzXFBA5vb4wdeguOZ46imbpQM3HH
	 VbmZy/7x+nH69YQY2OOsAnYP+h77GPwhZ10eb8lYWdibiRsgakr8hNR513hYa6OsHA
	 gpASOlSPUVEOm4CFtta8+PxVQjSIgJg3YiJ5RcBr/ZHi2Xty17GWUHctn85sd1BqVt
	 XJsm/JrHHT7qBnq9NK7Lz9rP/vkw47eMBX/Cx9FWYGHGKivBZvrjK+3uTjCI4IYbJ+
	 LGk/gzldD+MoA==
Date: Wed, 18 Nov 2026 15:12:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sergei Khomenkov <shomenkow@gmail.com>, linux-media@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Will Deacon <will@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 09/12] dt-bindings: iommu: verisilicon: Add the reset
 lines
Message-ID: <179503633303.1026294.13265931291841937198.robh@kernel.org>
References: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
 <20261113-hantro-robust-v3-9-82383c722ad2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-hantro-robust-v3-9-82383c722ad2@gmail.com>
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


On Fri, 13 Nov 2026 16:40:40 +0000, Arun Iyengar wrote:
> The RK3588 AV1 IOMMU is part of the AV1 block and has no reset lines
> of its own: the four AV1 resets also cover it. Its registers can't be
> accessed while they are asserted. Describe them.
> 
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


