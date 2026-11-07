Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C460A2631
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JYCvJSTu;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Gg2YvsR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WXcTlxWH4qnX8oi9ZX69BAlVnoTYRMBFIYfdkKu3cX4=; b=JYCvJSTuByQ+5UQ/5t8x6cCUMl
	8/zq/TEhbHO+tWnwX2lcLkVPxI98OrOCrkMeBeOxe9e3lhVtIxAHY2dO+rrZz0rnOWfdS+9gSws60
	dIcAI8W0cf5xTE5+DHkSf3AnEKAbpDTDKmkDKNOMUx4U3DkVEG1EqpNFXaUpsQCK+XItcP4FcV2oL
	YuJRtxvFQR53msah8ZpK8AKAAu9zILq8uPpop/901rO/PfaWONvIku8jyoNhEhcZmzszM71nd7qOU
	8zwgkFY822PWPdNWdr8Mmw7lAw0pDVVfONHJGPg7L4Vmknt2cH+UT667ocq0GJcQAn7cm0cVsw1pj
	b3+NCOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgxn-0000000EmWL-2qrd;
	Sat, 07 Nov 2026 14:00:11 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgxk-0000000EmVS-1410
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WXcT
	lxWH4qnX8oi9ZX69BAlVnoTYRMBFIYfdkKu3cX4=; b=Gg2YvsR33DGzJN72X8qy
	CNy30T0OsdlC2V3QdKzLrxWCZxrgLQ3WXmpjul/Jp/9UjYgiupHoOxGuSFh2q+y4
	r85SE3TLVp4BroH+vipZ4z4ZYYyrnaAm5nW6uFGjt72OpMhIrdhcg5xAO+kqafxd
	KIr5rHlZ7l0w4PPpDvC/2IJZaB+k8ihGX5iNmSWu42B+PHin7lPFkr7R5cR+20dY
	JuhBuw9Q7xSbk8YYUgT0JqTQlMf0rJxD8UGoGomUxj4gk0wHphw+OvoEFWwmbRrp
	QP8b0tHkfIvV/y85LV7TQ8JfJbIOnWKKYqZGKMnnJLcT5S6ffYUb+o+I8v9lOEO2
	6g==
Received: (qmail 2523875 invoked from network); 7 Nov 2026 15:00:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:00:01 +0100
X-UD-Smtp-Session: l3s3148p1@i+zUJLBfUdQFFu4k
Date: Sat, 7 Nov 2026 15:59:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: apple,i2c: Add t8140-i2c compatible
Message-ID: <au8u3Ndnx3v6RV6p@shikoro>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
 <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_060009_257562_78FD68BA 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 01:52:34PM +0200, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T8140 (A18 Pro) SoC is compatible
> with t8103. Add "apple,t8140-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Andi, since there is no driver change associated, I guess it is easier
if this goes via the apple tree?

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


