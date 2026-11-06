Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qN0VOm8S;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ed49qcPf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=; b=qN0VOm8SBCC5m3EzLtk27vJOpU
	pXjqcNnNLvOjXiQwHdzUXSK5Ew062r2i+YfgGLAECjFK1ONwbrazn5vqsGagCiE5ZWQTiUANP2OPc
	9h/0T7eVhpbtAid0LrAowW0mN16fiwlWuWDcW1gdCgg/K0UoeDlDtacOJAuDWLRN4VJY2XlCddA28
	mLqbXO5mcLuafog2ngwRLvhI5gp9Ccak2lcFrDw3HC2o3XoWwZraoaHa81CBu44OfBPpoSIHX54mi
	NGrc9zBrMVnJxfGY3LMUvosQ7z8jo3Gry9BNEIzwzq9vl8oxRalRfah2a7w+qbbMG29Gwwi+oFjPt
	K+fXsfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNsC-0000000DFWO-2jaQ;
	Fri, 06 Nov 2026 17:37:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNs8-0000000DFUr-3x9r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:37:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso768151a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986623; x=1794591423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
        b=Ed49qcPf58IQxMvEmXnpqPA4mP/h+zVOdoJJIr98bdZmt6dXY9wP+zJ5Df6XE4Hd4Q
         B2IDFeW+oRlI0u+9Qux7iGJVJtpoL1afUfRFk0pRlPXk1DXiF7CG0GzmC5TjjwOnFlr5
         Er0qzZH+SmcfNzYe5+j3l9FTFHDwugIS8cvoUrPql9favNiWzMLVMcaRnr4yBesitPVU
         TL6Rl5ND/VnjiDRZNrIQ8SWEWJFgyy8bo2uP5hGJcCdu8Tqla+Y7RB2u8IsNptsmY3a8
         zlYRV95O4i2H0nhbyjwwXHh7MqdVROhZSIJzD9osTCdlCENhklUhWMX27m6zdcRix9uO
         yj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986623; x=1794591423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bCjFCftZY+2sQA45xJDozhTjhcUphJevAvIJETfdPY=;
        b=ZYOYbHkXaKEOXpbzz+JlDDAC0dSorqYPA1xebdmw92FIS/Rzgsjcn3yXA4UI5AfRYc
         kO0BXbpg4VvmYPzzyWPq21c3Lmv02jYHKxmk4i82OcHoDNqYmknBOqxdMS9W1bG+Vu9U
         /bCbr5t+bJPpyC0Kws08TGp+4bXHUL2jbndVVjWfdaQeujRi2+D/DQZdiQ4nfwj3JerZ
         auHLFZmhwMv1OfWvaDdogsYdTHNpxO797vHhi/wV15kgTW9CuvaGeGiMLNFmbw8Wgnk+
         2wDLpZuF4tbbIsfAnd9YIjP1BEqt1HfQHrCiovQIMEgwH1MI7sfGSB5Xi6QxvQJqFluR
         CN5w==
X-Forwarded-Encrypted: i=1; AL+hErHfh+s+nkbzE5BjHFUfFbr4cuef7eH0Swb5s+BiOlYgX9qXnMR6o0LBQQSotCUvwZFUgXXnGMOlDxfzGNu99NwV@lists.infradead.org
X-Gm-Message-State: APuU4Z/wqECASEQwll0a8vUf+o4onWFYYnCDC+hMN0/S67eNHjgCED1p
	825unub7XNUSbdcXafXpWz+GtWumEFlACDJxKImATfl1bFZ20RE3lKNZ
X-Gm-Gg: AYBFou2RhjK7R6yUWYOCNpGgZpfhg6etzsY0TwbbUkrMJ0VHyPorW6GLjcNUHeiUxDr
	XoTrYbC/Q4/Tc/LFbkWMo0E+68XXc8emUnyyMDEb8RiK+nXxX91PnP0E2OD/VdHoncEc0suBPBh
	wOOHBM1y10Isu6JTMa1yZer65yyXJrlEXBeKEuWXGtU6g0QW9MhXBcXvViBEbLh0lq9rS0kZkAw
	7Q2j3rGmQ++RAJfOoqfHl79sbfKoGnzwfePAY6l7SeupM6+B9fYQfrnCYxZdPJ7OqkGJVqUBf+e
	zfV4sXT6CcZRyGWvMl/gztUbjFxLCwXZ68htwXBJPACllUSqUGs86m+y54UsV8TL37cPIy0Mvf4
	8o5B3O+VBh2lQ/vfynhX2dSsVaHVBeGi7mtR48vqr39yFTHP+lC2n4i5ZLlC24WVY4v2eMySavB
	RHR6L5NqHQa+n8/nLbKb9MYjCtqMZY1GkwprO80tFU5e6C13FLDJ6RUeDDqZ6imwcIgVyHeqO4n
	QphYd7novwnegplsRz3BDBRbPytq5OBE66hUao8tsVOZXiSUwSRZaUsxRQYJqlbD8QulkKh2XFj
	I4AwV7WaBDGNmcdivy/2LiOE7A3c7+d7jhSugFIq0uKuphAyAmDCg51lCS1WXSbKbJuk
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3b0db6e7fa8mr3207259a91.35.1793986623300;
        Fri, 06 Nov 2026 09:37:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0f76ff45fsm983355a91.17.2026.11.06.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:00 -0800 (PST)
Date: Fri, 6 Nov 2026 09:36:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Juergen Borleis <jbe@pengutronix.de>, Denis Carikli <denis@eukrea.com>, Lee Jones <lee@kernel.org>, 
	fangxy@xiaopeng.com, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: mx25-tcq - clamp the FIFO sample count to the
 buffer size
Message-ID: <au4Pt9K9145wF2r_@google.com>
References: <20261106075127.3105907-1-liuc63@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106075127.3105907-1-liuc63@xiaopeng.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_093704_982801_332C1B83 
X-CRM114-Status: GOOD (  20.36  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Liu,

On Fri, Nov 06, 2026 at 03:51:27PM +0800, Liu Chao wrote:
> MX25_ADCQ_SR_FDN() reports up to 31 pending samples.  The IRQ thread
> aligns the count down to a multiple of the sample count but never
> bounds it by the size of sample_buf, so a FIFO backlog larger than
> TSC_MAX_SAMPLES overruns the stack buffer.
> 
> Clamp the count before the alignment so that the result stays a
> multiple of sample_count.
> 
> Fixes: 4f7ed234f2a5 ("Input: touchscreen: Add imx25 TCQ driver")
> Cc: stable@vger.kernel.org

This is a platform device, not something that can be randomly connected.
SO barring silicon issues the condition should never happen. I do not
think this makes sense to backport this.

> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/input/touchscreen/fsl-imx25-tcq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
> index ff270b3b8572..fa8d8b736723 100644
> --- a/drivers/input/touchscreen/fsl-imx25-tcq.c
> +++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
> @@ -319,6 +319,7 @@ static irqreturn_t mx25_tcq_irq_thread(int irq, void *dev_id)
>  	 */
>  	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
>  	samples = MX25_ADCQ_SR_FDN(stats);
> +	samples = min_t(unsigned int, samples, TSC_MAX_SAMPLES);

Why is it valid to clamp instead of refusing invalid data?

>  	samples -= samples % priv->sample_count;
>  
>  	if (!samples)

Thanks.

-- 
Dmitry

