Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x5ekdbFy;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=RlrYyot6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dw4p4I5iIgHPR6iLHR0gyKsTPKAy203NjBPDL1ureKM=; b=x5ekdbFyL9B2F6J43pHsWH5lmL
	LPLCKI0RPTbtqoDbMzq8eGwEtCFINbrh6gg06liK9i/QR0bQzvjvYCTgNRw9Av6y0jIVyac5c1zeg
	PDZgGvJcmcxNR6efjtXStwzB97Qrq5axbjtkMgnY5Ugeh3Kqd/GERknB5tkd119fgo780CJZQZhXI
	9taGER1/DSbtVcroyWLxenbPbDlS24cjbdLLCXJ3u1SvqrrngVl9ZXgkY+05knIzfdDKQ1t5Rc6H2
	EPG+5sjKWI2Y0UbHgMZD2RYJR8wrUR3u7tq/KKDOQCKHG9+UKxLlpt/12zDq3tG5fwuV+Gc3Jt6n4
	JaQnhawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULFr-0000000EW5k-0VSf;
	Fri, 20 Nov 2026 09:50:03 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULFb-0000000EW0p-2dvg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Dw4p4I5iIgHPR6iLHR0gyKsTPKAy203NjBPDL1ureKM=; 
	b=RlrYyot6SP9+fd9yVKAEsHSqRmdn9Tf8bn85zIAV874lHSIWQYq5QKNfz/FAsomtZFLGyUYaCXp
	KxsfKbIXCW5JVqgvrXE3ZwhS4W2byiVzq2Zv16dtCRL3L3hQUXBiCYxLPc38NBlUwj+sqp2H7IeS9
	p3pXiELF73J3rBREKSJiQptATX2xzTs36E6AtrilkpcZO4SnUW3pC4IGSmJFxNEIu5B3rDSU1vflc
	hSyeeP3OI2xIcp0m63WzuauKwbwMjrkVsUpPdmGm1DMh/yUbsACnfa00PRcWKoaO3vQyWlTw2TbLx
	uEEAgFHJxeFx5fhGi9Bny2g+8MaspZN22/fg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xULFU-0000000HYXb-3w4g;
	Fri, 20 Nov 2026 17:49:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 20 Nov 2026 17:49:40 +0800
Date: Fri, 20 Nov 2026 17:49:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] crypto: arm64/ghash - Reduce boilerplate
Message-ID: <awAXtOjMOVqZn6dn@gondor.apana.org.au>
References: <20261109164502.905237-2-u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109164502.905237-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014947_691468_32C61643 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 09, 2026 at 05:45:02PM +0100, Uwe Kleine-König wrote:
> Make use of module_cpu_feature_match() which expands to nearly the code
> that is typed out.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  arch/arm64/crypto/ghash-ce-glue.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

