Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zU/njDtB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhbHDnhq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CfhMFAUFDbWoJRBmu9tGLqNA4W0g6TELIvWPuiErhDw=; b=zU/njDtBnTW1OHVFTDQXNgB+EK
	sz6lB8puoSnsAFPXfveCeacObUNybyfOgTIJpYfDhCNn5QD8gD3njVVjxZGTY+3IfPSgejEg6YWOB
	OFdnVyy/3oBuhwyrxq6Z1kF3Ntq0UJCn15B5pJZILNI15M+jmJhWkJz4n0KxnFNyP0ekmfNGRW52v
	N/tKNAzqP3FndSXVshSvlsjD4ryeYlCV1VKQNSEWzJkxkNzknLsL9ZyQa2k1WahZD+Cn82Zxxsisq
	qIZ4ARUmCGDIt+95r6YClpp7ge/+M86XioXGh2ba+5wr6FPcWij8vm9bO4R9v0GVw1n9Bqhb8gz4Z
	IeH61NXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCCl-00000009qns-4AXt;
	Wed, 25 Nov 2026 12:34:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCCk-00000009qnl-2akz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:34:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B5DC42E8C;
	Wed, 25 Nov 2026 12:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827661F000CA;
	Wed, 25 Nov 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610069;
	bh=CfhMFAUFDbWoJRBmu9tGLqNA4W0g6TELIvWPuiErhDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FhbHDnhqjlmTdrbOe4QuxzTLaw1MsJz3P8U6qGwC1ppFUHnccHP1rMaycukB59UUJ
	 u6Al4a3QABCe/6OoKosBrLsNLwnVVZHRzw4w/E0+9+ziLPcSZee/T6YIeRXrCxhtFl
	 iIg4QPG7ToM1dPCvTOD5upnFKnOZ3MsULBZd+jDCeCIkU2P5BKCZYfvwg79+hkTDG3
	 KebcoDbizyl8NFHbmipPM72oYQNBjEHAD28v7H9XRl5YDZfmWMr4qQRsM3N6kY6aPd
	 0Ar4sSigUObzPLXZ43isDpGfBmGVMOtSJiv3jtbgjqhoWMlR30XrHznNNsHpKArYm4
	 z1LSWB5F9fOSg==
Date: Wed, 25 Nov 2026 20:14:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
Message-ID: <awbREK0TPUBmw97d@xhacker>
References: <20261124150144.7505-1-jszhang@kernel.org>
 <179553409391.3294.4369903743102583251@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179553409391.3294.4369903743102583251@kernel.org>
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

On Tue, Nov 24, 2026 at 03:28:13PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

hit during development

> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

actually triggered

> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

synaptics SL2619-RDK board. However, every dwmac users could see
this issue in theory.

> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

