Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCwsgb3P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nivgsl1R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c12Zkxjeg6rjGrTjjN1zUUM8OFcraLXLi6+BuwMU4QE=; b=GCwsgb3P8zjCrM
	cf8HBnl5tSBDTfgjrvgZ2W2g8x0vPmIUjMsNqDOVFAGMdYfLZmV8k6uXhvZiS5xzeE1gkspoZIPzs
	e44BJVt255+SHQ4LSvT/DYw1Adjj1O7QHruOAV1XM+BxMazmKChWtjHG6w/UI3qe25r5vCZjnM+nF
	p8TJTzdJI/ErVM0eD3U7ulvgqm4k/Qe0tdMFpr39SVaFtLDmfSViiBJKyh5X96ALTeY4903RMFRM6
	JWA2W77TXx7wIYaZ1YsZVGKJKbQ1RqNWgtXUywY5SFHkwHP5q6EcuCE5Rsw/SVvFnymT0ZeC66QL3
	KpA95w4C5qcY0InBDLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuzj-0000000G6ky-17dy;
	Fri, 27 Nov 2026 12:24:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuyw-0000000G6Qv-3jyO;
	Fri, 27 Nov 2026 12:23:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8650C43F0B;
	Fri, 27 Nov 2026 12:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231E31F00893;
	Fri, 27 Nov 2026 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782194;
	bh=c12Zkxjeg6rjGrTjjN1zUUM8OFcraLXLi6+BuwMU4QE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Nivgsl1Rie9zo+jVegl2JAscy+WS4emvn5WXBN7aZeLouEqCRFW/Ij0cPiOxef4yB
	 7TQjWdkZHYz66WQRqFXlfVBwsN++Lp9UOko8o3ScfUYxRjjfg3ZzogLVfJ+JHj4F+W
	 43Y8KDsv5fX/Gc2ZKdkVbhLmfB8BsRtCa2RjwMa9tGdPWIwFRu3Cx7Z/OOU+kgHQXq
	 z5yRO4lqg/iIaF0YrsnJTC4L0bc4WX1jbOr/p+COqKFsf9Xyxq5uyJhtLLnAa6D5pL
	 dBZjo+iAslkSNaw2Zxgx4iZB+PiZge9QvRqqu1eFs3ktC7gUEEUPWEJeslVK2ygWY6
	 xPWJyHAWkI3Ew==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: rockchip: samsung-hdptx: Power down the lanes on
 phy_power_off()
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110-hdptx-lanes-pwroff-v1-1-c2f85b7e06a4@gmail.com>
References: <20261110-hdptx-lanes-pwroff-v1-1-c2f85b7e06a4@gmail.com>
Date: Fri, 27 Nov 2026 17:53:05 +0530
Message-Id: <179578218573.13164.1824444278264015973.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073; i=mani@kernel.org;
 h=from:subject:message-id; bh=Oj5HV/thFvMBEahPJ2+46+EsI+CFa7Kz8uIFq/XTiSE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCXYtawNTHXtgF90TUxjdD1J8a+FlpDcFmwX+/
 KgyshZ7F4WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawl2LQAKCRBVnxHm/pHO
 9TqhB/0VwhOvKxRk8npFn6N+osdlrMNKoI2eGwyv109+fEdDmkOPXYREVtdGfWLNYeuHaGvfdAc
 aOJGZhycAK83LE36fox2tn4fj3x1xZshOgJjxSsD43qRQOHWNwfu76yEsarhwVfXESxDaw2AKBk
 g1WfOuUOAQLtHdQBrWlRjD+/UUMCq8BeMQcjJTJdD5JyO4P78KT8aNO5tgkB1QpKCVo84OVZMpK
 zAPrIKIWjXr6wL6hArrhtXFCyl5Cw89T2ameZExNqqunLco244CWvA5MCccSy+cZc5eu3pkst2n
 7NPn04lmXFuf0buYSSDDLUyQhGA8LT/QlJ0NghLh0vHhuQky
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-10 07:16 +0000, Arun Iyengar wrote:
> Since the PHY became a clock provider, rk_hdptx_phy_power_off() does
> nothing but drop the shared usage count, and the PHY is only really
> disabled when that count reaches zero.  The count is also held by every
> clock consumer of the PHY PLL, so with a clock reference outstanding
> the lanes keep driving the link after the HDMI controller has asked for
> the PHY to be powered off.
> 
> On RK3588 a clock reference is almost always outstanding: the VOP lists
> the PHY clock among its clocks so it can source its DCLK from it, and
> the Rockchip power domain driver puts every clock of a device under
> pm_clk, which prepares the PHY clock (i.e. bumps the usage count)
> whenever the VOP is runtime active.  As soon as any other video port is
> in use, e.g. a DP output, switching the HDMI CRTC off therefore leaves
> the HDMI lanes enabled and the TMDS clock on the cable, so the sink
> never sees the link go away.  The lanes stay on until the whole VOP
> goes to runtime suspend.
> 
> The lanes belong to the PHY consumer alone, whereas the PLL is shared
> with the clock consumers.  Hence disable the lane output and hold the
> lanes in reset in rk_hdptx_phy_power_off() regardless of the usage
> count, and keep leaving the PLL to the count.  This is the state the
> PHY is in between PLL and lane bring-up anyway, and the next
> rk_hdptx_phy_power_on() restores the lanes through the regular
> rk_hdptx_post_enable_lane() path, so no additional PLL re-init is
> needed.  The vendor driver does the same: its power_off callback only
> clears the lane enable bits, leaving the PLL to the clock refcount.
> 
> The DP mode is left untouched: its PLL is not exposed as a clock and
> the lanes are torn down by rk_hdptx_dp_reset() from the usage count.
> 
> Fixes: c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock provider support")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



