Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C686606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JqWacWxO;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cPo7XPZd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=; b=JqWacWxODgbL+x
	l9dvOcyFCYv6xgRXbISIsJCU1Hfambv1G7nQ7gKSE14UjOP+MZ12GOsxZx8SiveqYM9mRgSwtYPC4
	1p7XYjoLwWuwNPhwMvjAezdSOXsIV9vACyCsJn7YHVMpR4PheO3+4wQwFWkbWUJoqx1s6B7dFpoff
	6HkVYOVbNgbMc8Mhr8x6dmpqDWSfWWh8N7mF6IsBPcNoMlTo+IDvD2aihPl6rWxph4J/7QcdhP7M8
	Hl+zFUtGGuqtK0oVsQHdFj/KUNK8ooBcPVLLwaer8KCDIVD2/KbtNgEt+TkoPZhlKh63poLS9dgSB
	0HzkFurvSZ5rN2igWBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK9y-0000000BL05-01mq;
	Wed, 25 Nov 2026 21:04:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK9Y-0000000BKvu-0FOo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:03:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so7223751a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640622; cv=none;
        d=google.com; s=arc-20260327;
        b=jeQfYZSs73SXxmn4fmh9v7IRabdXV0/jXJjFEAeelZ6pxVuxMLQz+2giMF2caw1J/R
         XLsgHjMkdtFznxCYswDR1lZoQGwijEcU8VT3jXMPE/ry9DCF4FsfEQNwdZ53kPtLavL+
         fD9tV7WtSzsjND9itQhFVOFjWmEkS7HQzIszFmujeixhXBxc3unvCRjSOKz/znocsi8G
         yEOzQLilTxEjO6/HLW0hro0XQTSlqblNdRunFrbyCZ21Wm14xbrdQrseccFUj4FaJRvt
         ZsIHBkiEIwSExRJR0wQdujMb0MbVcbqFhOGQFm6DyYBWhxaT/soSre5pObY0wY2w7Kx9
         fNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
        fh=/GZKSiFZhq+/+z2sFIKBercLAUQPSKoYVLIzggtVCB0=;
        b=WjUbfsRY6Gk1hlC4GQTi5r/B2AXbMfsU8TWjLyIbwrZIQjN5vUXH7RYo0kcb6vT3xA
         4jc2/L1aD5ZTf8pz8OsHVqzQOmeRUTt2MKX0GwYFi3LDhPNucbc7FX3PD2PF89IZi/Nd
         RjNIrMrFtwV5MjYxKjzICgE8jKfj6gUJLyKkTX2FmjWtKw14MzNKvN9LZoFTWKARTwkD
         htkoo0WaEn8pgV4qTXlHnhGSUm4daVxX+glwAVn/evkb6/45X0lOk+3TOf8IbWA6my5p
         XIFDqJTf8AZhRWwNdGmWHbdItM3xGgBPYsvFGPi8IQ6xYlj52OG8NfBMxSUMMVPoPvad
         a6eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640622; x=1796245422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
        b=cPo7XPZdm3AulxP/iZ306/tTe52Ii+erddtHHiUvPq6GxfEsype9oRVbFwO/v3GSES
         EKK41aBQ0uVG8W+RzFRF3kdumn2eXFVV84qkO8z1+oR262QHPT+lXzdWb1JKjQfN9gP9
         H7yfUkwL0/miTTYzbF2nin02Ys8H+CKYcBOSh9TwuZgVCbDWgz1OlfV01oyioUtXa2ZL
         CMPKtb8pvzTE7Z+UKL9BMJxCansEqAEfIC3sET+U2kEW3AxVrszTYgvHMpYEtc1BjuR4
         FxasvzP/BUIEus8RmPZDZ/4vJ0OfO/OX3MFaFUiMW0+veL5uL8TTjOUy6otZjvnB8obB
         +4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640622; x=1796245422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
        b=mlGEJGUagKXL7IA8s5GOznF4XmKozltY36STL4f6YnImJj37Vmll5yXoBPooupCSk7
         8R5rjmXXDmf58hC9Hzl1yVY58oiShVzvhFq11yg3tjVAbstZN/SaKC13FYsYJG7QxtYX
         PonyuQRL5gfJOlf5PtelS+27Ar3rQzBANE6iBj83kbzt2hmly60CkSRCm6iOiLr+XAc4
         +c8lNBkoL1w/qCFUAYlTcONcAaX3ZhlTlsBxhJLJ1DWRtYINh4FggHi1u3Jf6iBMzBDO
         n3w/n/D/j/8xRz0xnxkx4LXj+iv/j0owRZ/NPrOk3n7C59Ejfb5H8oplsvOhq7YRYhc8
         2SSQ==
X-Forwarded-Encrypted: i=1; AL+hErEmj2vfZjol8VkwxK8yTVte/fIhmrnWMgX4gIaE4EIkDbDuRKTxiG0SzXgeUKrCZgvZDYjEpFhkCWsIPgufYPAd@lists.infradead.org
X-Gm-Message-State: APuU4Z/sEfAbIFrfLpI57gwc3jLEBZI9svOlmoWjfuF69M5sxDesw+2Q
	68r4WXj546SFniaiOukco/ox6tHhDxQWwXgPnjubU0wFteRZVkubiXFDemaCPGG1zOAWsYO0GhK
	c22ycjAcAFVkX5LCI8ZNY0NKUcONvHsGA1iUjo8o6rA==
X-Gm-Gg: AZFdTZfu/E8VVB90zVe5gorsesAOGDCB3hnVw3kXvWTsBO+6eeNqTcdpqMrGV2ZOCKN
	FK8WJGod3vl0C85Gb+gUVevWhNRxl8jx5uBCYdFiMoNrBI3+SIH9mnunpvlDi5FliQd5tIrhbgr
	NZGZ+sVftw1vGkHckZ+JH2UPBLN5D3gaJGoUfW8M94b3xlyq6ghWzAyR6uFFMg+EuUcmGb66zEB
	5d0J+j0uSCp5knI5dqrxN2lbsCJwvGvZ6mzC/a1H3oxZ7hWNPgWp++QqyRenyS7EeeLahu7lKbn
	iwDKROUTEeYb8NnvGEiLOss3X6BXmxxhHNnFIlyRyLGjkSVV7gtfFtUClWAPmf3F5aNxbKx0qa5
	nzNCr3N+w8tGXHBrYtB6IznldB3mNdqL7ljjYfkH1BaixxkYqEJq8LftMa76zBrqjwXaCxNI=
X-Received: by 2002:aa7:df18:0:b0:6b9:c43d:88f with SMTP id
 4fb4d7f45d1cf-6ba37d5c69dmr10748147a12.9.1795640622317; Wed, 25 Nov 2026
 13:03:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org> <20261123-gs101-usb-phy-orientation-v2-1-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-1-3361fa5f7543@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:03:29 +0000
X-Gm-Features: Aa3M54pP550miJl9HbCRj99JxEMj3d0cMVlh26LqNCl_O0LJ7lYFwSv6xfFKFjY
Message-ID: <CADrjBPpm8OzJTG4J8TqWZF-f_qdOKXJ4Tk-LYhNH1D=mWPNNUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: exynos5-usbdrd: gs101: re-init PIPE3 on
 orientation change
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, RD Babiera <rdbabiera@google.com>, 
	Juan Yescas <jyescas@google.com>, kernel-team@android.com, phone-devel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130346_546635_6A3386FD 
X-CRM114-Status: GOOD (  34.69  )
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

On Mon, 23 Nov 2026 at 14:25, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The SS lane mux on gs101 is programmed only when the PIPE3 phy is
> initialized, based on the Type-C orientation known at that time.
> The orientation switch callback just stores the new orientation and
> relies on the USB controller to exit and re-initialize the phy, which
> only happens if DWC3 enters runtime suspend.
>
> If a cable is connected during boot, the phy is initialized before the
> TCPC reports the orientation (e.g. ~4.0s vs. ~5.3s on Pixel 6), so the
> lanes are programmed for TYPEC_ORIENTATION_NONE, i.e. as if reversed.
> DWC3 doesn't runtime suspend while the cable stays connected (and
> runtime PM is forbidden by default anyway), so the phy is never
> re-initialized and the link comes up in high-speed only.
>
> Re-run the PIPE3 init from the orientation switch callback if the
> PIPE3 phy is initialized and its lanes are programmed for the other
> orientation. Rewriting the lane mux registers alone isn't sufficient,
> the link still comes up in high-speed only with that. Re-initialize
> before signalling VBUS valid, so that DWC3 only sees VBUS once the
> lanes are right. A failure is only logged, so that the TCPM still
> configures the USB role.
>
> Mark the PIPE3 phy as initialized in the same critical section that
> programs the lanes, so that an orientation change can't get lost in
> between.
>
> Also stop storing TYPEC_ORIENTATION_NONE on unplug, so that the stored
> orientation always describes the lanes: while the PIPE3 phy is
> initialized, they stay programmed for it, and when the phy is
> initialized again after phy_exit(), which gates its power, they are
> programmed from it. This avoids re-initializing the PIPE3 phy when a
> cable is plugged in again in the same orientation and the phy stayed
> initialized.
>
> Cc: <stable@vger.kernel.org> # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd=
: propagate GS101 PIPE3 lock failures
> Cc: <stable@vger.kernel.org> # 6.15.x
> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notif=
ier if required")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++=
++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index 2186b745d58f..ccaf0f27c4c8 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -509,6 +509,7 @@ struct exynos5_usbdrd_phy_drvdata {
>   * @regulators: regulators for phy
>   * @sw: TypeC orientation switch handle
>   * @orientation: TypeC connector orientation - normal or flipped
> + * @pipe3_initialized: gs101 PIPE3 phy is initialized (and not isolated)
>   */
>  struct exynos5_usbdrd_phy {
>         struct device *dev;
> @@ -532,6 +533,7 @@ struct exynos5_usbdrd_phy {
>
>         struct typec_switch_dev *sw;
>         enum typec_orientation orientation;
> +       bool pipe3_initialized;
>  };
>
>  static inline
> @@ -1713,6 +1715,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct e=
xynos5_usbdrd_phy *phy_drd)
>         u32 reg;
>         int ret;
>
> +       lockdep_assert_held(&phy_drd->phy_mutex);
> +
>         exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
>
>         /* force aux off */
> @@ -1737,7 +1741,17 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct =
exynos5_usbdrd_phy *phy_drd)
>         if (ret)
>                 return ret;
>
> -       return exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
> +       ret =3D exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Set this while still holding phy_mutex, so that the orientatio=
n
> +        * switch callback can't miss an orientation change.
> +        */
> +       phy_drd->pipe3_initialized =3D true;
> +
> +       return 0;
>  }
>
>  static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
> @@ -1783,6 +1797,9 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy=
 *phy)
>                 ret =3D exynos850_usbdrd_phy_exit(phy);
>                 if (ret)
>                         return ret;
> +       } else {
> +               scoped_guard(mutex, &phy_drd->phy_mutex)
> +                       phy_drd->pipe3_initialized =3D false;
>         }
>
>         exynos5_usbdrd_phy_isol(inst, true);
> @@ -1880,8 +1897,48 @@ static int exynos5_usbdrd_orien_sw_set(struct type=
c_switch_dev *sw,
>
>         scoped_guard(mutex, &phy_drd->phy_mutex) {
>                 void __iomem * const regs_base =3D phy_drd->reg_phy;
> +               bool reinit_pipe3 =3D false;
>                 unsigned int reg;
>
> +               /*
> +                * The SS lanes are configured during PIPE3 init, for
> +                * TYPEC_ORIENTATION_NORMAL or else as reversed. If the P=
IPE3
> +                * phy is initialized already (e.g. the orientation is on=
ly
> +                * known after the USB controller probed) and the lanes h=
ave
> +                * to change, initialize it again, before signalling VBUS=
 valid
> +                * to the controller. Rewriting the lane mux alone isn't =
enough
> +                * for the SS link to come up.
> +                *
> +                * TYPEC_ORIENTATION_NONE (unplug) isn't stored: while th=
e PIPE3
> +                * phy is initialized, phy_drd->orientation is what the l=
anes are
> +                * programmed for, otherwise it is what the next PIPE3 in=
it will
> +                * program.
> +                *
> +                * Don't return an error, so that the Type-C port manager=
 still
> +                * configures the USB role.
> +                */
> +               if (orientation !=3D TYPEC_ORIENTATION_NONE) {
> +                       bool was_normal =3D (phy_drd->orientation =3D=3D
> +                                          TYPEC_ORIENTATION_NORMAL);
> +                       bool is_normal =3D (orientation =3D=3D
> +                                         TYPEC_ORIENTATION_NORMAL);
> +
> +                       reinit_pipe3 =3D (phy_drd->pipe3_initialized &&
> +                                       is_normal !=3D was_normal);
> +                       phy_drd->orientation =3D orientation;
> +               }
> +
> +               if (reinit_pipe3) {
> +                       const struct exynos5_usbdrd_phy_config *cfg =3D
> +                               phy_drd->phys[EXYNOS5_DRDPHY_PIPE3].phy_c=
fg;
> +
> +                       ret =3D cfg->phy_init(phy_drd);
> +                       if (ret)
> +                               dev_warn(phy_drd->dev,
> +                                        "Failed to reconfigure SS lanes:=
 %d\n",
> +                                        ret);
> +               }
> +
>                 if (orientation =3D=3D TYPEC_ORIENTATION_NONE) {
>                         reg =3D readl(regs_base + EXYNOS850_DRD_UTMI);
>                         reg &=3D ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVAL=
ID);
> @@ -1900,8 +1957,6 @@ static int exynos5_usbdrd_orien_sw_set(struct typec=
_switch_dev *sw,
>                         reg |=3D HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
>                         writel(reg, regs_base + EXYNOS850_DRD_HSP);
>                 }
> -
> -               phy_drd->orientation =3D orientation;
>         }
>
>         clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->cl=
ks);
>
> --
> 2.56.1.750.gf70dc682cf-goog
>

