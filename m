Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6688606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oABktT+9;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=qFuytspF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QKbQ/ruVPJfxFXMkY7n2nO72I37QhMdT2FVadZTIHTI=; b=oABktT+93h9bs0
	ZLFpkdvjwGvZ9o30pIK77h4wr/B7tFdYyMjvY7H1v5Zsg6y/ojcLA0pWwJt/zjjdyhO3m9tCpLBdG
	2JwdF7K3R45mebXzV4d+Oa8+jIfVdZGcrSK8Ds0/E2CFv2zK5DrjQENEarL9KQ0db2zSzjbnlXio/
	QTLTRJbQl06B0pfHTPurFGErG4scs1qQO775p4apfVDveqcsIfo+bckJyPAbt2RPXXq5hjBMFWNDC
	ZUAZJ8id5rklqlLsYGBz4t2AWTUf6t4o7xN/W1MqlrYxwpBviFdUlGgfEBfgFD1gL/vmTyZkIp/WK
	VDRdZYUz8jwLh/nKshbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEJb-00000001jI2-3z42;
	Sun, 22 Nov 2026 20:37:35 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEJZ-00000001jHf-0pCq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:37:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80F1BA035D;
	Sun, 22 Nov 2026 21:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795379848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QKbQ/ruVPJfxFXMkY7n2nO72I37QhMdT2FVadZTIHTI=;
	b=qFuytspFxPUpX6GrAkKPVuaEtZasvNyYeXwbBa2EIqSZUcam1s1+xbV2rb32CWrwoBdtIS
	O8H9eKezIsDv8/IfzH0orjDIwMbutBycVnW2ZXRbQdoBg1TU6EEEjz48a/vE1OVqJ8RJSx
	T++URvx/NQYgDHrf7LPJVcyAS11UjHHm1g4IpnlPMAprMfuFB/0yuFWuEdvxAvVctmag0K
	yDL6/LncNKgq5vUCKxI/HArfzlv11d2S/bNBdZDQrEiSZLVql07ElV2vhX/6j90GxU8BKt
	xnymK0uc5/MoVhQZuZBd347dWYGayg0AdUpVBDC/yM8kmBB95A2sT1QsS3EAiA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 21:37:24 +0100
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
In-Reply-To: <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
 <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
Message-ID: <9fbb80bfc0e58a531c1eb59127bd8059@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_123733_690716_51386DCA 
X-CRM114-Status: UNSURE (   6.30  )
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

On 22.11.2026 21:20, Sam Edwards wrote:
> [...]

>> After a successful retry, doesn't this leave the last received frame 
>> in
>> the ring until the next RX irq? Could the poll refill first?
> 
> Do you mean "first as well" or "first instead"? Because "instead" can

> [...]

> But, "first as well" sounds good to me: before entering the main loop,
> refill 1 buffer (if possible) just to ensure either the IRQ fires
> again immediately (if the FIFO is holding onto another packet for us),
> or the inaccessible ring slot is clean (if the FIFO is empty).

This (first as well).

BR
Nicolai

