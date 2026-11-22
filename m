Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF2A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DREqpuCk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWyCsVjg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=; b=DREqpuCkiUnk/+
	U3HPvwyk2SH7RxmcQcHnqiuE6Rpl0yBPnhqzycjnZoHiZkKnj1UF+Ev8EWSSn3Weemd8wSrtPfR0Z
	hzeO6ynCud8BkVx5J4Y4tpzpShQr8aPkplwa8i80INQys7Ko4rHArSYRAZfK7eBlqLY0t7GmWcCsG
	iQ28u2IwuY7x0tPWqR4D07jgRFmTKSxkY5Ow4gscACq7mvG3ctIh3Rp06cBv7B7Qr3EbEONzsUckt
	AHEjdNE9VGzzsR32xRVyFjLophShynD+57qcuKESjU3cPnqcwGLVAapVxSjRTtp+rxrvhNgy2Iyfg
	/trrsDF2pwVWhe8v/EoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVE2u-00000001hYR-3fCB;
	Sun, 22 Nov 2026 20:20:20 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVE2r-00000001hY0-2eiS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:20:19 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd69954c755so1895728a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:20:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795378816; cv=none;
        d=google.com; s=arc-20260327;
        b=NH8396otz9BefFUc2A1KBzNRY3wMO0PY0fyKrJJ0fZ8pFJrk9BgI9ctC4n79UMQAub
         QOkRV3XrwsJaFEXlqcqJi94YATPRQj1VexutEa8kdADSNowqUuziPFYY1WnG8rxpbFNd
         LnkTS7IYO0Xq+HrPwoBQ8hwCCYSd6dT6a7fZVQiznhc4sQhFds+1TfInpLUucj3JDHDt
         ABdLUsskeDAcTO6rUapJf2z1Bs0S80WHQu/WSgh9tJha5bANHyGHLSDKWEAA2p2Uq8NM
         2pNlF0S+ZodoDH0NdSvgxwvN8m1rSOVBfMYCgdxCqth3P0pwHwCwuNLPSRGs1+PKenzi
         TFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
        fh=99cVCU+aiq6dVvnpFSEAj3176I/YdI98cWdyYk1fp8c=;
        b=YQyxNvkfhNFggZmfaYjF9UwBFbt+qYfT/kmyhmHAO970rAGy91hWJADKzbmjoUHO9q
         dvnsTiOZrv3cTciRBuNuuZrLIlI/qVJmYxTC2Cri3qXwbvJzYtI+CPEF+1rFwk4F9QsS
         GJ706rWyvJbyvyS8RbMxL/vZcJO/xSl+x50IcoOCTaRD4Z/1BuQv6xVITRiDbIkncD3E
         CI+fUvu0/ZiC7B7U6OPDV+7oUEATpd2HSKBqunXpXI9OaFu0nvB/VM3T3frPxYKolK0T
         6IFVgIUbFte7CtuomPKnfGYnZ7r7jfwzWry2T9a6z5IgN2V2pyRvzvSq6T3Weio7pQNV
         0M7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378816; x=1795983616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
        b=rWyCsVjglIcyd1NARYRBv+e5g6WqgbHdYBiMQXABuNcsoENcr0GX+6s7As89V5J+b7
         qEQgJzvX1K0Lc6KwOGVRFA1UskgWf0eGsICLRiZ8JqY+oeGNb4pIjsTAbSb5BDZOztuA
         zlXu2lK2QXgsFFZanBFBL5YVIW9hIz9X+xmFe5HdbNXGx8zZXCzs1zhZ0iOQSx/M6AJV
         FJdDOTEOZaq6YSPzDyH+ua/mpjn0yteXi7Uvr8Pn4Bw2NoJf4U7z3tBC/u/b68VATpVw
         rxAT94feOT+MEWF3UzcL46MwUEZzKIMztTCEasSrwfu3+YtsFEbXHXLmF12ioOx6DcAM
         VcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378816; x=1795983616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
        b=SJqmi4rxmcXajCOpEKzqBJHPVgaE7TwEKa/7d/KKERwAKkPcV1bhbxtYVkiBJ8l4OS
         OxlLCLxq9VP/kpax7T0hQTI0C+q2yU3mUBZv1pHicdbL754PJOH2xGSJhCg8HA1Q1SwQ
         PQCa6iZj8sLvFy5ef1tkg6qQ1Bb0at4IN9MdEj8HBc7iTDP1chGvckYxKfkPER/FwZqj
         nK5lmHRg+9fWyWg72Ow2bbfan0Z7MDj5zS/NrJCdOlLn9so+7G+UN5sgjvdQiiS6+sHK
         t9P+eeLX4BkcCuy4YZoC5QyA0y9qhCkrcWMnxVr68yextKuQbEYdR3YIZhzG6RV7h02K
         TGGg==
X-Forwarded-Encrypted: i=1; AL+hErE5gnx9UrMlzxNLfPkjvJLGJvNIodHwvbwArscu5R1ESBM8wKOnY96IugZTbnS4k/qmNeCXHEtt0pNy9uWkGrbQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+SOHYWhsIcJCPCVqblfVLa+OZ1xirzZlEHy5aQdzWx5BYfPf7M
	LO0jpZscgJtDvcoZkLm5ITuc0N1ay3LKOv+9ftFJ6uBjp1p1qH5bt7ZTkhs9eqqXmih1E9L03XT
	5dfRL8LeulgLHhtIy+rYH541yVUtIscg=
X-Gm-Gg: AZFdTZesUSXTOnIGvzOPbOGVOn9jD9yLy4YnzuRIkQzwO/1F9VNWALwP916YKVqXnLJ
	wzRAmSDm1lfO68LB8rubnd6m3F0NT21Wqsw0GxFDisBX0SvaFVY19OStgBXjP4DeuXPwuadUz5w
	3ZkCoIT/zVMw7KzaO2h/OSlhKpAJ9PaIDKhrtps0eFgifcs/166GXrxp3JQLDew8mRAlzbfAKNu
	D/SSYA3iVha/CWcS3wWr3mvMGf1v0m0aAKHiqX9JI3O04UtniqTZ6zCf04B+6y2trYbAZQkvEMo
	aJFnU750QAJyCsr+3Y7oOwNOk+5smGgFSKpIsgOm4fAoxk6Zaa1+z0ey+8tNiAt0M6CpaW9jZV6
	4+rTDGb2dvhs3H1mA70C8jZHAk4cpTmxDtgVLuPEkeVM8JRm+EkLlp0PI2DkC3qHboYgK9hs=
X-Received: by 2002:a17:90b:442c:b0:3a8:9b79:e6ea with SMTP id
 98e67ed59e1d1-3b41cb235cbmr8580615a91.59.1795378815937; Sun, 22 Nov 2026
 12:20:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
In-Reply-To: <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 22 Nov 2026 12:20:03 -0800
X-Gm-Features: Aa3M54o84M-uX2uQ_qZeHIKjUVqNqkyoSTJtgWDoyviNh_-BeSJ3m7iO-KDBvI8
Message-ID: <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: retry a failed RX refill from a timer
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>, 
	stable@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_122017_682427_38FDA317 
X-CRM114-Status: GOOD (  12.28  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 10:01=E2=80=AFAM Nicolai Buchwitz <nb@tipi-net.de> =
wrote:
>
> Hi Anandu
>
> On 20.11.2026 08:49, Anandu Padinhare wrote:
>
> > [...]
>
> > @@ -6164,6 +6205,8 @@ static int stmmac_napi_poll_rx(struct napi_struct
> > *napi, int budget)
> >       u64_stats_update_end(&rxq_stats->napi_syncp);
> >
> >       work_done =3D stmmac_rx(priv, budget, chan);
> > +     if (unlikely(stmmac_rx_refill_needed(priv, chan)))
> > +             stmmac_rx_refill_timer_arm(ch);
>
> After a successful retry, doesn't this leave the last received frame in
> the ring until the next RX irq? Could the poll refill first?

Do you mean "first as well" or "first instead"? Because "instead" can
cause avoidable packet loss:
1) Initially, network is idle and ring is full of empty DMA buffers
2) A burst of exactly one ring's worth of packets arrives
3) The RX irq fires and stmmac_rx() attempts its refill-first (none
needed) then depletes the ring to the maximally-dirty state; the
refill timer is armed
4) During the 10ms timer period, more traffic arrives
5) The RX irq doesn't fire again because no additional DMA is
happening: there are no usable buffers in the ring. So we're forced to
wait out the timer.
6) Any packets during this time (beyond the RxFIFO's capacity) are
discarded by the hardware

But, "first as well" sounds good to me: before entering the main loop,
refill 1 buffer (if possible) just to ensure either the IRQ fires
again immediately (if the FIFO is holding onto another packet for us),
or the inaccessible ring slot is clean (if the FIFO is empty).

Cheers,
Sam

>
> > [...]
>
> Regards,
> Nicolai

