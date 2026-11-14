Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E134606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ie80uKJ9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv0p5Oqa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xu1Ch5SXzmukBzjwhfrUVAX6Y1aXdcS/DpJ5yAXyxco=; b=ie80uKJ9orBPys
	AB997vCTt8HynRCRey9TCIyKhX+ziStcLBtGtkBYoYHtMt+UPpV0WFUBID5R+hJYl8KXfVJf/m2y0
	ZoApLXz7cdugU3Mnp9zFsGwGjxZqoLbmkSHkR++r14NF7mstKyRMCo0HdCYIc8bil2oiec5ihadSW
	EjvSlsWcvsUaZHXX8HUCyVb5yeE4h+JyN+ZxgnxUz+wqBD1wSe+yq+0N16Zap220mCcmA3JDYO4fZ
	IKRWYmna/8bjQWAOAmvMkNQfgGXtoyAUGjoRn/tNxwNzPS1Kp/8R5TeDSj/xy+SC35q78k4VVrmZB
	xhhQ5iR2BCLGrxniRbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDa2-0000000G5PI-0ykd;
	Sat, 14 Nov 2026 13:14:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDa0-0000000G5Ov-3nvL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C18A45999
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C64B1F00927
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662044;
	bh=Xu1Ch5SXzmukBzjwhfrUVAX6Y1aXdcS/DpJ5yAXyxco=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zv0p5OqaUOwOAG7H6IinOG7MKZZLjNtn8OpRuk/AMQ7IhMTG2AbPgDz35aF4yoDo8
	 DMBl1Cjp+ggQQPruYxZxsi4T92QMfMU7YlzFFCLOeYooScYmtjd+qfYgMLJ+TgLlZv
	 Z5NtnB0j5jlAg9G7Dixlnfug9472vn/X8f9ftZe5sM+2bpZcK0t8gwsnTeKc3X1OM4
	 VP1RHgjt/00kaQLWuTi1rmeqCC+huv95dY1n93DRFw8FixtteLaYiG6SVGFZdNtvti
	 m/lJLJz1BEC4f2Lfd6Ewa3QZYnKvvjbtwSDGU/EnnIotuM/pp1L34UTab1BhcblTYD
	 SlTYSEgtX6IJg==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49134c8509fso2051252f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:14:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGmUC+d8yREYlUnFuKijOG7dRnHAQ6A/8KInXN/CNQQuEiu2kAIFKkbSH8bZxvn00TIjTIXjGkcu1iSuPQnykSd@lists.infradead.org
X-Gm-Message-State: APuU4Z9bk/e3c68RVv76lzSKkoSF3Cc1J2SV1P3T6UDoa2AWPIHM0aKh
	q99Z7zTyLtqrieddO6G4H+XXolbQ5TdoTz/T81kOw+BMxgQKHKvEgX5+sZaHa+VQpGKQlXIXFvl
	hVa30Iup8uY3wCC8Ba5Ou2jBwpgcpnhs=
X-Received: by 2002:adf:e00b:0:20b0:491:45bc:d69a with SMTP id
 ffacd0b85a97d-49c72e852c4mr9010555f8f.44.1794662042739; Sat, 14 Nov 2026
 05:14:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:13:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTF0b-dkLdznGzwYZmC6rP6GozX1j0Rre5t-aw6i5uDvg@mail.gmail.com>
X-Gm-Features: AclHuK-h5N3J841s1gOOr7kF2F78LtoydmQ7sQ-jEgbZErj4cvRoD35qUys8ixA
Message-ID: <CAJF2gTTF0b-dkLdznGzwYZmC6rP6GozX1j0Rre5t-aw6i5uDvg@mail.gmail.com>
Subject: Re: [PATCH 01/19] riscv: sunxi: describe the wider Allwinner SoC family
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
> ARCH_SUNXI is about to cover the V861 as well. Update its prompt and
> help text instead of adding another option.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig.socs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index cecbce0c4983..4cf3b24467e8 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -61,13 +61,13 @@ config SOC_STARFIVE
>           This enables support for StarFive SoC platform hardware.
>
>  config ARCH_SUNXI
> -       bool "Allwinner sun20i SoCs"
> +       bool "Allwinner SoCs"
>         depends on MMU
>         select ERRATA_THEAD
>         select SUN4I_TIMER
>         help
> -         This enables support for Allwinner sun20i platform hardware,
> -         including boards based on the D1 and D1s SoCs.
> +         This enables support for Allwinner SoC platform hardware,
> +         including boards based on the D1, D1s and V861 SoCs.
Perhaps we could keep the help text generic and omit the specific SoC
models, so it won't need updating whenever support for another
Allwinner SoC is added:
This enables support for Allwinner SoC platform hardware.

>
>  config ARCH_TENSTORRENT
>         bool "Tenstorrent SoCs"
>
> --
> 2.55.0
>
>


--=20
Best Regards
 Guo Ren

