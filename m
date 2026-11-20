Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B5B606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPKUA2ys;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R09Lu/dz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=; b=xPKUA2ysOIisV5
	EDczm96BK8YQDwYgE25CToySBqQH4h+wXmep1Qzwb5vlYuv3dS1upFWy8hOqYCtF5A3qTQc7jMC4j
	X0GxSr+sdMTJhmf1YH6BEaS4cOQcE9kgWLIebzpbMLak/3DOY3lJrzlJiEVYfEUNJRX/z/Q8aSclQ
	yR0uTzmcKCoy4l80dd1dWTnpVjMi98ndMbjbhlUv3YqnoDFWvcqwyjdBfk8rMZMcFItUm6JKyaLJC
	Jmr6gbuGcDkle+qyLTYCNwO4vREXeMXZzE1KS9fqENkB13XrdpbZbbGWMZXKZ06exLLueiNIzTXm4
	6wXZqP3AM6Lqw796GkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSqk-0000000FpTq-0ewt;
	Fri, 20 Nov 2026 17:56:41 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSns-0000000FnjD-0Ylf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:53:50 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eadef147ffso889788e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795197218; cv=none;
        d=google.com; s=arc-20260327;
        b=Beq/UbZfw7wPieCUVBm/cm2Cvo1ocQJ3nwdOBO7+QoeulCgvC2s80in9y4XjbYv26W
         KhD830gd+X2dkrNdVMzVGQ7ope4nJn4CdQNCdLPuD8HMcbraeQ6CBOZxuGSO36r6QDPn
         Tbo/qLTvQbtZiri6tY/Up9KXsQ2z38etd2PWBvrbXtdI3UT1UMDuKYKTdD94ycefvqTJ
         5SR8cCljlZ5/xkxeCbA/2YiBrPLHM4EKwTn1zGZBQalXR8kSRba74dHyICic5EdAGWaR
         2WXacS4QrWKVjPrGgUX8KxuFiJa7CfVNBLHIfnFj7s9dAN4BT7tV84ZSiHzSFuYJ4aTF
         OT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
        fh=JodhGweBGzetpHZvQ+rOgYSJ12oYTCmxPqobBhZDlCM=;
        b=rHxu7piuhpqXbr0AwTPHWOdaHa9f+qIusN0szXceSYgWXCHnUHm+oDxqm0arZDODxN
         +TzDdvJmhOx2p3ni+MASckTeZgMtH882oYctCDdV7sjpbjj62JhAM+ZAlQDiKNaYhU9P
         AoV7rJC8CTPKBh4SqfnoizHTLxeOvrqBATi0i4KkDBy1PTn2hc0C8zGmfBya12TvqvkY
         lDTStQ35Rnu2eM2P+pMVFrWbIICzgP9siVKKjUSgS64hvJN1+uK7HeNGQX1rZRsfMfpc
         zo9hCJAC/1Yu2PElWMlf3HODzgeThE+hKR3jPcvyPkvs0DkYWD6mI1+cYPyGUxqQ2xHw
         ye+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795197218; x=1795802018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
        b=R09Lu/dz/p5JBTOi1ufw+Nz3sAp9YRnp5Lo2yO85RW75nvJIzKIngT7O/kaY5DLU5Z
         1KUDCttc9VDZwGVO3+y12TnzfD+sE8mCQDDI6uw6QABnTFZanqytcc8x3ZH5P88gU2Hq
         lHj3flXQK9y2oNk8aPFwQ+Gukl7j7+utTXA2MDWoXN/PR1c1giesgMwcVohqE0hcUS8u
         KBjLfgFGlm6tZA0tK02BzV2FL8pvKdqdKO+dsw0UNUdDwYdXb5bMMA0ryuPuH9k5LeGW
         RgCz3WxsZFUJbsn+EEqorzkqlR2wn6S3rT4TXpKItLuSomW0G8ybPZX52XLq6rgvaele
         vquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197218; x=1795802018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
        b=1HLTrde2/05D4rKJJOJLF7o5ly34BHRv3cflgWENVTeP59VRVDVj9xRdaucqOoDQ7a
         5hAvsQQuFU2pGtxYpHciT2Oz6HPtMPYLpQEtVoePIT+5HGvP7eRUfXAQ2E4VORTYMOJh
         7svbigh30xHXQ37usjkSZZsMsEpPzbXn3RAgX4zXJ93DXA96wp/sKQ/JZkfIVaMRKGoZ
         Kc+G6u+ki20Oi+geTQZgsh1SMQ113xGWDl/n2Rbcn+54XbHmEhB9NX/GPrZOw4/jKR+f
         opJ5KJaQIoMMmm+QZzz6moZwlmQiCU+f8Mdw8iM4dxVlFe8yOBfGqw6+VknW2iCDRgJ5
         4lkA==
X-Forwarded-Encrypted: i=1; AL+hErEtMm1DhHnWo37JidHIbnUnydp5Pi/iaM7y2a5bWPlgHo/XyVXwTjEs3TYXgwAyQX8hn25EgUWNy4jpmvftOWeK@lists.infradead.org
X-Gm-Message-State: APuU4Z8VxKs3oKcZSy4fsvhEVA1Kxpq83JbYj2TbQnbu5v0lPGEu5KTg
	Jpckle64dz8mAwH2aYpwIZMGf50G+URgb/Fzw/lSFAQ8WaFX/aFOLYO2tlSOabdHyenaoHHLbcF
	HZThF6pU+vNjrVk15LV6hOsL313tj74E=
X-Gm-Gg: AZFdTZe5DlAUzSFlQ2dBwB016Md3bHUFGmjjv41Y8837yJv0+EHav0eejSGCKw2BEOT
	q9TmqBYo/Mm7oV4zCfnkhwCT62CTg/tFaCUKAivfDX95UnJiT5AsS1e/67bc38glqHcv1xw0TUm
	QoIeIzas+9ERj+W6vzz3GsO91VxdpruJLnTC0aLAY2n9dn7s5zpHgQ1UBkcvZXzadNPdt7skLOR
	lRGOjlnI2NXWeYGnj+Lor6iPVprtQh8Npar10f5nF4LukYdOwRIUo5gVtZm2QFdBXhfjoe40qoQ
	eywQvN3cCIGtgRixnuKFq0ru+JdfV017+kAI7TYpA3sSSZvbigVthzsg6pj5mEh2uTYUESDqFFs
	gnxLv8hax+kW9ck4bvj7LEPlRDUZSVa+u1hjwZj6Eqj7NP3G3IW30zQIaOJvOw1aSEVZA+TkQZC
	/BCWNdFBjCW34L4BDBSYNacO5V0kUXyiOm9ywkFUOd1tYuyqvWEh6otc/Q+3KLIsOXZIs+TxwmW
	T/uCLegC0NXI6w1dzgSZcAmaXGyVg==
X-Received: by 2002:a05:6102:a4d:b0:7cb:fd69:4155 with SMTP id
 ada2fe7eead31-7d72b3582d9mr2198831137.5.1795197218598; Fri, 20 Nov 2026
 09:53:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
 <179511723446.3136.5381192433185500992@kernel.org>
In-Reply-To: <179511723446.3136.5381192433185500992@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 10:53:27 -0700
X-Gm-Features: Aa3M54r9Ol27mWG1eqxOv22iaYVvbksTWo4-8sJ4NYAR7dV76pguE_MCDRLUKI0
Message-ID: <CADvTj4qRtmZPS6N_0tM5WuFNbm8BRpE3NjxiODNMTaNBytuUag@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_095342_392047_00D46A1C 
X-CRM114-Status: GOOD (  49.32  )
X-Spam-Score: -1.8 (-)
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

On Thu, Nov 19, 2026 at 12:40=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] After this patch, stmmac_hw_setup()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3725-3729) checks=E2=
=80=A6
> - [Low] The struct stmmac_ops comment for rx_ipc
>   (drivers/net/ethernet/stmicro/stmmac/hwif.h:322) still says "Enable=E2=
=80=A6
>
> Pre-existing issues:
> - [Low] This problem wasn't introduced by this patch, but
>   sun8i_dwmac_rx_ipc_enable()=E2=80=A6
>
> --
>
> net: stmmac: preserve RX checksum capability when offload is disabled
>
> This patch changes stmmac_hw_setup() so that a zero return from
> stmmac_rx_ipc() clears plat->rx_coe only when RX checksum offload was
> requested, meaning hw->rx_csum is non-zero. Before this, the RX COE
> capability was lost when the interface was reopened after RX checksum
> offload had been turned off with ethtool.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 25894771e9e9f..e162976be2e6d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev=
)
> >       stmmac_safety_feat_configuration(priv);
> >
> >       ret =3D stmmac_rx_ipc(priv, priv->hw);
> > -     if (!ret) {
> > +     if (priv->hw->rx_csum && !ret) {
>
> [Severity: Medium]
> Can plat->rx_coe now stay unverified when RX checksum offload is off at
> every stmmac_hw_setup() since probe?

Yes. On GMAC, GMAC4 and XGMAC, zero is the expected readback when
offload is disabled. Clearing plat->rx_coe on that basis is what makes
a working feature disappear after the interface is reopened.

What v2 misses is the later live enable. stmmac_set_features() sets
hw->rx_csum from plat->rx_coe and ignores the readback. If the enable
bit stays clear, the RX path can mark an unchecked packet as
CHECKSUM_UNNECESSARY. I haven't seen the bit fail to latch on hardware,
but the driver should check it when enabling offload and leave software
checksum reporting off if the enable fails. The rx_ipc comment should
also say that these callbacks return whether the checker is enabled,
not whether the hardware supports it.

>
> For example, if "ethtool -K ethX rx off" runs before the first
> "ip link set up", the readback is never checked. plat->rx_coe then keeps
> whatever value the HW feature register or platform data reported.
>
> If RX checksum is later enabled while the interface is up,
> stmmac_fix_features() keeps NETIF_F_RXCSUM because rx_coe is not
> STMMAC_RX_COE_NONE. stmmac_set_features() then ignores the rx_ipc result:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_features() {
>         if (features & NETIF_F_RXCSUM)
>                 priv->hw->rx_csum =3D priv->plat->rx_coe;
>         else
>                 priv->hw->rx_csum =3D 0;
>         /* No check needed because rx_coe has been set before and it will=
 be
>          * fixed in case of issue.
>          */
>         stmmac_rx_ipc(priv, priv->hw);
>         ...
> }
>
> That comment assumes the stmmac_hw_setup() check has already run, and
> after this patch that is not guaranteed. Before this patch, any open
> with a zero readback cleared rx_coe. So once the interface had been
> opened, offload could not be enabled at runtime without a check.
>
> Some hardware may advertise RX COE while its IPC bit does not latch. On
> such hardware, hw->rx_csum would be non-zero while the MAC is not
> validating checksums. stmmac_rx() and stmmac_construct_skb_zc() would
> then mark IP frames CHECKSUM_UNNECESSARY based on hw->rx_csum:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_construct_skb_zc=
() {
>         ...
>         if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
>                 skb_checksum_none_assert(skb);
>         else
>                 skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>         ...
> }
>
> The zero-copy path does not look at descriptor status at all. Split
> header is also enabled from rx_csum > 0.
>
> This would last until the next stmmac_hw_setup() with a non-zero
> rx_csum, for example after down/up, resume or an MTU change.
>
> I could not find a specific part where the IPC bit fails to latch, so
> this depends on the hardware case that the stmmac_hw_setup() check
> exists for.
>
> Would it make sense to check the stmmac_rx_ipc() return in
> stmmac_set_features() when offload is enabled? Another option is to
> verify the capability once, whatever state was requested.
>
> [Severity: Low]
> This isn't a bug, but should the rx_ipc comment in struct stmmac_ops be
> updated to match the contract this check now depends on?
>
> drivers/net/ethernet/stmicro/stmmac/hwif.h:
>         /* Enable and verify that the IPC module is supported */
>         int (*rx_ipc)(struct mac_device_info *hw);
>
> The commit message says the callbacks program the state requested in
> hw->rx_csum and return whether IPC is enabled afterwards.
> dwmac1000_rx_ipc_enable(), dwmac4_rx_ipc_enable() and dwxgmac2_rx_ipc()
> behave that way. The hwif.h comment still reads as if a zero return
> means the IPC module is unsupported.
>
> sun8i_dwmac_rx_ipc_enable() already uses the other reading ("caution
> this function must return non 0 to work") and ignores hw->rx_csum.
>
> >               netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\=
n");
> >               priv->plat->rx_coe =3D STMMAC_RX_COE_NONE;
> >               priv->hw->rx_csum =3D 0;
>
> [Severity: Low]
> This is a pre-existing issue, not one introduced by this patch, but the
> commit message says:
>
>   Keep calling rx_ipc when offload is disabled so that the hardware
>   is still programmed with the requested state.
>
> Does that hold for the sun8i EMAC used on H616? The commit message
> limits this claim to the GMAC, GMAC4 and XGMAC callbacks.
> sun8i_dwmac_rx_ipc_enable() ignores hw->rx_csum and never clears
> EMAC_RX_DO_CRC:

That's correct. The sun8i callback always returns 1, so it doesn't
trigger the capability loss fixed here. The separate sun8i patch [0]
keeps the hardware checker enabled in both modes and lets packets
whose only error is a bad IP or transport checksum reach the stack as
CHECKSUM_NONE. On that MAC, ethtool rx off controls whether the driver
reports a checksum as verified, not whether the MAC checks it.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-1-505=
8fecba6b3@gmail.com/

pw-bot: cr

>
> drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:sun8i_dwmac_rx_ipc_enab=
le() {
>         ...
>         v =3D readl(ioaddr + EMAC_RX_CTL0);
>         v |=3D EMAC_RX_DO_CRC;
>         writel(v, ioaddr + EMAC_RX_CTL0);
>
>         return 1;
> }
>
> So on sun8i, "ethtool -K ethX rx off" leaves the EMAC checksum engine
> on.
>
> stmmac_rx() still treats these frames as CHECKSUM_NONE because coe is
> 0, so I could not find any frames being marked with the wrong checksum
> state. The problem is that the register state does not match the
> requested state.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386%40gm=
ail.com

