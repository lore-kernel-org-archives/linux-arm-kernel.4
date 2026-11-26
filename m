Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JnwXGN2s;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCtvAYNR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=; b=JnwXGN2seR/qYe
	jcSlt/hWPgMoSpvkd49TLOEmxJc8VR/1R+fE15OjkPxrqpmT2QyPSY2ZppfClYGJyU52rtOBopjH1
	17XSZWXksSQZbFnvA/nz/XoREARk4gq1e2qroenK/C8LQWLP+IlNB3fhs2NCKUPsiOxgsg19yPjZ1
	rxHCOe3zsjsNdIj0sfop4JiPqjytt5HyxJ8cDcdhurRGc4Gn4Tr1j7Fy4CX7xkroqBL/Yc7379jcY
	lrenhb/b980T8Tgyr8iATu6dcq3JAfzR97Gsg7Cuw8sK/OOtd7i/sGsJ9jmGDWU4/22yl3soE6Y7E
	nmmVsXbYRAni44sSGqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXnT-0000000D27U-2MBi;
	Thu, 26 Nov 2026 11:37:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXnN-0000000D261-3hqU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:37:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4327750f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693064; cv=none;
        d=google.com; s=arc-20260327;
        b=EBreZzqILpCQtk8OExAcODe+fBuk3hiP4PZ7UpNVSatNlX5WLtVJcPifSarxghWE3/
         ekZD/OgOU7lI0hsMvdcS1tme32a6tBF73qFgqiIDIuM6AErjrtfWiAqLagBjscDyW0Wn
         fEPWoii1SYtSz0G76f5elDgwNYlWm4CJKi3oCu4vZh9FOZtTKKLRacgmvW5p72x/UqWs
         Fs9G0qLmPz9Kua+YTHSSfLeB3aqMZWQd0x0nQ3uu9G371VDYCjdcXTztHgef+XJacBoR
         Cx7qWS0iSinsOPbMT7cENshgYTibM4MGRH4OH0W0HItsP7kBTnT9S1MC5SdyPP5M+o7f
         ZXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        fh=TFZUfqnVoHGYi2cWJY0zBUQTWahzb5UsYYYzH1/47qY=;
        b=THGIuKoTzI9g0QjfOxrmoGnvohICX1+pjqnT3+2QD8XXu5RETCjC/ww3UdKxB8tNm2
         62+EmhNhWAhIRqTAIMjnki/Qvj5HZabCgTBqkSDuPxP3hfCnCABaj0MtVIgPIqtD7h9/
         qL97fYrp9zOxhHIVryIXOpl3pz33W/Haq4jNIfPzJ//DkrO/6H98XsNCsDtPAvzmbitG
         7f2BI5C41YsjDNzodKHC+1IRAo0XLZuHP6xi404tzUc15DDrUVw7y2hFkW80N3gbhRJM
         a/UGqTM1xsR6B3uQsoEzsAl68VCI5e/89h7SPipH2OVwlQ0agLsmUeRwUTkNvRmkw7YE
         8imA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693064; x=1796297864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        b=gCtvAYNRP1ltkb0Rp/VUxRvFaJdv4uLOUROWbkVbSEl2liaClJtpkOW61eqgwy5hZS
         /TfVEgb2SC0KgOqtfyZmVs6ACWui9OEGtvz/qQxIhaTzuHk6PeuatVDEs4Pqa/b8cSUn
         Msc2PZaf1Iji2M9XmXjqTuNqIVPl3iKHki5HGE4SbVLYxV3Bql8CEwJMlKZlqsViM+Jc
         jF8iec+B5a4+XvTIDfYobJOLkMl/tUtTiXW/Ktq3Ozq5094uqqBwm1JSJ4G6S/71th4x
         jcO/ExgtRdLBKtD/47UG8DtWMoRkaPUSB4s1BlXhg92kmwu3zh3+ftJbAPKvx7QrejFb
         ePcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693064; x=1796297864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        b=e5cJF4eEazVrm/egCjvZR3uuLKInV4kWVEaFlNX/hnVjDxRGdbqolmIF/QLYoghLCG
         0UyAcWqx332A1yW5E7o5eTBvmghslx3SXozrLUoN/wzPGBafZGyzI1XLW9O+Kj+FGTqN
         YSKJYZ6nOAyE3V0NbXf1WgK2+/TErNGmB4H9QO36BMoC1EDL1w9nHi4fXh9Z9M74HZ3D
         6qD2v7Pr2vS1QSXwudpfX08w5sRqUZb1xPBINtFeq0M20bXquDkVarpbRuqi3TswvN2j
         F5iEWbnMqhQZxit9LE//n2WrQ2a5KAKCPSieRbuq8DSEWA+S5QH4eK+Xi/NaDYEBGKRw
         jeJw==
X-Forwarded-Encrypted: i=1; AL+hErEm8WOUiNEn+l2RQcx6JGS7wL0FNet0YJ5By1ZDGXGMfzDuqSBR5z2Ej7Fe7hVaCmupPv/ijBgqhpyIsDjirFkz@lists.infradead.org
X-Gm-Message-State: APuU4Z/muwiMwzlEjH96v9wRaX8vmgDQX0G81skXyRZAE51nOt0Xbfnr
	LbLdhRKyGwe3PDFWNybU/6zoZX2ublfxQ0U10tY2pLrgA2FpHlsfbxgKrci3/b0BhH9nk/jegQd
	/UXQw7p0Chc8wLmF1MjIk0b02l75G0kw=
X-Gm-Gg: AZFdTZflIn3bZepyLCGqrgkCqt43XS1PLWRnypW4A8gSP7oS/fHNBJHGBB+Lk5EX3ql
	2/2n7HXZuY97TJzLmOgkkLen6KLgFM/QnCObmE8JWC46ndNXZy6qBw7FE91Jch6h2G4WLrF7XQj
	+TB3y8dTqWyIM02kjrNxdfEPduY2FY5szYdSjOm1PdWoJH9Gbbw/x4zuck2OTF340JUYY8B7B3i
	/LXl1ZOgDoqP+FYMyzx3FtiZDv9hfoCZuvXMbRjaaEy8YVcOr1acJQw9iwVVFOlj1HlMwnwC2Wu
	E7MjW8aKp+w81qynobMJf6n1YZ02/oOhUf37KLIRuK6Z9IOEyDE6m2Ee5N3KQvNquQzkbxuBYDt
	4LemOyi9elQ3G8U/4VyCN2gIP38RLZa+2mfWdTAlXAIav1nd74braF1FP/h+37Nb3tK66T9AE6x
	aijeS6v26DEGQUZuPUivH1iSQuK3TaYy76eExRMrXkNZKU7To4A44P5BAFIg==
X-Received: by 2002:a05:6000:4304:b0:4b7:6d41:f12d with SMTP id
 ffacd0b85a97d-4b76d608a13mr15756287f8f.27.1795693063407; Thu, 26 Nov 2026
 03:37:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179561342293.3135.3941627441868252725@kernel.org>
In-Reply-To: <179561342293.3135.3941627441868252725@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 11:37:16 +0000
X-Gm-Features: Aa3M54qKq7za6CWkwIvxk1EuXc32uI-wo6A6tNrIs2BtzXEyjHAyjQeGf7f6308
Message-ID: <CA+V-a8vxYR56e1dxG-2ReYdLcsY4DsSS+GB7RqtbP+U+cEaV=g@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: Advertise TX checksum offload only
 when supported
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vinschen@redhat.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_033745_963536_91CBCEC5 
X-CRM114-Status: GOOD (  36.30  )
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

On Wed, Nov 25, 2026 at 1:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The fix does not cover the bugged_jumbo case, so DSA user
>   ports can still advertise TX checksum offload that the stmmac conduit=
=E2=80=A6
>
> --
>
> I found one possible regression: on bugged_jumbo cores, DSA user ports ca=
n still show TX checksum offload after the conduit has turned it off. The d=
raft reply for the list follows.
>
> net: stmmac: Advertise TX checksum offload only when supported
>
> This patch changes __stmmac_dvr_probe() to add NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features only when priv->plat->tx_coe is set.
> The aim is to keep TX checksum flags that stmmac_fix_features() later
> clears out of vlan_features. DSA user ports inherit vlan_features.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a685ce4638f61..d32d3e7b1b8c6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >       ndev->xdp_metadata_ops =3D &stmmac_xdp_metadata_ops;
> >       ndev->xsk_tx_metadata_ops =3D &stmmac_xsk_tx_metadata_ops;
> >
> > -     ndev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6=
_CSUM |
> > -                         NETIF_F_RXCSUM;
> > +     ndev->hw_features =3D NETIF_F_SG | NETIF_F_RXCSUM;
> > +     if (priv->plat->tx_coe)
> > +             ndev->hw_features |=3D NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M;
>
> [Severity: Medium]
> Does this cover every case where the conduit drops TX checksum offload?
> stmmac_fix_features() has a second reason to clear these flags, and it
> depends on the MTU:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_fix_features() {
>     ...
>         if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>                 features &=3D ~NETIF_F_CSUM_MASK;
>     ...
> }
>
> In stmmac_probe_config_dt(), the snps,dwmac-3.40a compatible sets both
> tx_coe and bugged_jumbo. The snps,dwmac-3.610 and snps,dwmac-3.710
> compatibles set bugged_jumbo, and tx_coe comes from dma_cap.
>
> On those cores the new tx_coe check still passes. The checksum flags are
> then copied into vlan_features once, during probe, while the MTU is still
> 1500:
>
>         ndev->vlan_features |=3D ndev->features;
>
> When such a stmmac is a DSA conduit, the DSA setup raises its MTU:
>
> dsa_conduit_setup()
>   dev_set_mtu(dev, ETH_DATA_LEN + tag overhead)
>     stmmac_change_mtu()
>       netdev_update_features()
>         stmmac_fix_features()    /* clears NETIF_F_CSUM_MASK */
>
> This clears the checksum bits from conduit->features only. vlan_features
> is not updated afterwards.
>
> The user ports take their features from conduit->vlan_features in
> dsa_user_setup_tagger() and dsa_user_create():
>
>         user->features =3D conduit->vlan_features | NETIF_F_HW_TC;
>         ...
>         user_dev->vlan_features =3D conduit->vlan_features;
>
> Nothing in net/dsa appears to react to NETDEV_FEAT_CHANGE on the conduit.
>
> So could the user ports still advertise IP_CSUM and IPV6_CSUM while the
> conduit has them turned off? That looks like the same symptom the commit
> message says this patch removes:
>
Yes, this can still happen when bugged_jumbo clears the checksum
features after an MTU change. DSA user ports copy
conduit->vlan_features when they are created and don't update them
when the conduit's features change.

This patch only fixes the case where tx_coe is disabled. There, the
conduit never has TX checksum offload, but vlan_features still
advertised IP_CSUM and IPV6_CSUM from probe time. I'll reword the
commit message so it doesn't suggest the patch covers the bugged_jumbo
case.

A proper fix for bugged_jumbo would have DSA sync user port features
when the conduit's features change. That's a DSA change rather than an
stmmac one, and I don't have the affected hardware to test it.

Cheers,
Prabhakar

>   "DSA user ports inherit vlan_features and can therefore advertise TX
>   checksum offload even though the conduit cannot perform it."
>
> Packets should still be correct, because validate_xmit_skb() on the
> conduit falls back to software checksumming. The problem is limited to
> which features are reported.
>
> Would it make sense to also clear in vlan_features whatever
> stmmac_fix_features() clears, or to handle this on the DSA side, so that
> bugged_jumbo conduits are covered as well?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261124132802.2003605-1-prabhakar.mahadev-lad.rj%40bp.renesas.com

