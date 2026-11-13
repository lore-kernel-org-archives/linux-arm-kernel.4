Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B6606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J0cBsmOm;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=BG6GxORi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sBw3P7XEecuUSrnOX7EuT/qRSUKWDAXXiFgzDBf5980=; b=J0cBsmOmemGJeZZlBjoZwrsoul
	lhh+dbWIPSIX8GnOPfXLkI+ajNYui2x/d59qZ/k0auvDR41j9sEtZmJQ26V9SfkPqmqXnIY4Lf80q
	9HGNQq6Tf8YIBiQzNiRCH2vwTbO7augmfVb/PxZvtqbhhDj+cb/foN0Kgc79F8DY2VscspODY24MR
	bG4jy8rgPiNj6GxI3eNgLHDYx66jNpdVmbBCX9FiylfeU0hpHkU7kNgje1XAOCWFX8YfmlbeLLoE9
	dmDfVIAh6n/ZxapSmBNx0ciH1VEhnhcNMT6oVE+vWiMnZifFEzQxEJbMoS9wyqF1knR9JkwEdWAb6
	lHV6WpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqxq-0000000CpPe-0m1y;
	Fri, 13 Nov 2026 13:05:10 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqxo-0000000CpOn-1dYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=sBw3P7XEecuUSrnOX7EuT/qRSUKWDAXXiFgzDBf5980=; 
	b=BG6GxORi3Hgn6fmiF3iJoLXnALrcRu7/DWSuWkLSjwtM14z1LDCE9Pk+ohHHk7Rw3LKZ6mI6G9o
	vLbHQV1Dg3af3NiYd5QQpUFvjTVoz+W9pHNiX8eA531UB4Gu4oxChZRqjaMrqpmYCFI9lDTIxa7i/
	IDPl+d6U6zkc5sMVwafPfqRM4zeeqZIECnDDJ4gQIDsC/OcYv7Y29VsS4EWmtT3GYFgSQhLYQ9k7m
	HTEhtyrfTmMVgrXiqaB5B9CpIkkf6E5oIvC79IjGm/g2jLc5gTFI9Q+lP7bZlY5EIYEBknZm4oCDK
	jaICX6gwvaTmuWHOrMgW2evLXVqir8trjFwg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xRqxO-0000000EfDG-00ou;
	Fri, 13 Nov 2026 21:04:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Nov 2026 21:04:41 +0800
Date: Fri, 13 Nov 2026 21:04:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Frank.Li@oss.nxp.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	T Pratham <t-pratham@ti.com>, Thorsten Blum <blum@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Pan Chuang <panchuang@vivo.com>,
	Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
	"open list:CRYPTO API" <linux-crypto@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:QUALCOMM CRYPTO DRIVERS" <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] crypto: use dmaengine_desc_set_callback()
Message-ID: <avcK6e1eMqcyW66R@gondor.apana.org.au>
References: <20261102164538.3834039-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102164538.3834039-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050508_435292_54316140 
X-CRM114-Status: GOOD (  10.77  )
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

On Mon, Nov 02, 2026 at 11:45:30AM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various crypto drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/crypto/atmel-aes.c            | 3 +--
>  drivers/crypto/atmel-sha.c            | 6 ++----
>  drivers/crypto/atmel-tdes.c           | 3 +--
>  drivers/crypto/img-hash.c             | 3 +--
>  drivers/crypto/omap-aes.c             | 8 +++-----
>  drivers/crypto/omap-des.c             | 5 ++---
>  drivers/crypto/omap-sham.c            | 3 +--
>  drivers/crypto/qce/dma.c              | 3 +--
>  drivers/crypto/sa2ul.c                | 3 +--
>  drivers/crypto/starfive/jh7110-aes.c  | 3 +--
>  drivers/crypto/starfive/jh7110-hash.c | 3 +--
>  drivers/crypto/stm32/stm32-cryp.c     | 9 +++------
>  drivers/crypto/stm32/stm32-hash.c     | 3 +--
>  drivers/crypto/ti/dthev2-aes.c        | 9 +++------
>  14 files changed, 22 insertions(+), 42 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

