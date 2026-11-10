Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIyiUQoC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Usp3eWU6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gvFWqio/V9hzEqiVCMxAfOwWWqkCgy+VVi7hZNerAjc=; b=zIyiUQoCxa4JYY8Btm9+0GBdSk
	yaj6hLKGvQ5JbhTjlvGo2eW5Iai690qmN1u+IHwzyMxyT4ti7i8rudl6x22fMIA5TAd7JPWbXHzRt
	nY5SBh6+3SlokRIIw3X7E5TXWXpXDwO5Yb8SQ09cmd7Y7EqkQViNTQN9kV8QcAG5A12EcHmamow6R
	mZ0p6pA8V/At/Dog+9H7wnzL2Jk9Fm1l8ZImSoxA4wtNrRQ76jPHGw06OV99WrYCjCloBMj6oW2Xv
	RoFrg+8gs8gL+ayICbW30sZTqfV/iiX7tT9Hkc3oHHvSnz6pxnpqpaoap8rDAgBQnpMOuQ+OfJCNJ
	weOc9J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQt35-0000000529R-0PJ0;
	Tue, 10 Nov 2026 21:06:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQt33-0000000529L-3pzr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:06:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8E0560254;
	Tue, 10 Nov 2026 21:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8371F0089F;
	Tue, 10 Nov 2026 21:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794344792;
	bh=gvFWqio/V9hzEqiVCMxAfOwWWqkCgy+VVi7hZNerAjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Usp3eWU6UCaumbGlTP32QlBGf+GrRTldOtRig70TjugpHeY9nDlP3haBpHeOAAeKc
	 N8bs87ku0ttil+ciVrMW6dzJY8GZ2xMlDdr0DAE0BJ3Ebk/w3m2Bh34WttA0eVu2Dv
	 1kDL1v1q2vtjfO189PwUm5jHY2xa1j7woDTftdsDwKqp1Kjf0MrS0kCoxrhmN2v59P
	 hMKuBec4p9xsmdBT/F0gPHu1aeGl4jkHJuT4M8CQkDRrFf1l80cKEnDjGqCwDtKKS3
	 WRE16CH4Tx5ckDc38CWDaFLDugl12jRnVP+/zAgwNMbi0IKs/CWlpgEWsNzHbdfCh5
	 FStqbYEV7nwng==
Date: Tue, 10 Nov 2026 13:06:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] crypto: arm64/ghash - Reduce boilerplate
Message-ID: <20261110210630.GA1907@quark>
References: <20261109164502.905237-2-u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109164502.905237-2-u.kleine-koenig@baylibre.com>
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

On Mon, Nov 09, 2026 at 05:45:02PM +0100, Uwe Kleine-König wrote:
> Make use of module_cpu_feature_match() which expands to nearly the code
> that is typed out.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  arch/arm64/crypto/ghash-ce-glue.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
> index eaf2932ceaf5..0884f812a315 100644
> --- a/arch/arm64/crypto/ghash-ce-glue.c
> +++ b/arch/arm64/crypto/ghash-ce-glue.c
> @@ -384,7 +384,8 @@ static struct aead_alg gcm_aes_algs[] = {{
>  
>  static int __init ghash_ce_mod_init(void)
>  {
> -	if (!cpu_have_named_feature(ASIMD) || !cpu_have_named_feature(PMULL))
> +	/* ASIMD is implied by PMULL, but better be safe than sorry */
> +	if (!cpu_have_named_feature(ASIMD))
>  		return -ENODEV;

The ASIMD check can be dropped too.  There's already other code that
assumes PMULL implies ASIMD.

- Eric

