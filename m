Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86883606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtKG3ERb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fL6n4Vxu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zpfZ+FMD2+J+dqvfXJBq85BWZ+lYU4FkFWwGXvTX/U4=; b=PtKG3ERbZmgpKK
	y/VJ1mXNbu66dCC5ng7FpmHtjf3jbVY25x3qERfes2RYnb2cueidhnPP27BM8/9PWO7YBrh3wvyl4
	KGLV+oBOeWgzpqiksF3mt56JqEyk5/E3CWLa5cNkBdVxuHgUj8S7/N/D5kG1QV8/i0wvDsNSXRbZm
	viw//JpN9M71Q3Gs9g4NbaZ85g70tnbqxpwHqIX48rojuI5FpIc3p8aXmRylAZ2PM+ulG7HpMg13r
	fuxMmjOG3o+If9Ej80hDaDMU0JxVT5NLCpmKDl2evog2RC8hOSfIKjcD2x363j5rvW9EzC2aXyRvl
	9s5aIr5i/KR/8UeAPhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Ne-00000008sGF-1LMF;
	Wed, 25 Nov 2026 07:25:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7NY-00000008sG6-3jUx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:25:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C65141A3F;
	Wed, 25 Nov 2026 07:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A61F000C0;
	Wed, 25 Nov 2026 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591520;
	bh=zpfZ+FMD2+J+dqvfXJBq85BWZ+lYU4FkFWwGXvTX/U4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fL6n4VxutKJSfH7EDJ4J2f0g4edaoUtaM0ZWnnQ0IKBx97/HUVLYR1tWtleYKrQpy
	 +MXxznIsqeQpiE9stpH8Wr2tBpw6xHMqzCnUHOfd+s9PXU+3AElpnL0t9VLsv74A3E
	 rUYFOD88yFICYPSpwp/gaDHUYGqA2HrYuz6FPimptmb8cTO91YhIcewmlxr29sBTxf
	 j/X3A4tuL3CPtHioXqH4gdUuXITtB5zPxuVUG56cuFgzaOQ/nOYZvN0obZqn2K8zQs
	 CElzxTU5sINwO/5berbHClULavbe1+gWicYkyvfMZ5wIQwa7mQfbbzuGVQ5agOaVCC
	 cpXgfC5wPZ3hg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/9] arm64: dts: marvell: armada-8040: Fix node
 names
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-4-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-4-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:25:17 +0100
Message-Id: <179559151714.9063.13867081335073416775.b4-reply@b4>
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
> Fix various node names to use standard names.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Fix behind-32bit-controller@7f000000 in separate commit
> ---
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts |  2 +-
>  arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

