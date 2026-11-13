Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD760A2622
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4A5UvtGd;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=WETKN16L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4cmFUMcPAMvcv/oWl7bACmLFpt/PFZRCaHhzhd0+rMs=; b=4A5UvtGdHNHMWdbwwSRdv+PzVY
	uZ9KI2AH56+JQCgoPCLjXwmiJnMTwFhDIFQtAJsQUdYkt6+wOkCBfv+C2+HwpcSXjQXcqCM+ib3TQ
	nqHxNVTQBbkKbRbPUdOPTMeACEo21PwbI8iJnPHij9fkuVTq/ajOGjdghUp3IQj4Z3One4nri1PCp
	2byMikPqVykrpP1Ru5Y8mn1SltrbM+MS53O8BQ4bsi6WRrl3Rnfr7ct9SEpsO/TxGPXsTg3x6nC2Z
	zTTot/4r4Iy0DSvy4Pipiq1RTB+oPTa58ZIAshEC0FtzpqpPoxd5R6KTzuaPXydc4p00MHikvXabA
	d3FBbz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqyH-0000000CpVW-2btX;
	Fri, 13 Nov 2026 13:05:37 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqyE-0000000CpUH-3NmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=4cmFUMcPAMvcv/oWl7bACmLFpt/PFZRCaHhzhd0+rMs=; 
	b=WETKN16LBGZKxHYigk0fqsdX8r8k4hW2X5DYm2W5PUhET19Sgk5kzPlUeRz4uXFXCtsU35z+Jly
	jVRsrlgSRZ0oijj+o3nQFx5DnDk2ZmCiCmSm+knTJK33sFMKn6eKysEB2y8FyLhNbOiABBaXH9656
	8SFFcg5ZIrRCq6NhwKmcj77N8etIotXiQQTNGdKqu/ogHVQcBy9TRXRnYNv+svQlBvSAH8xee18jp
	M9vXgZSwV6wCG+76BFz73QZ0TtkUc95Fmr/r8fePEi7xK+zGtyqZX4Z4Tf0bKLSwd797tOvtaOQSp
	2dI+0h68jgNHnpxujaf1Mw5grmw3uaVVVQMg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xRqy7-0000000EfGg-34d2;
	Fri, 13 Nov 2026 21:05:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Nov 2026 21:05:27 +0800
Date: Fri, 13 Nov 2026 21:05:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: clabbe@baylibre.com, davem@davemloft.net, linusw@kernel.org,
	kaloz@kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] crypto: ixp4xx - Free the fallback cipher if context
 initialization fails
Message-ID: <avcLF6uiIj-r9AVq@gondor.apana.org.au>
References: <20261103062942.1021598-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103062942.1021598-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050534_847656_0A856A79 
X-CRM114-Status: GOOD (  12.54  )
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

On Tue, Nov 03, 2026 at 06:29:42AM +0000, Wentao Liang wrote:
> init_tfm_ablk() allocates a fallback skcipher before calling init_tfm().
> If allocating either security association context fails, init_tfm()
> returns an error and the fallback is left allocated. The crypto core
> does not call the algorithm exit callback after a failed initialization,
> so exit_tfm_ablk() cannot release it.
> 
> Free the fallback cipher when init_tfm() fails. The security association
> contexts are already unwound by init_tfm().
> 
> Fixes: dfb098d692ea ("crypto: ixp4xx - fallback when having more than one SG")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

