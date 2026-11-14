Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D71606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AquEQH4T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbe77+1G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4kdsxrLqnYOpX1QyU0iNFte1eOYe1nCLmGqKY73MdjQ=; b=AquEQH4T+ZrSgl
	sxwx2XgugenozaRUPtg1SWbDZ3+CCTByQoRC/yH8s1D++83O12Lta6kM4+46M/lGeOLgyf7As7YFd
	QU1xB4CG+1YieJjjfM2qyhOZNlBkCna0OiTczxhV1ZrhLRF7vLzpEAslZ09UNQDNsocd1SIHpKAph
	V0VbKPvHxB7QiyCu1YQqucIFGOB/5TWyRUInO8lfHGGR4a/vlOX2Q3FgTOAt+WNzlMLRhbEGhdZx/
	rX9HNcRdl+bKcgHl2xo33JaxsI7qHpHTqR8TYUltX27ouEZYnkSqefr5KvKBxwuLuqjcEy5LSY165
	32B1NzW/6w3XvuomXS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDq1-0000000G7WH-1YPc;
	Sat, 14 Nov 2026 13:30:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDpz-0000000G7Vo-2fKa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:30:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 314A045DFE
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E421F00925
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663035;
	bh=4kdsxrLqnYOpX1QyU0iNFte1eOYe1nCLmGqKY73MdjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mbe77+1GhvODI+6mWq5hPRR5d8VCtc9UMyfbjr+wccQGdxYPb9nXX6Y3s8yGz6kIb
	 fARVMe7B9b5Et13NlB8hB5LeWaFryaB7pJSkHiyWDoClDmPB2TlzhG/YI8qDTjQyE/
	 WDYvttsj6kL3Jr40rcFF7sVzzMxutqB1pjXLA3LPT/3vG60X33w+vhS0JbUTe+7ifG
	 pRaQ8FCones0hTHahfg6b0pKCSEghuci+Q5h5pGV3/RP7te5YPKnzUWRAgSWqWAJJm
	 1x/N9wO2eWU3JIquYC91FWUiwJsvg9fCcORSszU+M2uU6/IAYsisGgX7mvKHBJlkZ3
	 /lEINIMPlev0w==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491aaed7565so841786f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:30:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFn43MXCdJjpS6w3YZ0H49C2FTpO0v5gUhgeqzAna5wddQyw9yJ7ruyXJlo0aqstocwmpVv1ctQGVqrmq1lkpuy@lists.infradead.org
X-Gm-Message-State: APuU4Z/w0aDDqga7KO1fFrOmaCLGWr4XftNQKGcofDHuIkezU1PDDdvG
	c1Y9t/0Log76nYXCs2aDlj2J7X1tF28s//kZgPdgtKV5PNUZbGE7WTgR72GmYY4d1pxavL3y3qw
	ZEDMblu9r3tZ5t2GtiRw+pfny1VSCwgc=
X-Received: by 2002:a05:6000:288c:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-49d1ce31d46mr9587940f8f.21.1794663033180; Sat, 14 Nov 2026
 05:30:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:30:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRDcAVjTu5N+-8zhPJRvgCBiTtt3xZRbF_1s7D+yXXJ+A@mail.gmail.com>
X-Gm-Features: AclHuK8K2OPl8wvZJVK74a7K9gwaF5hUGnQfkFwAnJJ_kB4aFWWolyDhl3_PTvA
Message-ID: <CAJF2gTRDcAVjTu5N+-8zhPJRvgCBiTtt3xZRbF_1s7D+yXXJ+A@mail.gmail.com>
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
Oh, my misunderstanding, thead,c900-clint is used by opensbi. Please
keep this in the commit log.

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren

