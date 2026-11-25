Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E04606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=db4c7tv0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcmwcoGT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wz7iJ7/C+al2wsNcjwCJLGM55CpVxGiIFprkKm3yEaU=; b=db4c7tv0gzNuNi
	608B5YMu6a4pOdu9Fl8TyVypTh/6aRoH4RZFENUlYljG1npMLG46v9FsQypJdvB5xFQW0PkVJvIQn
	T30XFzmYK6R8KsMJ/s1RVzl7HjE6CNITXoY+e7do2gjnhS71o67VLsKarRBTqeSN1thxq+3RD0cw1
	vCmCJAnvuypZQM+GXFKASW8D/qoihjVBfcsZzEToRIBS7/WfCYYSMGSwvRplP1iR/ygZwqWHChkL1
	orejjq9dYos5QYpuK78q3xQJY1imjd6cyq4m9gxqVOCnEVi+Tk+4whBCKOxx4FRKNWGf0iaCzN6yB
	9/vM3zj01jSnnLn9S81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8FN-000000092sc-2Ufw;
	Wed, 25 Nov 2026 08:20:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8FN-000000092sF-12bq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:20:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57DF162298;
	Wed, 25 Nov 2026 08:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEACA1F000CA;
	Wed, 25 Nov 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594855;
	bh=wz7iJ7/C+al2wsNcjwCJLGM55CpVxGiIFprkKm3yEaU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TcmwcoGTgJhdF0/CY96V3d+BxrNuCMfdhlb71tM3uoBkYiDrtP6UZBY7PzIsmrwZB
	 dWbYTTxwpaJiNuab2qtMD5HqBmPLhSSHuF+VEXo1O6MeM4EY7yup2aqLd1Z6OuhW+l
	 ltnUbDfRsPtcagSkU/F7IJZFln/skn5NmIuHmxzrRwXhG88siIt8RUKgEblaw7dLK9
	 DWtzi+ud6CKSmtluSic2qUr5MQNYyoAifAAazWNHD5uBzlvOBsYDW+LlPRCTM0pAJM
	 6vFHaqkP9QOeRhWn0dtOKhgZrRA78oweYwhuLLOHRWTIPt8vJOmhTqVT5P+mmie09A
	 OWb/wzqMEHGmw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 7/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-7-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-7-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:20:52 +0100
Message-Id: <179559485224.14607.4321830873250502368.b4-reply@b4>
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
> The part has no reset line nor does the Linux driver handle the property,
> so drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

