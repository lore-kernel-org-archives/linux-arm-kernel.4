Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D365606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZZNDznFb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emj47kG+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fGGMmpzYvSRCJOjYoy+gZDvztGrcb3fgwkLyHKES3d0=; b=ZZNDznFbBcE9Dh
	+ofEepjibnM6+wI3++xTi2/N+CyZnIJwY9f/VCMw6FLAjtXYvgI0E3Lq0i7ahaMMv8W9ZmysDPeGv
	fFJ2WXlfXOLBNEr2Vn0gu53nS52TkZhmPSIPiR1IW+Wws2gQIrF4tr3zGZu7ToIdcX9fhF08nryYg
	9EuOUCuoYtuZvr+W90wQCIKA2nmea16Q9OA+/Oa1yS6wWpscRbKsByW/G7HnbGMCwvyb8eKVfHHDj
	2GtDddAEBOFBJ7pMNDH8Nr6zidVGORiwaZP/KpWU5FzQlgOflBoaEfULFtNMjijbtNILm2eQ7XPgO
	Mc9bL5+UMoNPl9F/YXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Lp-00000008rep-3GEi;
	Wed, 25 Nov 2026 07:23:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7L9-00000008rGu-0cys
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:22:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E205C40E23;
	Wed, 25 Nov 2026 07:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFDA1F000CF;
	Wed, 25 Nov 2026 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591370;
	bh=fGGMmpzYvSRCJOjYoy+gZDvztGrcb3fgwkLyHKES3d0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=emj47kG+cOG02+gYOfZgF4FkoTPRC11y2I9vFAo7h5/UZVhX+m2RfvUk0uhStGPod
	 KztRuNNwtJAtArxVbE+W7yTK40LhtV4YGh3U/f7CUbsdqriXGJ6Vt8QTPdArkQ39fi
	 6tOSdz367cSzb9DYywX/56XoTLug50BvvjMELt23nToLlvxXFUtYJKoQ/4Nq6cIA8m
	 LUhvCGXH+r6tyXvuDgWZT2ETcjKv1hxJisn1s45yLvKwnZG5nMO5TVGeP9SjwN5sfB
	 HfgL+IoXQ7R9Ge9XOvIxXc9MRKkQE9Qe4QJN9RU/LJPuUZ5/TL5tev8hxQojArTkyl
	 fzyYLK3hDUk4A==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/9] arm64: dts: marvell: Drop SPI max frequency
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-3-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-3-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:22:47 +0100
Message-Id: <179559136716.9063.4751486198367684170.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> Remove spi-max-frequency from the CP0 SPI controller node on the
> CN9130 SolidRun SOM. The property belongs on SPI devices, and the
> flash child already has its own maximum frequency. Plus, pretty
> sure 1.8GHz is not a possible SPI bus frequency.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

