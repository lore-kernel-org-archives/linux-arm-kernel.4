Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4155606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJIrcnNN;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=PlUv11zu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jvCxwlOVxvnKYhMHTmlKe3u7SgksgRLz0kN7w/QcZLA=; b=jJIrcnNNud57iU
	DvB+7uP2BUUm1F4DEfs703n9DqG7lb5jRF/2L4QuA2XRwsgrsFut4YJzOlFovG/B2tbD8Zozcl5zX
	6R6xdTBoCodAeWt+G/AZPoKh3EGv+IL+eP6/yWrEvhYvICXhND899NGBu46cILvLfaENE3z0usk9W
	tYURT5H1IzpfUfR1wiH+gnGB2LHq05Cm7UBY/7DyDNwc+RNzPpWJYzr8swuHg6dkS1eOm3iHAPijZ
	enb9MU7rqeFYrV0riHvGjYMCbD+RnfifVyI1YXNzsq3fIaoDTVPvkRbf1L5RftkeF0iaq7Z0cbfeT
	yDNw76fN0I5Sz72RlnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFpB-00000001q10-0Fqn;
	Sun, 22 Nov 2026 22:14:17 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFp8-00000001q0d-0EN0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 22:14:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 660FCA1583;
	Sun, 22 Nov 2026 23:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795385649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jvCxwlOVxvnKYhMHTmlKe3u7SgksgRLz0kN7w/QcZLA=;
	b=PlUv11zuZmjCQ9XkkO0TWMYVaLHEBdR/ZEwNEQwGvaTjoK2mf3tmATDiyebZKtUBELRIbr
	C78c7ckRSlxFK2m+88dWVkS63z4qDLMgW/Pm15Jw9IsbWwzPCNWZCw0V1ghfzATIcrV7pI
	mzoHTGvMTV20Z/ktP0eVnAIyP0osVNs5UreK4vEkbC2bDd3qzcMWtsn0wcpl6Mqv/xOjMU
	BxSsXhcvF6bmc2zN2h94JOjZDVVHRxJ6Bb5XFU+ZTU0+9R1yIqD9Q/NlBiNSe92L+O/ix2
	Wd0OiBjCjSJSi1gn2oELSg2xWcUhpZ62fvwUxIUxOTDDeVTeqxPE5UosZMPyAw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 23:14:05 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>,
 stable@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: retry a failed RX refill from a timer
In-Reply-To: <CAH5Ym4ijMNSAWZ8k3GmwOoLDBVTy32B1uhS_fE-dGhsPkgozeQ@mail.gmail.com>
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
 <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
 <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com>
 <3303844cdf7c00c5369453eb91027c1b@tipi-net.de>
 <CAH5Ym4ijMNSAWZ8k3GmwOoLDBVTy32B1uhS_fE-dGhsPkgozeQ@mail.gmail.com>
Message-ID: <8e7b5bd372934d85ff890a6da7ca93b8@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_141414_561726_E196EF37 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22.11.2026 22:34, Sam Edwards wrote:
> [...]

>> Only if the ring is no bigger than the NAPI budget, right?
> 
> Right, but as pointed out in b6cb4541853c7 ("net: stmmac: avoid rx
> queue overrun" -- the commit that introduced the "leave one behind"
> behavior) the ring can be as small as 64 and that commit's author was
> seeing budgets larger than that.

Fair, a 64 entry ring is enough to hit it.

> 
> Perhaps NAPI should only be told to stop polling if we either:
> a) Reach the clean tail of the ring (so we *know* there are no further
> packets for us)
> b) Run out of memory and have to arm the retry timer
> 
> Thoughts?

Agreed, simpler than refill in the loop. If stmmac_rx() stopped at
dirty_rx and the refill worked, return the full budget so NAPI polls
again.

Anandu, could you fold that into v2?

> [...]

Regards
Nicolai

