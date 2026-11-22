Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iyNPTgpB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwRlkKPP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=; b=iyNPTgpBAdcNs5
	atHNb9YscbZSE5mf6NBmKVukFJS5MM2YwN9BJuOhOSam00U1PjBN7LpUS/o90f8dri0ldT2HG6Jc2
	estgI85gQLjIIT+rVIpBPbHyMXnu2eZTTwN+tmK84A2eSMRLN0MDfiaJ2TH1mGaaqI6Lj26pxkGtf
	25oxDw5MLq7FVz+qVjsyNaTaYJXy6kmGMxC5pTU4pO5NAmYIDYoC0vHDy1HeJahRn4Xpc7tor7DAU
	ZzyfnWAPm5vvSjOyr64tw8fkVnlwu5yv3tGkB1/UbH2lR9UYZqscYwv9EhsN0D361gVEvB/ec2yp5
	818Uy7B/W/JSEVNgULUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEi0-00000001kaR-3fwO;
	Sun, 22 Nov 2026 21:02:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEhw-00000001ka5-3RtW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 21:02:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1439320a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 13:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795381364; cv=none;
        d=google.com; s=arc-20260327;
        b=afL9ZSPP9FwP3XjDVncmVvx7UyTyJrTSQqb3zhxFxF5Bcosw/T/HIAf/eabT2y9uNq
         NkQoCa6L5iFYdCPyQXzOxXtqAuCObsY28dtkC9/sEebT75au2nzab3fpJtA3/D/xXZkY
         cieVxRcjuw/hShXdVJYRGlLrBQ709sigxbJ+f2erSKJx/znh5zF+4xZrmfMZYc9gKr/S
         4WsGpbGttyyhlJkKaP7g9ph5VzcPTABuYIWOvuaSkLPY2fubaiICq9/uC4gyvwTaDYJe
         uorE7HjmegNE0JPiYK5kDsUg6B3ZcWCFeiGDpBizpMPqvHZ4jCAYm7Uxgs5L+2wMQb8h
         Xa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
        fh=75FRlZnY9Ub3dBhYfGKRhk7gJYqdwm3S0r9S8LFYnoY=;
        b=VeSMd74yc7me7DuNlGTPAeqzodw89C3/amM9ZZtO2wPOkAzTX80FH9BvM2iVGOwv82
         dscWMDKhBWAnJNECWV7pHhT5WbFlGGAIpkB95wJm+/2qwM8fpavX05S2KyqFWUZKw6zD
         XPDTxgg+e3pV010CB6DogzJr653HTWHqnVAm6W1J9t7Q7aVLAdvpNXjcVQEmeN8tZHJg
         OAymgO3NxoMCk9ri/ON4RyhDn15NOjMOey6p16QLUUfx9mSQntI5OrRxZ4yw/E4C5IQC
         VkvKmaa9gWBi4xrqQxO7gqtPaR1zA24Uj6YyaOI+u/kmQCoHtW/TJTDLjTzmj1dPIyI+
         ZmCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795381364; x=1795986164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
        b=LwRlkKPPluvwfjcPVgfMDT/w1sqJLRvIVHYuJ5c9wQKtyiBMSkwp+td6sSiBiHBQDM
         omrbWIwtBkh1Wx2PBtVM2Lej3DLzHHq94xGYDQ3D0M/oKjf/kQ1/EPfoLB6+hUGSXz/3
         f/3XYXvjstOrCTlS28pJVlJH4LF6cpFQlT04AUPuIieUkAoTdQo0NrNimQnz6n0bi2gk
         heg6KGGlNxfL5T67gY1y43BpHvJJOzCuR51zq9FZFp9hoGH53Z+olQaz15AEwblrJDNh
         1ZCIh61cuZmB02etIXSGrFVNVZ1V8I4SVaxD2gtAT0bwP/ymvyn/8Q2u5beJZoPdFG1Z
         +7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381364; x=1795986164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
        b=zXeUzNHjMd3tlObueX3fomfdPGS+F5YycoWlpneisgaVyCsQirXjHOxlypuan9Ef5W
         s2ZprZu9C75cfICN0qOrEBrVpZMq5Fov1YyH7lpEMH94FO5WE47QdUhD+tb3APO0DKue
         XOu4iBpDUEnmOV02QU+iAYPho4bmMCQH28LO7BmIesn03+WldaxwawABVrzlQwRQfIkQ
         W3Xwdx3VFIKJ59D3PSSz81BUhSA+YbfHOwuKW3k4l7KVl0gzS+gJwN/GcVlKK2leFhT0
         b3ZchgVMA1nvyxRwbTH17/8ADymPAsbxcrMdXzayd78iyl7FB4DCMJwx7mt0jBtQbErZ
         p1zQ==
X-Forwarded-Encrypted: i=1; AL+hErHVHNeKor67i++wIfxNZH7zpM3klfeaAvxgQG959K8RVEL5o87PXIRlHqEuApUtToX7ITZA39EEtYSge6XgbagA@lists.infradead.org
X-Gm-Message-State: APuU4Z9SuKvvUaxR8sx7h6Rx9ngJ3VGNjjd4I1I3LW1Yhyh/cTvUZIHj
	qMDmRm0gwRUMGSlDBOyqRi9d9DBppoVnEwqwbU1+Ui+OYNdn1rztBTNq3IbSH3zbBX+WF+pItLU
	vMDuhEVR7CCg3OkusjJj7k4R2OvTuM5rBPBPutqQ=
X-Gm-Gg: AZFdTZdrfuCcM3HrQQT/gqXyv52AJTtfx7zFCQRwDKcs0gxs1XFFLRPn8auTUaUVhpw
	XN4JlhxWY9zYiRTTtO7WfP4i5bWzfdZ7ioixju3VGB57VJiKS8QRvfLwjR0swmrrkuIsmvPaJL9
	YmF2Qf6YdtwKZLoOIGkFMts/l/5zNKxnI/YzBL4VEzpG8olahkzhr/KRxJJMWAEcJDs9cf9tx90
	BsMHOnzpOdBUC3Z2NvOipXgmgs5J2gCTRtxCvSt0rjIqIHMEQ/qs/OdoTxS6y5YpEPU/9M0LuHH
	44RmAxpxpedzkXarz4MMWXzfpmK0iS8N3wkRci3GuFOSqvp837ge/OK609JnaE9ovabebIKnY1L
	UIyg2ooYxVOatMF6kiUi25ZpPynqkz4q8TGpA8V25L9tg/vVoYC8Af+yDY8C15NzvE33drQ==
X-Received: by 2002:a17:90b:554e:b0:3ac:860e:1af9 with SMTP id
 98e67ed59e1d1-3b41c981a67mr6077104a91.41.1795381363876; Sun, 22 Nov 2026
 13:02:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de> <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
In-Reply-To: <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 22 Nov 2026 13:02:31 -0800
X-Gm-Features: Aa3M54oHW1FHI6GaA1OK0id-oEs8UcKMQfeywYsbJpKdYciL2E1UJ9KIq7wOQ5I
Message-ID: <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261122_130246_546403_F2FE107C 
X-CRM114-Status: GOOD (  17.25  )
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

On Sun, Nov 22, 2026 at 12:20=E2=80=AFPM Sam Edwards <cfsworks@gmail.com> w=
rote:
>
> On Sun, Nov 22, 2026 at 10:01=E2=80=AFAM Nicolai Buchwitz <nb@tipi-net.de=
> wrote:
> >
> > Hi Anandu
> >
> > On 20.11.2026 08:49, Anandu Padinhare wrote:
> >
> > > [...]
> >
> > > @@ -6164,6 +6205,8 @@ static int stmmac_napi_poll_rx(struct napi_stru=
ct
> > > *napi, int budget)
> > >       u64_stats_update_end(&rxq_stats->napi_syncp);
> > >
> > >       work_done =3D stmmac_rx(priv, budget, chan);
> > > +     if (unlikely(stmmac_rx_refill_needed(priv, chan)))
> > > +             stmmac_rx_refill_timer_arm(ch);
> >
> > After a successful retry, doesn't this leave the last received frame in
> > the ring until the next RX irq? Could the poll refill first?
>
> Do you mean "first as well" or "first instead"? Because "instead" can
> cause avoidable packet loss:
> 1) Initially, network is idle and ring is full of empty DMA buffers
> 2) A burst of exactly one ring's worth of packets arrives
> 3) The RX irq fires and stmmac_rx() attempts its refill-first (none
> needed) then depletes the ring to the maximally-dirty state; the
> refill timer is armed

Thinking about it more: the "unreachable packet" problem happens at
this point too, even with the "first as well" behavior.

Maybe the best way to resolve it is to adopt stmmac_rx_zc()'s behavior
of refilling during the loop?

> 4) During the 10ms timer period, more traffic arrives
> 5) The RX irq doesn't fire again because no additional DMA is
> happening: there are no usable buffers in the ring. So we're forced to
> wait out the timer.
> 6) Any packets during this time (beyond the RxFIFO's capacity) are
> discarded by the hardware
>
> But, "first as well" sounds good to me: before entering the main loop,
> refill 1 buffer (if possible) just to ensure either the IRQ fires
> again immediately (if the FIFO is holding onto another packet for us),
> or the inaccessible ring slot is clean (if the FIFO is empty).
>
> Cheers,
> Sam
>
> >
> > > [...]
> >
> > Regards,
> > Nicolai

