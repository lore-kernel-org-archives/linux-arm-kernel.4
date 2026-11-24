Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aKbLkoUN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfZFMJbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=; b=aKbLkoUNfToJ+N
	YvtJ3ibIzSPavQIN9iDkmSGyqjRDjP35dhLhbvRLhz260vNEatNx/yH4qNYU9l92dYXecmicE+z/u
	nk6QwARkuPAc74VsBr2/RnSbRFYtEnw2pJ8mflrwtf4agyZQ8JS3rBETsBVCCVS2YVWV5IaUjIite
	PB5EwYOqwfSmRM1N9Bw2QCBDqgEEeCIOMsvzHPbY2LHLQzIKF5PdwwMI1+HiLb1HFCWMMp2ozlTlj
	IhO71nGQL6+w1+MxPWOKBls9iNSvM8TXMhtO5Y6HGUUHw2PM6myDJHSFUTLDew4l0jaHplIlFJdaQ
	MUVFMJyyFq6ENQ0fSQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqTA-00000006cwI-4BJV;
	Tue, 24 Nov 2026 13:22:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqT6-00000006cva-3Y0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:21:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2624567f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 05:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526512; cv=none;
        d=google.com; s=arc-20260327;
        b=VSVxuwcRRVD/G0FnqTYGAVQddXThCjCsc8S8vhOIyqKAVF7CjxXMuIGLppiuxlC8/6
         xrMqfWRKY7pSR9NkJWE27VE6SdR7YIZiJVLm7bIWraamcllcqajqwiDRKVq0pXQR8qWg
         vXuFqJreuPI5svuk9LcZjlLv/u60RZtwRofqKc+AOS5Ek6+U2NUrK5GF2/FcEpbOtDp3
         aiZd+Q0eppOKTgfbNEK8gvsO4SyscTNY6+79KykQ2Cbv0w3X/GrvsjBB9PvD57fJZ1kl
         2LaxfAN+kgIffKDTLzYwoiJI9oZVj6tpb3yKPLpQIu/Hkhb4YRSi28rbezGWkaV9rCHb
         KDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        fh=qshWn7nui2qeM5Bs4khklGgBpKmr7IKSzQdx/6UyRRA=;
        b=OguJ72lU5nK67ZT+6pftG7ItUl1RTsYLSS3bnzG9wlwS+oRqvizQk7+ZjfZIVDgrLZ
         10CmIHwvehk/h974++rb2f+7rMpA6oiP84mkPiJS3f19KEod4DxwgT3RPhHTduGC1133
         yNBbIjEzVJTLu89P9pMC09bV07RuQng51OEnRjBBpfMq896hSpZE91a7UFbPRVLZdeF7
         WdEjWpTI3hUpxaPjSTZ9JoZBHfmtBZM+WsHF7c9+xScKFm4jzzmrb+i+DHvJ35Tf+uMA
         b1bjTZfxirBYXInvdU1bupO+5j54NkVuUWXvhquDOoMfaNY+jvqmSLYT/ykpyXFYnlIg
         u8Wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526512; x=1796131312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        b=lfZFMJbSOnJYp1SR7vQX6+IOGT28P7iiZDGhTIxgMdEckXnMJJC98Gj8kM4YYKYOrs
         hpnVYn4jwlN+zCpYS8T+mbjzR6GjcwuOLqyAK1w96TqvmIYRe7GeYK8LusuhF7y30fHM
         44Be7ud/Lvg8Oad7ITlT9jEriiBzP50eVLEJz2cXjxKC0eLiYju9LDzusAyPMsbiW4v3
         XmKnGDwqdROMC2sY1KJ5LBiwZ3JpOFXw2noTu1SBVtPbXMs/3jkBkDhGStdauEnJw9Gs
         zrocyvKjn+OVRlvsLqf9icTRQjc2mxSzCWavixMeroZ4GEc9e7wWAsYkG7zNVZF6rGmO
         TUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526512; x=1796131312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        b=USqrHwXTaT8qyDR9rK55GyfgitMzvBeCevNG/77Mtra13Ig1F9RCouJmrldRt/DAWB
         Zk/O9L/cPLR81Gx7wTd/E1YZ7rAdjWaitWFe0FtJAcAqZyjrmTMyxxPY0uJvd3GgoN2s
         z+he73HHoC6MpXkmMsd+qzPRm7Nu5E0FWdjLrbgsWGcm7nLjQ0dfwmm+xrzW7HGVXHzT
         DQgoE+bs9tgNAdKpEbI1QuCZdTa66RL622BJVxjhTU4DLbQBjJP0KmF44ZOy6fqEMrBn
         TieWr69RYd9bjcMMkW+Egc+pV+8cvoDKVVta79eukydzBFG41RvRcMQhyTXxkU7moKgf
         Q9Rg==
X-Forwarded-Encrypted: i=1; AL+hErEQG5pGs5sAa4GK0TQsFb7qtlTf5nINiokzNUeLQfHcS6FHl0prfJgJw8s4dRDQwjLnxZfUvo03E91JeToOO1Oo@lists.infradead.org
X-Gm-Message-State: APuU4Z8jZpAkamX7D9GiQvSRO7QLwRWv2Rj+wnQyBt/U50wXm7NSorhr
	YFiW4Vk7TamcMxYDwpp2GK8qQxGDQRSSBkKzM3SdnHyx6TPTTS2XFNruB3WMpn9m54A8g9/e67M
	jSf+CeJJnK2uSonuTXyzPtYHWkx4jbV0=
X-Gm-Gg: AZFdTZdA8Tf73LrELdiCvqxEjTesQgsE/uxlIyYMwbRL6FsKBCJsiaxoM3lwApxIt+J
	grPuiipSiEEVc+75FhLL47fdZp9spgorW8yXq83OrgmKdFObJwpTJgD90D8rPfPa0f7/h0IngqM
	PUKFfhGjh06y1Eq3jjxQbmxYY6T7ZylwCiUUy4fb81UHWdgehyfwj8Z7jZYEM0cWnKy1gpM0bUy
	lT7sYHuGQdRpbdFbk/r5/p0g70t5+wuBkpWq6+egO8/13qymaj9SBtLhUzA6V8FiAaXKAqbCw97
	GyiOyv/NakNSrSfQ4ug0YXokEQqGzyeTOLyX8k6hk9CdR9lNkxbwHOcBSvSWxg/KsX3sCWcBtJ5
	94xgFomrv3ll9q0aXDprErA2iKZZo6T1UrO4rhr/glKSdQxOuOCBsOjNAma2rt6yYIpx/84MNN5
	lCJNhm7piQVfjNpLrxlt+Aw+5Glb7TdT3xP+wwe9EFpj8nckgn3kGD8afLdjDEsBYpATEjsyTCA
	u+jfII=
X-Received: by 2002:a05:6000:41c9:b0:48d:fdd0:6ce8 with SMTP id
 ffacd0b85a97d-4abaab633bcmr28636444f8f.3.1795526512489; Tue, 24 Nov 2026
 05:21:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179546436704.3135.12593345717335656860@kernel.org>
In-Reply-To: <179546436704.3135.12593345717335656860@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Nov 2026 13:21:26 +0000
X-Gm-Features: Aa3M54qYvwnStTQeBsV6jkU4pnj89Z8PUCLhVvQ2lAGOs1SaKPKt9ljNLbIFBQo
Message-ID: <CA+V-a8s722YOUnoErKDEiMd2KsZT5E5wkTvjJ1Zbeji1UPiSRg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: Advertise TX checksum offload only
 when supported
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_052157_667576_84D7B8B0 
X-CRM114-Status: GOOD (  38.99  )
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

On Mon, Nov 23, 2026 at 8:06=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
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
> - [Medium] The new advertisement gate in __stmmac_dvr_probe() trusts
>   plat->tx_coe.
> - [Low] The commit message presents this as a bug fix ('This can cause
>   DSA user ports to inherit checksum offload through vlan_features=E2=80=
=A6
>
> --
>
> net: stmmac: Advertise TX checksum offload only when supported
>
> With this patch, __stmmac_dvr_probe() adds NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features only when plat->tx_coe is set.
> Previously they were always advertised. The goal is to stop DSA user
> ports from inheriting TX checksum offload through vlan_features when the
> conduit can't do it, for example in threshold DMA mode.
>
> > The driver unconditionally advertises TX checksum offload, even when
> > the hardware capability check disables it, such as when threshold DMA
> > mode is selected. This can cause DSA user ports to inherit checksum
> > offload through vlan_features despite the conduit not supporting it.
>
> [Severity: Low]
> This reads as a bug fix, but there's no Fixes: tag, and the message
> doesn't say what actually breaks. Is this meant for net or net-next?
>
> Before this patch the conduit's own dev->features was already correct.
> stmmac_fix_features() removes the TX checksum bits:
>
> stmmac_fix_features() {
>     ...
>         if (!priv->plat->tx_coe)
>                 features &=3D ~NETIF_F_CSUM_MASK;
>     ...
> }
>
> So only hw_features and vlan_features were wrong.
>
> For header-tagged DSA traffic, validate_xmit_skb()->skb_csum_hwoffload_he=
lp()
> on the conduit already falls back to software checksums. Also,
> stmmac_features_check() drops CSUM for non-IP ethertypes. In that case
> the only effect looks like wrong feature reporting.
>
> Wrong L4 checksums on the wire would come from trailer taggers that rely
> on the conduit (tag_trailer, tag_xrs700x). Is that the case this patch
> fixes, and could the message say so?
>
> There is also a change users can see in ethtool when tx_coe is false.
> tx-checksumming on the stmmac netdev now shows "off [fixed]" instead of
> "off [requested on]". Should the message mention that as well?
>
I'll update the commit message with a fixes tag and send a v2 for net.

Cheers,
Prabhakar

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f256244ce0d11..8cb1e3b4030e2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8224,8 +8224,9 @@ static int __stmmac_dvr_probe(struct device *devi=
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
> On cores without the DMA HW feature register, does plat->tx_coe reflect
> threshold DMA mode by the time this check runs?
>
> The threshold-mode override is applied only inside the hw_cap_support
> branch of stmmac_hw_init():
>
> stmmac_hw_init() {
>     ...
>         if (priv->hw_cap_support) {
>                 ...
>                 /* TXCOE doesn't work in thresh DMA mode */
>                 if (priv->plat->force_thresh_dma_mode)
>                         priv->plat->tx_coe =3D false;
>                 else
>                         priv->plat->tx_coe =3D priv->dma_cap.tx_coe;
>                 ...
>         } else {
>                 dev_info(priv->device, "No HW DMA feature register suppor=
ted\n");
>         }
>     ...
> }
>
> Older GMACs such as 3.40a don't have this register. There,
> dwmac1000_get_hw_feature() reads 0 and returns -EOPNOTSUPP, so the else
> branch runs and tx_coe keeps the value the platform set.
>
> For "snps,dwmac-3.40a", stmmac_probe_config_dt() sets that value
> statically:
>
>         if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
>                 ...
>                 plat->tx_coe =3D true;
>
> It reads "snps,force_thresh_dma_mode" for any compatible. Nothing makes
> the two settings agree.
>
> If both are set, stmmac_dma_operation_mode() checks force_thresh_dma_mode
> first:
>
>         if (priv->plat->force_thresh_dma_mode) {
>                 rxmode =3D tc;
>         } else if (priv->plat->force_sf_dma_mode || priv->plat->tx_coe) {
>
> The TX channels are then programmed in threshold mode with tx_threshold[]=
,
> while tx_coe stays true.
>
> In that setup the new check still adds NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features, features and vlan_features. That is the
> DSA case the commit message describes. stmmac_fix_features() keeps the
> bits because it also checks only tx_coe. stmmac_xmit() then requests HW
> checksum insertion for CHECKSUM_PARTIAL skbs.
>
> The driver comment says TX COE doesn't work in threshold mode. If the
> hardware really skips it, won't those frames go out with only the
> pseudo-header partial checksum?
>
> No in-tree DT seems to combine dwmac-3.40a with
> snps,force_thresh_dma_mode (spear3xx.dtsi uses 3.40a without it). This
> may not be reachable with current in-tree users.
>
> Would it fix this to move the force_thresh_dma_mode check that clears
> tx_coe out of the hw_cap_support branch?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261119185016.1789843-1-prabhakar.mahadev-lad.rj%40bp.renesas.com

