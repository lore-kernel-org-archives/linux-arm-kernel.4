Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8216606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VEKYF0mt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sdiioxly
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=; b=VEKYF0mtZ/i0Q/PTlqG2A0EJ7g
	1Utv/4m+BmP0zaQDbC5U196FnmiN6/LGzMjGHs3Vc3u20Ierp2wk2k2VPVqiqBhVyQMf7XIXOxxz3
	0HNOSHFp8NoyoF5Qu0RA6wxvLLuwTFE6tI0kDdfJXSGUSwfIFv/2rR6D0+OzEvjHIexA/jIii7ESv
	eBD3dZ/B28Y66ZA+AcKRTbO0szzcVczcSusLYc2StFiCbgkCt6mK+I7EcNgEdRlZSMKBJfxMWoxrV
	R5huW7h0bxv8btIUF+wxzYBKyOuM/fQvinBjeKuD6qMw9K0SMHaYOjgMFzVmrKcwVGNHKROJwohyC
	wuqMK6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS327-0000000F4qv-2Wi5;
	Sat, 14 Nov 2026 01:58:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS325-0000000F4ql-2L61
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 01:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F00DF45BD7;
	Sat, 14 Nov 2026 01:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146DD1F000C4;
	Sat, 14 Nov 2026 01:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794621500;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Sdiioxly7NjwFRO575POppKZvua3L6WryftyguGqSYZamdJsAojMHIkMmxVFp/WNU
	 H11hZPL1loqMrPcgNMIObTCzDN/d+3JZAhV6qS6+qU0Zi4nge1AKK8jHoqEHcbgbrS
	 JszJ5sF2FyY/XmcApaHlAFQU7Q9Wsk5CakCfoT7+Go+rxOSdAXTbhHHoSOw4jzACop
	 cztjbReNHN7gII6vEbqAbtU9WxXIp9iWIewja+SU7FfvjTgWOjeIKZ/NxPYWNw5Ms+
	 9ezlAnYa4JJTxUYRklbQGmxKWLeuahQB5NUrtbmkKiUSrAE0hDM6o/5NMF0yCibrje
	 9W1GVttm762lQ==
From: netdev-bot+sinfo@kernel.org
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, horms@kernel.org,
 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC ASP 0x2
Date: Sat, 14 Nov 2026 01:58:19 +0000
Message-ID: <179462149962.2168702.2687296647559611353@kernel.org>
In-Reply-To: <20261114015554.2187341-1-zxyan0222@gmail.com>
References: <20261114015554.2187341-1-zxyan0222@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

