Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A85560A3812
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RskdH2HE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECgVGtYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LGe29TGUJkMIBRUHWh143So/gwRz7NytSGsVNGYnlLU=; b=RskdH2HEI8aIHY+viKCnv49y3S
	y7Afbny5fQLhpd/WaWUBMhHOZ3DahwgVgWT1cbe6PinGG2rE26lRfghNjPks9b2/wZPQabqeOIEC5
	YFT14i2yJvS6RG/n/KyLGnj3HavBZxDUYK0eajrQXlEuGKHYZRXfnbW6h1Py+fHGll/ODHtTOmGyW
	0eFP5bFBYxkaLxvol/zytgb6BfemcoMlkW3eiAzRaZmijElUdpY40ckBxlTI6jXx4U+tmm43G/340
	J/1slzRqpIKZRsuvcHs5FdZfy66HpcQiU1FhtZbgK31eSzP9HRkYnWlMjehPtW0+QG2GkFWaO5rzg
	s3f+GSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAre-0000000Dbe1-1xVa;
	Thu, 19 Nov 2026 22:44:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUArd-0000000DbdW-1r73
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:44:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8D2E62DC7;
	Thu, 19 Nov 2026 22:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3973F1F000C6;
	Thu, 19 Nov 2026 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128260;
	bh=LGe29TGUJkMIBRUHWh143So/gwRz7NytSGsVNGYnlLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ECgVGtYgOkViLqWhm7I9KZmilWOJpJwWGiLqa/2Grn75XYqQ2R9qpYGx0RvdHMuok
	 m+BbADjAnNdGp8rzlqPHQTFAr/h/uZrlFzpOlreUrTPv0qEa+jiM/LHszEblaRiK+e
	 vb93b0UrIce50w17N91gVFQVnnyFTXd+rfNPciajdgIX1WJkS4ZuoCOrvDRsph5fA5
	 Y8DwOw+qv8pvyECOn+elniGVhD+pVlX98fUnHvhopl72z7336wceP6Ome4gPbUpNlJ
	 oiosQCqeczuLZi/R1WwSCCWlTqEAAQtOPQ902djgEM3+ujO6KIugRPd7QAN/q4fPsF
	 ftzaWg5sWBjig==
Date: Thu, 19 Nov 2026 14:44:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 1/2] raid6: neon: process four data disks per Horner step
Message-ID: <20261119224418.GC1894@quark>
References: <20261118183335.1944213-4-ardb+git@google.com>
 <20261118183335.1944213-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118183335.1944213-5-ardb+git@google.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 07:33:37PM +0100, Ard Biesheuvel wrote:
> diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
> index 14a9fc2c60fa..6f74e2b82fc4 100644
> --- a/lib/raid/raid6/arm/neon.uc
> +++ b/lib/raid/raid6/arm/neon.uc
> @@ -22,15 +22,29 @@
>   * $#-way unrolled NEON intrinsics math RAID-6 instruction set
>   *
>   * This file is postprocessed using unroll.awk
> + *
> + * The Q syndrome is evaluated using Horner's rule, but four data disks at a
> + * time, i.e.,
> + *
> + *   Q' = x^4 * Q + x^3 * D[z+3] + x^2 * D[z+2] + x * D[z+1] + D[z]

In gen_syndrome_real() and xor_syndrome_real() later in the file, z is
the highest disk index in each 4-disk step rather than the lowest.  So
it might make more sense to write this as:

      Q' = x^4 * Q + x^3 * D[z] + x^2 * D[z-1] + x * D[z-2] + D[z-3]

> +/* Q * x^4 + D3 * x^3 + D2 * x^2 + D1 * x + D0 */
> +static inline unative_t HORNER4(unative_t q, unative_t d3, unative_t d2,
> +				unative_t d1, unative_t d0, unative_t x1d)
> +{
> +	unative_t lo = vshlq_n_u8(q, 4) ^ vshlq_n_u8(d3, 3) ^
> +		       vshlq_n_u8(d2, 2) ^ vshlq_n_u8(d1, 1) ^ d0;
> +	unative_t hi = vshrq_n_u8(q, 4) ^ vshrq_n_u8(d3, 5) ^
> +		       vshrq_n_u8(d2, 6) ^ vshrq_n_u8(d1, 7);
> +
> +	return lo ^ PMUL(hi, x1d);
> +}

This is called right after 'q' is updated, so it will take a bit longer
to be available than the other inputs, and ideally the generated code
would XOR together the other inputs first.  Putting 'q' last might make
it more likely for the compiler to do that:

    unative_t lo = vshlq_n_u8(d3, 3) ^ vshlq_n_u8(d2, 2) ^
                   vshlq_n_u8(d1, 1) ^ d0 ^ vshlq_n_u8(q, 4);
    unative_t hi = vshrq_n_u8(d3, 5) ^ vshrq_n_u8(d2, 6) ^
                   vshrq_n_u8(d1, 7) ^ vshrq_n_u8(q, 4);

- Eric

