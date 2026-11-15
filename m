Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kcczFTIP;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ChaNsDt+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZaEc514ihvfvk9V5+VuMh0ehlrDQX81AXtOUhrkge+A=; b=kcczFTIPPJy1+ab4O3ep7BI9Z9
	keCQB71hTXhee2rwhoHtG7DyRdvDdSzAhnnbRqFx6dIUltZ+5n4xQ8FlPz/OYoLsfwRPb5GC/B5y2
	DwT7tTQppZVfWOhb5vWntx74e9Os/XdQ7VSTY9dlfXJv+NLGpvIYwe8p6piYUyG4ZXDsty15SR0vN
	VpGn4QSEUcsP6DFID0MCq+iQd2a4N04v1dNBoAYVzARkK1GT+mZ8Nn3y5GWcwpJEnUCaps+jUAQ2A
	5mLJvt5CoBjCDI1F3J3KxVnBcKIesczIPn2rP3fNRSZEuiGhp5/bU6/u3mzvHZsjVbXYm0ze6/tvt
	lgIeXdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShK9-00000000T7c-2WDP;
	Sun, 15 Nov 2026 20:59:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShK7-00000000T77-1pOz;
	Sun, 15 Nov 2026 20:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZaEc514ihvfvk9V5+VuMh0ehlrDQX81AXtOUhrkge+A=; b=ChaNsDt+/6WNmwdhBfZyPGeAHN
	lvqWX4m45CErxVseqoveA3sj9SQrqB9sUihwEWp0recnzzHJL2US2uukHEkt+hgcZGbvYGx83utaO
	EtClqeg9GWiZy63DcFKfFTR0ZqONpOK2oYXqvebBsX4m7jErRs1B/JbW2Wrn1W8xVe5d9vTX8YZw1
	xdCXfvaDACX47G/5PvBBhV+ij9Luh11fnYvyXgBVptACMEjU8RQhQBBAy7HR01M0mC7/ZBG/aQCli
	LguNJ4RG/48wZZzGFujY1c5IcaOdph6hUi8Z1y1ObRgWeWCDo8eH+WjeAp5DFHWaAUVkc+7ML75k6
	CaO8zQNA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jonas Karlman <jonas@kwiboo.se>, Guangshuo Li <lgs201920130244@gmail.com>,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v2 02/11] accel/rocket: number the cores by devicetree position,
 not bind order
Date: Sun, 15 Nov 2026 21:59:24 +0100
Message-ID: <8bRsvcNcRhepz3nNzmBZVw@sntech.de>
In-Reply-To: <20260922080114.44662-3-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-3-royalnet026@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_125939_500906_E2A32623 
X-CRM114-Status: GOOD (  35.51  )
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

Am Dienstag, 22. September 2026, 10:01:05 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Igor Paunovic:
> rocket_job_hw_submit() programs the S_POINTER registers of a core with an
> extra bit derived from core->index, the way the vendor driver derives it
> from the hardware number of the core. rocket_probe() sets core->index to
> the slot the core takes in rdev->cores[], which is the order the cores
> bind in.
>=20
> The two agree only while the cores that bind are a prefix of the core
> nodes in the devicetree, in devicetree order. Unbind them and bind them
> back with a different core first, have one core's probe deferred behind a
> sibling's, or disable a core other than the last one, and every task
> submitted to a core whose slot is not its hardware number times out after
> 500 ms. The reset that follows does not help, and the inference finishes
> with wrong output.
>=20
> Observed on an Orange Pi 5 Plus with a KASAN build, over all six bind
> orders of the three cores: only the devicetree order ran clean. The other
> five produced 27 to 141 "NPU job timed out". In four of them no output
> tensor changed with the input, and the harness gave up before its first
> measured round; the fifth got through a six-second run with 27 timeouts
> and a wrong top-1 class. All but one of the timeouts land on the cores
> whose slot is not their hardware number, in proportion to the tasks the
> scheduler hands them, and in both directions of the mismatch.
>=20
> Number the cores by their position among the core nodes in the devicetree
> instead, which is what the hardware number is.
>=20
> The wrong value has been assigned since the driver was added, but it only
> reached the hardware once the extra bit was introduced, hence the Fixes
> tag below.
>=20
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse checkpatch
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

nits: both the commit message, as well as the comment blocks are
excessivly long, and could be shortened a lot, if a future version is neede=
d.


Heiko

> ---
> Supersedes the standalone posting:
> https://lore.kernel.org/r/20260905135612.7324-1-royalnet026@gmail.com
> Same diff. The message now says the numbers come from a KASAN build,
> corrects the timeout range to 27-141 against the raw log (it said 140),
> says what the four failed orders showed (the output did not change with
> the input; it said an oracle rejected the output), notes the one timeout
> that landed on a matching core, and drops the throughput figure, which
> was measured under KASAN.
>=20
>  drivers/accel/rocket/rocket_core.h |  5 +++++
>  drivers/accel/rocket/rocket_drv.c  | 31 +++++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/ro=
cket_core.h
> index f6d7382854ca9..46ed8352a79d2 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -30,6 +30,11 @@
>  struct rocket_core {
>  	struct device *dev;
>  	struct rocket_device *rdev;
> +	/*
> +	 * Hardware number of the core: its position among the core nodes in
> +	 * the devicetree. Not an index into rdev->cores[] - that slot is what
> +	 * find_core_for_dev() returns.
> +	 */
>  	unsigned int index;
> =20
>  	int irq;
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 2bcfe4ab3c68f..7d927bb6b322d 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -157,10 +157,39 @@ static const struct drm_driver rocket_drm_driver =
=3D {
>  	.desc			=3D "rocket DRM",
>  };
> =20
> +/*
> + * The extra bit that rocket_job_hw_submit() sets in the S_POINTER regis=
ters
> + * is the hardware number of the core, which is its position among the c=
ore
> + * nodes in the devicetree: a disabled core keeps its number. The slot a=
 core
> + * takes in rdev->cores[] is the order the cores happened to bind in, an=
d the
> + * two only agree while the cores that bind are a prefix of those nodes,=
 in
> + * devicetree order. Every task submitted to a core whose slot is not its
> + * hardware number then times out.
> + */
> +static int rocket_core_hw_index(struct device *dev)
> +{
> +	struct device_node *np;
> +	int index =3D 0;
> +
> +	for_each_matching_node(np, dev->driver->of_match_table) {
> +		if (np =3D=3D dev->of_node) {
> +			of_node_put(np);
> +			return index;
> +		}
> +		index++;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  static int rocket_probe(struct platform_device *pdev)
>  {
> +	int index =3D rocket_core_hw_index(&pdev->dev);
>  	int ret;
> =20
> +	if (index < 0)
> +		return index;
> +
>  	if (rdev =3D=3D NULL) {
>  		/* First core probing, initialize DRM device. */
>  		rdev =3D rocket_device_init(drm_dev, &rocket_drm_driver);
> @@ -176,7 +205,7 @@ static int rocket_probe(struct platform_device *pdev)
> =20
>  	rdev->cores[core].rdev =3D rdev;
>  	rdev->cores[core].dev =3D &pdev->dev;
> -	rdev->cores[core].index =3D core;
> +	rdev->cores[core].index =3D index;
> =20
>  	rdev->num_cores++;
> =20
>=20





