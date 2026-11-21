Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E8606A699
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QZgzAT1z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqOFmsnc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EMCAKhcauQqF4krrprPAqbzo9TePN9barIrQOovM2kw=; b=QZgzAT1zem8/vF
	ySb90UU1dx3zIc4KcTdbnM3v1wUPqmxwrjlysYvrKB7MCxR5Ih2FkNSYJKvXlFHyC/5XV3v4yqwEw
	9w/QtimtM8rRgohgZmsK4vU/qYxJ0U5hGKpjMWLpm/IjSBUYa9OdeFBt8Z5Rfph1qtTIl7L+CUTH7
	kjE7H139y+wWEbxrF70EXVvwkxhDd7TcVe+blES3N+CnhANiNvrSVHSPesCXjWCru538zh2EGHwis
	hbO1R97wWigXS6U8rNBVItiq2eacetaX70hpqwW2ZPRiiZ+b6woBafwShpFicLIxQHQCjMwWMebgg
	pbqRK2LBEZSjWE1mmU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUaF5-0000000GfGu-2jw4;
	Sat, 21 Nov 2026 01:50:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUaF4-0000000GfGb-03GD;
	Sat, 21 Nov 2026 01:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19E6B61272;
	Sat, 21 Nov 2026 01:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA121F000E0;
	Sat, 21 Nov 2026 01:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225812;
	bh=EMCAKhcauQqF4krrprPAqbzo9TePN9barIrQOovM2kw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KqOFmsnc71y3ofBBu9xyCEYqK/DAyjN4APR5/FqaSuM1DtxL5iqyGya+mESPgCcop
	 dH8vJ9HiKcdKBT68CfRcBujLEqZTNBYHJzxpoOgvpTleiX0jj5UuuGujucuR2rmRFR
	 l8P1eRPBYlTrPu6Gx9aNotHFyNA/h8tQgy7JC4Ze6VcdiHzFpFqTMtG7Y87nCX7rzV
	 DVkVJRmnK84cs52a66YyBoYLFRJxm2nuLhnUbk+Qf86y2UH6fI2s/Ad/xENvfW3czi
	 vbD4JYCWJ3oG4CtztXK73BSaRQ2J7DeRd+TWBh6fOpHMp3w5VfN8J8/8Nr7WEyjENV
	 DTPTUscPu8Z+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773C9380AA5E;
	Sat, 21 Nov 2026 01:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5] net: pcs: xpcs: make supported_interfaces
 authoritative
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179522581102.882976.1777503818733834004.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:50:11 +0000
References: <20261117175215.3015703-1-coiaprant@gmail.com>
In-Reply-To: <20261117175215.3015703-1-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 01:52:15 +0800 you wrote:
> pcs.supported_interfaces is the mask of interfaces a given xpcs
> instance actually supports. The compat table describes what the
> Synopsys IP can do in general, but a specific integration may support
> a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
> SGMII and QSGMII in hardware, but does not implement the C73,
> 10GBASE-R or 2500BASE-X modes that the Synopsys compat table
> advertises.
> 
> [...]

Here is the summary with links:
  - [net-next,v5] net: pcs: xpcs: make supported_interfaces authoritative
    https://git.kernel.org/netdev/net-next/c/b09a65056479

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



