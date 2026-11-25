Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB9F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=09KfGHhD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC2itC6N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=we+jyk811DxDB1kpmFRUhHwg7Xb3fLiUU6GkBZOAy+s=; b=09KfGHhDZEsHXo
	Jlztm7cP7Ew7f4eVIHQqCEavf+XI6aXzokxsnZkJPBQdFCTy5avRGK+AWw3Lcvg61gRXktyD8ImEM
	JeeIrAhGiplSIa+FM3YDXebhn/kJ7RtPy+5mNUgIcWeM0XAuOQUz7FMG8nL3q2UfASpfGwOFyXQLI
	J9FoIwscBkNxGUxXb60HB2f5C1UIJ+vvT1PhBHUTWKjJDf56U1hYAzhNI2rf5h0Fg5FaT2O/WPOHD
	4TsFl5JsNt0prdXm5Z41TnJkZPVZFqjeTqJYUzOq7e2ea7hXlgk6xQOP8x7tjog2/QNt5bWfIjfSk
	TSk88S5IYURl/m5RkdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Fx-0000000933r-3k3F;
	Wed, 25 Nov 2026 08:21:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Fw-0000000933N-2PCc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:21:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 916BF62350;
	Wed, 25 Nov 2026 08:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5697D1F00A03;
	Wed, 25 Nov 2026 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594891;
	bh=we+jyk811DxDB1kpmFRUhHwg7Xb3fLiUU6GkBZOAy+s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EC2itC6N+uYhtWmmdoJjTzMhW/T7ftWmq/aIe49XkzczNT/UN7Gsv/DOXq4PDIcMM
	 yO5NFv1wKiHzBbpFNACjIyruxoe2pGg0141OX/rHfeXm+h7KUpCQUAQdXiZvoRTLSo
	 g6whcRoCvLVbzyRZf6uGvNzOjh7EqKGG36xk4abdq3EA+Qov9kz8a4eJVd1k0LXZrC
	 zF4gBEDPxOhq3SaMf/AXpEjjXEpr/76swpBtm2MtvBijUOjStB8eFxmJeePhuz5GjP
	 AlgyDEJ7XvUDU5M2yzL3ugFpdBoyH+hVW55q4Oi+IKRmKzEonqqqHseREj+pmFjInd
	 X0wVzprDdPuEw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 9/9] arm64: dts: marvell: ac5-98dx25xx: Rework
 'behind-32bit-controller' bus
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-9-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-9-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:21:27 +0100
Message-Id: <179559488764.14607.13962945107658633472.b4-reply@b4>
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
> The 'behind-32bit-controller@7f000000' node doesn't follow
> standard naming and overlaps with the 'bus@7f000000' node address. The
> reason for the 2 buses was separating the DMA capable blocks which need
> 'dma-ranges' translation, but there's no reason that needs to be a
> separate bus. Merge the nodes in 'behind-32bit-controller@7f000000' to
> the 'bus@7f000000' node. Doing this requires increasing the
> '#address-cells' and '#size-cells'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - New patch
> ---
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 101 +++++++++++---------------
>  1 file changed, 44 insertions(+), 57 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

