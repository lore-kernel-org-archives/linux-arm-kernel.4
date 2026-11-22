Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B82606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sf7zsTvC;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=frqHZnJk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uxe+/upGUtn9RMUQNSI1VT9y02p7mp9sPqgPQ5Y4SGs=; b=Sf7zsTvCFg+kmo
	a7mB9hROa+EKrMME+bBlbhPhDHObpFwAfs/o6HZw/39mR6UEN+fUhFSmRTkap/lgo9G0yzq3BnODF
	Oe6IV7Z7pxZAUcjWCc/0UTDDzwgLfbrga5XDFMc7RIGWiiihhhDOMQ+Py9X3bxBMs6iZs4ireDqWQ
	4070CBIYjVhg/Jic4tlXPKcWSBuS47tfUGsH2LX9flrFDzcrCauVTd0oqGWc/LZ1/PpCpEsMdLnAA
	mM0glWyCJoSGBqNpDY91Oud4JpLivzzXFvy/4OES/xNYEW1qVYytI97qeOT2guwTdWMEhA+4l4/Xn
	0BZ9o4zvHzfs3vV4R6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEop-00000001m8s-02Qz;
	Sun, 22 Nov 2026 21:09:51 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEom-00000001m8Y-0qkL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 21:09:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B99AAA035D;
	Sun, 22 Nov 2026 22:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795381785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uxe+/upGUtn9RMUQNSI1VT9y02p7mp9sPqgPQ5Y4SGs=;
	b=frqHZnJkTNxaPAjLmOsie2BAIg2lEWzgDqBSAagS74GBXq028DxAkyGhmH4Lc/UTP9h2/D
	ADmcniHun9j5JI2EcNeUlRI2sXkiP1oIHHQ6toy8xs3lN0UaVO5bzJDMcvdmi+aTbz/S50
	S8imbjTNZLaNYK3GEKUMvrNUwzLxzCGAxT8Tiyn169jjiBqwDaqRFSGzPXsvUqq5bmWbbR
	NJT4lhERRy1gmk2Qwaw3jqsaUKBO65i+SXIopcUp5yTebvsk7VF8qCOoyS8lVMKBbj5NOJ
	KT3DoYoxb+/tzUSxGEo5T5w0pyA7KbEWnxViY2IYi0nEV3xsBkdkaSKPnGR0RQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 22:09:40 +0100
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
In-Reply-To: <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com>
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
 <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
 <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com>
Message-ID: <3303844cdf7c00c5369453eb91027c1b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130948_422328_D3FB5392 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi Sam

On 22.11.2026 22:02, Sam Edwards wrote:

> [...]

>> Do you mean "first as well" or "first instead"? Because "instead" can
>> cause avoidable packet loss:
>> 1) Initially, network is idle and ring is full of empty DMA buffers
>> 2) A burst of exactly one ring's worth of packets arrives
>> 3) The RX irq fires and stmmac_rx() attempts its refill-first (none
>> needed) then depletes the ring to the maximally-dirty state; the
>> refill timer is armed
> 
> Thinking about it more: the "unreachable packet" problem happens at
> this point too, even with the "first as well" behavior.
> 
> Maybe the best way to resolve it is to adopt stmmac_rx_zc()'s behavior
> of refilling during the loop?
> 

Only if the ring is no bigger than the NAPI budget, right?

Otherwise tne poll can't empty it unless a refill failed, and refill 
first
covers that.

Refill in the loop sounds good, but this would be IMHO a net-next 
follow-up.

> [...]

Regards
Nicolai

