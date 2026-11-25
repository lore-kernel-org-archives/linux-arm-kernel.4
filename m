Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4mTdM16T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PG0ErR3g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VBOZGBr55Ujwl78qDcJLp8xc/aTsL0m4eKXQ3BODtCU=; b=4mTdM16TWE8iZsvuiufWwJ2hju
	Nasddl6HWNomu78WwB4cEOBpr3w0cwo7XVGU+tli1vrLwowE0NtZuJfZ3EqPGkedRmiZpbGmOy+5c
	oTg23m3ENL6n8jwqDfIwkeENZsGncyvKgyA7lGAVQhgIXpVh9+f8SFaAJwaS3p7EqWO1bQYeGXvBi
	bIrYEqoxAKqWxSOzI9sSyLqw0pZWgxgJ4xVaTBK2n68sj+r+hvFOk1tJv36Ko2fjqIeEd49YmLulc
	qh7b+AtL0UwPboFvg3olzYK6Hu7BYLwzXi5Bdcbkr0uA5o7qWzQ9LPKiXbnsnyj87KOoSLM4awF8y
	NALAkPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Tg-00000008tiq-0Y7J;
	Wed, 25 Nov 2026 07:31:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Te-00000008thS-1pAn;
	Wed, 25 Nov 2026 07:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13BED4011C;
	Wed, 25 Nov 2026 07:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EAE1F000C4;
	Wed, 25 Nov 2026 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591897;
	bh=VBOZGBr55Ujwl78qDcJLp8xc/aTsL0m4eKXQ3BODtCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PG0ErR3gAmTnmjd1zmcQ4dqGICFZ9/gVAxZhRY5ICPtEvjZXvnumFGUXPCvUnUM57
	 V7Ox3LPxJ/wqw5+ZP0v6lvBYkkzSOopSVTpyivztvutTZr1ReiNz//aM/+bvxfJqB8
	 mCAVVGL2FBMZCmX+yS3Yfq1JyPrEWPWbduh4CLW6sYREGtigXHCHuMa5qMt76KzEME
	 DOFFZL3mbaq4B/CGkkPNf+IZfang3VZrolXR/dyvBcclg9E35/1L8AxSwBir024KU6
	 Cc3hc8mq2GNXx4e5L5QgfSIj1SSjtM9Wsu9qmLciKh2Pu3oSLW/1FW6g98iY+Pw+5U
	 Y7gJQasbU6ElA==
Date: Wed, 25 Nov 2026 08:31:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Andy Yan <andyshrk@163.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Yakir Yang <kuankuan.y@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>, 
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, 
	Sandy Huang <hjc@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maud Spierings <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: display: starfive: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20261125-tasteful-brown-galago-a6725e@quoll>
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
 <CGME20261124155406eucas1p23a523deb496c21cbf3da3724812a8101@eucas1p2.samsung.com>
 <20261124-jh7110-clean-send-v8-4-de92635dd857@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261124-jh7110-clean-send-v8-4-de92635dd857@samsung.com>
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 04:52:40PM +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> 
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map, and its
> two children: the PHY and the controller.
> 
> The two have separate resources. The PHY takes the 24 MHz reference
> clock and provides both the pixel clock, which the VOUT clock generator
> routes on to the display controller, and the phy the controller uses.
> The controller takes its clocks from the VOUT clock generator. What
> they share is the register space, which the parent maps.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 

DT bot reports here a lot of failures. I don't see immediate problem,
but something feels odd.

E.g. https://gitlab.com/robherring/linux-dt-review/-/jobs/18332570769/artifacts/raw/build-15017782.log
(see rest on DT patchwork)

Best regards,
Krzysztof


