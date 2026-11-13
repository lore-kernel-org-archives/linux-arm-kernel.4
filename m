Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC8C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wp2BcEKG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLqQPuwB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YE/QFiUmU3OYrjYzXRMMATHqXl1z5aveyaIXT6zCXNs=; b=wp2BcEKGQgsigPzkH6U8TflI4+
	24/ijDGaas2zZ8Dp3G1Mu/jS+PmKylIMMAYcKQd4uq9F7tJLVVS5IVx+KLmyFUIFGtxnQK5toBQzp
	HjdMhouTjIcW7VOfoO44v2i3TpjUY7pv7NipuVAuxf/UBo0B5YcernJbT6IpKVYIGh28gi1d9ZZcx
	Ki9HFSHNr5DV0Exdt9Mr8phX6BM3CCY2RnCg6EAFpvgIjBlxqAczu2yJfdQpUz1SPWcIP5b/zBYQD
	35p/T633OVEyL3tyNNugjdJlXeUSrqktkcrJt7Uo6OSwZo29eGzqwZYSWwmUOZSrhpaDb9tEg1aw9
	07WNWjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpDK-0000000CUps-3G9N;
	Fri, 13 Nov 2026 11:13:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpDI-0000000CUoy-0N3p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:13:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B98BF4486D;
	Fri, 13 Nov 2026 11:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F9B1F000C4;
	Fri, 13 Nov 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568379;
	bh=YE/QFiUmU3OYrjYzXRMMATHqXl1z5aveyaIXT6zCXNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RLqQPuwBt4mADxbvW1lqlsDuGrKL59sU9HusL5TZqEstdiigTp//KxFNmgVsXiB/u
	 Hu3PxDr+IafRqR34zNggZX0y1A3hBIX4ZABy0DBVICfL8soGxe268Z3/p2CACkRt+Z
	 BTDd8JtoA/QCbfJ92e+rXuoNodBxzTsBZhNF68hVQzUHvWUkMhEnguZWQoMF6250oF
	 WiOQUDmpWl6c743VM14Tj1r9n+7OuqUfxn5rNeEgpaoHH76yzkXAPspFP294JickIw
	 YDd8q6q/qjew/qhiJ53gOolgnmj8hB5+HRsZ5wbRB7pCI73BRDcOKUe6hfff4IOv7a
	 0Q2nl2rRtUhsw==
Date: Fri, 13 Nov 2026 12:12:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733-cubie-a7z: add
 the user LED
Message-ID: <20261113-shapeless-dodo-of-skill-32b3cb@quoll>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
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

On Wed, Nov 11, 2026 at 10:49:17AM -0300, Vinicius Pedrosa wrote:
> Describe the green user LED on the Radxa Cubie A7Z. It is driven high
> by PM2 and uses the heartbeat trigger by default.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>  .../boot/dts/allwinner/sun60i-a733-cubie-a7z.dts     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

This should be squashed, you just added the file in previous patch.

Best regards,
Krzysztof


