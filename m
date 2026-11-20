Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2133606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l+EfGq0X;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=QWd9mMI4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7fW/RGjQm4R4BPeAeI/WGaYGJTPLFeO245z4nfgEOkA=; b=l+EfGq0XUkn+6+OlFD92p/VAWO
	UzyaBOUGhLm1gULXiQOs5u+0cUEay25oaoz2j2cU/mU2BjOIlikEJAzVqlU+YpaadkZcz/nWMvVJ8
	tQFRR/8Zyrsp4xG6Gwt+LBSR8ZFH//5xmq/VIQO7G+rb4A+GHgALj7ER2B8ZYrxJQBiBg945e4xOo
	eTalMo5JmIBOBcReM+9P/+MuKOU7h86CAZvAoE3TSoX3Sr5MAuc3gRtHju28yHPdvyAQTJsw6WBCI
	uk3etMhjroQfIe7nj1Bi/1Nlx/VOEXDpw5yMnktkP89yyb8IYRrVHTbS/DAZo3qUjJErfktKpHSN1
	dwNmgQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULFq-0000000EW5a-45hy;
	Fri, 20 Nov 2026 09:50:02 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULFU-0000000EVz9-2n2X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=7fW/RGjQm4R4BPeAeI/WGaYGJTPLFeO245z4nfgEOkA=; 
	b=QWd9mMI4wFHQM2SDoqfoube/8Ipx2BgCY+vi7XA3UBrXpuNV9AcKnl+a57nW9w1tAF/el8f5Hc/
	XnwM57SWVte1l3s0mlKkEeTqrctUI7zKX2UfHurhoKQ+1B4uCF02uxQ9NRv7pXAiugYtbAFW825nJ
	mUlrA7zr+Z6a5htYZLCK4SSs2NnPMc63V1ZJfE9y+NcCmAZpq7VjPX3Hknbx6/8K9SOg+AeH0oYJK
	XiUq6Y7ghmC3OcV6/6dCBjibENXh0DGgDr4ApjkQlBFh/ibHde1FIoCYGidWEhhVoYcyUEEx9a3hS
	co6/NNp6irf2GlyXNJVN6lWyd4ipK6/cebxw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xULFO-0000000HYXA-01uX;
	Fri, 20 Nov 2026 17:49:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 20 Nov 2026 17:49:34 +0800
Date: Fri, 20 Nov 2026 17:49:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto/arm64: sm4 - Drop cpu feature table for PMULL
Message-ID: <awAXrhYQ-DD3dTl_@gondor.apana.org.au>
References: <20261109161052.890682-2-u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109161052.890682-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014940_707675_E275BF2D 
X-CRM114-Status: GOOD (  17.73  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 05:10:52PM +0100, Uwe Kleine-König wrote:
> The result of having that table is that the sm4-ce-gcm module is
> autoloaded if the CPU supports the PMULL cpu feature. However that
> module is only usefull if there are both SM4 and PMULL. The module is
> already auto-loaded if the CPU has SM4 and calls sm4_ce_gcm_init() then
> which fails without PMULL.
> 
> So dropping the PMULL cpu feature table has the only affect that on
> machines with PMULL but without SM4 the useless module isn't loaded any
> more.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> PSA: I don't know what these cpu features are and what the sm4-ce-gcm
> module does. I just stumbled over that MODULE_DEVICE_TABLE(cpu, ...) and
> convinced myself by looking at the code about the above analysis. It
> wouldn't be a big surprise to me if I missed something relevant. So
> please apply some distrust before the patch.
> 
> Best regards
> Uwe
> 
>  arch/arm64/crypto/sm4-ce-gcm-glue.c | 6 ------
>  1 file changed, 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

