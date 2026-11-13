Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8166606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppT568aB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5E4Lnpk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SNoLKxUB9rBkU92blcv5qQgqkRz/rRE9L1+6xhOucIA=; b=ppT568aB5VXABY
	0G+iWHa2v50CqQC40pcamAkoxdKLNp7W/OWAZoyIeadKbA/a+GdJyXTmiD6mmhXRcmBVBMNQrL7Z/
	A/brvrpp3MlvV1eT38vU7Su6Y1lG4Uhb9C+Ik8Tds4WrExc3fnUh539KtICtOtoOYL7tBkcStUYSk
	bMMAOJj/xCCgyMYEqp5dVpYO7XnmngYSFBPr+55MoNKxIC50ccvsxq7Zlo/IpECMxcdsbaur9DaJq
	mhzfh7v9WSzBYAkEttkT90rQIh4MC7FJO+WmVxznCSh1XDeF2+CUDll+hZ/odHt7lJcsMztKxM1oG
	IClZXuzZdPWCOsolW7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrWH-0000000CzLf-0zmE;
	Fri, 13 Nov 2026 13:40:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrWG-0000000CzL6-0sev;
	Fri, 13 Nov 2026 13:40:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96A17406CF;
	Fri, 13 Nov 2026 13:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098DC1F000C4;
	Fri, 13 Nov 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577243;
	bh=SNoLKxUB9rBkU92blcv5qQgqkRz/rRE9L1+6xhOucIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B5E4LnpkBq28Oq9EAKWTxU+UWi7ZQ+FXozOPosnLV1L8e46K6i2TMUCPLGfeuQ2e4
	 3JV/DtoqSxfwnzlSEx4QZLe6y5gWXxGPvq+WfTC0eW2VMArWrmJ5lnS0KGJy9Q54RR
	 6bCHv7qiqrqXkWtXVb5S2rDrtMmE9ynqNucJFhrIDr1MC2jhBKAd5V13Esfh7NUo9F
	 eYcuLvgDiCgFGGUbqSUNmLRprSGJiCiDVLU8W8M4HH6OOhqV1LOA5WF3CGoTmjyC5r
	 HOjBp1/zphBabRt/yAERDtHRT7hz3a8k9ugyiP8enhvZvh1JLLIC3iNpT9XbdfyD0x
	 uzwb5HFYEoO0w==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, daniel.baluta@nxp.com, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Oliver F. Brown" <oliver.brown@oss.nxp.com>, stable@vger.kernel.org
In-Reply-To: <20261110120546.6247-1-stefan.ghetu@nxp.com>
References: <20261110120546.6247-1-stefan.ghetu@nxp.com>
Subject: Re: [PATCH] phy: freescale: phy-fsl-imx8-mipi-dphy: Fix hs_zero
 underflow
Message-Id: <179457723966.636098.12816261169765119793.b4-ty@kernel.org>
Date: Fri, 13 Nov 2026 19:10:39 +0530
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


On Tue, 10 Nov 2026 14:05:46 +0200, Stefan Ghetu wrote:
> The hs_zero timing is computed as
> 
> 	n = (144 * (hs_clk_rate / 1000000) - 47500) / 10000;
> 	cfg->m_prg_hs_zero = n < 1 ? 1 : n;
> 
> hs_clk_rate is an unsigned long, so the subtraction is done unsigned and
> wraps for any rate below about 330 MHz, where 144 * MHz < 47500. Because
> n is a u32, the wrapped value is never seen as negative and the "n < 1"
> clamp does not take effect. The garbage value is then truncated into the
> 8-bit m_prg_hs_zero register field. At the minimum supported rate of
> 80 MHz this programs 199 on 64-bit and 181 on 32-bit, instead of the
> intended minimum of 1.
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: phy-fsl-imx8-mipi-dphy: Fix hs_zero underflow
      commit: 9a0dd2a09484e5ba45eb8e6ab58c0effe18703a3

Best regards,
-- 
~Vinod



