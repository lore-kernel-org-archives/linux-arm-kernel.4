Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43304606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnF8ZuSc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLvpYBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=; b=xnF8ZuSctThAsA
	4rA6ICUt5spnH/sT+Sm0Cy+9TbX0bWXHumS9H9p14CUbTvZ5MFJqYK+nWaMbIaEMkgG1If1AARKlS
	EqsvtAv0MpLTRR08PF0a10ZOn565Gfl7oFts8gC5FNV1ZNe/voPmKPFeST2WyhMJ9VjrVMYBy3HrT
	I/upVL6hLZjjB7EW4sBw/4jLCFonti+2BfD75x/0asReYimI2CB8MrR1jS/dTal73i2lYy9cHE4r1
	yAIaEBXBMHWqhkYx96fVBrgcFKqoN2gTLuzIzRB4iFDy2myWX378/0MV9q63P/PVWeloMtOMvblPS
	IpWlWwF73xWsi/jM2VOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5m8-0000000Cog4-3OT0;
	Thu, 19 Nov 2026 17:18:20 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5m5-0000000CofX-3yPV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:18:19 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so10138241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108696; cv=none;
        d=google.com; s=arc-20260327;
        b=UnR1FVtN3T4FtJ5LfiznhRfW+7weUxDSINXi+VW+ipTr8JmKWDhwTu26NHo49ZWsnU
         4k6Qtk0rm8gYkg75EEpDO9X88T2jW5RpBivTt7zJgue6KQIR3UtqI2Z4+UdTiEngvQfc
         eN3f7uXTrBcfhaJA6Y+qL6Nn7Q1PhvEhT32zdo/HFIwRbpiqmXM/q829l38UNgsysVcQ
         N966tDgE0qy0T+WDE76NZQO60EpwmwbENS5RT8VmVCaoIdufDKgeD/SfxZA1aA703pKN
         rC4ZmWPBOkgNEKUCW6iBFVslKjgXNFMYOIJjtfnkqgUYe2rC8gp/ljf0VGO6UL7dGYM3
         2yfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        fh=qVqUsis/hDIb8KhkrNBQIed+/zN+BVHRPdZD5PHytvY=;
        b=sWsmvK2bteaKbX1TIpGwJlQ0IoIiq1uFIFEwkPMxkR3c5XcJDNT81QVY/6sti/j3q3
         NlOpnl4WM/KPheVy9gC5kE94qWLTKAgFGXH2n8q0CkIPaNEE23p4/V+6F8HR2Q3nSmLz
         L3TqG7NuVwaRUuWB2UzoUweisZoCvvA+DNLBJzNURtLXpiz+a2LebSBy/0dcftMouTaE
         l7YC36AZgFSNrrOw9vwL9c6TEBG7GdSuoUqgfCruVeSSBZLl/I054KnZjZTcwwqJzC/9
         pqLMHhL4q3vpbyEHcboDIem5RwAiJMJ0iHWgYlzv3d4K5Fu+aFOMG5wi3hA2ZExy+S93
         edDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108696; x=1795713496; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=qxLvpYBJ5XW1LO3C7RW2OjnTWYW7jwqZSFHNC9JJD9ehxEJgkrEIysTzUQfAHDiEoc
         hnDlXnaIkUVoqf1hBQuAbJA4zD1VO5pC0LziC4Iaa63dq39PGQfO7n8X296YJ6LlGRet
         LoUcnqf4R/uHXYBs54Q8hpXaU5ppRNyin7dv0dAZb+lLWuOUW/WJNim/fG7M7mnOqBQl
         SOTxmIGgUQwUQVfaiZYUg6Qh6+7ijY67lfMiW1q3Ma7Y5EWCZTlXtV6UydKaxB/0Igvi
         lY3obIolIHRz0zRkE+i6fno4i7buSsTnFD0miwGEB1OtqEJS0mafKBP6uYBB2ZfK2W5i
         w/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108696; x=1795713496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=QW7HeUW2n+TBfNT+cEQ1SGf6tfmykfTdPSk67UTF4z44dqaO1PeMVC8obT87HhV+oA
         kqBsb08JB9iKwCAEFQCNe48tcWG4azBvtmFSAsCy8yhGgpBe17ivko30G+62hHcXAoyb
         EZJABtZDTDmaXlSB9gnu5/OzOZUQPQUc8sSWqWQDCjOO5OhIicEnqjKenrsN22kuuxwp
         xfd1l2I/md9bGXxYT5WcWV4u0o24RGUKsKia7XPXJxpOCyzbqlB6FkzCCd+wGCw/xYNc
         QEk8W9wiHv6yucKVa0hS3uh5ycwUDL/77H7uRBEIE6z9rEL0vgLrqTgprXF6JdPeALUi
         xfmg==
X-Forwarded-Encrypted: i=1; AL+hErEw/2TubPFgzlfsfQhUz/fb0+ZtQH87KzZEArBOQiPO/GdDR1Q2g7rCg5HyH8xjbrXtrF4vcleDkdKH9SaOIV3T@lists.infradead.org
X-Gm-Message-State: APuU4Z9UTYp+pyLWEd0AM68XSF7Iwf+cRdds/D6Z8pOZVJPYAjEIoYkZ
	zw+odwnVBuAaaYZDvIqE4L55ZtvKcBZ14eF8VjVvl4C+Kr/cojcXReECc4x4Lzjf9pyUF30FCPM
	9x/jlUUNfXysWHGfzoKNcD93GKdVXoPM=
X-Gm-Gg: AYBFou3bzwRjX3hA+wdQPajSNUdrlerUYcKXrrt+HxAKTn6qq8LLNqMjxBhXJny7X/P
	Ztls4zOsGiyPAVPy0uo/nLkz3YChn2d/xXMVBwty5dTVlIeN3W7zeXUegrtjG8fZpIBdTxsymkx
	wdf9+MidfcPPN3XwmUV1xeirmYKawpf2hTawKAyT/JxJjIH98Ef0wjneo726eSJ9cjxP+712HS1
	DxhSA2iWeU5Rbq7+Z6B20IlScGTCCz/EoCVY13ZoCfGH0r9GHPS3buFwTaEktYsy9QNxRxBwas0
	uMWGLt50axxX5MYOpDzRX7CgVHX+82kdJp5KRb827GusW6ykceXA6Z89XTWiLqSRPPxTq4hGb+Z
	ZANL5ET80blOb7yDO9L4tMe/yDWjd8E6NmKnadvzgjZlDl28c5hWt+7jsW/eTiQO/fQ5cFVXWcf
	/P+sOYmevciGOIW6C594efegLDnaSyqLtjK7GUlgq12B44snhxM5O8sVm7x/uFU0V6B0xrJ/0VX
	0pT57V1bAJ8eherVC6ZUIvvtFvptQ==
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7d72b3688c2mr101327137.4.1795108696380; Thu, 19 Nov 2026
 09:18:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179497442968.3136.18415990643273213851@kernel.org>
In-Reply-To: <179497442968.3136.18415990643273213851@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:18:05 -0700
X-Gm-Features: Aa3M54poH74flJHm30nVUNh5kQyVyqEvjxxcHU_6uijb8f_Ea6AWdb-4l3_B2EM
Message-ID: <CADvTj4p9bBOTCk5xbiVMRtcv5gL3L8Nn2Umxm4i5VD_6jJBbNg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, clabbe.montjoie@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_091818_068598_76B2DF9E 
X-CRM114-Status: GOOD (  39.80  )
X-Spam-Score: -1.9 (-)
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

On Tue, Nov 17, 2026 at 9:00=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Clearing EMAC_RX_DO_CRC (EMAC_RX_CTL0 bit 27) whenever
>   NETIF_F_RXCSUM is off may also turn off the MAC's Ethernet FCS=E2=80=A6
> - [Low] When RX checksum offload is turned back on, frames the sun8i MAC
>   received while EMAC_RX_DO_CRC was clear can be marked=E2=80=A6
>
> --
>
> net: stmmac: dwmac-sun8i: Honor the RX checksum offload setting
>
> Before this patch, sun8i_dwmac_rx_ipc_enable() always set
> EMAC_RX_DO_CRC. With the patch, it sets or clears the bit based on
> hw->rx_csum, so that turning off RX checksum offload through ethtool
> also turns off the hardware checksum engine.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 2ece7ba9dd73b..98cc7503bddeb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_de=
vice_info *hw)
> >       u32 v;
> >
> >       v =3D readl(ioaddr + EMAC_RX_CTL0);
> > -     v |=3D EMAC_RX_DO_CRC;
> > +     if (hw->rx_csum)
> > +             v |=3D EMAC_RX_DO_CRC;
> > +     else
> > +             v &=3D ~EMAC_RX_DO_CRC;
>
> [Severity: Medium]
> Does clearing bit 27 of EMAC_RX_CTL0 also turn off the MAC's Ethernet
> FCS check, and not only the IP/L4 checksum engine?

It doesn't on H616. I sent 100 frames with a deliberately incorrect
FCS in each setting and checked that bit 27 changed. With normal
filtering, none produced an RX descriptor. With error forwarding
enabled, all 100 produced descriptors with RDES0_CRC_ERROR set in
both settings, and the driver discarded them. All 100 good-FCS
controls were received in both settings.

>
> The bit is named after the CRC:
>
>     #define EMAC_RX_DO_CRC BIT(27)
>
> The probe code says the hardware features were "copied from Allwinner
> drivers". That code sets this bit with the comment "Enable CRC & IPv4
> Header Checksum". The Allwinner manuals describe CHECK_CRC as "Calculate
> CRC and check the IPv4 Header Checksum".
>
> On this path, sun8i does not have the hardware strip the FCS.
> stmmac_rx() removes it in software without checking it:
>
>     /* ACS is disabled; strip manually. */
>     if (likely(!(status & rx_not_ls)))
>         len -=3D ETH_FCS_LEN;
>
> The only FCS check left is the hardware RDES0_CRC_ERROR bit, which
> ndesc_get_rx_status() turns into discard_frame.
>
> Suppose bit 27 does control CRC calculation. After "ethtool -K ethX rx
> off", the path is stmmac_set_features() -> hw->rx_csum =3D 0 ->
> sun8i_dwmac_rx_ipc_enable(). Frames with a corrupted FCS would then no
> longer set RDES0_CRC_ERROR. They would reach the stack as good frames,
> with the FCS silently stripped. That behaves like NETIF_F_RXALL rather
> than "RX checksum offload off".
>
> Is there a datasheet reference or a bad-FCS test showing that bit 27
> gates only the L3/L4 checksum? If the hardware ties the two checks
> together, a different approach may be needed. For example, keep bit 27
> set and, when rx_csum is 0, stop discarding frames whose only error is
> the IP or payload checksum.
>
> [Severity: Low]
> Can frames that arrive while EMAC_RX_DO_CRC is clear be marked as
> checksum-verified once RX checksum offload is turned back on?

Yes. In a separate test, frames with bad UDP checksums were already
in the RX ring when offload was turned back on. When NAPI processed
them, invalid datagrams reached the UDP socket in both the IPv4 and
IPv6 tests. The driver used the new offload setting for descriptors
filled under the old one. Changing the order of the register and
software flag updates would not fix that case.

>
> When "ethtool -K ethX rx on" runs, stmmac_set_features() publishes the
> software flag before the MMIO write that re-enables the engine:
>
> stmmac_set_features() {
>     ...
>     if (features & NETIF_F_RXCSUM)
>         priv->hw->rx_csum =3D priv->plat->rx_coe;
>     else
>         priv->hw->rx_csum =3D 0;
>     ...
>     stmmac_rx_ipc(priv, priv->hw);
>     ...
> }
>
> NAPI is not disabled, RX DMA is not stopped and the ring is not drained.
> Meanwhile, stmmac_rx() may run on another CPU and read the flag
> directly:
>
>     int coe =3D priv->hw->rx_csum;
>     ...
>     if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
>         (status & csum_none))
>         skb_checksum_none_assert(skb);
>     else
>         skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>
> sun8i uses normal descriptors. ndesc_get_rx_status() never returns
> csum_none, so nothing in the descriptor says whether the hardware
> actually checked a given frame.
>
> Any unchecked frame still in the RX ring would then be passed up as
> CHECKSUM_UNNECESSARY. That covers frames received before the writel()
> in sun8i_dwmac_rx_ipc_enable() and frames received just after it.
> Before this patch, the bit was never cleared, so this state could not
> happen on sun8i.
>
> Swapping the two writes would narrow the window, but it would not cover
> frames already in the ring. Would RX need to be quiesced or drained
> across this transition?
>
> >       writel(v, ioaddr + EMAC_RX_CTL0);
> >
> >       return 1;
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f%40gmail.com

