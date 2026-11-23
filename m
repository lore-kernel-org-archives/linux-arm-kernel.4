Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B6F606D16D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c5KliaFF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkUu4qcH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iSp+6Y67zsfn/WpLtVUfCKIyxWtLaKdyUG5apCNSwDw=; b=c5KliaFFmvYutZ
	z11MvYzvO91xtE/QiWpCPcld7Wj6Kxpuk7lkTEgO1yrISiYzzuM+6xoBDEc5EAhAKhEpR/QEbq5Yj
	qid1TVIWxkGxq1eK8fI+bSnuRnL3Z8L+2fOcI/6048d2xSotRDeiRXKoWmT5srNTOl3uKPTKavgXU
	6/2MStOv1WcJvYrkQRLprlRCC+PnkhWFVjvVQYd6SY/e1WVtXQPi60UHRN31hnc1ZsulNfCZGWnaR
	tfKPZfkSg5XmMbNYQtgksoUiKiRas9PIjcms0Bxi4sJEEQ4HFErUfMGgsRkOQ3sqC4jITAFhAciFo
	4/b4UfQc67TrZHH4jn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP1P-00000002Wqs-0Lbz;
	Mon, 23 Nov 2026 08:03:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP1O-00000002WqS-2Pnk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:03:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1923B44E39;
	Mon, 23 Nov 2026 08:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5F51F000D4;
	Mon, 23 Nov 2026 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421010;
	bh=iSp+6Y67zsfn/WpLtVUfCKIyxWtLaKdyUG5apCNSwDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AkUu4qcH9drXb9xgMaNlzw5vEkS/7ZFFrwoAA347UQxbFPH7hcyVVXYvx7WweNV3r
	 XsnNHS0pQ0brOTh8KFBXpS02vnsNZvzyPOisZ4jZSmCTdngWtMR5Dwb5r8NuDZ9LG5
	 luLttXNHT4JseguiRjYpECtk3bjJHyIDolwXmG2d57HaUqnhTyT4rPDhH+SlvEVQis
	 TfVy8mZlVEfpae7EzS46JBDGifFJSanFgv8fBY9CgkqG4MhCmiZwGgDi0Lk/XIEEDg
	 fATFrwNAWsrcT9+Jdke3LXtdDOsghDlriY3wfR1miyjAjEjxjYnnjd6rhemc/yEAZJ
	 wkwcvUYgdHybw==
Message-ID: <bc070af5-62f1-4836-baa6-3749f2fba6e6@kernel.org>
Date: Mon, 23 Nov 2026 09:03:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 6/8] iio: adc: at91_adc: pass struct device to
 at91_ts_register()
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, jic23@kernel.org,
 linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com,
 amin.gattout@gmail.com, antoniu.miclaus@analog.com,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-7-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261123070101.53868-7-abdelnasserhussein11@gmail.com>
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
> The at91_ts_register() helper only uses its platform_device argument to
> obtain the parent struct device.  Pass that device directly and simplify
> the function signature and its call site.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts

