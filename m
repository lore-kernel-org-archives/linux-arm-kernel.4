Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2HpMnpfz;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=EUHc0Zw4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=On77mFW6X0dla9fTTn/ye//ONpA/8ovfBsxR4/ar/t4=; b=2HpMnpfzqoTVqPMWOy5nk4dJGG
	mmnjGrZxNvB2OSwQjuOFAd1sv9anEYuz+Ylgrl5ziQPWSzpjUPPa1OsBXZ7kF7BEm+n44DPXEO7XM
	TACOCXC/BzykByuCORLh4iyt4vi52oceK/FiM+jz/Kc6PVq0KLFjC54fsBDkFpzFLlJLmRytGmcrP
	Vl3F7dJv4S9gIeLckFGDsgBH3+xji21KBrPVpGdzqqoPD9thJIWMEAWTRifcLP2xYw6UH2U1MCMVY
	cyV89r8HP1lhQovPRfQX7cEzByyVkYNkMLZHhUZYYq3EVhqU03ha7XjQlj9Mw3tMtGFHNVviTmJj1
	JLLhkOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlCK-0000000HHip-2xXA;
	Sat, 21 Nov 2026 13:32:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlCI-0000000HHiJ-2p5F;
	Sat, 21 Nov 2026 13:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=On77mFW6X0dla9fTTn/ye//ONpA/8ovfBsxR4/ar/t4=; b=EUHc0Zw43qyAHoow9nLSYnMNku
	nIsHpuRMHhRcOWdAjWWdn5zXkKiz2s0/XLjWqj+imuH4EXunbC4W2JmK+ttiY9aP0ipgkDUjDbNbq
	bFyYyHz2CdA9attGCmkp1VT0Q1ciLO+vECPwgm7qt0l8deL1l+2bApg2LBRmKyObynHmLqkvW3HWH
	HGtytnGZmTVlHepQqdBW5+WBl0+mHBtJJL4E7qIMdBZZY3YsucAYjjW2VU7ZaoHYPT2NYwBU0baKQ
	ekhoO6DQY0OvtOH23V5DrK4AHqsrB32Eg8e0QYbSFYQl1EdeFgs/KoL4I+hR1O9J65lXH67qJU5/k
	PINYiehg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 ZhuXiangyu <1194781887@qq.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ZhuXiangyu <1194781887@qq.com>
Subject: Re: [PATCH 1/2] pwm: rockchip: add PWM v4 support
Date: Sat, 21 Nov 2026 14:32:04 +0100
Message-ID: <jocuz3u0Ta6QRkgSoouIaQ@sntech.de>
In-Reply-To: <tencent_27C5A1EA3CF33BA5221F7F01A066E92BCC07@qq.com>
References: <tencent_27C5A1EA3CF33BA5221F7F01A066E92BCC07@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_053206_868284_358F959F 
X-CRM114-Status: GOOD (  30.96  )
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

Am Samstag, 21. November 2026, 07:59:35 Mitteleurop=C3=A4ische Normalzeit s=
chrieb ZhuXiangyu:
> Add basic support for the Rockchip PWM v4 controller found on the
> RK3506 and RK3576 SoCs. Compared to the earlier versions, v4 moves the
> enable bits into a separate register, uses hiword write masks for the
> control fields and latches a new configuration with a control-update
> bit.
>=20
> Only continuous output mode is supported for now.
>=20
> Tested on an RK3506 board with a 100 kHz output at 40% duty cycle,
> including enable/disable, verified on an oscilloscope.
>=20
> Tested-by: ZhuXiangyu <1194781887@qq.com>
> Signed-off-by: ZhuXiangyu <1194781887@qq.com>

please check mailing lists, before submitting duplicate work.
There is already a better (yet unfinished implementation pending,
that also incorporates the counter input).

All the process issues, Krzysztof pointed out in another thread still
apply too.


Heiko


> ---
>  drivers/pwm/pwm-rockchip.c | 146 +++++++++++++++++++++++++++++++++----
>  1 file changed, 130 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
> index 050ca8aa..aa89f23d 100644
> --- a/drivers/pwm/pwm-rockchip.c
> +++ b/drivers/pwm/pwm-rockchip.c
> @@ -7,6 +7,7 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/limits.h>
>  #include <linux/math64.h>
> @@ -31,6 +32,27 @@
>  #define PWM_LOCK_EN		(1 << 6)
>  #define PWM_LP_DISABLE		(0 << 8)
> =20
> +/*
> + * Register layout for PWM v4
> + */
> +#define PWM_V4_HIWORD_UPDATE(v, l, h) \
> +	((((v) << (l)) & GENMASK((h), (l))) | (GENMASK((h), (l)) << 16))
> +
> +#define PWM_V4_ENABLE_MASK		GENMASK(1, 0)
> +#define PWM_V4_CLK_EN(v)		PWM_V4_HIWORD_UPDATE(v, 0, 0)
> +#define PWM_V4_EN(v)			PWM_V4_HIWORD_UPDATE(v, 1, 1)
> +#define PWM_V4_CTRL_UPDATE_EN(v)	PWM_V4_HIWORD_UPDATE(v, 2, 2)
> +
> +#define PWM_V4_MODE(v)			PWM_V4_HIWORD_UPDATE(v, 0, 1)
> +#define PWM_V4_CONTINUOUS		1
> +#define PWM_V4_POLARITY(v)		PWM_V4_HIWORD_UPDATE(v, 2, 3)
> +#define PWM_V4_DUTY_NEGATIVE		(0 << 0)
> +#define PWM_V4_DUTY_POSITIVE		BIT(0)
> +#define PWM_V4_INACTIVE_NEGATIVE	(0 << 1)
> +#define PWM_V4_INACTIVE_POSITIVE	BIT(1)
> +#define PWM_V4_CTRL_DUTY_POSITIVE	BIT(2)
> +#define PWM_V4_ALIGNED_INVALID(v)	PWM_V4_HIWORD_UPDATE(v, 5, 5)
> +
>  struct rockchip_pwm_chip {
>  	struct clk *clk;
>  	struct clk *pclk;
> @@ -43,6 +65,7 @@ struct rockchip_pwm_regs {
>  	unsigned long period;
>  	unsigned long cntr;
>  	unsigned long ctrl;
> +	unsigned long enable;
>  };
> =20
>  struct rockchip_pwm_data {
> @@ -88,13 +111,25 @@ static int rockchip_pwm_get_state(struct pwm_chip *c=
hip,
>  	tmp *=3D prescaled_ns;
>  	state->duty_cycle =3D  DIV_U64_ROUND_UP(tmp, clk_rate);
> =20
> -	val =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
> -	state->enabled =3D (val & enable_conf) =3D=3D enable_conf;
> +	if (pc->data->regs.enable) {
> +		val =3D readl_relaxed(pc->base + pc->data->regs.enable);
> +		state->enabled =3D (val & enable_conf) =3D=3D enable_conf;
> =20
> -	if (pc->data->supports_polarity && !(val & PWM_DUTY_POSITIVE))
> -		state->polarity =3D PWM_POLARITY_INVERSED;
> -	else
> -		state->polarity =3D PWM_POLARITY_NORMAL;
> +		val =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
> +		if (pc->data->supports_polarity &&
> +		    !(val & PWM_V4_CTRL_DUTY_POSITIVE))
> +			state->polarity =3D PWM_POLARITY_INVERSED;
> +		else
> +			state->polarity =3D PWM_POLARITY_NORMAL;
> +	} else {
> +		val =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
> +		state->enabled =3D (val & enable_conf) =3D=3D enable_conf;
> +
> +		if (pc->data->supports_polarity && !(val & PWM_DUTY_POSITIVE))
> +			state->polarity =3D PWM_POLARITY_INVERSED;
> +		else
> +			state->polarity =3D PWM_POLARITY_NORMAL;
> +	}
> =20
>  	clk_disable(pc->clk);
>  	clk_disable(pc->pclk);
> @@ -102,6 +137,47 @@ static int rockchip_pwm_get_state(struct pwm_chip *c=
hip,
>  	return 0;
>  }
> =20
> +static void rockchip_pwm_config_v4(struct pwm_chip *chip, struct pwm_dev=
ice *pwm,
> +				   const struct pwm_state *state)
> +{
> +	struct rockchip_pwm_chip *pc =3D to_rockchip_pwm_chip(chip);
> +	u64 prescaled_ns =3D (u64)pc->data->prescaler * NSEC_PER_SEC;
> +	u64 clk_rate, tmp;
> +	u32 period_ticks, duty_ticks;
> +
> +	clk_rate =3D clk_get_rate(pc->clk);
> +
> +	tmp =3D mul_u64_u64_div_u64(clk_rate, state->period, prescaled_ns);
> +	if (tmp > U32_MAX)
> +		tmp =3D U32_MAX;
> +	period_ticks =3D tmp;
> +
> +	tmp =3D mul_u64_u64_div_u64(clk_rate, state->duty_cycle, prescaled_ns);
> +	if (tmp > U32_MAX)
> +		tmp =3D U32_MAX;
> +	duty_ticks =3D tmp;
> +
> +	writel_relaxed(period_ticks, pc->base + pc->data->regs.period);
> +	writel_relaxed(duty_ticks, pc->base + pc->data->regs.duty);
> +
> +	if (pc->data->supports_polarity) {
> +		if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> +			writel_relaxed(PWM_V4_POLARITY(PWM_V4_DUTY_NEGATIVE |
> +						       PWM_V4_INACTIVE_POSITIVE),
> +				       pc->base + pc->data->regs.ctrl);
> +		else
> +			writel_relaxed(PWM_V4_POLARITY(PWM_V4_DUTY_POSITIVE |
> +						       PWM_V4_INACTIVE_NEGATIVE),
> +				       pc->base + pc->data->regs.ctrl);
> +	}
> +
> +	writel_relaxed(PWM_V4_MODE(PWM_V4_CONTINUOUS) |
> +		       PWM_V4_ALIGNED_INVALID(false),
> +		       pc->base + pc->data->regs.ctrl);
> +	writel_relaxed(PWM_V4_CTRL_UPDATE_EN(true),
> +		       pc->base + pc->data->regs.enable);
> +}
> +
>  static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device=
 *pwm,
>  			       const struct pwm_state *state)
>  {
> @@ -175,14 +251,31 @@ static int rockchip_pwm_enable(struct pwm_chip *chi=
p,
>  			return ret;
>  	}
> =20
> -	val =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
> -
> -	if (enable)
> -		val |=3D enable_conf;
> -	else
> -		val &=3D ~enable_conf;
> +	if (pc->data->regs.enable) {
> +		writel_relaxed(PWM_V4_EN(enable) | PWM_V4_CLK_EN(enable),
> +			       pc->base + pc->data->regs.enable);
> +
> +		if (!enable) {
> +			struct pwm_state curstate;
> +
> +			/*
> +			 * In continuous mode the disable takes effect at the end
> +			 * of the current period, so keep the clock running for
> +			 * one more period.
> +			 */
> +			pwm_get_state(pwm, &curstate);
> +			fsleep(DIV_ROUND_UP_ULL(curstate.period, NSEC_PER_USEC));
> +		}
> +	} else {
> +		val =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
> +
> +		if (enable)
> +			val |=3D enable_conf;
> +		else
> +			val &=3D ~enable_conf;
> =20
> -	writel_relaxed(val, pc->base + pc->data->regs.ctrl);
> +		writel_relaxed(val, pc->base + pc->data->regs.ctrl);
> +	}
> =20
>  	if (!enable)
>  		clk_disable(pc->clk);
> @@ -217,7 +310,10 @@ static int rockchip_pwm_apply(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  		enabled =3D false;
>  	}
> =20
> -	rockchip_pwm_config(chip, pwm, state);
> +	if (pc->data->regs.enable)
> +		rockchip_pwm_config_v4(chip, pwm, state);
> +	else
> +		rockchip_pwm_config(chip, pwm, state);
>  	if (state->enabled !=3D enabled) {
>  		ret =3D rockchip_pwm_enable(chip, pwm, state->enabled);
>  		if (ret)
> @@ -291,11 +387,26 @@ static const struct rockchip_pwm_data pwm_data_v3 =
=3D {
>  		       PWM_CONTINUOUS,
>  };
> =20
> +static const struct rockchip_pwm_data pwm_data_v4 =3D {
> +	.regs =3D {
> +		.duty =3D 0x14,
> +		.period =3D 0x10,
> +		.ctrl =3D 0xc,
> +		.enable =3D 0x4,
> +	},
> +	.prescaler =3D 1,
> +	.supports_polarity =3D true,
> +	.supports_lock =3D true,
> +	.enable_conf =3D PWM_V4_ENABLE_MASK,
> +};
> +
>  static const struct of_device_id rockchip_pwm_dt_ids[] =3D {
>  	{ .compatible =3D "rockchip,rk2928-pwm", .data =3D &pwm_data_v1 },
>  	{ .compatible =3D "rockchip,rk3288-pwm", .data =3D &pwm_data_v2 },
>  	{ .compatible =3D "rockchip,vop-pwm", .data =3D &pwm_data_vop },
>  	{ .compatible =3D "rockchip,rk3328-pwm", .data =3D &pwm_data_v3 },
> +	{ .compatible =3D "rockchip,rk3506-pwm", .data =3D &pwm_data_v4 },
> +	{ .compatible =3D "rockchip,rk3576-pwm", .data =3D &pwm_data_v4 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_pwm_dt_ids);
> @@ -327,7 +438,7 @@ static int rockchip_pwm_probe(struct platform_device =
*pdev)
> =20
>  	count =3D of_count_phandle_with_args(pdev->dev.of_node,
>  					   "clocks", "#clock-cells");
> -	if (count =3D=3D 2)
> +	if (count >=3D 2)
>  		pc->pclk =3D devm_clk_get(&pdev->dev, "pclk");
>  	else
>  		pc->pclk =3D pc->clk;
> @@ -351,7 +462,10 @@ static int rockchip_pwm_probe(struct platform_device=
 *pdev)
>  	chip->ops =3D &rockchip_pwm_ops;
> =20
>  	enable_conf =3D pc->data->enable_conf;
> -	ctrl =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
> +	if (pc->data->regs.enable)
> +		ctrl =3D readl_relaxed(pc->base + pc->data->regs.enable);
> +	else
> +		ctrl =3D readl_relaxed(pc->base + pc->data->regs.ctrl);
>  	enabled =3D (ctrl & enable_conf) =3D=3D enable_conf;
> =20
>  	ret =3D pwmchip_add(chip);
>=20





