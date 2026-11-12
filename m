Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49191606B5BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F3hiBott;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/WwOyIr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HyWSHHx1ypekksDhSqGRcHe+rqBksxrZ0hHOYq4hR8Q=; b=F3hiBottCQ1WeKmVDHBLxBTXsB
	JYkgfH6LQgFficzIyPn61lQGyh6kD84OcIYzHmdjTXz33Ax6w/YzPKXn9BXpzQLccviB1jEKk/OZ0
	5hZNRRG0Qy0RHyUz1r8RkX4CAYmSp0OFe6nbNSRfQ5dMeWP9911hRqqu591UM2KQwhAEKyNyii6sb
	thgATg246ThWs83bj1gH81ZUYpL31GrXEUz9Qb8G4pamCcfOfShCfajj/k75nZ+NCtkleNPfacv64
	QBo4MF3ulSBYj53Kq/EPw+8bKPq8uIHwuhi812mtmxEnpcY3uU9TQR1/pqN4YxT42HgpajJvaKq7g
	2vin/OgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQPf-00000009DI3-2vMO;
	Thu, 12 Nov 2026 08:44:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQO1-00000009Ce5-3Y4z;
	Thu, 12 Nov 2026 08:42:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D2B560E04;
	Thu, 12 Nov 2026 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE1E1F00A05;
	Thu, 12 Nov 2026 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472944;
	bh=HyWSHHx1ypekksDhSqGRcHe+rqBksxrZ0hHOYq4hR8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I/WwOyIruZoMOkUbGZNU6q4KT0lvUgSB1p0xtgfgmttwEDqeTAtHNv/9hB2uu2Pki
	 Ct0JdXpop0O6/xJQVc4xLUrzytzxwr5hXLsd72kJvIvqhBGnxnyv3RkQ5jWbOMHO2x
	 sjQ6WhW+KLS5CKU3ObYd4049NdGP7DVLVBAo7APkV59B7WWAWU2cjY1M9E5YJ/3Doi
	 hF8f769e0iOZNKoVjkqrqNQkVz4U4wbnrDjzeg1p/ry0Ymtzy9sIDCytkJdd9tBVm9
	 yAA/+4gqk4Anq6KNVFrU5Rhvhuw5yt7O8eh2sL+NlZC/NDiprHgdbjEGObYTC8C6Zf
	 I8LrdD9/zjQrw==
Date: Thu, 12 Nov 2026 14:12:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-ID: <avV77eoO96zacmoq@parshuram>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
 <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
 <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
 <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
 <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22-10-26, 10:32, Coia Prant wrote:
> Hi Vinod,
> 
> Gentle ping on this series.
> 
> The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
> https://git.kernel.org/netdev/net-next/c/5e91edfb0e45
> 
> The DTS changes are waiting on this PHY binding and driver to land before
> they can be sent. Is there anything you'd like changed, or is it just
> queued?

I dont see the dt patch acked..

-- 
~Vinod

