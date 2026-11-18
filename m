Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D8606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XOxrRMXL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZnFBLaJi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ne9zjfCtE2ZYUY/5J+qHTBhV7SIbNLnRnfVz2YJDTqU=; b=XOxrRMXLxVa8hUhEGioUDFqXcr
	D/dSmpqIxIoBZhgBQRIr7BDpF4FhhgacAbJ78sDb0beyGtWVE9mMDq8laQ0B6Kh8JaMHP8Sjek4JG
	zBdpsGYPW2i92m7AqHxX61Sff+kGnIMzDn8bxzpKfLH2ZDY5YenZWlvGgTF8o5xrzGTfemo6/26sA
	+mBRjlbSRCIR7vR7l3bbOjvGe4+Xb6zsD24ZCZdiWTz7vhv18X6ff+rSvztjUla2l0j+DglFy0Idd
	Lj37PqhG+XNasPMqKbO7Vrh0GnNu/JDHPeCm9ItFOVXWlWXllXJurNKD1wkGdcT6Pou4h4BFLz8t1
	p8Ggwp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTibd-00000009XYp-28De;
	Wed, 18 Nov 2026 16:33:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZh-00000009WIt-0b6C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:31:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3272A4374C;
	Wed, 18 Nov 2026 16:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37041F000C4;
	Wed, 18 Nov 2026 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019516;
	bh=Ne9zjfCtE2ZYUY/5J+qHTBhV7SIbNLnRnfVz2YJDTqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZnFBLaJi6RcEic/+9H5w4sIwZIkB+fnu0L7z9GJjIX5mDcz2/9l//34AP9Wh4SG/T
	 I0OtIQ4XDPgRuwTOJq+PI5uZUfSycMTi6M96eNe2u7y0yBtvV68mtKTJSeUpdUXcg0
	 JU+M17y+AbLItrwJGiPGetc6fOEMgfyt/bTm6u9ZioMeyqUEYkVwt1um7Kv7ZjG4gX
	 myzW6MOFrtP7pfSZC0+qmGfuWSfItXR/TuVlmM6YZbWFTGM+HdggDC9w5Vc2laEaep
	 XGhXAroYBK0kiWB7JlKmFP21z9V3QQgqxhRDT2zvrJpT20sDFSFxv/20yI92+haDmu
	 NxmxG5man5cNg==
Date: Wed, 18 Nov 2026 10:31:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: nuno.sa@analog.com, dlechner@baylibre.com,
	linux-arm-kernel@lists.infradead.org, jic23@kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, cwweng@nuvoton.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, andy@kernel.org,
	chernyakin.victor.j@outlook.com
Subject: Re: [PATCH v5 1/3] dt-bindings: iio: adc: Fix channel property
 validation
Message-ID: <179501951295.2811032.13608319647135153156.robh@kernel.org>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-2-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117082832.1551574-2-cwweng.linux@gmail.com>
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


On Tue, 17 Nov 2026 16:28:30 +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> The common ADC channel binding currently uses an anyOf constraint
> to require the reg property and select between single-channel and
> diff-channels.
> 
> However, the reg-only branch allows validation to succeed even when
> both single-channel and diff-channels are present, bypassing the
> intended mutual exclusion.
> 
> Replace the anyOf constraint with an explicit reg requirement and
> a not constraint that rejects channels specifying both properties.
> 
> This preserves support for reg-only, single-ended and differential
> channel descriptions while rejecting conflicting configurations.
> 
> Fixes: dd471a2b7759 ("dt-bindings: iio: adc: Add single-channel property")
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../devicetree/bindings/iio/adc/adc.yaml        | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


