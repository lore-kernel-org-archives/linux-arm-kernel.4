Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1455606A6B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2OsEcfEa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQZg+5F6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=leRR6eNzADhVnKcUAKiblsCMLIUNRjwjArIIU12nGiE=; b=2OsEcfEaTNM6Fe
	kzyUZREeXH00YlB2opOd1mCvBXObSvUMZzf4t13u6icB9bW/Dsp1BxvF5m7WR+VSdFhG93WOWC/8J
	3cTLLXl/SrJlcVUTjBDYN8C05QrNQSP/ylZ/76nO7R3YzSi6DUe0GdxwWn5AkDjB1jwuXfT/HxUNl
	decr204rgBHbhMdFNak3PzkStRoMsI0NTzVdvFlhw6fDW3SXDWja9cdQHBVDoRAktYA1saa/EtceV
	dHFqYa+/7G7RVNYemWIdCu2Xn9FC16a7OMP7vQvFG9/GQX8Ns2kC35wvrOsmDpmGNkp1cPAvsu9Kx
	cK9VMUo7fipFDU14foUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP1z-00000002WzJ-0tDf;
	Mon, 23 Nov 2026 08:04:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP1w-00000002Wy2-12sA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:04:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05979439FF;
	Mon, 23 Nov 2026 08:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF5E1F000CF;
	Mon, 23 Nov 2026 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421043;
	bh=leRR6eNzADhVnKcUAKiblsCMLIUNRjwjArIIU12nGiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kQZg+5F6Arowc8IX/pv/bvNDLZ+/tso26+mHlXpttbrrxleQO3nGx4ltqpDIoVWqZ
	 OUi0TWLIZWFTW6lF2U+hmLX+cgUT/26AqFoPh1oicwi0S8y/aoxo033JQDfN4vpRAi
	 I0hMpX8OuVWTX6XqVnhQ9lGqrWMCky1KchX2y41+U6ZXmpe2PYF5xzL23Uc3W9vX5R
	 qW1u+0Jt2/e1zo+zGSp8HU/2ThsWrDO/O8A4pzsyatU1bbEiWqiO5NJcT0tH39gP8U
	 1bhAz16hlUVQgxltp09in9gcdk5SvW12+lbVe/IKRiABRuJrSlN8Pwn958EuRHkQez
	 /xNw+XGYmOZsA==
Message-ID: <d854fae0-eb46-456d-a7d9-8a0691db40b1@kernel.org>
Date: Mon, 23 Nov 2026 09:04:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 7/8] iio: adc: at91_adc: use HZ_PER_KHZ instead of raw
 1000
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-8-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-8-abdelnasserhussein11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-Nov-26 8:01, Abdelnasser Hussein wrote:
> Use the HZ_PER_KHZ constant from <linux/units.h> when converting the ADC
> clock rate to kilohertz instead of open-coding the divisor.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---

Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts


