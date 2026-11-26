Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97201606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zBTVoHdg;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=csebFMpp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0uU1xHkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QFPp+98olB7H96ELndfVAn1aKwnYlE7wJR1s/MOg1H0=; b=zBTVoHdgD6QaR7HBqBYr9I2H1o
	fpP0knhU9/x0BqGyRv/Wla/I/nqE+Et1vtICQq//2w1U5xExpqzOrqnTOou6lMxXLaf2WRbTZ4Wmp
	wmGmGJa1Z9h0GzCNLAvRrpUXVblLvIHoeEcLCvymT5x3p2myWopiUaazVfK6JmCtwwu5UMuzrdmtO
	FBySg7YGemrXHrrp1Tt64Bnm9ZJsAyYCUQBiIfMiLZ5p8vUg+IoGGefDCzukNjzJaE/PcVMDktju6
	1RGbhtey6jCtVAhp+psJYLsldT2X3XFhkYdVm+M9CeZpukcQHgdaYhWxAifrSWTVJzDO392sPUaFb
	bQ0mjRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO2j-0000000BlVi-0DT2;
	Thu, 26 Nov 2026 01:12:57 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWO2g-0000000BlUV-0tkT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:12:56 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 294771D00573
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 20:12:53 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 20:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795655571; x=1795741971; bh=QFPp+98olB
	7H96ELndfVAn1aKwnYlE7wJR1s/MOg1H0=; b=csebFMppgOhUiBbEkbTSRv9iZs
	f0Mv7OqLVjAjyDyr0Lz75ojOLtUOsZ3Sw/N8FIGK/Oj7Jv7uAqygHc0sifPczpeS
	WkKL+zLYZ/nHVWjEB+1/U3XkcDBKGPYljVCk4+fzhkJPGWii3IaA5byD0bIJ2xJd
	aIM7I7mj50iElY8ymTYk4A1CZ7R/IZ17wAMUIvzRBIeO40YEqHpDlABIiUe+aPuM
	b8Fv1wv3JYlQx0rCGhe2rEHlHF3D0RVg0wnIAwCySVXniXoRLXpW3+csrepj1YGM
	O3PyHmOuFVg226bNNFzKcSjYR03m/jy+t8ogTolg83mP07zW+RwLE1x3Gm+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795655571; x=1795741971; bh=QFPp+98olB7H96ELndfVAn1aKwnYlE7wJR1
	s/MOg1H0=; b=0uU1xHkUn32vcdm8XjisZD7aSDs9UE6fsR0vrXBZKC3XJLAvOrP
	F1JpLpdUB1IsKyzIl/ReCUjVBeGzeUDtl+8n6Cpbz0F5asf2yL0LAFLxRVCidm9E
	zNKISMDoXy4fUw1ZuuuHmUtAR1bCdDHNOCpgRT+/moEvtkUQ/lMeTcvz3JD48Qzv
	9y7zTbwE3zaYqbm3JDMTHhcrrHZQ+WHfpmR1hqPVj2f2tvx9ZiGh49D7UIgg8fF7
	gtz8UdxNh9HEiADicztA74Z5cwrrFPYBfuuKiLDFMUihns78SxFlVR2w94jRLLNL
	ZIAHMBRWQVRTaz5dBdLCbyc/UgCDblK9mVA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795655571; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:PcfTJCbmwhWHUYDgCgNcjD5T/li5B0WH6CbHzhCLiP4Vv21
	Pp2conVrjJWAGVV+wzO3pecXUfL67cEvGUEatkd+hVN1Kul9QCFn//dFkO/usoXS
	AgwzpaDS1apr9WLiNorOcu37Yv8Yc0lbaBSt+XoNSe7ed3xPLcFqM4ozzKIjya57
	9CAh+0v2Q43AQSn36rmDnVoOT1WLVPucDWCjQo0SolhXYqE/9yN7hUAAlKXI71lz
	yDaliJZOix/irBkeUjEvXGimP8Mw19+0CEoWw2Gqe/LfBb3rk7z1Ze6ruZOc71Xx
	GuwxFm0i1YsyyB/5iyi34nPYBR0or8DlXQxDEpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Q0i1sTTQbcjmcXXT+M78PquS39tDib4K1VaPggSsh+0=:rq6xRGOu8WZ0gInXjlwLQNeu4yVsubQwpS0nHDS7kME=;
X-ME-Sender: <xms:k4cHa0GdHKbMWjJhotoLJn_zcVf207pWafl0MQHx794PRpGZKFVcoQ>
    <xme:k4cHayii4_XqdCUy5bfnX0Y_KfqidZnP271fQ488M8rTg0nkROttU27P5h9zpc0JX
    lFnVX7uW4y6p1l5SOk4HNnq94hJnQuwMN4KsacSRK6rnk8ompjFrohE>
X-ME-Received: <xmr:k4cHaxiD5oGhwklRRZMPphhiN4ortZMUD9XVTWU8rMiIKzmoICRtVyd-VtqYyr8-E7UJjZQhdJ2euhvHmoC5OAAhptmnEguzUlc>
X-ME-Proxy-Cause: dmFkZTG0rxQYipiteh89VTxNujjcq7oJ6AI8/b9/lv+JwM2PNH0ky658Zp0jDPofAzJsG/
    ZQu5GcTSXHhrU3CcJoy6C1K1bQ6vro+A6eC7QdoOX8XIi7t0s6yXZPqNDY+OjlxKoE9ktT
    NM7IrzlPvdpl06IqqwaOwQBopeNlKj0mag1R3fCYnHSHjpACcMAQRo/PrXW4G10Wx1WCUK
    kGKUeJF5Lw/g9x7ya2UlZTED5wT+xb9btslIHSuUF8BB8VfOS57evdqjRcOZN7OmEMv30c
    2yogudxI0ANUXjhDo6q/kjYUcoj7pVP9Z/oEWvePj73xUyqhiBEhGmHlt3pAHAO2l4kKGR
    Y4CBIQcVrQb6DY+gmtOQWinKB0jkTHvOlEVC9o1w974iuoERGgLMPyb5cGP3LpD2n1WImE
    Qqbnd27BfuiqTfhLl97qvXq/8+zFU7cNG/8z0LD5cDzV/iyI3Lljw9Vsh+bt8LNtSZlt2n
    dQX2+Czn2HFAu3i+bRVajncraUfveSIIBnymn1t9WteKrXWp9CIdeEf3mjgYM8z4b60+mZ
    HzTRNBHQeINorJluCDAtjpdKz3GaHN3tz4ieliS3tYZJ93TVGpAaDBi9/xvGP7EIzZuK+Q
    WtLqdO7SRx5uv5braDVAcRqtssFXojTA5Q6I691mMS1NSYjPLjkIOLiOYwcg
X-ME-Proxy: <xmx:k4cHa1mgK7EpLcXSceXoVGApuqd988gMOwDkBAdTklHoWjdj7k1rAQ>
    <xmx:k4cHa1bPKoQOvqZNC5DdBsV1PMBm1J6pexnGoRgZkHKR2HSYbHUP7g>
    <xmx:k4cHa4wLqrTcg5W3-Ou0zLXHfZ_4zw0CcMlaPu6yjNyEb8kNJoBInQ>
    <xmx:k4cHa8ZDkgJ7NQIM8n0CPol8tUetjjp2RBg-UmLgvtF7HASvpJQRNA>
    <xmx:k4cHa-kR7uPkcLcsUX9P6JEFTYrzqBkwfNjS64e6s98Ptm-2p8N9D0K3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 20:12:50 -0500 (EST)
Date: Thu, 26 Nov 2026 02:12:49 +0100
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <20261126011249.GF372978@robin.jannau.net>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_171254_318183_79BC7BD0 
X-CRM114-Status: GOOD (  12.07  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 02:11:49PM +0100, Sasha Finkelstein wrote:
> atc.c is getting pretty big, split out the hardware generation-specific
> code into separate files.
> 
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/phy/apple/Makefile    |    2 +-
>  drivers/phy/apple/atc-t8103.c |  273 +++++++++
>  drivers/phy/apple/atc-t8122.c |  713 +++++++++++++++++++++++
>  drivers/phy/apple/atc.c       | 1286 +----------------------------------------
>  drivers/phy/apple/atc.h       |  340 +++++++++++
>  5 files changed, 1333 insertions(+), 1281 deletions(-)

from a code history and code churn point of view it would have been nice
if the split happened before or while adding t8122 support. Not sure if
it is worth the effort now that t8122 support already exists.

Janne

