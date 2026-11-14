Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B906606A8BE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CpJGkBLV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf7YOYxV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vNQVHHIZZSTfT1nrplfEiIhLIPg6pXBmqlh+M+H8vW4=; b=CpJGkBLVPob9uu
	3UUamNn72w8CXC3wTjyaPvrAwUHfMXNLcNY94frw/DLu7StRO0idZJAyrBnyR3rpgsmG6yCVsOf1X
	A2TtRf1qUn3IuAdhXC3iHKHLAMODulpot3YmkerLD5wZM2Kfcx8CAp3mbyCuOZoP2o5J6SsywlRTk
	8v6+zAavRfT7QFJ1SOjSsXwarOmXK7gNY+Er7h/wE1bFkFYupAIETQo3RdpVFrSIdUGI+3e/Hss7i
	ObsR4D5ZOZWb1O3S3KFXHi0+DKB5nto+bzPwL01kZm1z1LBI/rL7aSwbnLsHV+R7Gj9p7qGkdjB2w
	lDaXg1vzAi/yEU4TaQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDbE-0000000G5gZ-2a0V;
	Sat, 14 Nov 2026 13:15:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDbE-0000000G5g0-04L4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:15:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B54BC4646D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969EF1F00AE3
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662119;
	bh=vNQVHHIZZSTfT1nrplfEiIhLIPg6pXBmqlh+M+H8vW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf7YOYxVYTo5d0Tbx5gjgNZgPFz3MxuFXw29Z0fXtpyvQLlRrt2F0jRnECvFS16r7
	 430u/94eNRLSN8StKFXd5LKPWVBYC1YmrUZCOGWBSbDeS2mC0JiTT+JGiARRZNMo20
	 Vf/baGSX3peSR8oLnSEzJDLJ+cSDFHAri6ZstYW4/MNQe+8OTtzEScdG1Tt3kOzQz5
	 EkInjFMaSoynkqxUCzlB+LBP17jf5p+BjAXmQT5Afitek8u6KhlK5VTbb3IU9EAq4Y
	 09a/neI1QYgYvPd8juYRJOS+ySsYJOjR26YtDPUj9Sob509vbXEM6thWCsomRplVQW
	 rED+Vwwv0D4sw==
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11923955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:15:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE9H5pTcVtHS95U2vTNuAR1dFjmigQtVex9oEWWnX+Wmr0viCsglxGAGgnjjHvwZX6LCYFbYefR3oGYiuTDI7gF@lists.infradead.org
X-Gm-Message-State: APuU4Z9oG/SWZEka4sykT6K2h6XZvKa29QE3JfSykk3YluIQGsN2dp77
	lp8nUsv1rmMXGnvrislG4y4LVCc4qIKG4ROuosQIM+xMNpSP4uCjtdXXzGxg8HFeGwSrIlA9ve6
	2/C7qBXwTh0fV4MVgUC4GF/BZFa/kqYs=
X-Received: by 2002:a05:600c:470a:b0:4ac:b0b2:fa12 with SMTP id
 5b1f17b1804b1-4bb559f5d44mr107933255e9.1.1794662118139; Sat, 14 Nov 2026
 05:15:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:15:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQhhDe6vxjNSUfoC87D5hW_DFS+gUnrt3ojnzQJEd5jw@mail.gmail.com>
X-Gm-Features: AclHuK9KtD0Arqx9onqXzPVHTGELkECSfl6DqyPNiPMBBAgZM_jcqAKpqYXH_44
Message-ID: <CAJF2gTQQhhDe6vxjNSUfoC87D5hW_DFS+gUnrt3ojnzQJEd5jw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Nov 14, 2026 at 6:33=E2=80=AFAM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> From: Han Gao <gaohan@iscas.ac.cn>
>
> Add myself as maintainer for the V861 bindings, clock and pin control
> drivers and device trees.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..dfc300dc1eb2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24031,6 +24031,18 @@ F:     drivers/irqchip/irq-riscv-intc.c
>  F:     include/linux/irqchip/riscv-aplic.h
>  F:     include/linux/irqchip/riscv-imsic.h
>
> +RISC-V ALLWINNER V861 SoC SUPPORT
> +M:     Han Gao <gaohan@iscas.ac.cn>
> +L:     linux-riscv@lists.infradead.org
> +L:     linux-sunxi@lists.linux.dev
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/allwinner,sun252i-v861-cc=
u.yaml
> +F:     arch/riscv/boot/dts/allwinner/sun252i-v861*
> +F:     drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> +F:     drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> +F:     include/dt-bindings/clock/sun252i-v861*.h
> +F:     include/dt-bindings/reset/sun252i-v861*.h
> +
Good Work, thx for maintaining these.

Acked-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren

