Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CCE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXiv7Ety;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iwUpONJa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ooh2Ut4OkXb4cnFIzK24GOQEm3EtxNlb5xhtxv/8OV4=; b=hXiv7EtyHPZls0U7G3hUSrbLQy
	HHscrPe3mWrx7yuM9cRehMN8n7bLfNdcexnCCPuUKgj3+tpDaoHrAo7a0YVD1+YYz33mbBtzRBaZC
	b5b3vi9QugyNKK2WPJ3sfh4Ah2KpXH3RPHjYj7SMA6posX5aE8begT9OYDYfV+zdMqbY231HazxKi
	DGde0yEiRmyGh6rKCs/UAVS6CRujNbNTgs+ejr3/aijEdQK8shQM89nTQeH3Rww0UyGFADsFxikt9
	EFTxh4eBhTKj2rXG+V1wboThc0fP0DZ7iNUtKY2otLyksoMOAydC/qep5Ku+jNp93J7r2L39Z8G6d
	9yPIoS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmKt-0000000ADbX-0Fls;
	Wed, 18 Nov 2026 20:32:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmKs-0000000ADbE-18fN;
	Wed, 18 Nov 2026 20:32:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6F5963B82;
	Wed, 18 Nov 2026 20:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433671F000C4;
	Wed, 18 Nov 2026 20:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033973;
	bh=Ooh2Ut4OkXb4cnFIzK24GOQEm3EtxNlb5xhtxv/8OV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iwUpONJaUZJPm+lXfBmkJc0tKTinjGLkWtnilXXoN2c5fi4Cj/2nKIMegk74eoqwI
	 S/9+rLm9GzfnB4NHfENFH/Lz0PrpvlBvocecRjvuNR5xNun/AxYylBQyPOJ3YU0c+5
	 hzIE9sWbbGAF9xmHBgvni12CMMGL7heqcEvsP5XIMGHCLPUAI1OP3NfLBGh9QKhcpG
	 +Di9hNVRs82vn+OjO6QWEBIYZtDMhJMkyRtT6+q4N9E9oQII6G58ZTMtei6KzYg1hn
	 5BiQ+wU4nOzTfnfoMicgqiA4ryx1KIUKHTvPlgPCoXNmcV6E91OTWsJWAwVLAyk4Bi
	 4PqgTqj5roQeA==
Date: Wed, 18 Nov 2026 14:32:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Simon Xue <xxm@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>, devicetree@vger.kernel.org,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Niklas Cassel <cassel@kernel.org>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
Message-ID: <179503397082.838785.14210006963521500308.robh@kernel.org>
References: <20261113-smmu-v3-pcie-pd-v3-0-39eb4f919529@gmail.com>
 <20261113-smmu-v3-pcie-pd-v3-1-39eb4f919529@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-smmu-v3-pcie-pd-v3-1-39eb4f919529@gmail.com>
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


On Fri, 13 Nov 2026 08:45:05 +0000, Arun Iyengar wrote:
> The RK3588 PCIe MMU-600 has a clock (ACLK_MMU_PCIE) and a reset
> (SRST_A_MMU_PCIE) in the CRU. When no PCIe controller holds the clock,
> it is gated as unused and the SMMU stops responding. Allow one clock and
> one reset.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


