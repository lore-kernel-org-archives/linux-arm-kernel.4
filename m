Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ECD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V9lxduvw;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wD5zPBe6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JNnYp35o/nf6vmTuNBxPUZDLjYmnLfH8FNhphGFUILw=; b=V9lxduvwlKOXVM
	NW0D7vZlgBcm3IooXweGTCIhflf8ZKEhdOHMXvYtAPi02LIAx8DRdSisKs4oaOms+FLeaJi0VgLJN
	biVkBkEPQqZZ3ExH6uFC83ZAmUiRCCOg2akW12PkF+Xj4GWNraHc/Bn4mySFX1CMawqOysqzeR/Tg
	wkSKjW1P7wy4Lsv3H6YFcvwUpHh7ego3cRJBQV7oUFKscoLkXq1MKDGYGHm+3pDvBJ4GVP06XbgSc
	4YEmXJ2SvraVSVb80ocjgc4cGqQO54Eb/VaLVXyDNXjvnz2/BKqlzv4Yp3vnG9s50e1SaFT8DFMgA
	iXlyqSDwqRFp5ooxoUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWta-0000000AUGM-1i5M;
	Thu, 12 Nov 2026 15:39:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWtW-0000000AUEt-1yzq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:39:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8F551A1634;
	Thu, 12 Nov 2026 15:39:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BD705FF85;
	Thu, 12 Nov 2026 15:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C23B11BC12B5;
	Thu, 12 Nov 2026 16:39:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794497954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JNnYp35o/nf6vmTuNBxPUZDLjYmnLfH8FNhphGFUILw=;
	b=wD5zPBe6kaum/BhnlH6o+LaQ7BAShR19kjnPomalW1TpQGj6uPuqzef7EcWSGlDS1OF8SH
	DSTpRZNPSr6dZhWViBlT+EdYHo/E2WR0ink4eAqmHj8FvCWiZztJ7R+X9Mxi9SAh75cIfW
	9ndpaN6jBbDTTQ6PBJ5Y3SUlTGmj99QYHcxyy4vsV5txUrG6ak/t7JCioBN+gM3RkPDBn8
	aaK7KGVaPok38beWMpECPkVhTserR9yBDYI0SwAlrvXJM8LFO+qk9Tv6SJJVrJA2HMa3Lo
	xkBkqyucxvXaR2FllFwFLk2SWwCN4yi4rZvDSaRP0v1dgw0sLMDEO5w4PAAqgA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 16:39:06 +0100
Message-Id: <DMTCFJVH99S4.27AWO8PN3ZPK7@bootlin.com>
Cc: "Damon Ding" <damon.ding@rock-chips.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
To: "Jun Yan" <jerrysteve1101@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Heiko Stuebner"
 <heiko@sntech.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get()
 for the DP PHY
X-Mailer: aerc 0.22.0
References: <20261110023721.2014061-1-jerrysteve1101@gmail.com>
In-Reply-To: <20261110023721.2014061-1-jerrysteve1101@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_073922_661320_03F0807D 
X-CRM114-Status: GOOD (  21.90  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Tue Nov 10, 2026 at 3:37 AM CET, Jun Yan wrote:
> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
> internal eDP port) has no separate PHY device and relies on its built-in
> PHY, which is programmed directly through the GRF registers, so its DT
> node carries no "phys"/"phy-names" property.
>
> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
> misleading "no DP phy configured" error at probe time before falling back
> to a NULL phy.
>
> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
> absent and otherwise behaves identically, and drop the manual -ENODEV/
> -ENOSYS handling. This also removes the spurious error message.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
> ---
> Changes in v3:
>   - Add missing changelog entries and reference links
>   - Link to v2: https://lore.kernel.org/dri-devel/20261013134659.335829-1=
-jerrysteve1101@gmail.com/
>
> Changes in v2:
>   - Added comments to explain the changes made.
>   - Link to v1: https://lore.kernel.org/dri-devel/20260924020417.868588-1=
-jerrysteve1101@gmail.com/
>
>  .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6df6963740d2..637b1bff0f6c 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct anal=
ogix_dp_plat_data *plat_data)
>  	if (ret)
>  		return ERR_PTR(ret);
>
> -	dp->phy =3D devm_phy_get(dp->dev, "dp");
> -	if (IS_ERR(dp->phy)) {
> -		dev_err(dp->dev, "no DP phy configured\n");
> -		ret =3D PTR_ERR(dp->phy);
> -		if (ret) {
> -			/*
> -			 * phy itself is not enabled, so we can move forward
> -			 * assigning NULL to phy pointer.
> -			 */
> -			if (ret =3D=3D -ENOSYS || ret =3D=3D -ENODEV)
> -				dp->phy =3D NULL;
> -			else
> -				return ERR_PTR(ret);
> -		}
> -	}
> +	/*
> +	 * RK3288/RK3399 use Analogix DP controller built-in PHY,
> +	 * no extra PHY configuration is required.
> +	 */
> +	dp->phy =3D devm_phy_optional_get(dp->dev, "dp");
> +	if (IS_ERR(dp->phy))
> +		return ERR_CAST(dp->phy);

The original code ignbores -ENOSYS, devm_phy_optional_get() does not. So,
either -ENOSYS was just impossible, or this patch potentially changes the
behaviour.

Can you elaborate on that?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

