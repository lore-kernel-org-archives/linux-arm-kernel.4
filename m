Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A45606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w/owMjSQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAquH30K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O67Sld1N23xdXCx6gIqCXwUsjQS8tlDbGqdMHZU/fNY=; b=w/owMjSQkr20kh
	D8IYchKIAgU4c9sIoTAwqk/btw/RRCEl/xzg4xo0Gry6DHNx6c6r03dbObTyo11qIS2JSGzUQIK9I
	D9YvlNdCu78P0vdnThY8cxdR+YKXWREt8IGcrsym9n7/Xq0A8yTjjD6zC9Mj9warHdotxiNHn2oJ2
	PUXR5BszV5KBuNTqXMGsXcy6KkuUuZsHdpTxqWVDT6SlsCX5MEFiG3kUksiiiXc1b2C2Y7zOSjNiK
	N6Q8odnPMq3tQi+0sjn4qtXITAmXUGE0ZHTg7ZDHCA2okba1wMgfsz4AINRbr8KkMjqG2Q0/K0zQg
	719f/oNjjxf2TNZg2sSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDTj-0000000G3xJ-2aKf;
	Sat, 14 Nov 2026 13:07:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDTi-0000000G3wv-2Ucl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:07:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BB534657C
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354E31F00932
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661654;
	bh=O67Sld1N23xdXCx6gIqCXwUsjQS8tlDbGqdMHZU/fNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iAquH30Khmvacvb33iblyujUgHVesD/yt9CYr5SmFcp1ApKO7T+J37/AyKkyTaSv/
	 EsWGut9q7KWd2gVEyBu/nITBODZA6MEasZBNx0yJah9iOvv4l2nbwnsrsyIklDiQir
	 vnJynlk0O1pmrm7PPFcunHu4Gq+bdPIoQO27xkEZwUlpTj5PAYVzwUf7vDdSUjZ2tn
	 pi647oQyFJF/9n5Oi3H2MjRredHD7BHUm5xS5M2h6NjsyuRzK4q3SlYuiPx3dSdoYf
	 XzKGmiMpZXUPQQCApGxPkLf1MaAmTU9qLoLldT34MGOwd3AerJ6SvgJ51qV1vY5qb9
	 XKyABiarnAsdw==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1089241f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:07:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGzSGO4N3KBvB+SIsvNb+LRyWMm9NiZSiODyM1mWpGyxfwPp6cbjUB7jvcWx1kPMypEfVERg6ngPyyHNhXuQXxi@lists.infradead.org
X-Gm-Message-State: APuU4Z+vPMmtKFpMCflPLxHmOjKJk3aTijvesom5GJR7EoHBTwhIrM3D
	3tbElEKsJRCxhrYZckeXD7Zb3lDOkOL7B8zBtGStcMMfSHc/Pns/LjrI7CLC7gpC0QFJWoF7CIx
	yeaOgsLv8AalaDXNeoS4tCt1/2j2G4zI=
X-Received: by 2002:a05:6000:4202:b0:493:72f7:1d5b with SMTP id
 ffacd0b85a97d-49b03217678mr21427286f8f.29.1794661652676; Sat, 14 Nov 2026
 05:07:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:07:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCtecm6LsuEy_s2rS0hAFzjN61FPRkhdPXg9Vh+xqNpw@mail.gmail.com>
X-Gm-Features: AclHuK9gMmE7_2DKOWkhqnjhaQpkVZ3vMJCR5skQAuEE5nkS6qc3opH65-HdPes
Message-ID: <CAJF2gTSCtecm6LsuEy_s2rS0hAFzjN61FPRkhdPXg9Vh+xqNpw@mail.gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
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
> The V861 uses the XuanTie C900 PLIC implementation, like the D1. Add an
> SoC-specific compatible with "thead,c900-plic" as the fallback.
It's allwinner,sun252i-v861-plic in the patch; please correct the commit lo=
g.

>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml     =
 | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index cde4bb691897..6178fea9bbdc 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -72,6 +72,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> +              - allwinner,sun252i-v861-plic
>                - canaan,k230-plic
>                - sophgo,cv1800b-plic
>                - sophgo,cv1812h-plic
>
> --
> 2.55.0
>
>


--=20
Best Regards
 Guo Ren

