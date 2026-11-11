Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6175606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dNUBX/Ey;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j/bKAVJr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lnDCWDQWS7lnvEMZecQHmZbDoApXTQBDAtdlF1srqGU=; b=dNUBX/Ey2R54Y8C8KKj2CtFKvS
	l/7EdLZTBSkdAeLy5+MYRXTZqfRDnXA4TMfnOX1iv0yMOorJjCtcVJ/RIYNsiyM/LMoLACPv6mxxc
	tZbW4Z8a6Y/amHl80eeTsR48s9n/F5KG/KAe0A0UD17Mjhr4fx3zblKI4lvmWYaDZNK1SnxBaqNlE
	zPl97Dhx/bHWXYkJmgvV4f5rHkD0he7JLXBW655fFomLhaqdIYsF8Yk679IfF9bfeBCjFEtP8VDiH
	MOfbApKkgJg94BHdE7prFd3YKpkbSzIrjdK1xWwcZaimmwHb36iqk3baRLOc1saBYotDf/UQTx8AL
	NzyCbbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Jp-00000006SSX-35vM;
	Wed, 11 Nov 2026 11:16:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Jo-00000006SSP-22ZV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:16:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A75D462C1F;
	Wed, 11 Nov 2026 11:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6225A1F00A06;
	Wed, 11 Nov 2026 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395803;
	bh=lnDCWDQWS7lnvEMZecQHmZbDoApXTQBDAtdlF1srqGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j/bKAVJrtZwDofw24ex418Jp2+gu3PnPe30TpfHOwVcYjUhGjWJd9Xjw6PluHQvE6
	 EpRzF8mQTjZ9OyiEpB+ZwB1eG+8ArTSr5Ahf5KjPQquN6klAR9jhDmd+3M9JrPRZXI
	 qNFN+JTLKWto+SP0sHWnUfGCynsBOGz/5lMJ1cn9C07bn4AzFfTrsxDGbKpN1rdgnB
	 BiQpmWw3iu6FcMa4SdDSgP9aY3/WTym2C3FxjVcklOkEYs5FL1K8Keg2yQZO18Og3/
	 EKbjTjm5K8KuC4fHXbK88S1U8sbXFduvsf6OS3EJQ6txDOgF5hJ+mAFmL4kETKuBk/
	 SgGtRvGAR10EA==
Date: Wed, 11 Nov 2026 12:16:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: andrew@lunn.ch, robh@kernel.org, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	klightspeed@killerwolves.net, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: marvell: Remove duplicate DS212
 compatible
Message-ID: <20261111-efficient-magenta-jellyfish-90cfde@quoll>
References: <20261110093120.179318-1-artem122novak@gmail.com>
 <20261110093120.179318-2-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110093120.179318-2-artem122novak@gmail.com>
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

On Tue, Nov 10, 2026 at 03:31:19AM -0600, Artem Novak wrote:
> The Kirkwood Device Tree binding lists "synology,ds212pv10"
> twice in the compatible sequence for the Synology DS212.
> 
> Remove the duplicate so that the documented compatible
> sequence contains only unique identifiers.
> 
> Fixes: 1c5f2ea8ce7f ("dt-bindings: arm: marvell: Convert marvell,kirkwood boards to DT schema")
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml        | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


