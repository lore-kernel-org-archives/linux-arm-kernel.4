Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6b+5nc9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYfkIXaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9CxTExrzL3kATeAM6ygWp3ufG5hvlr8xzSC5e3ulCyQ=; b=Q6b+5nc9CerBZsF0kmjTB70rH+
	7H68Y6Wzb0VJft+d8y5qD/RQczRnbNvNmYs6/Bo99RKITRqZGVZbV9Rlx8sLxSJr6oN26u4/JhbV8
	XJ1YvAXZlfcVmFm308iaQpl2sMkIeUuFRubU0xClbw6+vH2w9Um+UAW5fsDvRN46QcSBHjMe/uPqj
	tBfe/4nd3d8tjSjfucsQM4sqIGibkxQSHKR7ytjeWzKEH2OTj9evpp+EASpkueUKv004jcbf9vr5b
	ZHfP6bBEOlpCTZlmwfOCW3XUjwyo50OvXwENlidoU5iBbYuEx/2mXifLpMTkBsuNzeG8w8DP7hVnk
	4UDsuDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQng-0000000FT6W-1fWd;
	Fri, 20 Nov 2026 15:45:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQna-0000000FT5o-42h3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:45:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 6A4CB627BA;
	Fri, 20 Nov 2026 15:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 72EE61F000C4;
	Fri, 20 Nov 2026 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189514;
	bh=9CxTExrzL3kATeAM6ygWp3ufG5hvlr8xzSC5e3ulCyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NYfkIXaQ7K9996vy7S3LxJCGXvh73w6a9/xv+XlVLTSOdlQecNdrelyJKMG5PRRMv
	 71/tC33C4YOxotc56Y4VJW7L6PpRh50mCRXHdakmnrMsk/IrBqEcf4/LHPMu2lopC+
	 iXqDhydmRiLH+7Jsz4R5wSeeOPcw5DeCP47Yhc28ddzKwzTao7gvDzPxbGLk+/ouUP
	 CRXcSDjkYnGyWqFh2+r2v/IXFwMLHRQzXyLMfnAwrsRTLWybrNEZuY8lSnvTt5OVqB
	 Uu0Fze9Bw4DsF0ii36eXHZdjT5EAuJ394EASPmZSjfUvEi64Cup2AMZDYySlYq+rPg
	 s6y439xcJK5+A==
Date: Fri, 20 Nov 2026 16:45:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v6 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Message-ID: <awBfa9jMlhCTR5xV@monoceros>
References: <20260914110739.203479-1-cwweng.linux@gmail.com>
 <20260914110739.203479-3-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghj4wwdna3eordl2"
Content-Disposition: inline
In-Reply-To: <20260914110739.203479-3-cwweng.linux@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ghj4wwdna3eordl2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
MIME-Version: 1.0

Hello,

just some nitpicking left ...

On Mon, Sep 14, 2026 at 07:07:39PM +0800, Chi-Wen Weng wrote:
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +
> +#define MA35D1_REG_PWM_CTL0			0x00

The manual calls this EPWM_CTL0, so I suggest to name this:

	MA35D1_REG_EPWM_CTL0

> +#define MA35D1_REG_PWM_CTL1			0x04
> +#define MA35D1_REG_PWM_CLKPSC(ch)		(0x14 + 4 * ((ch) / 2))
> +#define MA35D1_REG_PWM_CNTEN			0x20
> +#define MA35D1_REG_PWM_PERIOD(ch)		(0x30 + 4 * (ch))
> +#define MA35D1_REG_PWM_CMPDAT(ch)		(0x50 + 4 * (ch))
> +#define MA35D1_REG_PWM_WGCTL0			0xb0
> +#define MA35D1_REG_PWM_WGCTL1			0xb4
> +#define MA35D1_REG_PWM_POLCTL			0xd4
> +#define MA35D1_REG_PWM_POEN			0xd8
> +
> +#define MA35D1_PWM_CTL0_CTRLD(ch)		BIT(ch)

I like it if the register this bit field is defined for is a proper
prefix of the name, so please rename to MA35D1_REG_EPWM_CTL0_CTRLD().

> +#define MA35D1_PWM_CTL0_WINLDEN(ch)		BIT(8 + (ch))
> +#define MA35D1_PWM_CTL0_IMMLDEN(ch)		BIT(16 + (ch))
> +
> +#define MA35D1_PWM_CTL1_CNTTYPE_MASK(ch)	(0x3 << (2 * (ch)))

The reference manual calls this CNTTYPEx, so please rename to

	MA35D1_EPWM_CTL1_CNTTYPE(ch)

> [...]
> +static int nuvoton_pwm_config_channel(struct nuvoton_pwm *nvtpwm,
> +				      unsigned int ch)
> +{
> [...]
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CTL0, ctl0_mask, 0);
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CTL1, ctl1_mask, 0);
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_WGCTL0,
> +			wgctl0_mask, wgctl0_val);
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_WGCTL1,
> +			wgctl1_mask, wgctl1_val);

I think these lines are short enough to not break them.

> +	return 0;
> +}

Best regards
Uwe

--ghj4wwdna3eordl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAawMACgkQj4D7WH0S
/k5Bogf+I9+wjvPp6RamXalq4J4R7DZ5hp2Jlexu1TfyjL9nyTVT/kY6M1IuN9IB
LfLIYkgHk/eW9wWejLQVdbh1zyMonOnaGfRsL7eK81qeX2HjBxNnbnzd7y6qy7lI
9n/uuaaJ+fVw/5jGmhuhgmrIwd8wiCD2N02u9fm2Yv6c4TlFVfn1nn4oRNQ7UQ1M
40tHBzcYV+Le7+SgIMU4BvtsZAD+vbaNFx6HY488zG8PuKOptKrGQhOGvTvXQ4Na
C/AdG7SR03mlxLKf/i+2B13lNSFFY2vudsTpzhkKYQ55cIrk+0BMCv0oaK4qwJ7H
T/D0VdOZl7XQ+G91htlMluNddWRuJw==
=qdzv
-----END PGP SIGNATURE-----

--ghj4wwdna3eordl2--

