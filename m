Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEFE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmaeFXtq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5HDhFWd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UCh5hxQKcdbzNOsUZdCUK4aYJ8BLmHiwc+AaL/5mCtw=; b=EmaeFXtqmaBHRCbYIkYkzoG2Bn
	i3ssDoaSyJcLIMoX9Tt64bzVKIV2Wdf6v8pRk6ui9IgtlgGRBWjj/mEDcZNzWxhyVpRDe41p8oFe4
	40YYg5yc9bqD51rU/FsQMvze0VN4Ct47F17izvCmnRhI+zgr3icxeoC8hdFcSYY8gOyhmP25UWT6L
	Ic/+AycZO+6GW/wks3BM02x/vkfAvZWcFzvVcLZ5Z/3qLHb+1kzf4Kml0Aq6PJRqTjxV32Sa0DBLk
	vN0jIjl95ASXCaVyYrcQyE5upe2GgS2/GiGztDrwg6017qQN4qWRBic+CRDwSWvzQOcARxWPCTEm+
	/wMYZSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl32-0000000A5GO-0Kvd;
	Wed, 18 Nov 2026 19:10:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl31-0000000A5Fu-0ttx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:10:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51B8263892;
	Wed, 18 Nov 2026 19:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E961F000C9;
	Wed, 18 Nov 2026 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795029022;
	bh=UCh5hxQKcdbzNOsUZdCUK4aYJ8BLmHiwc+AaL/5mCtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5HDhFWdwjKadxktuCmDcMvY+D3moREE+GETDz0pFNOebjgwsDrTn87jPGwHdYOW3
	 L8EeQr9uUYADO1ofNqcw94QXA0ad4XWFaCJpxob3CGBh+zTdfBU0MoAtTIHo+dsINM
	 Vk+U7DpDuOAiImIsXxCBaBEZvJavktPLwXMCzUAGcyMMzKf4jOMjzzFR1aqW+Ur2jr
	 NmyFmfVJnR2pLP76e5OJaD28i+sKjwkU2T48ZvYfxNtKA78yw34Lv9NEhVZ9XkCaQ2
	 6JHJFHzv+3QCM24PB1zGtor0DJLnniixl7X7/UJeGUQNJSadj2nRVVwN4FHDkmqX9g
	 WH8r046ydH57g==
Date: Wed, 18 Nov 2026 13:10:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: linux-clk@vger.kernel.org, bmasney+clk@redhat.com, tglx@kernel.org,
	cix-kernel-upstream@cixtech.com, vkoul@kernel.org,
	joakim.zhang@cixtech.com, radu@rendec.net,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	robin.murphy@arm.com, devicetree@vger.kernel.org, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	jbrunet+clk@baylibre.com, Frank.Li@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <179502901965.259850.4106981988225434645.robh@kernel.org>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
 <20261117094408.1393837-2-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117094408.1393837-2-Jelly.Jia@cixtech.com>
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


On Tue, 17 Nov 2026 17:44:04 +0800, Jelly Jia wrote:
> The AUDSS CRU contains a separate AP interrupt gate for each of the eight
> DMA-350 channels. The enabled inputs are combined onto one GIC interrupt.
> These gates are part of the CRU register block, not the DMA controller.
> 
> Describe the CRU as an interrupt-controller in addition to its clock and
> reset functions. A child interrupt specifier contains the DMA channel
> index, matching the corresponding gate bit; the parent interrupt is the
> combined GIC line.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


