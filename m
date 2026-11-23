Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SGa1GLTV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAKROXVq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MFtS+X6Xpozvsy7k0lb/HTdWvxM3I3CnfCZATCjvav0=; b=SGa1GLTV8QtVYk
	48eLegHCja3OU5+jUqA2IiG9PrercfdUqVGQ1uA7IAuWojBNiVRYrt9dk8UZrDcswOVjY2GDJ97yb
	PoCHbfQY/SWtrha04mBn0fpGOGT1Mi6z7uVN+x303zFez0CUUNwEwzXKQYWQjnmvgrv4LZi7zFpQB
	g9YMxWPtgiqC0gQJDNXxsuc0L+CUP+N0sMumfsWFZhtNu09NvubeOo9ISH1Z0RqfDx86QaaalDnAo
	ipxNp2oYm1/R0njZ05MpPHepqnhZpk1Pg/VaWppZYIwvYAl/9y5dZhKym2II0T1wfM+aohksrDzS/
	YjpnS2lhFVSgw6efYBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOuy-00000002Vzc-0SS7;
	Mon, 23 Nov 2026 07:56:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtK-00000002VO7-15nG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:55:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68EB361D5B;
	Mon, 23 Nov 2026 07:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C024E1F000C4;
	Mon, 23 Nov 2026 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420508;
	bh=MFtS+X6Xpozvsy7k0lb/HTdWvxM3I3CnfCZATCjvav0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UAKROXVqvSHTREB2yar0kzYn4O/8P0H9yk7j0jP+4ER3Eed98TnmEKCnHDnUhU2UM
	 XXMUK/CoXhXkssKT5YuLx0JWC7Vf650XApstPU/6tJ5nFZn74KA/EjhxudIB0TXS6k
	 gX0XyKtSzn4B0c8+mBV3zOyUmwTKVYiCU4IeOrVaPHrRc+cjFAxa/6ssP78RoDBB1b
	 z+SA/pnk6U0JQMZ22cqvOAMK+llAHnELYqWH6lgH5rw00drkaNe7jK2tn/uVvTN/Ch
	 NY577KZMl12SOxzHRdNIpvLvAcvmypw1BLwgmrj5NUIUYubhHVC1HnKiLkW+o31OIu
	 n1sP/6ezE4feg==
Message-ID: <98dd960b-721c-47d8-ad85-7828b8ee26c9@kernel.org>
Date: Mon, 23 Nov 2026 08:55:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/8] iio: adc: at91_adc: drop duplicate IRQ allocation
 error message
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-3-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-3-abdelnasserhussein11@gmail.com>
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

On 23-Nov-26 8:00, Abdelnasser Hussein wrote:
> devm_request_irq() already logs an error message when it fails.  Drop the
> additional dev_err_probe() wrapper and simply return the error code to
> avoid reporting the same failure twice.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts


