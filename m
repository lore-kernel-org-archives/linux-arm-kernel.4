Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDD606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3BD21zji;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+X1Qp2M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xIJP/ux0u2zudpHSHBN3zgctS50zYkGAb3SzJpj0v60=; b=3BD21zjiyqSI49
	lhJKhBQJiq7ju20khvEpTpGXeonLYQuVitQq2zAuTRtLCSdbz7a4+fUgx+YZvznNPjhKnPHyq7sFK
	gGhA5Rpmdmi+Py7yREidFIScjteKUxsbUI+cifuGjfFv3xGPEFr7N7z5P2mjgdbhbL365SO6L5XBm
	8GYSXwI9vP8uOQbu65CVKig63Ldy3kw/PzAozwTx/5uH/VqgClZHHAIIj9VAN+DYNQmvxOLJ+NEil
	BQpcMo6QWPym1KwRtsXGozM5wn8iBiGhhenIA8c/7pi2jzh9hgYyi8y+vcCognSvAl2xb5yTvErcS
	ubH07mA2XbXCYvpt3w/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnGN-0000000FOHN-4BRu;
	Sat, 07 Nov 2026 20:43:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnGN-0000000FOHH-1sBF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 20:43:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3829C42B7F;
	Sat,  7 Nov 2026 20:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DD71F0089F;
	Sat,  7 Nov 2026 20:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084227;
	bh=xIJP/ux0u2zudpHSHBN3zgctS50zYkGAb3SzJpj0v60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M+X1Qp2MqP3zYUYD6309po4giUA4YS0ZDStqsnfzwZcAmmQCrqcKt6s94A2e5FQqk
	 3vygZ2+LcYgFDNYRd55jBzgAQQUuXC7EbCLqW58ObeCfkrwHiiMDOacRqLPdQNw2m2
	 jYPt46CupXaDMm3RrfIIjVKeoq0LX/8+u4ebkGPVOzdaklcrVgI5AZyRniVaGzAqYN
	 XdO8wXEFUCkudScu1VDf7OxnHqV3ZexLikZrtLUBB3DBzKSMJkXaYi8o0wjvgsJasb
	 HOTqkART3+P+yH6uImF3aJEX4+ftFHMkLvi9Q3Fr08affb8aAprixKWh4T1NADjlqJ
	 L+h4Il2mIsEnQ==
Date: Sat, 7 Nov 2026 20:43:42 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Conall O'Griofa
 <conall.ogriofa@amd.com>, Salih Erim <salih.erim@amd.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, stable@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] iio: adc: xilinx-ams: fix out-of-bounds accesses
 when parsing channels
Message-ID: <20261107204342.4ff7487e@jic23-hlaptop>
In-Reply-To: <20261104164510.105359-1-kapoorarnav43@gmail.com>
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed,  4 Nov 2026 22:14:59 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> The driver sizes its channel array for 10 fixed and 21 external PL
> channels, but accepts external channel nodes numbered 20 to 50, and it
> never checks the remaining room while filling the array. Channels 20 to
> 29 are the fixed ones, so listing them adds duplicates and overflows
> the array.
> 
> Patch 1 limits the external channels in the binding to 30-50, as Sai
> pointed out. Patch 2 does the same in the driver and adds the bounds
> checks from v2.

Applied with the fixes tag for dt binding dropped.  
Note I'll take this the slow way so this will only merge next
cycle.

Thanks,

Jonathan

> 
> Changes in v3:
> - New patch 1: limit the binding to channels 30-50 (Sai)
> - Patch 2: only accept channels 30-50, so a channel node can no longer
>   duplicate a fixed channel (Sai), and add a static_assert() that
>   ams_pl_channels[] holds the fixed plus the external channels
> - Patch 2: rework the commit message around the duplicate channels
> - Rebase on fixes-togreg (now on 7.4-rc1)
> 
> v2: https://lore.kernel.org/all/20261023185652.195025-1-kapoorarnav43@gmail.com/
> v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/
> 
> Compile-tested only (W=1); I don't have ZynqMP hardware. dt_binding_check
> passes, and rejects a channel@25 node in the example.
> 
> Arnav Kapoor (2):
>   dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to
>     30-50
>   iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
> 
>  .../bindings/iio/adc/xlnx,zynqmp-ams.yaml     |  7 ++-
>  drivers/iio/adc/xilinx-ams.c                  | 57 +++++++++++++++----
>  2 files changed, 50 insertions(+), 14 deletions(-)
> 
> 
> base-commit: c293f0db308fe76a0a9b0f6674cd2dea149b03aa


