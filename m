Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C56606A89B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jy4tsh1J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yonu3wmr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zcZOYtsVTv31lVYaNP6RLbKLvR8+yhhBm9mhbhr/iKE=; b=jy4tsh1JeKKkZ+CwjegdjLK52v
	oSmfozDAUeEpMoTuKw3BXpVe/ocFlFx8xNxcXVVrZK9uTe1g5pRN+/aWEMZjUjs+Ln+ZsHO8fskGc
	PnZDIq30Hxe7SYA89LcNmsd5ZldxPTRhMplJ7PqBQWKmW2S5nsTEgecUOfKWP1mvKRYSM5aJJqENQ
	XjBcImWSF1jGUDDJsJumubuqsr8LDrajSITbKCIwuTGt9FhLc1wkMg3TuKEaCPDMKvE0lsfZTpnW3
	dvUtdTMJod+ut+Gem0+qAMcg/nqgd66mYFygvYfq4j3m/KITwxn2pKOD6cqXD9rGeEf4LWXUO9zIh
	2D/PcFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV33-0000000A7Z6-1bx0;
	Thu, 12 Nov 2026 13:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV31-0000000A7Yr-27E5;
	Thu, 12 Nov 2026 13:41:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC14E61407;
	Thu, 12 Nov 2026 13:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB38C1F00A05;
	Thu, 12 Nov 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490862;
	bh=zcZOYtsVTv31lVYaNP6RLbKLvR8+yhhBm9mhbhr/iKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yonu3wmrYZO8QH3w1HXbsKpwGYVcENzULirtc+rC4xIhTzxXLe8imyh9Wsy+ItVwd
	 hBl+SPQuH39iG8rpqFyAQ74d4UzPaV07pGSCOB28vRxa1+zx2HbmHl2HwkXEZiC5FV
	 2Ju2NdqmaRS6aAzWIyDH1qU5TAlYWns+gGL0Kf5AbK43+c3NDoXVayjIFKOSQsK+od
	 FEc3DT4RbjS8MqKXnAy9xJppBHvp+WF28kcptd3ykeZ017qen8Nftwz21ZwL18j0CP
	 cK6nlnzRa5dODjVazj/M9h4B7NCVTp9EzoOX3bm0Kh8h8j01eubv/h+kWEFXnXkjHA
	 r9D+pUlHgkl9Q==
Date: Thu, 12 Nov 2026 19:10:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <avXB6ga-QVfks8RF@parshuram>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <179353091270.2955.16595397888583885694.b4-reply@b4>
 <aufM3PCuU9CM8zFo@venus>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aufM3PCuU9CM8zFo@venus>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02-11-26, 00:46, Sebastian Reichel wrote:
> Hi,
> 
> On Sun, Nov 01, 2026 at 04:31:52PM +0530, Manivannan Sadhasivam wrote:
> > On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> > > The recent Rockchip platform have a combined PHY, which does USB3 and
> > > DisplayPort as well as muxing the lines in arbitrary order. Changing its
> > > enabled functionality requires a PHY reset and as the PHY provides a
> > > clock to the DWC3 controller, this can result in an SError. Apart from
> > > that the PHY might not start up correctly when the DWC3 PIPE interface
> > > is running. This series prepares a Rockchip specific DWC3 glue driver to
> > > help out with these problems. To become useful more patches are needed
> > > on the Rockchip USBDP PHY side, which are send separately.
> > > 
> > > This was split from the USBDP cleanup series. v17 has a dependency on
> > > the patches that have been merged to phy's for-next branch. There are
> > > some additional Rockchip USBDP phy fixes, which depend on this series
> > > (which is effectively also a fix).
> > 
> > What is the merge strategy for this series?
> 
> I see these options (ordered by my preference):
> 
> 1: Vinod merges everything; the USB side is mostly a new driver
>    and thus there is not much conflict potential

I need ack from Greg for that
> 
> 2: Vinod provides an immutable branch with the first two patches,
>    USB tree merges the immutable branch and the remaining series.

I can do that

> 
> 3: Everything is merged through USB; this would block the final
>    cleanup for USBDP from being applied for yet another cycle.
> 
> 4: Vinod merges patches 1+2, USB patches are merged one cycle
>    later and final USBDP patches are merged two cycles later.
> 
> P.S.: I will have to send another version for the correct Sashiko
> feedback on the DWC3 side.

Ok

> 
> Greetings,
> 
> -- Sebastian



-- 
~Vinod

