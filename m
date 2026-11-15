Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 05:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tq4qh/LL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Shf9I945
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sxOBPrCyzV/VX68JlD+bnzHrsOO/mwcMVPnkr3sQCJE=; b=tq4qh/LLxOsmJmwXFTW/agRGvy
	WUje6uEd0RXQGTjtRLxXqThMePjw7MkcC70VLp1o3DqH0nyQpjNM9XGrS0Xd2pfM0sp21ql1R2iK0
	kzlcJU4Bz2cFYabIUUqDWmzjuohXW8LxC0AeOIhNTgsyL3IXCuiM8IYIoh2QdBd1dKMY1gvC/2+tt
	ZZJHYKr5Jrgy10C5cIlzb8c9fvrdMiZhg1tLTx+zugKWFwMwPXJo2PsvnmXpCgmYXn9vp9Y/v168F
	EBw/yKgHHUiLdr2uzF5HrLH2w9N0qnM5QZmOq0sbGvA06ip5rokrNcM0/j6sIp0DfjYzFiS/6E2Dt
	9ujCO+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSSXl-0000000H4uw-0U4V;
	Sun, 15 Nov 2026 05:12:45 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSSXg-0000000H4uP-3x3C;
	Sun, 15 Nov 2026 05:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794719509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JOGlxjHP0/DLspL53khKYZ0SgtKL6wuFzI00xEcjsX2X0naxDeDwG+mN0JTsz+5zf0ZCsFsBMFVqrfaYnQkAUR3t8lbRG8f1BqRhvEj48tV95ZrVQTmeVdXAt/QIi6mKdxRQO4HSe+Y2wYyGGmY5++jbPgiD+NxssVDB9aWoBjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794719509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sxOBPrCyzV/VX68JlD+bnzHrsOO/mwcMVPnkr3sQCJE=; 
	b=JTenAkqIMAIIKYfr7QF4ukYjfy4yNh7djxPijM5gJBR3O9VQkxjSsfcuEF+p9XA5MdQEuNgbt7oMj340d21QTX0xU1gbejcKMOP0wnSw4pDSpshTztxX0p8eRsiJSxdrfO19Rmjh226WJc5Bx5ELVWdzILkLoI3UZafzszEw3oM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Shf9I945a9oA67J+8Ds7UcvmrKj5kNlbGheeRhdtymi+TrNqZRK6TwdNA0v0w0R1b75OQzmI+Pyn/9GuzyrrZRQfM0JQGmkR68MafrCHVXz++GT9O2md5umoQoi44aXHOxbY6STIXDFBFIAEQXgeWQUE//D0QAsCIq6o9b5zNPUZt+5+wuziXnY35ZuNhZHvxU7OHkjnTNRyt2a3mSonSL2WllJDuNrDRkoqTTG0IN5p2Lc+cTSCHPlIF9dSfOHF+TkdKAJJrJV1uxIjEm7+Zqpjmq88uP2UTLimDIQ3QB1f6xrpwLEoaunTnY0SDU7qEWPeTq0v3mNjL5iZ6ia4tA==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=sxOBPrCyzV/VX68JlD+bnzHrsOO/mwcMVPnkr3sQCJE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794719506138787.2843822660936;
	Sat, 14 Nov 2026 21:11:46 -0800 (PST)
Message-ID: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861
 SoC
From: Icenowy Zheng <uwu@icenowy.me>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti	
 <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren	
 <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec	
 <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet	 <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  Maxime Ripard
 <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, Andre Przywara
 <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, 	linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Sun, 15 Nov 2026 13:11:31 +0800
In-Reply-To: <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
	 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_211241_069936_E72A5644 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

=E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4 R=
elay=E5=86=99=E9=81=93=EF=BC=9A
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add myself as maintainer for the V861 bindings, clock and pin control
> drivers and device trees.

I think traditionally sunxi do not add maintainers for specific SoCs.

Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
item instead.

Thanks,
Icenowy

>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> =C2=A0MAINTAINERS | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..dfc300dc1eb2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> =C2=A0F:	include/linux/irqchip/riscv-aplic.h
> =C2=A0F:	include/linux/irqchip/riscv-imsic.h
> =C2=A0
> +RISC-V ALLWINNER V861 SoC SUPPORT
> +M:	Han Gao <gaohan@iscas.ac.cn>
> +L:	linux-riscv@lists.infradead.org
> +L:	linux-sunxi@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> v861-ccu.yaml
> +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> +F:	include/dt-bindings/clock/sun252i-v861*.h
> +F:	include/dt-bindings/reset/sun252i-v861*.h
> +
> =C2=A0RISC-V ANDES SoC Support
> =C2=A0M:	Ben Zong-You Xie <ben717@andestech.com>
> =C2=A0S:	Maintained

