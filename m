Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3EC606C575
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ydfnuhgL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfZIYAbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ENcuBo4USOfVQFhUObechYbDtZ2GfADFPof/Bg1RaM8=; b=ydfnuhgLEeVNL5
	4F1bsgWnKb0+gr9q+D6lcBNC/lEWo8sm1l8Uf9lHBtybfG1rV+MxcHoSZv8mIKiKe7sb5+2dzP0Ta
	f5oWNxl6yzJrAWRMBIFoWLljSyRpM3fV3/SK0dh8G52O9N0HgkHk3iXBO7YOxsYtK4SY6OHVjqx1n
	JC9FS1IRAOFzPRSzSYx0mqWd66fMQUUDB0FfNJy+AWq2F5VOY1ik7MJ0Lzy/yocXMpRh7sseY3yv+
	rYOuQaGzG8Xqbl9kR+t13rtdqiD/oxDgzJx8Tfxeqoo1rzFBxRgQiPKAJKB8iSEj1FBXae0cYlxNV
	gJwUUsAEEgGm4vx2TqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDUt-0000000G4Nh-3ftg;
	Sat, 14 Nov 2026 13:08:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDUr-0000000G4N1-2kf4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B61D465C7
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6DE1F00929
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661725;
	bh=ENcuBo4USOfVQFhUObechYbDtZ2GfADFPof/Bg1RaM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfZIYAbbcFGk1GP4Q4eKfAcqvuppW3Wvi9Psg08B3GWREll4Tdsxk/TqwaG6emPge
	 K1zuRY+2fbOyuFHAl4Re7PYdfjDYozXFJQRCWe/VlTVxJlZEJa/fGud3tINeXQs76m
	 xoT8i8SSpfj3RtdNDmUG8aYEVDzUCtGrIHnw0qAmJdIMQNzwBQn/3dVSmOzcQAmUFJ
	 9gW5ZhzallYtftMidwJtEQDCX80k5Gi3bpwlGLBlFzbjvsOK1Om/iSDzsilcMNJtj2
	 X7J9Dcc4io/tCbHG1RjRHyxw8N03cYszawfFPmlXkDpQ6HM3+Ox/90uqEesFxF+36v
	 DXAVZgrsXU4EA==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10244285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:08:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnWgT3zaEqN4sMPknFX1r1PkMu/Joy48xOv7wiS33JNexYRgU1dT17RXZnT+yFWqHSz5UVqdqMCk9ocPNEh5l8@lists.infradead.org
X-Gm-Message-State: APuU4Z8CDFkUquOr42h9ud3xhs7humlaVzP6vEN5JdlMSrLbOztI5Yq6
	5TayMxv5SXuLME6CZtbf9GZ4ZCZiPRm0VLVXdXyHT/mlQzfFqcDzQTGTUSTjwcghZFUyf+IbApH
	JbNh/cMggMRx1RtBa+cAvGVhzeKsvR4E=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id
 5b1f17b1804b1-4bb55ab4493mr118562415e9.35.1794661723805; Sat, 14 Nov 2026
 05:08:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:08:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTScHWwSp6NbTf1+n0rS3fGUU0wRqhkZQVgjRLeu6XpvOA@mail.gmail.com>
X-Gm-Features: AclHuK_1B3cdhqJcEVfShwQslZ0jrvNhdkA66924rVca4uIM67v6w9N5xpnc6Kg
Message-ID: <CAJF2gTScHWwSp6NbTf1+n0rS3fGUU0wRqhkZQVgjRLeu6XpvOA@mail.gmail.com>
Subject: Re: [PATCH 04/19] dt-bindings: timer: add the Allwinner V861 CLINT
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
> The V861 uses the XuanTie C900 CLINT implementation, like the D1. Add an
> SoC-specific compatible with "thead,c900-clint" as the fallback.
It's allwinner,sun252i-v861-clint in the patch; please correct the commit l=
og.

>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index d53f52e80d88..313fb39bd453 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -49,6 +49,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> +              - allwinner,sun252i-v861-clint
>                - canaan,k230-clint
>                - sophgo,cv1800b-clint
>                - sophgo,cv1812h-clint
>
> --
> 2.55.0
>
>


--
Best Regards

 Guo Ren

