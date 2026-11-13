Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4144606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sz/vX9R/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VXbI+uNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bab0N+yEved2w0W90lFP2++NtYujTN45CVXQAOjD8eA=; b=Sz/vX9R/j9ZAnq
	NWb17LAlIO7U0tQ8uY4+k/k7mVv9BPdBapU1scnQdiLpAH3iVIcedruCHPuRMgIADc+dKta61sigz
	3U0cfRccLRpu26+N2v7CQJAoGj+SJxuk+jUVKlmlXxPghZuXePnaxT0nQLyCTCT9Ml+jzMRWhW8fc
	sTgZkRRmnIOvNND13CspvARsdZ8B/RnF8UZWFY/HLeN6oM7FDJetgmh3hhhhq4qnUrFjWjzZEg/q5
	7dwWQcYJh7XjxmrT6wsp+p72gLJMD0ak9x8pg6+u5e5rQ5EE7dcNd21A/ru3a/Vbfu5oGshct+zUx
	xif08WmCxY9HoCtj13Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrbT-0000000D0VT-1mFr;
	Fri, 13 Nov 2026 13:46:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrbR-0000000D0Us-0pEF;
	Fri, 13 Nov 2026 13:46:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2C97413A3;
	Fri, 13 Nov 2026 13:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB601F000C4;
	Fri, 13 Nov 2026 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577564;
	bh=bab0N+yEved2w0W90lFP2++NtYujTN45CVXQAOjD8eA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VXbI+uNXGx27gfeM+j4qz1ZfFhbZLGD2M+vrBM3A2E6Qkit1YFLWkx1674RT+elpL
	 5k8LkNMqWxMa49+OTsQYQcItDCDieVU0elo7UK3G9GNsgm6XtQs5x+Xw5AyBdT9K9Y
	 pCWUDFKDCtXYbZ1iVOv7aZC97m55txbRRuGwBPM9yy5hajWUq9j3oSPXJxost9gFP4
	 vXAkCEuNPdZ5sBpEbTvFoIyem12e12qaO5MVOhYmVX6TBuOztW7dlGuBqeqLwLycuG
	 9J0iY1Uqw+I/0Z1ca6NIOlmwskUZvFRuhv+NsDEFhjqpx2bEKw9NAoqRmVWlWFiDXA
	 6pk0rpwjpW3kg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
Subject: Re: [PATCH v5 0/6] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Message-Id: <179457756031.652128.8747150770670489287.b4-ty@kernel.org>
Date: Fri, 13 Nov 2026 19:16:00 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 10 Nov 2026 18:19:13 +0100, Sebastian Reichel wrote:
> This was noticed on RK3588 EVB1 when resuming from system suspend. This
> is technically a fix, but its unclear when the bug was introduced and
> system suspend is broken on RK3588 for quite a while and not just due
> to this problem. So I think this fix can be merged the normal way via
> linux-next.
> 
> Changes in v5:
> - Link to v4: https://patch.msgid.link/20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com
> - Add new patch converting 480MHz clock registration to device maanged
>   clk_hw helpers instead of using legacy clock framework functions with
>   open coded device managed release handlers. This is a cleanup, which
>   also allows easy implementation of the next point.
> - Restore clock registration back to the original place, so that internal
>   users can access it early. The clock provider registration is kept at
>   the new place (after initializing the ports) to ensure the clock can
>   only be requested when either more than two ports are available or the
>   port already being initialized. (Sashiko)
> 
> [...]

Applied, thanks!

[1/6] phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      commit: dd341fe270a274f3cc9ed4218dee0e9aa25ad954
[2/6] phy: rockchip: inno-usb2: ignore regmap_write return codes
      commit: d5162b71dc6ebf997a9f64dab89ffd3bf9ebcb9b
[3/6] phy: rockchip: inno-usb2: ignore reset_control return codes
      commit: c855ac52ffe0df3e71943874ff28086e73e00084
[4/6] phy: rockchip: inno-usb2: use devm for 480m clock registration
      commit: 02d20d92bfa81d0198b318fcfc3527fa13401dcc
[5/6] phy: rockchip: inno-usb2: move suspend handling into new function
      commit: 13f67965a6a335811bcb9cac34042d4fde591d2e
[6/6] phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576
      commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f

Best regards,
-- 
~Vinod



