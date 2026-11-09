Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1584606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhsg/GYl;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WVq5Rx8Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+DtZ7KHlWFW9dVfF6zjD7yk0+18lEu8fKpeuCrRtv7k=; b=dhsg/GYlCkmn8OezX4Pzioi3Qb
	x9SQ3ECN4AJxB4gzammpZ5M5lg2A6sUiwJGTbUyp/Mn50aLktFX+HU3kvS8FThdO+WlwwSE+Maho1
	vZsUzrgp3+Gtfot+HXy9dvxwYdz+5/VCSrajrXm0ZxJaywhXDKoZmGQ79FksFFw0/j7PyGwI5sfTu
	ENeJu0kHluC6Jpoc0GYHENfBZBFuRZlBO92yiYnSBQ2FiWQYCk+2HHLn9ZT5fLbr9qnykZ6RVLOYG
	zENx/rE/CUss5bTQykH3jf2Pk30Bl1aOPPB+DEO7F4UQFgGGmOECdFPGIJrdFVYnvDbrBOOk8Z1qB
	fjVoKzzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLL5-00000000AGN-28T7;
	Mon, 09 Nov 2026 09:06:55 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLL1-00000000AFz-21n4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:06:53 +0000
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C6EA9200ABF;
	Mon, 09 Nov 2026 10:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794215208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DtZ7KHlWFW9dVfF6zjD7yk0+18lEu8fKpeuCrRtv7k=;
	b=WVq5Rx8ZoUxvHAaoB8Dq6aA1lBk0P/H4t3rZFjJp1onPwObugyhEjg5xwXO+i9EoKtKZhq
	AcQ39IAorFSg/0tyKCHoSGwTB+6Bw0poiugp6RRBSCOUFKVHP50IlBxToDiyxIPS76xLcy
	WEIsJx5OyilXHb4fnPiAZwZMWqJkyR1x6H+MCOwgfe8IdQ5sIym7d/Njv4Rx5znLP3xudb
	4wcP+OHhPgsTOGjMQcNzWHuAqQlVnxxfvaDjyYXtwb7J6UzDgqtce2ZcX/cHLE75i1y4mX
	029OTRmZltTic56PZp8ovOcQny+Qwm9Aw6hZMIA3pdf6z9mKNH8aHLV8AoLj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794215208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DtZ7KHlWFW9dVfF6zjD7yk0+18lEu8fKpeuCrRtv7k=;
	b=JrJjBMVDHh63w//pEpoICNa4C7XRUvep8URP44f0FrnQFNNn91NKL6D/uunzrS+N/7TaDZ
	TN2KXH96cRrRNPtqS3GoKuXEH3DCEPF8tsaR4JHOtmKQ1PSJ8nLPCAATOCO077x98hjw3A
	P8PpMakyd0SUwyLKz/LdGKeAMx4zhsbh7qjdIPjRiTPGqdb7S/Zi/zu2lthONhrV1JF87b
	4IB2IzHJMZ0DKH6gtCMh+nHquKURAX005F4ur5zN0FFC8+MOk72NnqJOVca7Va1EK+B4II
	ehmQKR7ADSLDO2thJk8uyCTDrJ74CxDRl67hROuB9+P7RrjSbgfOAgUCXd9IKA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794215208; a=rsa-sha256;
	cv=none;
	b=RkGpFIaeRX9mJqRNpOq1YveFioi0f+74ngkBxzy0t2mVwU5NQ0tMArUJAgaD7cL9gtJqAi
	9LLrrIVI36oKMtN4J1qulRWqlsI7YJb7FpYGqCU6M4sSj76RHedfYQ+mVnlA2kIVzm3gAf
	RMjzlkazLGMzn8a/zV0sryhw2Z2DE/jlJHbtMM6HUqY9bA/l8ldbXHUiwNkvtM0FSmh02g
	JW+YD2eBdZtwsbv7diRzvXLcbhoE+G5y/aJROC+H8uDQQHJ5OvK7TYLZ0y7zub2Fzvu/cY
	Hs5o3zfSiEdwrnsXpoddQldraaQmAPcTzv2TGGG9mOk1vamURmI1aB77V1zARg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Shawn Guo <shawnguo@kernel.org>,  =?utf-8?Q?S=C3=B8ren?= Andersen
 <san@skov.dk>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
In-Reply-To: <a8a10c4b-993d-4cd4-9e99-fe7b0eff5597@kernel.org>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
	<20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
	<20261013-musical-brown-mamba-ff87a8@quoll>
	<87v774j0z8.fsf@pengutronix.de>
	<a8a10c4b-993d-4cd4-9e99-fe7b0eff5597@kernel.org>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Mon, 09 Nov 2026 10:06:47 +0100
Message-ID: <871p8uidaw.fsf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_010651_701353_132AA261 
X-CRM114-Status: GOOD (  25.19  )
X-Spam-Score: -2.1 (--)
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

On 2026-10-14 at 07:53 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 14/10/2026 07:38, Steffen Trumtrar wrote:
> > 
> > Hi,
> > 
> > On 2026-10-13 at 09:31 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >> On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
> >>> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> >>> similar, apart from the Display and touch controller.
> >>>
> >>> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> >>> variants to use overlays applied on this base version.
> >>>
> >>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
> >>>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
> >>>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
> >>>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
> >>>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
> >>>  5 files changed, 91 insertions(+), 99 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> >>> index 475e1ad9116e1..7c1b61249778e 100644
> >>> --- a/arch/arm64/boot/dts/freescale/Makefile
> >>> +++ b/arch/arm64/boot/dts/freescale/Makefile
> >>> @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> >>> +
> >>> +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> >>> +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> >>> +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> >>> +	imx8mp-skov-revc-tian-g07017.dtbo
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
> >>>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> >>> diff --git
> >>> a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> >>> b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> >>> new file mode 100644
> >>> index 0000000000000..33ddd08a7adb5
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> >>
> >> I do not understand this. This is a board, so not an overlay.
> > 
> > yes, that's what I did up until v4. New board with new dts.
> > 
> > - Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de
> > 
> > The boards are all very similar apart from the touch panel, but they are all
> > "real" boards and don't share a SOM, so dtsi is also not correct.
> > 
> 
> So why this is not a DTS?

One could argue, that the board, the RevC-Touch, is always the same hardware and there is only a different panel connected to it. Which is what is really happening. The panel is an attached device with these boards. So, imx8mp-skov-revc-touch is the board without any touchpanel connected. This still boots and is a standalone board where you can connect different touch panels to.

So, Peng [1] and Frank [2] are correct when they suggested overlays in v4, no?

[1] https://lore.kernel.org/all/akupDXc1QA4uKfR6@shlinux89/
[2] https://lore.kernel.org/all/ak5nKnRUmOxDxgZd@SMW015318/


Best regard,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

