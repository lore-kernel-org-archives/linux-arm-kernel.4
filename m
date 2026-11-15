Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DF606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3P2koHf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7WEGIfH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UkLWAV1hSmkKAmuwwqothfPZt11tAhXLerlu5PLiFXI=; b=E3P2koHfeYnwYX
	w+FsSMAL8CcZXsbNIH1LRy/oVQxseICeqn6lO3MiV7cNZqWwUpbSXfZ+yfwb24DmSeTu4UHOaglCa
	S4Mp4XFCa2ueLIR+h076Fv3o4MAzH20hPEE/upsAp+UwY8WOfQxKpC9z92YNXKjrJBbd6I/0K/qCV
	3wnNDxNRA61kfQ2JZQyw9xHh1y149q3gDFWOXLn3zV5HSGnr5h/IqnYftH+gAUbQov8vsnhmygjCx
	0RyjVP/ZgXZ5XRikFii30WfzMO3BRq/xMprf1vVArIYAJQQPGwvtpxtjt2rXAHm/FPAtDrVnAo6k8
	/8R+d6uumu7+95j3D18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYW3-0000000HSHt-3RMm;
	Sun, 15 Nov 2026 11:35:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYVz-0000000HSGk-1EGb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:35:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7958C60E03;
	Sun, 15 Nov 2026 11:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89651F000C5;
	Sun, 15 Nov 2026 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742518;
	bh=UkLWAV1hSmkKAmuwwqothfPZt11tAhXLerlu5PLiFXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h7WEGIfH8FvaqWXLN0d7OMtr/gQbGsGk9acfLe13ANtU20xLLJK1gxR+UiCXMsdyr
	 ErPTlvjSFCTKpyfVT5Fp+afuCFOMJQzhED8RQQf6V/HOlcTDpihhz03CZYc4n8zLL+
	 7i4UyA7jqiDtbVybiKkXjgdWsUmfM0w/fPFRzxCAJpCgEHB4NBjLOFaH+FoClGyoK6
	 x87ZvIsEd1c7LQCraA1DFLAV/OWgIZhfMcVM6/7O2F2mFKfhTFYKYXAJHfrTFISUAW
	 ku9q4aIK2ufEJr3zJGj5kS4rIpYA4LCAgYc3vajsCWUX300tkx5Nw+tgdy0D9hT+4/
	 qRUTvOGSO8IgQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185148.883318-1-jernej.skrabec@gmail.com>
References: <20261104185148.883318-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC
 clock to 37.5 MHz
Message-Id: <179474251652.3095306.12076464290738502589.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 19:35:16 +0800
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

On Wed, 04 Nov 2026 19:51:48 +0100, Jernej Skrabec wrote:
> The Samsung eMMC on Banana Pi M2 Ultra fails with "data error, sending
> stop command" within a second of sustained reads in DDR52 mode at
> 50 MHz. At 37.5 MHz the same board survives a long read/write soak.
> 
> Limit the eMMC clock to 37.5 MHz. Also enable the hardware reset line,
> which is routed to the controller (PC24), so the card can be recovered
> after such errors.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC clock to 37.5 MHz
      https://git.kernel.org/sunxi/linux/c/160738a3721c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


