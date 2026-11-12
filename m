Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05227606A21E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jDrtz+vk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RVb1ofME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P5iVSfC4PebKGq7ThZH76L5c18owWugS+eX0tVrTM4M=; b=jDrtz+vkFMYvYB
	l6BYypDQvFLEpja92nwOwy011qcYkmQMJa7l/q0euFMfn93kL6PNEzFdQsZAXR1RkeLS+z14BNhYB
	51TvHZuLjkVB3B9aNdQlm8XlnCuuqjORbFDiPy3gHNZI487cqdFh+kJL4ywkDtR66+1xSVXXY/J3k
	tZ/RvbXBac+drryxZ/jfeKElozf/f4U/jz2zAtg+TM/uoRVEsRcHTBpmOr3geUY7DEtcKnyShzP27
	zM+3JWWbcobpJvcL4nKx+iomVKlTGQUfC+sd2tfDPb1JeuLk2Q/ianmP8DpPU84z8MlkEZZYz1xFx
	6KOgh6piSakH2xVLUbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYn0-0000000Amdw-1IUF;
	Thu, 12 Nov 2026 17:40:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYmQ-0000000AmYK-2ZCG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:40:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0C2E61758;
	Thu, 12 Nov 2026 17:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837981F000C4;
	Thu, 12 Nov 2026 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505209;
	bh=P5iVSfC4PebKGq7ThZH76L5c18owWugS+eX0tVrTM4M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RVb1ofMEpb49KY5k3LAPGURGviC1jeHN7lTGe7CJI72SYt2bHwr379B+HnzcfCQyw
	 BewipxKFLO+JNMsaAd6ocGv7sniJI8pD5T2f0ys5ftSnKyfbAszY76Zs4Pgxcyzfwp
	 quLE18m6DttlllAc1PYMfk8KyB/EdfvmsnYlD5tNR2K0blRB9aLfZGEuUVUthL5R0C
	 db42/XS8NTZDICwaz0gJKN2bo7wsJ+UgrSKOHXajv59G758SMufmaejIXaPwn3YoOn
	 5NAO5NK22jBuZNL6aMp+yewn313w2qkmw0Ipyx6Zl0Dv47t8PdTcZ0Thcpj+lJktI3
	 VrPghiycMPoQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773D1380AA78;
	Thu, 12 Nov 2026 17:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: ixp4xx: fix OF node leaks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179450520802.558080.7315802190681537713.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 17:40:08 +0000
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
In-Reply-To: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com>
To: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, kaloz@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 15:08:00 +0800 you wrote:
> From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
> 
> ixp4xx_eth and ixp4xx_hss resolve their NPE and queue phandles with
> of_parse_phandle_with_fixed_args(), which takes a reference on the
> resolved device node.  Neither driver ever drops that reference, so
> the NPE and queue manager device nodes are leaked on every probe
> (and on every -EPROBE_DEFER retry in the ixp4xx_eth case, as the MDIO
> check happens after the DT parsing).
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: ethernet: ixp4xx: fix OF node leaks in ixp4xx_of_get_platdata()
    https://git.kernel.org/netdev/net-next/c/81d20448c14f
  - [net-next,2/2] net: ixp4xx_hss: fix OF node leaks in ixp4xx_hss_probe()
    https://git.kernel.org/netdev/net-next/c/37f53abe8ee6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



