Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D148606DE1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cFnlu3WE;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Xc1z0BjF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=132X4kEugYv0DZ68KeYi71Q6KKe1Gy7rUBXRX5SCGWo=; b=cFnlu3WE1m6fUU0plx5miRiMy5
	XVempdjZF0tUhxiEkRMvwsE47ym+Ec/8egBbbRgLOKUwG28tiKBPPe0TGTl93v4ufl/KsqoTWJwtc
	ImnL2gjiLLsQleqQIA7HtE/oo4cxCJFwyIVd0asNdKJlwPG531zlPspfWP8ynPU8ZjcUjGWrRjavE
	PD/bKYBdT9WxTSuzMLGKNdnp3eU+VQpD4e2kvE6wPzIS4ahunpXDmV+R62DND43U2L1XTwgAZ3+i5
	CLo+ARkXqFdv15T7g8Sw6oIBU4bMiB/DGiRcRQnjJUT4mPaUgQBvpwtVDN4A8QTXzEuMwRw76yRr2
	jvyJKCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1y-00000003S3X-3s0h;
	Tue, 10 Nov 2026 10:24:46 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj1p-00000003RxY-3mY5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=132X
	4kEugYv0DZ68KeYi71Q6KKe1Gy7rUBXRX5SCGWo=; b=Xc1z0BjFQqgkvGOLnR9+
	OyhAU8VyWf7eyOFIGj24cvVLNQ5vmQv8+TXX1n8Ap2kUrVdmmYXmwMfah+ryYnuc
	+ekewvukinYw3GkscbrpWqCCTe6N/GbrNg2o4DwoUdGhFHFr83C4wRo+9xawVXrI
	BB/xRHXCHfBjwCuw/bUmUAMUQnZSs8nzEXDKUCIWBMoacmTMYS17z7jbJALehaeo
	I/Ysu2pq2oWOaxDfYIJHrE+Gj9X0XrmjQsr+uUA44BG7zgDNpv4OlvZu+9+zIbKz
	6N96RuRjCc51wBADleWnmTkT/i1wulxc+V7Tt5ClfKKyQL30Emu9u7Rx9Lo0y9bt
	uQ==
Received: (qmail 187945 invoked from network); 10 Nov 2026 11:24:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 11:24:35 +0100
X-UD-Smtp-Session: l3s3148p1@xMwtfOlffIIujnsO
Date: Tue, 10 Nov 2026 11:24:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/8] i2c: of-prober: Let cleanup op know if a device
 was found
Message-ID: <avLw4zVtmr9WEQLR@shikoro>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-6-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022438_237010_3F786299 
X-CRM114-Status: GOOD (  11.91  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 12:37:29PM +0800, Chen-Yu Tsai wrote:
> The prober's cleanup op may want to do things differently if a device
> was found, such as wait for the actual device driver to pick up
> resources.
> 
> Add a parameter to the cleanup op to pass this information in.
> 
> Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


