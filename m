Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xXuXApV8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnDlvS7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5DFw/e8NbLOtDgOVzRqL/UczE4S7lgWwLX+RaMIW35c=; b=xXuXApV84BknLS1wvyXgKORsTb
	g8GWdJ+eAAX4NnuyMKtujeacioWQ63FUmvv9NM8l0TG0USMS/0tCNszt06ctN3aKKmgv+GaLYM6u3
	ZObj8L6opO13IS6cx3W2mK0ibf9z7KUMVUKCFPaM+53UIKqSLnuTOdKs6BrU7X+klyEQ6w8lm+/Pq
	6esvlaE8f5wEmZPUPapaT+0Do5o6n3JzA4V0no6mFepq9yiMP8+GrxyYPgJpL+t/EiQ2xqkANgwxX
	IoArl+fs502AaBF4RRyxuPMC9gn+bKDNs1LxjrK6VERBgg1dkaYvdsXycBy0N+/xDlWhxY+Pl9OCI
	zTSZAYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOM0-00000002RoP-3zx3;
	Mon, 23 Nov 2026 07:20:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOLy-00000002Ro1-006h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:20:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27BE761D9F;
	Mon, 23 Nov 2026 07:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD61D1F000C6;
	Mon, 23 Nov 2026 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795418440;
	bh=5DFw/e8NbLOtDgOVzRqL/UczE4S7lgWwLX+RaMIW35c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GnDlvS7lvlzKZ78arn3vcFhBxyJCTZrE+Pc4xkF8k/7Cwxy2Z1DeeWugf7SvDyYFp
	 SYVw43rG1xRBKleTZAEx4pn/0I1CshwLFf1WZRkKnxtXYujdoQZnwTtzqTxjTR8K9c
	 +ITbQcbffwX8rEOMrI5c8o3mBP8pbrzkqbrZYnwqeLVmH/GWQL4rne+lQd6JXv1vTI
	 jGx/nHYlVbTBe4c2cB1ihz6ed5GUg+PsfBW/emWGBYRjA8bERn31yXuFUWHUTQJbN0
	 9JGyv9bWRBDFwO1pYyxaM1ag1FCJ7SSAjmWnDQuCAhTXALJB+zsNx8eoYPErMlClHb
	 OSQ+LH9OvbPeA==
Date: Mon, 23 Nov 2026 08:20:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: tiwai@suse.de, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ALSA: hda: dt-bindings: cix: add hda dma memory-region
Message-ID: <20261123-mature-arboreal-seal-5a01fa@quoll>
References: <20261111103924.3395516-1-joakim.zhang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111103924.3395516-1-joakim.zhang@cixtech.com>
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

On Wed, Nov 11, 2026 at 06:39:24PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Document the reserved memory region used for IPBLOQ HDA DMA buffers,
> since the memory accessed by HDA DMA has certain limitations.
> 
> The property is optional: the controller driver falls back to system
> memory when it is absent, but the limited region should be used when
> the platform provides one.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)

Where is any user of this property? Why patch is alone?

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


